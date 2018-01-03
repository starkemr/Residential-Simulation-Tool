% Plots Water Density vs. Temperature Relationship
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
% Sources: Water Density vs. Temperature Tables
%--------------------------------------------------------------------------

clear all;  % Clear Workspace
close all;  % Close All Windows
clc;        % Clear Command Window

home = cd;

if isdir(fullfile(home,'Output Data','Figures'))
else
mkdir(fullfile(home,'Output Data','Figures'))
end

Water_Density = [62.42, 62.43, 62.41, 62.37, 62.30 62.22, 62.11, 62, 61.71, 61.38, 61, 60.58, 60.12, 59.83];    % (lbm/ft^3) Water Density
Temperature_Density = [32, 40, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 200, 212];                          % (F) Water Temperature

CuFEETperGAL = (1/7.4805);  % (ft^3/gal) ft^3 per gallon Conversion Factor

figure(1)
plot(Temperature_Density, Water_Density*CuFEETperGAL)
title('Water Density vs. Temperature')
ylabel('Water Density (lbm/gal)')
xlabel('Temperature (F)')
xlim([32 212])
print(figure(1),'-dpng',fullfile(home,'Output Data','Figures','WaterDensityVsTemperature.png'));