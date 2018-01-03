function [Global_Illum, Direct_Illum, Diffuse_Illum, DewPoint_Temp] = calculateilluminance...
    (Outdoor_Temp, Global_Irrad, Direct_Irrad, Diffuse_Irrad, Relative_Humidity, month, day, year)
% Calculate Solar Illuminance and Dew Point Temperature
%   This function calculates solar illuminance and dew point temperature from
%   solar irriadiance, air temperature, and relative humidity input data and
%   this data is used to control the lighting model.
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 6/8/2013
%--------------------------------------------------------------------------


Global_Illum = zeros(1,length(Global_Irrad));   % Initialize Global Horizontal Illuminance Matrix
Direct_Illum = zeros(1,length(Direct_Irrad));   % Initialize Direct Normal Illuminance Matrix
Diffuse_Illum = zeros(1,length(Diffuse_Irrad)); % Initialize Diffuse Horizontal Illuminance Matrix
DewPoint_Temp = zeros(1,length(Outdoor_Temp));  % Initialize Dew Point Temperature Matrix

latitude = 36;      % (Degrees North) Latitude of Oak Ridge, TN
longitude = 84.25;  % (Degrees West) Longituded of Oak Ridge, TN


% Determine Julian Day

if ~leapyear(year)  % If Year is not a Leap Year
    
    if month == 1       % January
        start = 0;
    elseif month == 2   % February
        start = 31;
    elseif month == 3   % March
        start = 31 + 28;
    elseif month == 4   % April
        start = 31 + 28 + 31;
    elseif month == 5   % May
        start = 31 + 28 + 31 + 30;
    elseif month == 6   % June
        start = 31 + 28 + 31 + 30 + 31;
    elseif month == 7   % July
        start = 31 + 28 + 31 + 30 + 31 + 30;
    elseif month == 8   % August
        start = 31 + 28 + 31 + 30 + 31 + 30 + 31;
    elseif month == 9   % September
        start = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31;
    elseif month == 10  % October
        start = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30;
    elseif month == 11  % November
        start = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31;
    elseif month == 12  % December
        start = 31 + 28 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30;
    end
    
else    % If Year is a Leap Year
    
    if month == 1       % January
        start = 0;
    elseif month == 2   % February
        start = 31;
    elseif month == 3   % March
        start = 31 + 29;
    elseif month == 4   % April
        start = 31 + 29 + 31;
    elseif month == 5   % May
        start = 31 + 29 + 31 + 30;
    elseif month == 6   % June
        start = 31 + 29 + 31 + 30 + 31;
    elseif month == 7   % July
        start = 31 + 29 + 31 + 30 + 31 + 30;
    elseif month == 8   % August
        start = 31 + 29 + 31 + 30 + 31 + 30 + 31;
    elseif month == 9   % September
        start = 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31;
    elseif month == 10  % October
        start = 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30;
    elseif month == 11  % November
        start = 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31;
    elseif month == 12  % December
        start = 31 + 29 + 31 + 30 + 31 + 30 + 31 + 31 + 30 + 31 + 30;
    end
end

n = start + day;    % Julian Day (Jan 1 = 1, Dec 31 = 365) Ignoring Leap Year

ST = 0;             % Initialize Standard Time
hour_angle = -180;  % Initialize Hour Angle


% % Solar Time Hour Angle Correction
% 
% SL = 75;        % (Degrees) Standard Longitude for Eastern Time Zone
% LL = longitude; % (Degrees) Local Longitude
% 
% Bn = (360*(n-81)*pi)/(364*180);
% E = 9.87*sin(2*Bn) - 7.53*cos(Bn) - 1.5*sin(Bn);    % (Minutes) Correction Provided by the Equation of Time
% 
% Solar_Time = ST + (4*(SL - LL) - E)/60;     % (Hour) Solar Time
% 
% 
% % Corrected Hour Angle
% 
% hour_angle = (Solar_Time - 12)*15;


for i = 1:length(Outdoor_Temp)
    
    % Solar Declination Angle
    
    declination = 23.45*sin((360*(284 + n))/365);   % (Degrees) Solar Declination Angle (Inaccurate for Dec 31st during Leap Years)
    
    
    % Zenith Angle
    
    Z_d = acosd(sind(latitude)*sind(declination) + cosd(latitude)*cosd(declination)*cosd(hour_angle));  % (Degrees) Zenith Angle
    
    Z_r = (pi/180)*Z_d; % (Radians) Zenith Angle
    
    
    % Sky Clearness
    
    Clearness = ((Diffuse_Irrad(1,i) + Direct_Irrad(1,i))/(Diffuse_Irrad(1,i) + 1e-10) + 1.041*Z_r^3)/(1 + 1.041*Z_r^3);   % Sky Clearness
    
    
    %----------------------------------------------------------------------
    I0 = 1367; % (W/m^2) Extraterrestrial Irradiance
    
    m = 1/(cosd(Z_d) + 0.50572*(6.07995 + 90 - Z_d)^-1.6364);   % Relative Optical Airmass (Kasten)
    
    
    % Sky Brightness
    
    Brightness = (Diffuse_Irrad(1,i)*m)/I0; % Sky Brightness
    
    
    %----------------------------------------------------------------------
    % Dew Point Temperature
    
    a = 6.112;  % (millibar) Constant
    b = 17.67;  % Constant
    c = 243.5;  % (C) Constant
    
    Ps = a*exp((b*Outdoor_Temp(1,i))/(c + Outdoor_Temp(1,i)));  % (millibar) Saturated Water Vapor Pressure
    Pa = (Relative_Humidity(1,i)/100)*Ps;                       % (millibar) Actual Water Vapor Pressure
    
    Td = (c*log(Pa/a))/(b - log(Pa/a)); % (C) Dew Point Temperature
    
    DewPoint_Temp(1,i) = Td;    % (C) Dew Point Temperature
    
    
    % Atmospheric Precipitable Water Content
    
    W = exp(0.07*Td - 0.075);   % (cm) Atmospheric Precipitable Water Content
    
    
    %----------------------------------------------------------------------
    % Calculate Bin
    
    if Clearness <= 1.065
        bin = 1;
    elseif Clearness > 1.065 && Clearness <= 1.230
        bin = 2;
    elseif Clearness > 1.230 && Clearness <= 1.500
        bin = 3;
    elseif Clearness > 1.500 && Clearness <= 1.950
        bin = 4;
    elseif Clearness > 1.950 && Clearness <= 2.800
        bin = 5;
    elseif Clearness > 2.800 && Clearness <= 4.500
        bin = 6;
    elseif Clearness > 4.500 && Clearness <= 6.200
        bin = 7;
    elseif Clearness > 6.200
        bin = 8;
    end
    
    
    %----------------------------------------------------------------------
    % Global Luminous Efficacy
    
    Global_bin = [96.63 -0.47 11.50  -9.16;
                 107.54  0.79  1.79  -1.19;
                  98.73  0.70  4.40  -6.95;
                  92.72  0.56  8.36  -8.31;
                  86.73  0.98  7.10 -10.94;
                  88.34  1.39  6.06  -7.60;
                  78.63  1.47  4.93 -11.37;
                  99.65  1.86 -4.46  -3.15];
    
    if Global_Irrad(1,i) < 1
        Global_Illum(1,i) = 0;
    else
        Global_Illum(1,i) = Global_Irrad(1,i)*(Global_bin(bin,1) + Global_bin(bin,2)*W +...
            Global_bin(bin,3)*cos(Z_r) + Global_bin(bin,4)*log(Brightness));                  % (Lux) Global Horizontal Illuminance
    end
    
    
    %----------------------------------------------------------------------
    % Direct Luminous Efficacy
    
    Direct_bin = [57.20 -4.55 -2.98 117.12;
                  98.99 -3.46 -1.21  12.38;
                 109.83 -4.90 -1.71  -8.81;
                 110.34 -5.84 -1.99  -4.56;
                 106.36 -3.97 -1.75  -6.16;
                 107.19 -1.25 -1.51 -26.73;
                 105.75  0.77 -1.26 -34.44;
                 101.18  1.58 -1.10  -8.29];
    
    Direct_Illum(1,i) = Direct_Irrad(1,i)*(Direct_bin(bin,1) + Direct_bin(bin,2)*W +...
        Direct_bin(bin,3)*exp(5.73*Z_r - 5) + Direct_bin(bin,4)*Brightness);                % (Lux) Direct Normal Illuminance
    
    Direct_Illum(1,i) = max([0, Direct_Illum(1,i)]);
    
    
    %----------------------------------------------------------------------
    % Diffuse Luminous Efficacy
    
    Diffuse_bin = [97.24 -0.46  12.00  -8.91;
                  107.22  1.15   0.59  -3.95;
                  104.97  2.96  -5.53  -8.77;
                  102.39  5.59 -13.95 -13.90;
                  100.71  5.94 -22.75 -23.74;
                  106.42  3.83 -36.15 -28.83;
                  141.88  1.90 -53.24 -14.03;
                  152.23  0.35 -45.27  -7.98];
    
    if Diffuse_Irrad(1,i) < 1
        Diffuse_Illum(1,i) = 0;
    else
        Diffuse_Illum(1,i) = Diffuse_Irrad(1,i)*(Diffuse_bin(bin,1) + Diffuse_bin(bin,2)*W +...
            Diffuse_bin(bin,3)*cos(Z_r) + Diffuse_bin(bin,4)*log(Brightness));                  % (Lux) Diffuse Horizontal Illuminance
    end
    
    
    %----------------------------------------------------------------------
    % Increment Values
    
    hour_angle = hour_angle + (1/3600)*15;  % (Degrees) Hour Angle
    
    if hour_angle >= 180
        hour_angle = hour_angle - 360;      % (Degrees) Hour Angle
        n = n + 1;                          % Julian Day (Jan 1 = 1, Dec 31 = 365) Ignoring Leap Year
    end
end

end