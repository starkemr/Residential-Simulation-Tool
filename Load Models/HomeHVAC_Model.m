function [HVAC_Power, HVAC_Q, HVAC_COP, Indoor_Temp, Mass_Temp, Envelope_Temp, HVAC_State] = HomeHVAC_Model(time_step,...
    HomeHVAC_Inputs, HVAC_Mode, HVAC_CoolingType, HVAC_HeatingType, Outdoor_Temp, Indoor_Temp, Mass_Temp,...
    Envelope_Temp, Direct_Irrad, Diffuse_Irrad, Internal_Q, HVAC_State, HVAC_ThermostatAdjust, Scaling_Factor)
% Dynamic Home/HVAC Model
%   Model which simulates the thermal characterisitcs of a home and its HVAC system
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 7/9/2014
%--------------------------------------------------------------------------
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/house_e.cpp
%--------------------------------------------------------------------------


% Constants and Defined Values

WATTperBTU_hr = 0.29307107;     % (W/(Btu/hr)) Watts to Btu/hr Conversion Factor
HOURSperSECOND = (1/3600);      % (hr/s) Hours to Seconds Conversion Factor
METERSperFEET = (1/3.28084);    % (m/ft) Meters per Feet Conversion Factor
LBSperKG = 2.20462262;          % (lb/kg) Pounds to Kilograms Conversion Factor

mf = 2.0;   % (Btu/F*ft^2) Total Thermal Mass per Floor Area (As Defined by GridLAB-D)
hs = 1.46;  % (Btu/hr*F*ft^2) Interior Surface Heat Transfer Coefficient (For Vertical Surface in Still Air)

if HVAC_Mode == -1  % If HVAC Mode is Cooling, Assume Summer Value
    ho = 4.0;       % (Btu/hr*F*ft^2) Exterior Surface Heat Transfer Coefficient (For Any Surface in 7.5 mph Wind) (For Summer)
    
elseif HVAC_Mode == 1   % If HVAC Mode is Heating, Assume Winter Value
    ho = 6.0;           % (Btu/hr*F*ft^2) Exterior Surface Heat Transfer Coefficient (For Any Surface in 15 mph Wind) (For Winter)
end


% Calculate Air Density and Specific Heat

Temperature = [-40 -20 0 5 10 15 20 25 30 40 50 60 70 80 90 100 200 300 400 500 1000]*(9/5) + 32;   % (F) Air Temperature
Air_Density2 = [1.514 1.395 1.293 1.269 1.247 1.225 1.204 1.184 1.165 1.127 1.109 1.060 1.029...
    0.9996 0.9721 0.9461 0.7461 0.6159 0.5243 0.4565 0.2772]*(METERSperFEET^3)*LBSperKG;            % (lb/ft^3) Density of Air

Air_Density = interp1(Temperature, Air_Density2, Indoor_Temp);  % (lb/ft^3) Density of Air

Air_SpecificHeat = 0.240;   % (Btu/lb*F) Specific Heat of Air (At 70 F)


% Home Input Parameters

if (HomeHVAC_Inputs(1) + HomeHVAC_Inputs(2)*Scaling_Factor(1)) < 1200       % (ft^2) Minimum Square Footage of Home (1200 ft^2)
    Floor_Area = 1200;
elseif (HomeHVAC_Inputs(1) + HomeHVAC_Inputs(2)*Scaling_Factor(1)) > 4800   % (ft^2) Maximum Square Footage of Home (4800 ft^2)
    Floor_Area = 4800;
else
    Floor_Area = HomeHVAC_Inputs(1) + HomeHVAC_Inputs(2)*Scaling_Factor(1); % (ft^2) Square Footage of Home
end
Ceiling_Height = HomeHVAC_Inputs(3);        % (ft) Ceiling Height in the Home
Number_Floors = round(HomeHVAC_Inputs(4));  % (#) Number of Floors
Number_Doors = round(HomeHVAC_Inputs(5));   % (#) Number of Doors
Aspect_Ratio = HomeHVAC_Inputs(6);          % Ratio of the Home's Depth to Width (Measure of how Rectangular the Home Is)
Area_Door = 19.5;                           % (ft^2) Area of One Door (Assumes: 3' Wide by 78" Tall)

Home_Volume = Ceiling_Height*Floor_Area;    % (ft^3) Volume of the Home


% Defined Ratios (From GridLAB-D)

WWR = 0.15;     % Window/Exterior Wall Area Ratio (As Defined by GridLAB-D)
IEWR = 1.5;     % Interior/Exterior Wall Ratio (As Defined by GridLAB-D)
EWF = 1.0;      % Exterior Wall Fraction (As Defined by GridLAB-D)
ECF = 1.0;      % Exterior Ceiling Fraction (As Defined by GridLAB-D)
EFF = 1.0;      % Exterior Floor Fraction (As Defined by GridLAB-D)
WETC = 0.60;    % Window/Exterior Transmission Coefficient (As Defined by GridLAB-D)


% Home Insulation Values

if (HomeHVAC_Inputs(7) + (9/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) < 4           % (F*ft^2*hr/Btu) Minimum Wall R-Value (R-4)
    Rwall = 4;
elseif (HomeHVAC_Inputs(7) + (9/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) > 22      % (F*ft^2*hr/Btu) Maximum Wall R-Value (R-22)
    Rwall = 22;
else
    Rwall = HomeHVAC_Inputs(7) + (9/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2);       % (F*ft^2*hr/Btu) Wall R-Value
end

if (HomeHVAC_Inputs(8) + (18.5/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) < 11       % (F*ft^2*hr/Btu) Minimum Ceiling R-Value (R-11)
    Rroof = 11;
elseif (HomeHVAC_Inputs(8) + (18.5/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) > 48   % (F*ft^2*hr/Btu) Maximum Ceiling R-Value (R-48)
    Rroof = 48;
else
    Rroof = HomeHVAC_Inputs(8) + (18.5/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2);    % (F*ft^2*hr/Btu) Ceiling R-Value
end

if (HomeHVAC_Inputs(9) + (13/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) < 4          % (F*ft^2*hr/Btu) Minimum Floor R-Value (R-4)
    Rfloor = 4;
elseif (HomeHVAC_Inputs(9) + (13/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) > 30     % (F*ft^2*hr/Btu) Maximum Floor R-Value (R-30)
    Rfloor = 30;
else
    Rfloor = HomeHVAC_Inputs(9) + (13/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2);     % (F*ft^2*hr/Btu) Floor R-Value
end

if (HomeHVAC_Inputs(10) + (1.25/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) < 0.75        % (F*ft^2*hr/Btu) Minimum Window R-Value (R-0.75)
    Rwindows = 0.75;
elseif (HomeHVAC_Inputs(10) + (1.25/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) > 3.25    % (F*ft^2*hr/Btu) Maximum Window R-Value (R-3.25)
    Rwindows = 3.25;
else
    Rwindows = HomeHVAC_Inputs(10) + (1.25/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2);    % (F*ft^2*hr/Btu) Window R-Value
end

if (HomeHVAC_Inputs(11) + (4/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) < 3          % (F*ft^2*hr/Btu) Minimum Door R-Value (R-3)
    Rdoors = 3;
elseif (HomeHVAC_Inputs(11) + (4/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) > 11     % (F*ft^2*hr/Btu) Maximum Door R-Value (R-11)
    Rdoors = 11;
else
    Rdoors = HomeHVAC_Inputs(11) + (4/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2);     % (F*ft^2*hr/Btu) Door R-Value
end


% Calculate Infiltration Volumetric Air Exchange Rate (As Described in 2001 ASHRAE Handbook: Fundamentals)

if HVAC_Mode == -1  % If HVAC Mode is Cooling, Assume Summer Values
    
    Temperature2 = [40 45 50 55 60 65 70 75 80 85 90 95 100 105 110];                           % (F) Outdoor Air Temperature (Summer)
    I_Matrix = [0.78 0.76 0.74 0.72 0.70 0.68 0.66 0.64 0.66 0.68 0.70 0.72 0.74 0.76 0.78;     % (1/hr) Infiltration Volumetric Air Exchange Rate Matrix (Summer)
                0.56 0.54 0.52 0.50 0.48 0.46 0.44 0.42 0.44 0.46 0.48 0.50 0.52 0.54 0.56;
                0.38 0.37 0.36 0.35 0.34 0.33 0.32 0.31 0.32 0.33 0.34 0.35 0.36 0.37 0.38];
    
    if Outdoor_Temp <= 40       % Minimum Outdoor Air Temperature of 40 F for Infiltration Volumetric Air Exchange Rate (Summer)
        
        I_Loose = interp1(Temperature2, I_Matrix(1,:), 40);     % (1/hr) Infiltration Volumetric Air Exchange Rate (Loose Construction)
        I_Medium = interp1(Temperature2, I_Matrix(2,:), 40);    % (1/hr) Infiltration Volumetric Air Exchange Rate (Medium Construction)
        I_Tight = interp1(Temperature2, I_Matrix(3,:), 40);     % (1/hr) Infiltration Volumetric Air Exchange Rate (Tight Construction)
        
    elseif Outdoor_Temp >= 110  % Maximum Outdoor Air Temperature of 110 F for Infiltration Volumetric Air Exchange Rate (Summer)
        
        I_Loose = interp1(Temperature2, I_Matrix(1,:), 110);    % (1/hr) Infiltration Volumetric Air Exchange Rate (Loose Construction)
        I_Medium = interp1(Temperature2, I_Matrix(2,:), 110);   % (1/hr) Infiltration Volumetric Air Exchange Rate (Medium Construction)
        I_Tight = interp1(Temperature2, I_Matrix(3,:), 110);    % (1/hr) Infiltration Volumetric Air Exchange Rate (Tight Construction)
    else
        I_Loose = interp1(Temperature2, I_Matrix(1,:), Outdoor_Temp);   % (1/hr) Infiltration Volumetric Air Exchange Rate (Loose Construction)
        I_Medium = interp1(Temperature2, I_Matrix(2,:), Outdoor_Temp);  % (1/hr) Infiltration Volumetric Air Exchange Rate (Medium Construction)
        I_Tight = interp1(Temperature2, I_Matrix(3,:), Outdoor_Temp);   % (1/hr) Infiltration Volumetric Air Exchange Rate (Tight Construction)
    end
    
elseif HVAC_Mode == 1   % If HVAC Mode is Heating, Assume Winter Values
    
    Temperature2 = [-40 -30 -20 -10 0 10 20 30 40 50 60 70 80];                     % (F) Outdoor Air Temperature (Winter)
    I_Matrix = [1.47 1.43 1.40 1.35 1.30 1.27 1.23 1.20 1.15 1.11 1.07 1.03 1.07;   % (1/hr) Infiltration Volumetric Air Exchange Rate Matrix (Winter)
                1.05 1.00 0.97 0.93 0.89 0.85 0.81 0.77 0.73 0.69 0.65 0.61 0.65;
                0.59 0.57 0.55 0.53 0.51 0.49 0.47 0.45 0.43 0.41 0.39 0.37 0.39];
    
    if Outdoor_Temp <= -40      % Minimum Outdoor Air Temperature of -40 F for Infiltration Volumetric Air Exchange Rate (Winter)
        
        I_Loose = interp1(Temperature2, I_Matrix(1,:), -40);    % (1/hr) Infiltration Volumetric Air Exchange Rate (Loose Construction)
        I_Medium = interp1(Temperature2, I_Matrix(2,:), -40);   % (1/hr) Infiltration Volumetric Air Exchange Rate (Medium Construction)
        I_Tight = interp1(Temperature2, I_Matrix(3,:), -40);    % (1/hr) Infiltration Volumetric Air Exchange Rate (Tight Construction)
        
    elseif Outdoor_Temp >= 80   % Maximum Outdoor Air Temperature of 80 F for Infiltration Volumetric Air Exchange Rate (Winter)
        
        I_Loose = interp1(Temperature2, I_Matrix(1,:), 80);     % (1/hr) Infiltration Volumetric Air Exchange Rate (Loose Construction)
        I_Medium = interp1(Temperature2, I_Matrix(2,:), 80);    % (1/hr) Infiltration Volumetric Air Exchange Rate (Medium Construction)
        I_Tight = interp1(Temperature2, I_Matrix(3,:), 80);     % (1/hr) Infiltration Volumetric Air Exchange Rate (Tight Construction)
    else
        I_Loose = interp1(Temperature2, I_Matrix(1,:), Outdoor_Temp);   % (1/hr) Infiltration Volumetric Air Exchange Rate (Loose Construction)
        I_Medium = interp1(Temperature2, I_Matrix(2,:), Outdoor_Temp);  % (1/hr) Infiltration Volumetric Air Exchange Rate (Medium Construction)
        I_Tight = interp1(Temperature2, I_Matrix(3,:), Outdoor_Temp);   % (1/hr) Infiltration Volumetric Air Exchange Rate (Tight Construction)
    end
end

% Infiltration Volumetric Air Exchange Rate (Before Applying Scaling Factor)

if HomeHVAC_Inputs(12) == 1 % If Loose Construction
    
    I_hold = I_Loose;   % (1/hr) Infiltration Volumetric Air Exchange Rate
    
elseif HomeHVAC_Inputs(12) == 2 % If Medium Construction
    
    I_hold = I_Medium;  % (1/hr) Infiltration Volumetric Air Exchange Rate
    
elseif HomeHVAC_Inputs(12) == 3 % If Tight Construction
    
    I_hold = I_Tight;   % (1/hr) Infiltration Volumetric Air Exchange Rate
end

% Infiltration Volumetric Air Exchange Rate (After Applying Scaling Factor)

if (I_hold - ((I_Loose - I_Tight)/2/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) < I_Tight     % (1/hr) Minimum Infiltration Volumetric Air Exchange Rate
    I = I_Tight;
elseif (I_hold - ((I_Loose - I_Tight)/2/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2)) > I_Loose % (1/hr) Maximum Infiltration Volumetric Air Exchange Rate
    I = I_Loose;
else
    I = I_hold - ((I_Loose - I_Tight)/2/3)*HomeHVAC_Inputs(13)*Scaling_Factor(2);           % (1/hr) Infiltration Volumetric Air Exchange Rate
end


% Surface Areas

Awall_gross = 2*Number_Floors*Ceiling_Height*(1 + Aspect_Ratio)*sqrt(Floor_Area/(Number_Floors*Aspect_Ratio));  % (ft^2) Gross Exterior Wall Surface Area
Awindow = WWR*Awall_gross*EWF;                                                                                  % (ft^2) Window Surface Area
Adoor = Number_Doors*Area_Door;                                                                                 % (ft^2) Door Surface Area
Awall = (Awall_gross - (Awindow + Adoor))*EWF;                                                                  % (ft^2) Exterior Wall Surface Area
Aroof = (Floor_Area/Number_Floors)*ECF;                                                                         % (ft^2) Roof Surface Area
Afloor = (Floor_Area/Number_Floors)*EFF;                                                                        % (ft^2) Floor Surface Area


% HVAC Input Parameters

Air_Mass = Air_Density*Home_Volume; % (lb) Mass of Air in Home

% Thermal Parameters

Cair = 3*Air_SpecificHeat*Air_Mass;                     % (Btu/F) Thermal Mass of Air in Home (*3 Multiplier is to Reflect that the Air Mass Includes Surface Effects from the Mass As Well)
Cmass = mf*Floor_Area - 2*Air_SpecificHeat*Air_Mass;    % (Btu/F) Thermal Mass of Mass of Home
Cenvelope = 12*(Awall + Aroof);                         % (Btu/F) Thermal Mass of Envelope of Home

UAinsul = (Awindow/Rwindows) + (Adoor/Rdoors) + (Awall/Rwall) + (Aroof/Rroof) + (Afloor/Rfloor);    % (Btu/hr*F) Thermal Conductance of Insulation
UAmass = hs*((Awall/EWF) + Awall_gross*IEWR + (Aroof*Number_Floors)/ECF);                           % (Btu/hr*F) Thermal Conductance of Mass of Home

UAsize = UAinsul + I*Home_Volume*Air_Density*Air_SpecificHeat;  % (Btu/hr*F) Thermal Conductance used for Sizing

R1 = 0.5/UAinsul;   % (F*hr/Btu) Thermal Resistance of Insulation (To Exterior)
R2 = 1/UAmass;      % (F*hr/Btu) Thermal Resistance of Mass of Home
R3 = 0.5/UAinsul;   % (F*hr/Btu) Thermal Resistance of Insulation (To Interior)

R1 = R1*(1/HOURSperSECOND)*(time_step/60);  % (F*s/Btu or F*min/Btu) Thermal Resistance of Insulation (To Exterior)
R2 = R2*(1/HOURSperSECOND)*(time_step/60);  % (F*s/Btu or F*min/Btu) Thermal Resistance of Mass of Home
R3 = R3*(1/HOURSperSECOND)*(time_step/60);  % (F*s/Btu or F*min/Btu) Thermal Resistance of Insulation (To Interior)


% HVAC Cooling/Heating Capacity

Mass_Solar_Gain_Fraction = 1.0;             % (%) Mass Solar Gain Fraction
Mass_Internal_Gain_Fraction = 0.5;          % (%) Mass Internal Gain Fraction (As Defined by GridLAB-D)
Latent_Load_Fraction = 0.30;                % (%) Latent Load Fraction (As Defined by GridLAB-D)
Over_Sizing_Factor = HomeHVAC_Inputs(18);   % (%) Over Sizes Heating and Cooling System from Standard Specifications

Cooling_Design_Temp = 95;       % (F) Cooling Design Temperature (As Defined by GridLAB-D)
Heating_Design_Temp = 0;        % (F) Heating Design Temperature (As Defined by GridLAB-D)
Cooling_Design_Setpoint = 75;   % (F) Cooling Design Setpoint (As Defined by GridLAB-D)
Heating_Design_Setpoint = 70;   % (F) Heating Design Setpoint (As Defined by GridLAB-D)

Design_Internal_Gains = 167.09*(Floor_Area^0.442);  % (Btu/hr) Design Internal Gains (As Defined by GridLAB-D)

Design_Peak_Solar = 195;    % (Btu/hr*ft^2) Design Peak Solar Radiation (Calculated for a Latitude of 35 Degrees)

Glazing_SHGC = 0.67;        % (%) Window Glazing Solar Heat Gain Coefficient (Nominal Value As Defined by GridLAB-D)

Solar_Heat_Gain_Fraction = Awindow*Glazing_SHGC*WETC;   % (ft^2) Solar Heat Gain Fraction


% HVAC Design Cooling Capacity

if HVAC_CoolingType == 1    % If HVAC has Air Conditioning
    
    HVAC_DesignCoolingCapacity = ceil(((1 + Over_Sizing_Factor)*(1 + Latent_Load_Fraction)*(UAsize*...  % (Btu/hr) HVAC Design Cooling Capacity (Rounded Up to Nearest 6000 Btu/hr)
        (Cooling_Design_Temp - Cooling_Design_Setpoint) + Design_Internal_Gains + (Design_Peak_Solar*Solar_Heat_Gain_Fraction)))/6000)*6000;
    
    HVAC_CoolingCapacity = HVAC_DesignCoolingCapacity*HOURSperSECOND*(60/time_step);    % (Btu/s or Btu/min) HVAC Cooling Capacity
    
    
else    % If HVAC Does Not have Air Conditioning
    
    HVAC_DesignCoolingCapacity = 0; % (Btu/hr) HVAC Design Cooling Capacity
    
    HVAC_CoolingCapacity = 0;   % (Btu/s or Btu/min) HVAC Cooling Capacity
end


% HVAC Design Heating/Auxilary Heating Capacities

if HVAC_HeatingType == 1    % If HVAC is a Heat Pump
    
    HVAC_DesignHeatingCapacity = ceil(((1 + Over_Sizing_Factor)*(1 + Latent_Load_Fraction)*(UAsize*...  % (Btu/hr) HVAC Design Heating Capacity (Rounded Up to Nearest 6000 Btu/hr)
        (Cooling_Design_Temp - Cooling_Design_Setpoint) + Design_Internal_Gains + (Design_Peak_Solar*Solar_Heat_Gain_Fraction)))/6000)*6000;
    
    HVAC_HeatingCapacity = HVAC_DesignHeatingCapacity*HOURSperSECOND*(60/time_step);    % (Btu/s or Btu/min) HVAC Heating Capacity
    
    
    HVAC_DesignAuxHeatingCapacity = ceil(((1 + Over_Sizing_Factor)*UAsize*(Heating_Design_Setpoint - Heating_Design_Temp))/10000)*10000;    % (Btu/hr) HVAC Design Auxilary Heating Capacity (Rounded Up to Nearest 10000 Btu/hr)
    
    HVAC_AuxHeatingCapacity = HVAC_DesignAuxHeatingCapacity*HOURSperSECOND*(60/time_step);  % (Btu/s or Btu/min) HVAC Auxilary Heating Capacity
    
    
elseif HVAC_HeatingType > 1 % If HVAC is Resistive Heating or Nonelectric Heating
    
    HVAC_DesignHeatingCapacity = ceil(((1 + Over_Sizing_Factor)*UAsize*(Heating_Design_Setpoint - Heating_Design_Temp))/10000)*10000;   % (Btu/hr) HVAC Design Heating Capacity (Rounded Up to Nearest 10000 Btu/hr)
    
    HVAC_HeatingCapacity = HVAC_DesignHeatingCapacity*HOURSperSECOND*(60/time_step);    % (Btu/s or Btu/min) HVAC Heating Capacity
    
    
    HVAC_DesignAuxHeatingCapacity = 0;  % (Btu/hr) HVAC Design Auxilary Heating Capacity
    
    HVAC_AuxHeatingCapacity = HVAC_DesignAuxHeatingCapacity*HOURSperSECOND*(60/time_step);  % (Btu/s or Btu/min) HVAC Auxilary Heating Capacity
    
    
else    % If HVAC Does Not have Heating
    
    HVAC_DesignHeatingCapacity = 0; % (Btu/hr) HVAC Design Heating Capacity (Rounded Up to Nearest 10000 Btu/hr)
    
    HVAC_HeatingCapacity = 0;   % (Btu/s or Btu/min) HVAC Heating Capacity
    
    
    HVAC_DesignAuxHeatingCapacity = 0;  % (Btu/hr) HVAC Design Auxilary Heating Capacity
    
    HVAC_AuxHeatingCapacity = 0;    % (Btu/s or Btu/min) HVAC Auxilary Heating Capacity
end


% HVAC Thermostat Settings

% Heating Thermostat Settings

if (HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3) + HVAC_ThermostatAdjust) < 60       % (F) Minimum HVAC Thermostat Setting (60 F)
    HVAC_Thermostat = 60;
elseif (HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3) + HVAC_ThermostatAdjust) > 85   % (F) Maximum HVAC Thermostat Setting (85 F)
    HVAC_Thermostat = 85;
else
    HVAC_Thermostat = HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3) + HVAC_ThermostatAdjust;  % (F) HVAC Thermostat Setting
end

HVAC_Deadband = HomeHVAC_Inputs(24);    % (F) HVAC Thermostat Deadband
HVAC_AuxDeadband = HomeHVAC_Inputs(25); % (F) HVAC Auxilary Thermostat Deadband

HVAC_MinHeating = HVAC_Thermostat - HVAC_Deadband/2;    % (F) Lower Temperature Limit (Heating)
HVAC_MaxHeating = HVAC_Thermostat + HVAC_Deadband/2;    % (F) Upper Temperature Limit (Heating)
HVAC_AuxHeating = HVAC_MinHeating - HVAC_AuxDeadband;   % (F) Auxilary Temperature Limit (Heating)


% Cooling Thermostat Settings

if (HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3) + HVAC_ThermostatAdjust) < 60       % (F) Minimum HVAC Thermostat Setting (60 F)
    HVAC_Thermostat = 60;
elseif (HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3) + HVAC_ThermostatAdjust) > 85   % (F) Maximum HVAC Thermostat Setting (85 F)
    HVAC_Thermostat = 85;
else
    HVAC_Thermostat = HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3) + HVAC_ThermostatAdjust;  % (F) HVAC Thermostat Setting
end

HVAC_Deadband = HomeHVAC_Inputs(24);    % (F) HVAC Thermostat Deadband

HVAC_MinCooling = HVAC_Thermostat - HVAC_Deadband/2;    % (F) Lower Temperature Limit (Cooling)
HVAC_MaxCooling = HVAC_Thermostat + HVAC_Deadband/2;    % (F) Upper Temperature Limit (Cooling)


% HVAC Thermostat Controls

% Cooling Mode

if HVAC_Mode == -1  % If HVAC Mode is Cooling
    
    if  HVAC_State ~= 0 && Indoor_Temp <= HVAC_MinCooling       % If HVAC is On and Indoor Temperature is Less Than or Equal to the Lower Limit, Do Not Cool
        HVAC_State = 0;
    elseif HVAC_State == 0 && Indoor_Temp >= HVAC_MaxCooling    % If HVAC is Off and Indoor Temperature is Greater Than or Equal to the Upper Limit, Cool
        HVAC_State = -1;
    else                                                        % Otherwise Do Not Change Current State of HVAC
    end
end


% Heating Mode

if HVAC_Mode == 1   % If HVAC Mode is Heating
    
    if  HVAC_State ~= 0 && Indoor_Temp >= HVAC_MaxHeating       % If HVAC is On and Indoor Temperature is Greater Than or Equal to the Upper Limit, Do Not Heat
        HVAC_State = 0;
    elseif HVAC_HeatingType == 1 && HVAC_State ~= 2 && Indoor_Temp <= HVAC_AuxHeating   % If HVAC is Heat Pump, On or Off, and Indoor Temperature is Less Than or Equal to the Auxilary Limit, Use Auxilary Heat
        HVAC_State = 2;
    elseif HVAC_State == 0 && Indoor_Temp <= HVAC_MinHeating    % If HVAC is Off and Indoor Temperature is Less Than or Equal to the Lower Limit, Heat
        HVAC_State = 1;
    else                                                        % Otherwise Do Not Change Current State of HVAC
    end
end

% Auxilary Heating Limit

if HVAC_HeatingType == 1 && HVAC_State == 1 && Outdoor_Temp <= 32 + Scaling_Factor(3)   % If HVAC is Heat Pump, On, and Outdoor Air Temperature is Less Than or Equal to 32 F (+ Scaling Factor), Use Auxilary Heat
    HVAC_State = 2;
end


% Calculate Fan Power Demand

Duct_Pressure_Drop = 0.5;   % (in water) Half Inch of Water Pressure

Cooling_Supply_Air_Temp = 50;   % (F) Cooling Supply Air Temperature
Heating_Supply_Air_Temp = 150;  % (F) Heating Supply Air Temperature

Design_Cooling_Airflow = HVAC_DesignCoolingCapacity/(1 + Latent_Load_Fraction)...           % (ft^3/min) Design Cooling Airflow
    /(Air_Density*Air_SpecificHeat*(Cooling_Design_Setpoint - Cooling_Supply_Air_Temp))/60;

Design_Heating_Airflow = max(HVAC_DesignHeatingCapacity, HVAC_DesignAuxHeatingCapacity)...  % (ft^3/min) Design Heating Airflow
    /(Air_Density*Air_SpecificHeat*(Heating_Supply_Air_Temp - Heating_Design_Setpoint))/60;

Fan_Design_Airflow = max(Design_Cooling_Airflow, Design_Heating_Airflow);                   % (ft^3/min) Fan Design Airflow

Fan_Power = ceil((0.117*Duct_Pressure_Drop*Fan_Design_Airflow/0.42/745.7)/(1/8))*(1/8)*(745.7/0.88);    % (W) Fan Power Demand (Rounded to the Nearest 1/8 HP)


% Adjust HVAC Cooling Capacity and Calculate Coefficient of Performance (COP) and Cooling Demand

if HVAC_CoolingType == 1    % If HVAC has Air Conditioning
    
    % Adjust HVAC Cooling Capacity
    
    HVAC_CoolingCapacity_Factor = 1.48924533 - 0.00514995*Outdoor_Temp; % (%) HVAC Cooling Capacity Factor
    
    HVAC_CoolingCapacity_Adj = HVAC_CoolingCapacity*HVAC_CoolingCapacity_Factor;    % (Btu/s or Btu/min) Adjusted HVAC Cooling Capacity
    
    
    % Calculate Coefficient of Performance (COP) and Cooling Demand
    
    HVAC_Cooling_COP = HomeHVAC_Inputs(20); % HVAC Cooling COP Under Standard Conditions
    
    if Outdoor_Temp < 40    % Minimum Outdoor Air Temperature of 40 F for Adjusted HVAC Cooling COP
        
        HVAC_Cooling_COP_Adj = HVAC_Cooling_COP/(-0.01363961 + 0.01066989*40);              % Adjusted HVAC Cooling COP
    else
        HVAC_Cooling_COP_Adj = HVAC_Cooling_COP/(-0.01363961 + 0.01066989*Outdoor_Temp);    % Adjusted HVAC Cooling COP
    end
    
    HVAC_CoolingDemand = HVAC_CoolingCapacity_Adj/HVAC_Cooling_COP_Adj; % (Btu/s or Btu/min) HVAC Cooling Demand
end


% Adjust HVAC Heating Capacity and Calculate Coefficient of Performance (COP) and Heating Demand

if HVAC_HeatingType == 1 && HVAC_State ~= 2 % If HVAC is a Heat Pump and Not Using Auxilary Heating
    
    % Adjust HVAC Heating Capacity
    
    HVAC_HeatingCapacity_Factor = 0.34148808 + 0.00894102*Outdoor_Temp + 0.00010787*Outdoor_Temp^2; % (%) HVAC Heating Capacity Factor
    
    HVAC_HeatingCapacity_Adj = HVAC_HeatingCapacity*HVAC_HeatingCapacity_Factor;    % (Btu/s or Btu/min) Adjusted HVAC Heating Capacity
    
    
    % Calculate Coefficient of Performance (COP) and Heating Demand
    
    HVAC_Heating_COP = HomeHVAC_Inputs(19); % HVAC Heating COP Under Standard Conditions
    
    if Outdoor_Temp > 80    % Maximum Outdoor Air Temperature of 80 F for Adjusted HVAC Heating COP
        
        HVAC_Heating_COP_Adj = HVAC_Heating_COP/(2.03914613 - 0.03906753*80 + 0.00045617*80^2 - 0.00000203*80^3);   % Adjusted HVAC Heating COP
    else
        HVAC_Heating_COP_Adj = HVAC_Heating_COP/(2.03914613 - 0.03906753*Outdoor_Temp + 0.00045617*Outdoor_Temp^2 - 0.00000203*Outdoor_Temp^3); % Adjusted HVAC Heating COP
    end
    
    HVAC_HeatingDemand = HVAC_HeatingCapacity_Adj/HVAC_Heating_COP_Adj; % (Btu/s or Btu/min) HVAC Heating Demand
    
elseif HVAC_HeatingType == 1 && HVAC_State == 2 % If HVAC is a Heat Pump and Using Auxilary Heating
    
    HVAC_HeatingCapacity_Adj = HVAC_AuxHeatingCapacity; % (Btu/s or Btu/min) Adjusted HVAC Heating Capacity
    HVAC_HeatingDemand = HVAC_AuxHeatingCapacity;       % (Btu/s or Btu/min) HVAC Heating Demand
    HVAC_Heating_COP_Adj = 1;                           % Adjusted HVAC Heating COP
    
elseif HVAC_HeatingType == 2    % If HVAC is Resistive Heating
    
    HVAC_HeatingCapacity_Adj = HVAC_HeatingCapacity;    % (Btu/s or Btu/min) Adjusted HVAC Heating Capacity
    HVAC_HeatingDemand = HVAC_HeatingCapacity;          % (Btu/s or Btu/min) HVAC Heating Demand
    HVAC_Heating_COP_Adj = 1;                           % Adjusted HVAC Heating COP
    
elseif HVAC_HeatingType == 3    % If HVAC is Nonelectric Heating
    
    HVAC_HeatingCapacity_Adj = HVAC_HeatingCapacity;    % (Btu/s or Btu/min) Adjusted HVAC Heating Capacity
    HVAC_HeatingDemand = 0;                             % (Btu/s or Btu/min) HVAC Heating Demand
    HVAC_Heating_COP_Adj = 1;                           % Adjusted HVAC Heating COP
end


% Calculate Heating Gains and Losses

if HVAC_State == -1
    HVAC_Q = -HVAC_CoolingCapacity_Adj/(1 + Latent_Load_Fraction) + Fan_Power*(1/WATTperBTU_hr)*HOURSperSECOND*(60/time_step);  % (Btu/s or Btu/min) HVAC Cooling Rate
elseif HVAC_State >= 1
    HVAC_Q = HVAC_HeatingCapacity_Adj + Fan_Power*(1/WATTperBTU_hr)*HOURSperSECOND*(60/time_step);  % (Btu/s or Btu/min) HVAC Heating Rate
else
    HVAC_Q = 0; % (Btu/s or Btu/min) HVAC Heating Rate
end

Internal_Q = Internal_Q*(1/WATTperBTU_hr)*HOURSperSECOND*(60/time_step);    % (Btu/s or Btu/min) Internal Heating Gains

Solar_Q = (Diffuse_Irrad/4)*(1/WATTperBTU_hr)*(METERSperFEET^2)*HOURSperSECOND*Solar_Heat_Gain_Fraction*(60/time_step); % (Btu/s or Btu/min) Solar Heating Gains to Interior of Home

Qair = HVAC_Q + (1 - Mass_Solar_Gain_Fraction)*Solar_Q + (1 - Mass_Internal_Gain_Fraction)*Internal_Q...        % (Btu/s or Btu/min) Total Heating Rate to Air in Home
    + I*Home_Volume*Air_Density*Air_SpecificHeat*HOURSperSECOND*(60/time_step)*(Outdoor_Temp - Indoor_Temp);
Qmass = Mass_Solar_Gain_Fraction*Solar_Q + Mass_Internal_Gain_Fraction*Internal_Q;                              % (Btu/s or Btu/min) Total Heating Rate to Mass of Home

Heat_Absorption = 0.6;  % (%) Exterior Heat Absorption Fraction

SolAir_Temp = Outdoor_Temp + Heat_Absorption*((Direct_Irrad/4 + Diffuse_Irrad)*(1/WATTperBTU_hr)*(METERSperFEET^2))/ho; % (F) Sol-Air Temperature


% Calculate Total HVAC Power Demand and Coefficient of Performance

if HVAC_State == -1
    HVAC_Power = HVAC_CoolingDemand*WATTperBTU_hr*(1/HOURSperSECOND)*(time_step/60) + Fan_Power;    % (W) Total HVAC Power Demand
    HVAC_COP = HVAC_Cooling_COP_Adj;                                                                % HVAC Coefficient of Performance
elseif HVAC_State >= 1
    HVAC_Power = HVAC_HeatingDemand*WATTperBTU_hr*(1/HOURSperSECOND)*(time_step/60) + Fan_Power;    % (W) Total HVAC Power Demand
    HVAC_COP = HVAC_Heating_COP_Adj;                                                                % HVAC Coefficient of Performance
else
    HVAC_Power = 0; % (W) Total HVAC Power Demand
    HVAC_COP = 0;   % HVAC Coefficient of Performance
end

HVAC_Q = HVAC_Q*WATTperBTU_hr*(1/HOURSperSECOND)*(time_step/60);    % (W) HVAC Heat Transfer to Home


% Calculate New Temperature Values

x = [Indoor_Temp; Mass_Temp; Envelope_Temp];

A = [-(1/(R2*Cair) + 1/(R3*Cair)), 1/(R2*Cair),   1/(R3*Cair);...
     1/(R2*Cmass),                 -1/(R2*Cmass), 0;...
     1/(R3*Cenvelope),             0,             -(1/(R1*Cenvelope) + 1/(R3*Cenvelope))];
B = [Qair/Cair; Qmass/Cmass; SolAir_Temp/(R1*Cenvelope)];

dx_dt = A*x+B;

dIndoor_Temp_dt = dx_dt(1);     % (F/s or F/min) Change in Temperature of Air in Home
dMass_Temp_dt = dx_dt(2);       % (F/s or F/min) Change in Temperature of Mass of Home
dEnvelope_Temp_dt = dx_dt(3);   % (F/s or F/min) Change in Temperature of Envelope of Home

Indoor_Temp = Indoor_Temp + dIndoor_Temp_dt;        % (F) Temperature of Air in Home
Mass_Temp = Mass_Temp + dMass_Temp_dt;              % (F) Temperature of Mass of Home
Envelope_Temp = Envelope_Temp + dEnvelope_Temp_dt;  % (F) Temperature of Envelope of Home

end