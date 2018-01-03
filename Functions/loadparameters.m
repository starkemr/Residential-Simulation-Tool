function [Occupant_Inputs, OccupantsPerHome_Inputs, HomeHVAC_Inputs, WaterHeater_Inputs,...
    RefrigeratorFreezer_Inputs, RefrigeratorFreezer_Inputs2, Deferrable_Inputs,...
    Uninterruptible_Inputs, ElectricVehicle_Inputs, HVACDemandResponse_Inputs,...
    WaterHeaterDemandResponse_Inputs, RefrigeratorDemandResponse_Inputs,...
    FreezerDemandResponse_Inputs, WasherDryerDemandResponse_Inputs,...
    DishwasherDemandResponse_Inputs] = loadparameters(inputdata)
% Load User Input Parameters
%   This function loads input parameters for the home, occupants, appliances, and demand response settings
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 6/24/2014
%--------------------------------------------------------------------------


% Occupant Parameters

if exist(fullfile(inputdata,'User Settings','Occupant_Data.txt'),'file') == 2
    Occupant_Inputs = load(fullfile(inputdata,'User Settings','Occupant_Data.txt'));
else
    Occupant_Inputs = load(fullfile(inputdata,'Default Settings','Occupant_Default.txt'));
end


% Occupants Per Home Distribution

if exist(fullfile(inputdata,'User Settings','OccupantsPerHome_Data.txt'),'file') == 2
    OccupantsPerHome_Inputs = importdata(fullfile(inputdata,'User Settings','OccupantsPerHome_Data.txt'));
else
    OccupantsPerHome_Inputs = importdata(fullfile(inputdata,'Default Settings','OccupantsPerHome_Default.txt'));
end


% Home/HVAC Parameters

if exist(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'),'file') == 2
    HomeHVAC_Inputs = load(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'));
else
    HomeHVAC_Inputs = load(fullfile(inputdata,'Default Settings','HomeHVAC_Default.txt'));
end


% Water Heater Parameters

if exist(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'),'file') == 2
    WaterHeater_Inputs = load(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'));
else
    WaterHeater_Inputs = load(fullfile(inputdata,'Default Settings','WaterHeater_Default.txt'));
end


% Refrigerator/Freezer Parameters

if exist(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'),'file') == 2
    RefrigeratorFreezer_Parameters = load(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'));
else
    RefrigeratorFreezer_Parameters = load(fullfile(inputdata,'Default Settings','RefrigeratorFreezer_Default.txt'));
end

% Primary Refrigerator/Freezer Parameters

RefrigeratorFreezer_Inputs(1) = RefrigeratorFreezer_Parameters(1);
RefrigeratorFreezer_Inputs(2) = RefrigeratorFreezer_Parameters(2);
RefrigeratorFreezer_Inputs(3) = RefrigeratorFreezer_Parameters(3);
RefrigeratorFreezer_Inputs(4) = RefrigeratorFreezer_Parameters(4);
RefrigeratorFreezer_Inputs(5) = RefrigeratorFreezer_Parameters(9);
RefrigeratorFreezer_Inputs(6) = RefrigeratorFreezer_Parameters(10);
RefrigeratorFreezer_Inputs(7) = RefrigeratorFreezer_Parameters(11);
RefrigeratorFreezer_Inputs(8) = RefrigeratorFreezer_Parameters(12);
RefrigeratorFreezer_Inputs(9) = RefrigeratorFreezer_Parameters(13);
RefrigeratorFreezer_Inputs(10) = RefrigeratorFreezer_Parameters(14);
RefrigeratorFreezer_Inputs(11) = RefrigeratorFreezer_Parameters(15);
RefrigeratorFreezer_Inputs(12) = RefrigeratorFreezer_Parameters(20);
RefrigeratorFreezer_Inputs(13) = RefrigeratorFreezer_Parameters(21);
RefrigeratorFreezer_Inputs(14) = RefrigeratorFreezer_Parameters(22);

% Secondary Refrigerator/Freezer Parameters

RefrigeratorFreezer_Inputs2(1) = RefrigeratorFreezer_Parameters(5);
RefrigeratorFreezer_Inputs2(2) = RefrigeratorFreezer_Parameters(6);
RefrigeratorFreezer_Inputs2(3) = RefrigeratorFreezer_Parameters(7);
RefrigeratorFreezer_Inputs2(4) = RefrigeratorFreezer_Parameters(8);
RefrigeratorFreezer_Inputs2(5) = RefrigeratorFreezer_Parameters(9);
RefrigeratorFreezer_Inputs2(6) = RefrigeratorFreezer_Parameters(10);
RefrigeratorFreezer_Inputs2(7) = RefrigeratorFreezer_Parameters(11);
RefrigeratorFreezer_Inputs2(8) = RefrigeratorFreezer_Parameters(16);
RefrigeratorFreezer_Inputs2(9) = RefrigeratorFreezer_Parameters(17);
RefrigeratorFreezer_Inputs2(10) = RefrigeratorFreezer_Parameters(18);
RefrigeratorFreezer_Inputs2(11) = RefrigeratorFreezer_Parameters(19);
RefrigeratorFreezer_Inputs2(12) = RefrigeratorFreezer_Parameters(20);
RefrigeratorFreezer_Inputs2(13) = RefrigeratorFreezer_Parameters(21);
RefrigeratorFreezer_Inputs2(14) = RefrigeratorFreezer_Parameters(22);


% Deferrable Load Parameters

if exist(fullfile(inputdata,'User Settings','Deferrable_Data.txt'),'file') == 2
    Deferrable_Inputs = load(fullfile(inputdata,'User Settings','Deferrable_Data.txt'));
else
    Deferrable_Inputs = load(fullfile(inputdata,'Default Settings','Deferrable_Default.txt'));
end


% Uninterruptible Load Parameters

if exist(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'),'file') == 2
    Uninterruptible_Inputs = load(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'));
else
    Uninterruptible_Inputs = load(fullfile(inputdata,'Default Settings','Uninterruptible_Default.txt'));
end


% Electric Vehicle Parameters

if exist(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'),'file') == 2
    ElectricVehicle_Inputs = load(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'));
else
    ElectricVehicle_Inputs = load(fullfile(inputdata,'Default Settings','ElectricVehicle_Default.txt'));
end


% HVAC Demand Response Parameters

if exist(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'),'file') == 2
    HVACDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'));
else
    HVACDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','HVACDemandResponse_Default.txt'));
end


% Water Heater Demand Response Parameters

if exist(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'),'file') == 2
    WaterHeaterDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'));
else
    WaterHeaterDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','WaterHeaterDemandResponse_Default.txt'));
end


% Refrigerator Demand Response Parameters

if exist(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'),'file') == 2
    RefrigeratorDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'));
else
    RefrigeratorDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','RefrigeratorDemandResponse_Default.txt'));
end


% Freezer Demand Response Parameters

if exist(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'),'file') == 2
    FreezerDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'));
else
    FreezerDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','FreezerDemandResponse_Default.txt'));
end


% Washer/Dryer Demand Response Parameters

if exist(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'),'file') == 2
    WasherDryerDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'));
else
    WasherDryerDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','WasherDryerDemandResponse_Default.txt'));
end


% Dishwasher Demand Response Parameters

if exist(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'),'file') == 2
    DishwasherDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'));
else
    DishwasherDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','DishwasherDemandResponse_Default.txt'));
end


% Residential Load Distribution Override (Overrides Default Percentages)

if exist(fullfile(inputdata,'User Settings','LoadDistribution_Override.csv'),'file') == 2   % Use Defined Load Distribution If Given
    
    LoadDistribution_Override = importdata(fullfile(inputdata,'User Settings','LoadDistribution_Override.csv'));    % Load Distribution Matrix
    
    HomeHVAC_Inputs(14) = LoadDistribution_Override.data(1);                % Percentage with Heat Pump
    HomeHVAC_Inputs(15) = LoadDistribution_Override.data(2);                % Percentage with Resistive Heating
    HomeHVAC_Inputs(16) = LoadDistribution_Override.data(3);                % Percentage with Nonelectric Heating
    HomeHVAC_Inputs(17) = LoadDistribution_Override.data(4);                % Percentage with Air Conditioning
    WaterHeater_Inputs(2) = LoadDistribution_Override.data(5);              % Percentage with Water Heater
    RefrigeratorFreezer_Inputs(1) = LoadDistribution_Override.data(6);      % Percentage with Refrigerator
    RefrigeratorFreezer_Inputs(2) = LoadDistribution_Override.data(7);      % Percentage with Automatic Defrost (Refrigerator)
    RefrigeratorFreezer_Inputs2(1) = LoadDistribution_Override.data(8);     % Percentage with Second Refrigerator
    RefrigeratorFreezer_Inputs2(2) = LoadDistribution_Override.data(9);     % Percentage with Automatic Defrost (Second Refrigerator)
    RefrigeratorFreezer_Inputs(8) = LoadDistribution_Override.data(10);     % Percentage with Freezer
    RefrigeratorFreezer_Inputs(9) = LoadDistribution_Override.data(11);     % Percentage with Automatic Defrost (Freezer)
    RefrigeratorFreezer_Inputs2(8) = LoadDistribution_Override.data(12);    % Percentage with Second Freezer
    RefrigeratorFreezer_Inputs2(9) = LoadDistribution_Override.data(13);    % Percentage with Automatic Defrost (Second Freezer)
    Deferrable_Inputs(1) = LoadDistribution_Override.data(14);              % Percentage with Washer
    Deferrable_Inputs(4) = LoadDistribution_Override.data(15);              % Percentage with Electric Dryer
    Deferrable_Inputs(7) = LoadDistribution_Override.data(16);              % Percentage with Nonelectric Dryer
    Deferrable_Inputs(10) = LoadDistribution_Override.data(17);             % Percentage with Dishwasher
    Uninterruptible_Inputs(1) = LoadDistribution_Override.data(18);         % Percentage with Cooking
    Uninterruptible_Inputs(4) = LoadDistribution_Override.data(19);         % Number of Televisions per Home
    Uninterruptible_Inputs(8) = LoadDistribution_Override.data(20);         % Number of Computers per Home
    Uninterruptible_Inputs(13) = LoadDistribution_Override.data(21);        % Percentage with Lighting
    Uninterruptible_Inputs(14) = LoadDistribution_Override.data(22);        % Incandescent Lighting Percentage
    Uninterruptible_Inputs(15) = LoadDistribution_Override.data(23);        % Halogen Lighting Percentage
    Uninterruptible_Inputs(16) = LoadDistribution_Override.data(24);        % Linear Fluorescent Lighting Percentage
    Uninterruptible_Inputs(17) = LoadDistribution_Override.data(25);        % Compact Fluorescent Lighting Percentage
    Uninterruptible_Inputs(18) = LoadDistribution_Override.data(26);        % LED Lighting Percentage
end

end