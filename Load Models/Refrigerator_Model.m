function [Refrigerator_Power, Refrigerator_Temp, Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer]...
    = Refrigerator_Model(time_step, RefrigeratorFreezer_Inputs, RefrigeratorDefrost, Indoor_Temp,...
    Refrigerator_Temp, Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer,...
    Refrigerator_ThermostatAdjust, RefrigeratorOpenDoor_rand, Activity, Scaling_Factor)
% Refrigerator Model
%   Model which simulates the thermal characterisitcs of a refrigerator
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
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/refrigerator.cpp
%--------------------------------------------------------------------------


% Constants

HOURSperSECOND = (1/3600);  % (hr/s) Hours to Seconds Conversion Factor

Cw = 1.0;   % (Btu/lbm*F) Specific Heat of Water

Water_Density = 62.43;  % (lbm/ft^3) Density of Water


% Refrigerator Input Parameters

% Refrigerator Volume (Vary Between 10 and 35 ft^3)

if (RefrigeratorFreezer_Inputs(3) + RefrigeratorFreezer_Inputs(4)*Scaling_Factor(1)) < 10       % (ft^3) Minimum Refrigerator Volume (10 ft^3)
    Refrigerator_Volume = 10;
elseif (RefrigeratorFreezer_Inputs(3) + RefrigeratorFreezer_Inputs(4)*Scaling_Factor(1)) > 35   % (ft^3) Maximum Refrigerator Volume (35 ft^3)
    Refrigerator_Volume = 35;
else
    Refrigerator_Volume = RefrigeratorFreezer_Inputs(3) + RefrigeratorFreezer_Inputs(4)*Scaling_Factor(1);  % (ft^3) Refrigerator Volume
end


% Refrigerator Thermal Conductances and Rated Capacity

UA = 1.2;                           % (Btu/F*hr) Thermal Conductance (Lower Values Mean Better Insulation)
UAr = UA + Refrigerator_Volume/20;  % (Btu/F*hr) Thermal Conductance of Refrigerator
UAf = 1.0;                          % (Btu/F*hr) Thermal Conductance of Food-Air

Cf = 0.05*Refrigerator_Volume*Water_Density*Cw; % (Btu/F) Heat Capacity of Food (Assumes 5 % of Refrigerator Volume is Water)

Refrigerator_Rating = Refrigerator_Volume*10;   % (Btu/hr) Rated Capacity of Refrigerator (Assumes 10 Btu/hr*ft^3)

Refrigerator_Q = Refrigerator_Rating*HOURSperSECOND*(60/time_step); % (Btu/s or Btu/min) Rated Capacity of Refrigerator


% Thermostat Setpoints (Vary Between 34 and 40 F)

if (RefrigeratorFreezer_Inputs(5) + RefrigeratorFreezer_Inputs(6)*Scaling_Factor(3) + Refrigerator_ThermostatAdjust) < 34       % (F) Minimum Refrigerator Thermostat Setting (34 F)
    Refrigerator_Thermostat = 34;
elseif (RefrigeratorFreezer_Inputs(5) + RefrigeratorFreezer_Inputs(6)*Scaling_Factor(3) + Refrigerator_ThermostatAdjust) > 40   % (F) Maximum Refrigerator Thermostat Setting (40 F)
    Refrigerator_Thermostat = 40;
else
    Refrigerator_Thermostat = RefrigeratorFreezer_Inputs(5) + RefrigeratorFreezer_Inputs(6)*Scaling_Factor(3) + Refrigerator_ThermostatAdjust;  % (F) Refrigerator Thermostat Setting
end

Refrigerator_Deadband = RefrigeratorFreezer_Inputs(7);  % (F) Refrigerator Thermostat Deadband

Refrigerator_Min = Refrigerator_Thermostat - Refrigerator_Deadband/2;   % (F) Lower Temperature Limit
Refrigerator_Max = Refrigerator_Thermostat + Refrigerator_Deadband/2;   % (F) Upper Temperature Limit


% Refrigerator Door State (Open or Closed)

if RefrigeratorDoor_Timer > 0   % If Refrigerator Door is Open
    
    if RefrigeratorDoor_Timer > 10/(60/time_step)   % Close Refrigerator Door After 10 Seconds
        
        RefrigeratorDoor_Timer = 0; % (s or min) Reset Refrigerator Door Timer
    else
        RefrigeratorDoor_Timer = RefrigeratorDoor_Timer + 1;    % (s or min) Increment Refrigerator Door Timer
    end
end


for i = 1:length(Activity)
    
    % If Activity is Food Preparation there is a 0.5 % Chance of Opening the Refrigerator (Do Not Recalculate if Door is Already Open)
    % If Activity is Anything Other than Sleeping, Grooming, Food Preparation, or Away there is a 0.25 % Chance of Opening the Refrigerator
    
    if (RefrigeratorDoor_Timer == 0) && ((Activity(i,1) == 4 && RefrigeratorOpenDoor_rand <= (0.005/time_step)) || (Activity(i,1) ~= 4 && Activity(i,1) >= 3 && Activity(i,1) <= 8 && RefrigeratorOpenDoor_rand <= (0.0025/time_step)))
        
        Refrigerator_Temp = Refrigerator_Temp + 5;  % (F) Increase Temperature of Refrigerator Interior by 5 F if Door is Opened
        
        % Do Not Allow Temperature of Refrigerator Interior to Increase to 10 F Above Thermostat Setting
        
        if Refrigerator_Temp > Refrigerator_Thermostat + 10
            
            Refrigerator_Temp = Refrigerator_Thermostat + 10;   % (F) Temperature of Refrigerator Interior
        end
        
        RefrigeratorDoor_Timer = 1; % (s or min) Start Refrigerator Door Timer
        break
    end
end


% Thermostat Controls

if Refrigerator_Temp >= Refrigerator_Max        % If Temperature of Refrigerator Interior is Greater Than or Equal to the Upper Limit, Cool
    Refrigerator_State = 1;
elseif Refrigerator_Temp <= Refrigerator_Min    % If Temperature of Refrigerator Interior is Less Than or Equal to the Lower Limit Do Not Cool
    Refrigerator_State = 0;
end


% Calculate Temperature of Refrigerator Interior

Refrigerator_Q = Refrigerator_State*Refrigerator_Q; % (Btu/s or Btu/min) Refrigerator Cooling Rate

C1 = Cf/((UAr + UAf)*HOURSperSECOND*(60/time_step));
C2 = Indoor_Temp - Refrigerator_Q/(UAr*HOURSperSECOND*(60/time_step));

dT_dt = (C2 - Refrigerator_Temp)/C1;    % (F/s or F/min) Rate of Change in Temperature of Refrigerator Interior


if RefrigeratorDoor_Timer == 0; % If Refrigerator Door is Closed
    
    Refrigerator_Temp = Refrigerator_Temp + dT_dt;  % (F) Temperature of Refrigerator Interior
end


% Calculate Refrigerator Power Demand

Refrigerator_Power = (Refrigerator_State*120);  % (W) Refrigerator Power Demand


if RefrigeratorDefrost == 1 % If Refrigerator has an Automatic Defroster
    
    RefrigeratorDefrost_Timer = RefrigeratorDefrost_Timer + 1;  % (s or min) Increment Refrigerator Defrost Timer
    
    if RefrigeratorDefrost_Timer > 8*60*time_step   % Defrost Refrigerator After 8 Hours
        
        Refrigerator_Power = 550;                   % (W) Refrigerator Power Demand
        
        if RefrigeratorDefrost_Timer == 8*60*time_step + 10*time_step   % After 10 Minutes Stop Defrosting Refrigerator
            
            RefrigeratorDefrost_Timer = 0;          % (s or min) Reset Refrigerator Defrost Timer
        end
    end
end

end