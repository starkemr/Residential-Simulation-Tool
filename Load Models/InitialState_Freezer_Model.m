function [Freezer_State, Freezer_State_DR] = InitialState_Freezer_Model(time_step,...
    RefrigeratorFreezer_Inputs, FreezerDefrost, Indoor_Temp, Freezer_Temp,...
    Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer, Freezer_ThermostatAdjust,...
    FreezerOpenDoor_rand, Activity, Scaling_Factor)
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
% Last Updated: 1/23/2014
%--------------------------------------------------------------------------
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/freezer.cpp
%--------------------------------------------------------------------------


% Determine Probability of Starting in the On State

Freezer_Count = 0;  % Increment Freezer On State Counter

Simulation_Length = 12; % (hr) Simulation Length

for j = 1:(Simulation_Length*60*time_step)  % Simulate for 'Simulation Length' Hours Using Initial Inputs
    
    % Simulate Freezer Model
    
    [Freezer_Power, Freezer_Temp, Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer]...
        = Freezer_Model(time_step, RefrigeratorFreezer_Inputs, FreezerDefrost, Indoor_Temp,...
        Freezer_Temp, Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer,...
        Freezer_ThermostatAdjust, FreezerOpenDoor_rand, Activity, Scaling_Factor);
    
    
    % Record Freezer State
    
    if Freezer_State ~= 0
        Freezer_Count = Freezer_Count + 1;    % Increment Freezer On State Counter
    end
end


% Determine Probability of Starting in the On State

Freezer_Prob = (Freezer_Count/(Simulation_Length*60*time_step));    % Probability of Freezer Starting in the On State

if rand(1) <= Freezer_Prob  % Probability of Freezer Starting in the On State
    
    Freezer_State = 1;  % (On) Initial State of Freezer
else
    Freezer_State = 0;  % (Off) Initial State of Freezer
end

Freezer_State_DR = Freezer_State;   % Initial State of Freezer

end