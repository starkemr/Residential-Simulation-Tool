function [time, Outdoor_Temp2, Global_Irrad2, Direct_Irrad2, Diffuse_Irrad2, Wind_Speed2, Peak_Wind_Speed2,...
    Wind_Direction2, Relative_Humidity2, Precipitation2, Accumulated_Precipitation2,...
    Estimated_Pressure2] = interpolate(start_min, start_hour, simlength, time_step, Outdoor_Temp,...
    Global_Irrad, Direct_Irrad, Diffuse_Irrad, Wind_Speed, Peak_Wind_Speed, Wind_Direction,...
    Relative_Humidity, Precipitation, Accumulated_Precipitation, Estimated_Pressure)
% Hour/Minute to Minute/Second Interpolater
%   This function converts hour or minute input data into minute or second
%   input data through interpolation.
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 1/22/2014
%--------------------------------------------------------------------------


% Set Time Scales

time_actual_hour = 1:60*time_step:24*60*time_step*simlength;    % Time Scale in Hours

time_actual_min = 1:time_step:24*60*time_step*simlength;        % Time Scale in Minutes

time = 1:1:24*60*time_step*simlength;                           % Simulation Time Scale


% Outdoor Air Temperature (1 Second or 1 Minute Resolution)

Outdoor_Temp2 = interp1(time_actual_hour, Outdoor_Temp(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (C) Outdoor Air Temperature
I = isnan(Outdoor_Temp2);
Outdoor_Temp2(I) = Outdoor_Temp2(find(I == 0, 1, 'last'));

Outdoor_Temp2 = Outdoor_Temp2*(9/5) + 32;   % (F) Convert from Celsius to Fahrenheit


% Solar Irradiance (1 Second or 1 Minute Resolution)

Global_Irrad2 = interp1(time_actual_hour, Global_Irrad(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (W/m^2) Global Horizontal Irradiance
I = isnan(Global_Irrad2);
Global_Irrad2(I) = Global_Irrad2(find(I == 0, 1, 'last'));

Direct_Irrad2 = interp1(time_actual_hour, Direct_Irrad(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (W/m^2) Direct Normal Irradiance
I = isnan(Direct_Irrad2);
Direct_Irrad2(I) = Direct_Irrad2(find(I == 0, 1, 'last'));

Diffuse_Irrad2 = interp1(time_actual_hour, Diffuse_Irrad(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (W/m^2) Diffuse Horizontal Irradiance
I = isnan(Diffuse_Irrad2);
Diffuse_Irrad2(I) = Diffuse_Irrad2(find(I == 0, 1, 'last'));


% Wind Speed and Direction (1 Second or 1 Minute Resolution)

Wind_Speed2 = interp1(time_actual_hour, Wind_Speed(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (m/s) Wind Speed at 42 ft
I = isnan(Wind_Speed2);
Wind_Speed2(I) = Wind_Speed2(find(I == 0, 1, 'last'));

Peak_Wind_Speed2 = interp1(time_actual_hour, Peak_Wind_Speed(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (m/s) Peak Wind Speed at 42 ft
I = isnan(Peak_Wind_Speed2);
Peak_Wind_Speed2(I) = Peak_Wind_Speed2(find(I == 0, 1, 'last'));

Wind_Direction2 = interp1(time_actual_hour, Wind_Direction(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (Degrees from North) Wind Direction at 42 ft
I = isnan(Wind_Direction2);
Wind_Direction2(I) = Wind_Direction2(find(I == 0, 1, 'last'));


% Relative Humidity, Precipitation, and Estimated Pressure (1 Second or 1 Minute Resolution)

Relative_Humidity2 = interp1(time_actual_hour, Relative_Humidity(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (%) Relative Humidity
I = isnan(Relative_Humidity2);
Relative_Humidity2(I) = Relative_Humidity2(find(I == 0, 1, 'last'));

Precipitation2 = interp1(time_actual_hour, Precipitation(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (mm) Precipitation
I = isnan(Precipitation2);
Precipitation2(I) = Precipitation2(find(I == 0, 1, 'last'));

Accumulated_Precipitation2 = interp1(time_actual_hour, Accumulated_Precipitation(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (mm) Accumulated Precipitation
I = isnan(Accumulated_Precipitation2);
Accumulated_Precipitation2(I) = Accumulated_Precipitation2(find(I == 0, 1, 'last'));

Estimated_Pressure2 = interp1(time_actual_hour, Estimated_Pressure(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (mBar) Estimated Pressure
I = isnan(Estimated_Pressure2);
Estimated_Pressure2(I) = Estimated_Pressure2(find(I == 0, 1, 'last'));


% % Outdoor Air Temperature (1 Second or 1 Minute Resolution)
%
% Outdoor_Temp2 = interp1(time_actual_min, Outdoor_Temp(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (C) Outdoor Air Temperature
% I = isnan(Outdoor_Temp2);
% Outdoor_Temp2(I) = Outdoor_Temp2(find(I == 0, 1, 'last'));
%
% Outdoor_Temp2 = Outdoor_Temp2*(9/5) + 32;   % (F) Convert from Celsius to Fahrenheit
%
%
% % Solar Irradiance (1 Second or 1 Minute Resolution)
%
% Global_Irrad2 = interp1(time_actual_min, Global_Irrad(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (W/m^2) Global Horizontal Irradiance
% I = isnan(Global_Irrad2);
% Global_Irrad2(I) = Global_Irrad2(find(I == 0, 1, 'last'));
%
% Direct_Irrad2 = interp1(time_actual_min, Direct_Irrad(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (W/m^2) Direct Normal Irradiance
% I = isnan(Direct_Irrad2);
% Direct_Irrad2(I) = Direct_Irrad2(find(I == 0, 1, 'last'));
%
% Diffuse_Irrad2 = interp1(time_actual_min, Diffuse_Irrad(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (W/m^2) Diffuse Horizontal Irradiance
% I = isnan(Diffuse_Irrad2);
% Diffuse_Irrad2(I) = Diffuse_Irrad2(find(I == 0, 1, 'last'));
%
%
% % Wind Speed and Direction (1 Second or 1 Minute Resolution)
%
% Wind_Speed2 = interp1(time_actual_min, Wind_Speed(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (m/s) Wind Speed at 42 ft
% I = isnan(Wind_Speed2);
% Wind_Speed2(I) = Wind_Speed2(find(I == 0, 1, 'last'));
%
% Peak_Wind_Speed2 = interp1(time_actual_min, Peak_Wind_Speed(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (m/s) Peak Wind Speed at 42 ft
% I = isnan(Peak_Wind_Speed2);
% Peak_Wind_Speed2(I) = Peak_Wind_Speed2(find(I == 0, 1, 'last'));
%
% Wind_Direction2 = interp1(time_actual_min, Wind_Direction(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (Degrees from North) Wind Direction at 42 ft
% I = isnan(Wind_Direction2);
% Wind_Direction2(I) = Wind_Direction2(find(I == 0, 1, 'last'));
%
%
% % Relative Humidity, Precipitation, and Estimated Pressure (1 Second or 1 Minute Resolution)
%
% Relative_Humidity2 = interp1(time_actual_min, Relative_Humidity(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (%) Relative Humidity
% I = isnan(Relative_Humidity2);
% Relative_Humidity2(I) = Relative_Humidity2(find(I == 0, 1, 'last'));
%
% Precipitation2 = interp1(time_actual_min, Precipitation(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (mm) Precipitation
% I = isnan(Precipitation2);
% Precipitation2(I) = Precipitation2(find(I == 0, 1, 'last'));
%
% Accumulated_Precipitation2 = interp1(time_actual_min, Accumulated_Precipitation(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (mm) Accumulated Precipitation
% I = isnan(Accumulated_Precipitation2);
% Accumulated_Precipitation2(I) = Accumulated_Precipitation2(find(I == 0, 1, 'last'));
%
% Estimated_Pressure2 = interp1(time_actual_min, Estimated_Pressure(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (mBar) Estimated Pressure
% I = isnan(Estimated_Pressure2);
% Estimated_Pressure2(I) = Estimated_Pressure2(find(I == 0, 1, 'last'));

end