function [Refrigerator_State, Refrigerator_State_DR] = InitialState_Refrigerator_Model(time_step,...
    RefrigeratorFreezer_Inputs, RefrigeratorDefrost, Indoor_Temp, Refrigerator_Temp,...
    Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer, Refrigerator_ThermostatAdjust,...
    RefrigeratorOpenDoor_rand, Activity, Scaling_Factor)
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
% Last Updated: 1/23/2014
%--------------------------------------------------------------------------
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/refrigerator.cpp
%--------------------------------------------------------------------------


% Determine Probability of Starting in the On State

Refrigerator_Count = 0; % Increment Refrigerator On State Counter

Simulation_Length = 12; % (hr) Simulation Length

for j = 1:(Simulation_Length*60*time_step)  % Simulate for 'Simulation Length' Hours Using Initial Inputs
    
    % Simulate Refrigerator Model
    
    [Refrigerator_Power, Refrigerator_Temp, Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer]...
        = Refrigerator_Model(time_step, RefrigeratorFreezer_Inputs, RefrigeratorDefrost, Indoor_Temp,...
        Refrigerator_Temp, Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer,...
        Refrigerator_ThermostatAdjust, RefrigeratorOpenDoor_rand, Activity, Scaling_Factor);
    
    
    % Record Refrigerator State
    
    if Refrigerator_State ~= 0
        Refrigerator_Count = Refrigerator_Count + 1;    % Increment Refrigerator On State Counter
    end
end


% Determine Probability of Starting in the On State

Refrigerator_Prob = (Refrigerator_Count/(Simulation_Length*60*time_step));  % Probability of Refrigerator Starting in the On State

if rand(1) <= Refrigerator_Prob     % Probability of Refrigerator Starting in the On State
    
    Refrigerator_State = 1; % (On) Initial State of Refrigerator
else
    Refrigerator_State = 0; % (Off) Initial State of Refrigerator
end

Refrigerator_State_DR = Refrigerator_State; % Initial State of Refrigerator

end