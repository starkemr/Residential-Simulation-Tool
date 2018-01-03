function [WaterHeater_StateU, WaterHeater_StateL, WaterHeater_StateU_DR, WaterHeater_StateL_DR]...
    = InitialState_WaterHeater_TwoNodeModel(time_step, WaterHeater_Inputs, Outdoor_Temp,...
    Indoor_Temp, WaterInlet_Temp, Water_TempU, Water_TempL, WaterHeater_WaterFlow,...
    WaterHeater_StateU, WaterHeater_StateL, WaterHeater_ThermostatAdjust, Scaling_Factor)
% Dynamic Two-Node Water Heater Model
%   Model which simulates a water heater using the two-node model
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
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/waterheater.cpp, Junji Kondoh
%--------------------------------------------------------------------------


% Determine Probability of Starting in the On State

WaterHeater_CountU = 0; % Increment Water Heater Upper Coil On State Counter
WaterHeater_CountL = 0; % Increment Water Heater Lower Coil On State Counter

Simulation_Length = 12; % (hr) Simulation Length

for j = 1:(Simulation_Length*60*time_step)  % Simulate for 'Simulation Length' Hours Using Initial Inputs
    
    % Simulate Two-Node Water Heater Model
    
    [WaterHeater_Power, Water_TempU, Water_TempL, WaterHeater_StateU, WaterHeater_StateL]...
        = WaterHeater_TwoNodeModel(time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp,...
        WaterInlet_Temp, Water_TempU, Water_TempL, WaterHeater_WaterFlow, WaterHeater_StateU,...
        WaterHeater_StateL, WaterHeater_ThermostatAdjust, Scaling_Factor);
    
    
    % Record Water Heater State
    
    if WaterHeater_StateU ~= 0
        WaterHeater_CountU = WaterHeater_CountU + 1;    % Increment Water Heater Upper Coil On State Counter
    elseif WaterHeater_StateL ~= 0
        WaterHeater_CountL = WaterHeater_CountL + 1;    % Increment Water Heater Lower Coil On State Counter
    end
end


% Determine Probability of Starting in the On State

WaterHeater_ProbU = (WaterHeater_CountU/(Simulation_Length*60*time_step));  % Probability of Water Heater Upper Coil Starting in the On State
WaterHeater_ProbL = (WaterHeater_CountL/(Simulation_Length*60*time_step));  % Probability of Water Heater Lower Coil Starting in the On State

if rand(1) <= WaterHeater_ProbU  % Probability of Water Heater Upper Coil Starting in the On State
    
    WaterHeater_StateU = 1; % (On) Initial State of Water Heater Upper Coil
else
    WaterHeater_StateU = 0; % (Off) Initial State of Water Heater Upper Coil
end

if rand(1) <= WaterHeater_ProbL && WaterHeater_StateU == 0  % Probability of Water Heater Lower Coil Starting in the On State
    
    WaterHeater_StateL = 1; % (On) Initial State of Water Heater Lower Coil
else
    WaterHeater_StateL = 0; % (Off) Initial State of Water Heater Lower Coil
end

WaterHeater_StateU_DR = WaterHeater_StateU; % Initial State of Water Heater Upper Coil
WaterHeater_StateL_DR = WaterHeater_StateL; % Initial State of Water Heater Lower Coil

end