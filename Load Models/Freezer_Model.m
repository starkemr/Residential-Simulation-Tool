function [Freezer_Power, Freezer_Temp, Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer]...
    = Freezer_Model(time_step, RefrigeratorFreezer_Inputs, FreezerDefrost, Indoor_Temp,...
    Freezer_Temp, Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer,...
    Freezer_ThermostatAdjust, FreezerOpenDoor_rand, Activity, Scaling_Factor)
% Freezer Model
%   Model which simulates the thermal characterisitcs of a freezer
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 7/15/2014
%--------------------------------------------------------------------------
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/freezer.cpp
%--------------------------------------------------------------------------


% Constants

HOURSperSECOND = (1/3600);  % (hr/s) Hours to Seconds Conversion Factor

Cw = 1.0;   % (Btu/lbm*F) Specific Heat of Water

Water_Density = 62.43;  % (lbm/ft^3) Density of Water


% Freezer Input Parameters

% Freezer Volume (Vary Between 10 and 25 ft^3)

if (RefrigeratorFreezer_Inputs(10) + RefrigeratorFreezer_Inputs(11)*Scaling_Factor(1)) < 10     % (ft^3) Minimum Freezer Volume (10 ft^3)
    Freezer_Volume = 10;
elseif (RefrigeratorFreezer_Inputs(10) + RefrigeratorFreezer_Inputs(11)*Scaling_Factor(1)) > 25 % (ft^3) Maximum Freezer Volume (25 ft^3)
    Freezer_Volume = 25;
else
    Freezer_Volume = RefrigeratorFreezer_Inputs(10) + RefrigeratorFreezer_Inputs(11)*Scaling_Factor(1); % (ft^3) Freezer Volume
end


% Freezer Thermal Conductances and Rated Capacity

UA = 0.3;                       % (Btu/F*hr) Thermal Conductance (Lower Values Mean Better Insulation)
UAr = UA + Freezer_Volume/20;   % (Btu/F*hr) Thermal Conductance of Freezer
UAf = 1.0;                      % (Btu/F*hr) Thermal Conductance of Food-Air

Cf = 0.05*Freezer_Volume*Water_Density*Cw;  % (Btu/F) Heat Capacity of Food (Assumes 5 % of Freezer Volume is Water)

Freezer_Rating = Freezer_Volume*10;         % (Btu/hr) Rated Capacity of Freezer (Assumes 10 Btu/hr*ft^3)

Freezer_Q = Freezer_Rating*HOURSperSECOND*(60/time_step);   % (Btu/s or Btu/min) Rated Capacity of Freezer


% Thermostat Setpoints (Vary Between -10 and 0 F)

if (RefrigeratorFreezer_Inputs(12) + RefrigeratorFreezer_Inputs(13)*Scaling_Factor(3) + Freezer_ThermostatAdjust) < -10     % (F) Minimum Freezer Thermostat Setting (-10 F)
    Freezer_Thermostat = -10;
elseif (RefrigeratorFreezer_Inputs(12) + RefrigeratorFreezer_Inputs(13)*Scaling_Factor(3) + Freezer_ThermostatAdjust) > 0   % (F) Maximum Freezer Thermostat Setting (0 F)
    Freezer_Thermostat = 0;
else
    Freezer_Thermostat = RefrigeratorFreezer_Inputs(12) + RefrigeratorFreezer_Inputs(13)*Scaling_Factor(3) + Freezer_ThermostatAdjust;  % (F) Freezer Thermostat Setting
end

Freezer_Deadband = RefrigeratorFreezer_Inputs(14);  % (F) Freezer Thermostat Deadband

Freezer_Min = Freezer_Thermostat - Freezer_Deadband/2;  % (F) Lower Temperature Limit
Freezer_Max = Freezer_Thermostat + Freezer_Deadband/2;  % (F) Upper Temperature Limit


% Freezer Door State (Open or Closed)

if FreezerDoor_Timer > 0    % If Freezer Door is Open
    
    if FreezerDoor_Timer > 10/(60/time_step)    % Close Freezer Door After 10 Seconds
        
        FreezerDoor_Timer = 0;  % (s or min) Reset Freezer Door Timer
    else
        FreezerDoor_Timer = FreezerDoor_Timer + 1;  % (s or min) Increment Freezer Door Timer
    end
end


for i = 1:length(Activity)
    
    % If Activity is Food Preparation there is a 0.25 % Chance of Opening the Freezer (Do Not Recalculate if Door is Already Open)
    % If Activity is Anything Other than Sleeping, Grooming, Food Preparation, or Away there is a 0.125 % Chance of Opening the Freezer
    
    if (FreezerDoor_Timer == 0) && ((Activity(i,1) == 4 && FreezerOpenDoor_rand <= (0.0025/time_step)) || (Activity(i,1) ~= 4 && Activity(i,1) >= 3 && Activity(i,1) <= 8 && FreezerOpenDoor_rand <= (0.00125/time_step)))
        
        Freezer_Temp = Freezer_Temp + 5;    % (F) Increase Temperature of Freezer Interior by 5 F if Door is Opened
        
        % Do Not Allow Temperature of Freezer Interior to Increase to 10 F Above Thermostat Setting
        
        if Freezer_Temp > Freezer_Thermostat + 10
            
            Freezer_Temp = Freezer_Thermostat + 10; % (F) Temperature of Freezer Interior
        end
        
        FreezerDoor_Timer = 1;  % (s or min) Start Freezer Door Timer
        break
    end
end


% Thermostat Controls

if Freezer_Temp >= Freezer_Max      % If Temperature of Freezer Interior is Greater Than or Equal to the Upper Limit, Cool
    Freezer_State = 1;
elseif Freezer_Temp <= Freezer_Min  % If Temperature of Freezer Interior is Less Than or Equal to the Lower Limit Do Not Cool
    Freezer_State = 0;
end


% Calculate Temperature of Freezer Interior

Freezer_Q = Freezer_State*Freezer_Q;    % (Btu/s or Btu/min) Freezer Cooling Rate

C1 = Cf/((UAr + UAf)*HOURSperSECOND*(60/time_step));
C2 = Indoor_Temp - Freezer_Q/(UAr*HOURSperSECOND*(60/time_step));

dT_dt = (C2 - Freezer_Temp)/C1;     % (F/s or F/min) Rate of Change in Temperature of Freezer Interior


if FreezerDoor_Timer == 0;  % If Freezer Door is Closed
    
    Freezer_Temp = Freezer_Temp + dT_dt;    % (F) Temperature of Freezer Interior
end


% Calculate Freezer Power Demand

Freezer_Power = (Freezer_State*120);    % (W) Freezer Power Demand


if FreezerDefrost == 1  % If Freezer has an Automatic Defroster
    
    FreezerDefrost_Timer = FreezerDefrost_Timer + 1;    % (s or min) Increment Freezer Defrost Timer
    
    if FreezerDefrost_Timer > 8*60*time_step    % Defrost Freezer After 8 Hours
        
        Freezer_Power = 550;                    % (W) Freezer Power Demand
        
        if FreezerDefrost_Timer == 8*60*time_step + 10*time_step    % After 10 Minutes Stop Defrosting Freezer
            
            FreezerDefrost_Timer = 0;           % (s or min) Reset Freezer Defrost Timer
        end
    end
end

end