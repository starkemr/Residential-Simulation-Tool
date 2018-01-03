function [Outdoor_Temp, Global_Irrad, Direct_Irrad, Diffuse_Irrad, Wind_Speed, Peak_Wind_Speed,...
    Wind_Direction, Relative_Humidity, Precipitation, Accumulated_Precipitation,...
    Estimated_Pressure, WM_Markov_Model, WM_Prob_Model, NM_Markov_Model, NM_Prob_Model,...
    WF_Markov_Model, WF_Prob_Model, NF_Markov_Model, NF_Prob_Model, C_Markov_Model,...
    C_Prob_Model, Tot_Prob_Model] = loadinputdata(inputdata, Occupant_Inputs, Environmental_Data)
% Load Environmental Input Data
%   This function loads environmental input data used to control the model.
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 8/18/2013
%--------------------------------------------------------------------------


% Environmental Data (From ORNL's Rotating Shadowband Radiometer)

Environment = importdata(fullfile(inputdata,'Environmental Input Data',strcat(Environmental_Data,'.csv'))); % Selected Environmental Input Data

Outdoor_Temp = Environment.data(:,6);               % (C) Outdoor Air Temperature Data (Hour)
Global_Irrad = Environment.data(:,2);               % (W/m^2) Global Horizontal Irradiance (Hour)
Direct_Irrad = Environment.data(:,3);               % (W/m^2) Direct Normal Irradiance (Hour)
Diffuse_Irrad = Environment.data(:,4);              % (W/m^2) Diffuse Horizontal Irradiance (Hour)
Wind_Speed = Environment.data(:,8);                 % (m/s) Wind Speed at 42 ft (Hour)
Peak_Wind_Speed = Environment.data(:,9);            % (m/s) Peak Wind Speed at 42 ft (Hour)
Wind_Direction = Environment.data(:,10);            % (Degrees from North) Wind Direction at 42 ft (Hour)
Relative_Humidity = Environment.data(:,7);          % (%) Relative Humidity (Hour)
Precipitation = Environment.data(:,12);             % (mm) Precipitation (Hour)
Accumulated_Precipitation = Environment.data(:,13); % (mm) Accumulated Precipitation (Hour)
Estimated_Pressure = Environment.data(:,11);        % (mBar) Estimated Pressure (Hour)

% Outdoor_Temp = Environment.data(:,5);               % (C) Outdoor Air Temperature Data (Minute)
% Global_Irrad = Environment.data(:,1);               % (W/m^2) Global Horizontal Irradiance (Minute)
% Direct_Irrad = Environment.data(:,2);               % (W/m^2) Direct Normal Irradiance (Minute)
% Diffuse_Irrad = Environment.data(:,3);              % (W/m^2) Diffuse Horizontal Irradiance (Minute)
% Wind_Speed = Environment.data(:,7);                 % (m/s) Wind Speed at 42 ft (Minute)
% Peak_Wind_Speed = Environment.data(:,8);            % (m/s) Peak Wind Speed at 42 ft (Minute)
% Wind_Direction = Environment.data(:,9);             % (Degrees from North) Wind Direction at 42 ft (Minute)
% Relative_Humidity = Environment.data(:,6);          % (%) Relative Humidity (Minute)
% Precipitation = Environment.data(:,11);             % (mm) Precipitation (Minute)
% Accumulated_Precipitation = Environment.data(:,12); % (mm) Accumulated Precipitation (Minute)
% Estimated_Pressure = Environment.data(:,10);        % (mBar) Estimated Pressure (Minute)


% Load Occupant Model Matrices (Created From ATUS Data)

WM_Markov_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Working_Male_Markov_Matrix.csv'));
WM_Prob_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Working_Male_Probability_Matrix.csv'));

NM_Markov_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Nonworking_Male_Markov_Matrix.csv'));
NM_Prob_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Nonworking_Male_Probability_Matrix.csv'));

WF_Markov_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Working_Female_Markov_Matrix.csv'));
WF_Prob_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Working_Female_Probability_Matrix.csv'));

NF_Markov_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Nonworking_Female_Markov_Matrix.csv'));
NF_Prob_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Nonworking_Female_Probability_Matrix.csv'));

C_Markov_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Child_Markov_Matrix.csv'));
C_Prob_Model = csvread(fullfile(inputdata,'Occupant Behavior Models','Child_Probability_Matrix.csv'));


% Create a Total Model based Upon Original Models and Percentage of Occupant Types per Household

Tot_Prob_Model = Occupant_Inputs(1)*WM_Prob_Model + Occupant_Inputs(2)*NM_Prob_Model +...
    Occupant_Inputs(3)*WF_Prob_Model + Occupant_Inputs(4)*NF_Prob_Model + Occupant_Inputs(5)*C_Prob_Model;


% Normalize Total Occupant Activity Probability Matrix

for i = 1:length(Tot_Prob_Model)
    Tot_Prob_Model(i,1:10) = Tot_Prob_Model(i,1:10)/sum(Tot_Prob_Model(i,1:10));
end

Tot_Prob_Model(isnan(Tot_Prob_Model)) = 0;  % Replace All NaNs with Zeros

end