function [EV_Power, EV_SOC, EV1_Power, EV1_SOC, EV2_Power, EV2_SOC, EV3_Power, EV3_SOC, EV_User] = ElectricVehicle_Model...
    (time_step, ElectricVehicle_Inputs, Outdoor_Temp, EV_Type, EV_Position, EV_SOC, EV_User, Occupants, Activity, Scaling_Factor)
% Electric Vehicle Load Model
%   Model which simulates an electric vehicle and its charger
%
%--------------------------------------------------------------------------
% Brandon Johnson
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 6/24/2014
%--------------------------------------------------------------------------
% Sources: Pia Grahn (Joakim Widen) (Modified for Different Charging Levels)
%--------------------------------------------------------------------------


% Initialize Values

EV_Power = 0;   % (W) Initialize Electric Vehicle Power Demand
EV1_Power = 0;  % (W) Initialize Electric Vehicle Power Demand (Level 1 Charger)
EV2_Power = 0;  % (W) Initialize Electric Vehicle Power Demand (Level 2 Charger)
EV3_Power = 0;  % (W) Initialize Electric Vehicle Power Demand (Level 3 Charger)

EV1_SOC = 0;    % (%) Initialize Electric Vehicle State of Charge (Level 1 Charger)
EV2_SOC = 0;    % (%) Initialize Electric Vehicle State of Charge (Level 2 Charger)
EV3_SOC = 0;    % (%) Initialize Electric Vehicle State of Charge (Level 3 Charger)

if Outdoor_Temp >= 80 || Outdoor_Temp <= 60
    
    Season_Coefficient = 1.1;   % Seasonal Coefficient
else
    Season_Coefficient = 1.0;   % Seasonal Coefficient
end


% Calculate Electric Vehicle Power Demand

% Determine if Electric Vehicle has Returned Home

for i = 1:length(Activity)
    
    % If Occupant Using Electric Vehicle has Returned Home, Set Electric Vehicle to Not in Use
    
    if (EV_User(i,1) == 1) && (Activity(i,1) < 9)
        
        EV_User(i,1) = 0;   % Electric Vehicle Occupant Possesion Matrix
    end
end

% Determine if Electric Vehicle is Discharging

for i = 1:length(Activity)
    
    % If Occupant is Away and Traveling in a Vehicle, Not a Child, and Electric Vehicle is Not being Used by Another Occupant
    
    if (Activity(i,1) == 10) && (Occupants(i,1) < 5) && (EV_User(i,1) == 1 || sum(EV_User(:,1)) == 0)
        
        % If Current State of Charge is Greater than Vehicle's Minimum State of Charge, Discharge Battery
        
        if EV_SOC >= (100 - ElectricVehicle_Inputs(7 + EV_Position))/100 + (Season_Coefficient*ElectricVehicle_Inputs(8 + EV_Position)*ElectricVehicle_Inputs(9 + EV_Position)*(1/60*time_step))/ElectricVehicle_Inputs(5 + EV_Position)
            
            EV_SOC = (EV_SOC*(ElectricVehicle_Inputs(5 + EV_Position) + ElectricVehicle_Inputs(6 + EV_Position)*Scaling_Factor(1)) -...
                Season_Coefficient*ElectricVehicle_Inputs(8 + EV_Position)*ElectricVehicle_Inputs(9 + EV_Position)*(1/60*time_step))/ElectricVehicle_Inputs(5 + EV_Position);  % (%) Electric Vehicle State of Charge
        end
        
        EV_User(i,1) = 1;   % Electric Vehicle Occupant Possesion Matrix
    end
end

% Determine if Electric Vehicle is Charging

% If Electric Vehicle is Not in Use

if sum(EV_User(:,1)) == 0
    
    % If Current State of Charge is Less than 100%, Charge Battery
    
    if EV_SOC < 1
        
        % If Electric Vehicle uses a Level 1 Charger
        
        if EV_Type == 1
            
            EV_SOC = (EV_SOC*(ElectricVehicle_Inputs(5 + EV_Position) + ElectricVehicle_Inputs(6 + EV_Position)*Scaling_Factor(1)) +...
                (ElectricVehicle_Inputs(11 + EV_Position) + ElectricVehicle_Inputs(12 + EV_Position)*Scaling_Factor(1))*(1/60*time_step))/ElectricVehicle_Inputs(5 + EV_Position);  % (%) Electric Vehicle State of Charge
            EV_Power = ElectricVehicle_Inputs(11 + EV_Position) + ElectricVehicle_Inputs(12 + EV_Position)*Scaling_Factor(1);                                                       % (W) Electric Vehicle Power Demand
            
        % If Electric Vehicle uses a Level 2 Charger
            
        elseif EV_Type == 2
            
            EV_SOC = (EV_SOC*(ElectricVehicle_Inputs(5 + EV_Position) + ElectricVehicle_Inputs(6 + EV_Position)*Scaling_Factor(1)) +...
                (ElectricVehicle_Inputs(14 + EV_Position) + ElectricVehicle_Inputs(15 + EV_Position)*Scaling_Factor(1))*(1/60*time_step))/ElectricVehicle_Inputs(5 + EV_Position);  % (%) Electric Vehicle State of Charge
            EV_Power = ElectricVehicle_Inputs(14 + EV_Position) + ElectricVehicle_Inputs(15 + EV_Position)*Scaling_Factor(1);                                                       % (W) Electric Vehicle Power Demand
            
        % If Electric Vehicle uses a Level 3 Charger
            
        elseif EV_Type == 3
            
            EV_SOC = (EV_SOC*(ElectricVehicle_Inputs(5 + EV_Position) + ElectricVehicle_Inputs(6 + EV_Position)*Scaling_Factor(1)) +...
                (ElectricVehicle_Inputs(17 + EV_Position) + ElectricVehicle_Inputs(18 + EV_Position)*Scaling_Factor(1))*(1/60*time_step))/ElectricVehicle_Inputs(5 + EV_Position);  % (%) Electric Vehicle State of Charge
            EV_Power = ElectricVehicle_Inputs(17 + EV_Position) + ElectricVehicle_Inputs(18 + EV_Position)*Scaling_Factor(1);                                                       % (W) Electric Vehicle Power Demand
        end
        
        % If Current State of Charge is Above 100%, Set to 100%
        
        if EV_SOC > 1
            
            EV_SOC = 1; % (%) Electric Vehicle State of Charge
        end
    end
end

% Set Electric Vehicle Power Demand and State of Charge based on Vehicle Charging Level

% If Electric Vehicle uses a Level 1 Charger

if EV_Type == 1
    
    EV1_Power = EV_Power;   % (W) Electric Vehicle Power Demand (Level 1 Charger)
    EV1_SOC = EV_SOC;       % (%) Electric Vehicle State of Charge (Level 1 Charger)
    
% If Electric Vehicle uses a Level 2 Charger
    
elseif EV_Type == 2
    
    EV2_Power = EV_Power;   % (W) Electric Vehicle Power Demand (Level 2 Charger)
    EV2_SOC = EV_SOC;       % (%) Electric Vehicle State of Charge (Level 2 Charger)
    
% If Electric Vehicle uses a Level 3 Charger
    
elseif EV_Type == 3
    
    EV3_Power = EV_Power;   % (W) Electric Vehicle Power Demand (Level 3 Charger)
    EV3_SOC = EV_SOC;       % (%) Electric Vehicle State of Charge (Level 3 Charger)
end

end