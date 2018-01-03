% Plots Air Density vs. Temperature Relationship
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 12/23/2012
%--------------------------------------------------------------------------
% Sources: Air Density vs. Temperature Tables
%--------------------------------------------------------------------------

clear all;  % Clear Workspace
close all;  % Close All Windows
clc;        % Clear Command Window

home = cd;

if isdir(fullfile(home,'Output Data','Figures'))
else
mkdir(fullfile(home,'Output Data','Figures'))
end

METERSperFEET = (1/3.28084);    % (m/ft) Meters per Feet Conversion Factor
LBSperKG = 2.20462262;          % (lb/kg) Pounds to Kilograms Conversion Factor

Temperature = [-40 -20 0 5 10 15 20 25 30 40 50 60 70 80 90 100 200 300 400 500 1000]*(9/5) + 32;   % (F) Temperature
Air_Density = [1.514 1.395 1.293 1.269 1.247 1.225 1.204 1.184 1.165 1.127 1.109 1.060 1.029...
    0.9996 0.9721 0.9461 0.7461 0.6159 0.5243 0.4565 0.2772]*(METERSperFEET^3)*LBSperKG;            % (lb/ft^3) Density of Air

figure(1)
plot(Temperature, Air_Density)
title('Air Density vs. Temperature')
ylabel('Air Density (lb/ft^3)')
xlabel('Temperature (F)')
xlim([-40, 1000])
print(figure(1),'-dpng',fullfile(home,'Output Data','Figures','AirDensityVsTemperature.png'));