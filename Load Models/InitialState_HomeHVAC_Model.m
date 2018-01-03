function [HVAC_State, HVAC_State_DR] = InitialState_HomeHVAC_Model(time_step, HomeHVAC_Inputs, HVAC_Mode,...
    HVAC_CoolingType, HVAC_HeatingType, Outdoor_Temp, Indoor_Temp, Mass_Temp, Envelope_Temp,...
    Direct_Irrad, Diffuse_Irrad, Internal_Q, HVAC_State, HVAC_ThermostatAdjust, Scaling_Factor)
% Dynamic Home/HVAC Model
%   Model which simulates the thermal characterisitcs of a home and its HVAC system
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 2/26/2014
%--------------------------------------------------------------------------
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/house_e.cpp
%--------------------------------------------------------------------------


% Determine Probability of Starting in the On State

HVAC_Count = 0; % Increment HVAC On State Counter

Simulation_Length = 12; % (hr) Simulation Length

for j = 1:(Simulation_Length*60*time_step)  % Simulate for 'Simulation Length' Hours Using Initial Inputs
    
    % Simulate HVAC Model
    
    [HVAC_Power, HVAC_Q, HVAC_COP, Indoor_Temp, Mass_Temp, Envelope_Temp, HVAC_State] = HomeHVAC_Model(time_step,...
        HomeHVAC_Inputs, HVAC_Mode, HVAC_CoolingType, HVAC_HeatingType, Outdoor_Temp, Indoor_Temp, Mass_Temp,...
        Envelope_Temp, Direct_Irrad, Diffuse_Irrad, Internal_Q, HVAC_State, HVAC_ThermostatAdjust, Scaling_Factor);
    
    
    % Record HVAC State
    
    if HVAC_State ~= 0
        HVAC_Count = HVAC_Count + 1;    % Increment HVAC On State Counter
    end
end


% Determine Probability of Starting in the On State

HVAC_Prob = (HVAC_Count/(Simulation_Length*60*time_step));  % Probability of HVAC Starting in the On State

if rand(1) <= HVAC_Prob     % Probability of HVAC Starting in the On State
    
    HVAC_State = HVAC_Mode; % (On) Initial State of HVAC
else
    HVAC_State = 0;         % (Off) Initial State of HVAC
end

HVAC_State_DR = HVAC_State; % Initial State of HVAC

end