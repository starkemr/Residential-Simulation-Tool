function [WaterHeater_State, WaterHeater_State_DR] = InitialState_WaterHeater_OneNodeModel...
    (time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp, WaterInlet_Temp, Water_Temp,...
    WaterHeater_WaterFlow, WaterHeater_State, WaterHeater_ThermostatAdjust, Scaling_Factor)
% Dynamic Water Heater Model
%   Model which simulates a water heater using the one-node model
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 1/23/2014
%--------------------------------------------------------------------------
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/waterheater.cpp
%--------------------------------------------------------------------------


% Determine Probability of Starting in the On State

WaterHeater_Count = 0;  % Increment Water Heater On State Counter

Simulation_Length = 12; % (hr) Simulation Length

for j = 1:(Simulation_Length*60*time_step)  % Simulate for 'Simulation Length' Hours Using Initial Inputs
    
    % Simulate One-Node Water Heater Model
    
    [WaterHeater_Power, Water_Temp, WaterHeater_State] = WaterHeater_OneNodeModel...
        (time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp, WaterInlet_Temp, Water_Temp,...
        WaterHeater_WaterFlow, WaterHeater_State, WaterHeater_ThermostatAdjust, Scaling_Factor);
    
    
    % Record Water Heater State
    
    if WaterHeater_State ~= 0
        WaterHeater_Count = WaterHeater_Count + 1;  % Increment Water Heater On State Counter
    end
end


% Determine Probability of Starting in the On State

WaterHeater_Prob = (WaterHeater_Count/(Simulation_Length*60*time_step));    % Probability of Water Heater Starting in the On State

if rand(1) <= WaterHeater_Prob  % Probability of Water Heater Starting in the On State
    
    WaterHeater_State = 1;  % (On) Initial State of Water Heater
else
    WaterHeater_State = 0;  % (Off) Initial State of Water Heater
end

WaterHeater_State_DR = WaterHeater_State;   % Initial State of Water Heater

end