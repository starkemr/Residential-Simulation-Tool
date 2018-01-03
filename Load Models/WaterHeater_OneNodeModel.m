function [WaterHeater_Power, Water_Temp, WaterHeater_State] = WaterHeater_OneNodeModel...
    (time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp, WaterInlet_Temp, Water_Temp,...
    WaterHeater_WaterFlow, WaterHeater_State, WaterHeater_ThermostatAdjust, Scaling_Factor)
% Dynamic Water Heater Model
%   Model which simulates a water heater using the one-node model
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
% Sources: PNNL GridLAB-D Report, GridLAB-D: residential/waterheater.cpp
%--------------------------------------------------------------------------


% Constants

SECONDSperHOUR = 3600;      % (s/hr) Seconds per Hour Conversion Factor
kWhperBTU = 0.0002931;      % (kW*hr/Btu) kW*hr per Btu Conversion Factor
BTUperLbm_F = 1;            % (Btu/lbm*F) Btu per lbm*F Conversion Factor
CuFEETperGAL = (1/7.4805);  % (ft^3/gal) ft^3 per gallon Conversion Factor

Cp = SECONDSperHOUR*kWhperBTU*BTUperLbm_F*(time_step/60);   % (kW*s/lbm*F or kW*min/lbm*F) Specific Heat of Water


% Water Heater Input Parameters

% Water Heater Volume (Vary Between 30 and 80 gal)

if (WaterHeater_Inputs(3) + WaterHeater_Inputs(4)*Scaling_Factor(1)) < 30       % (gal) Minimum Water Heater Volume (30 gal)
    WaterHeater_Volume = 30;
elseif (WaterHeater_Inputs(3) + WaterHeater_Inputs(4)*Scaling_Factor(1)) > 80   % (gal) Maximum Water Heater Volume (80 gal)
    WaterHeater_Volume = 80;
else
    WaterHeater_Volume = WaterHeater_Inputs(3) + WaterHeater_Inputs(4)*Scaling_Factor(1);   % (gal) Water Heater Volume
end


% Water Tank Insulation Value (Vary Between R-6 and R-20)

if (WaterHeater_Inputs(7) + WaterHeater_Inputs(8)*Scaling_Factor(2)) < 6        % (ft^2*F*hr/BTU) Minimum Water Tank Insulation Value (R-6)
    R = 6;
elseif (WaterHeater_Inputs(7) + WaterHeater_Inputs(8)*Scaling_Factor(2)) > 20   % (ft^2*F*hr/BTU) Maximum Water Tank Insulation Value (R-20)
    R = 20;
else
    R = WaterHeater_Inputs(7) + WaterHeater_Inputs(8)*Scaling_Factor(2);    % (ft^2*F*hr/BTU) Water Tank Insulation Value
end


% Water Tank Dimensions and Conductance

Height = 5; % (ft) Water Tank Height (Constant)

Surface_Area = 2*pi*(WaterHeater_Volume/(pi*Height)) + 2*pi*sqrt(WaterHeater_Volume/(pi*Height))*Height;    % (ft^2) Water Tank Surface Area

UA = Surface_Area*(1/R)*kWhperBTU;  % (kW/F) Thermal Conductance Of Water Tank


% Thermostat Setpoints and Ambient Temperature (Vary Between 100 and 160 F)

if (WaterHeater_Inputs(9) + WaterHeater_Inputs(10)*Scaling_Factor(3) + WaterHeater_ThermostatAdjust) < 100      % (F) Minimum Water Heater Thermostat Setting (100 F)
    WaterHeater_Thermostat = 100;
elseif (WaterHeater_Inputs(9) + WaterHeater_Inputs(10)*Scaling_Factor(3) + WaterHeater_ThermostatAdjust) > 160  % (F) Maximum Water Heater Thermostat Setting (160 F)
    WaterHeater_Thermostat = 160;
else
    WaterHeater_Thermostat = WaterHeater_Inputs(9) + WaterHeater_Inputs(10)*Scaling_Factor(3) + WaterHeater_ThermostatAdjust;   % (F) Water Heater Thermostat Setting
end

WaterHeater_Deadband = WaterHeater_Inputs(11);  % (F) Water Heater Thermostat Deadband

WaterHeater_Min = WaterHeater_Thermostat - WaterHeater_Deadband/2;  % (F) Lower Temperature Limit
WaterHeater_Max = WaterHeater_Thermostat + WaterHeater_Deadband/2;  % (F) Upper Temperature Limit

Amb_Temp = (1/2)*Indoor_Temp + (1/2)*Outdoor_Temp;  % (F) Temperature of Air Surrounding the Water Heater


% Thermostat Controls

if Water_Temp >= WaterHeater_Max        % Do Not Heat If Water Temperature Is Greater Than Or Equal To Maximum Temperature
    WaterHeater_State = 0;
elseif Water_Temp <= WaterHeater_Min    % Heat If Water Temperature Is Below Minimum Temperature
    WaterHeater_State = 1;
end


% Calculate Water Density and Flow Rate

Water_Density = [62.42, 62.43, 62.41, 62.37, 62.30 62.22, 62.11, 62, 61.71, 61.38, 61, 60.58, 60.12, 59.83];    % (lbm/ft^3) Water Density
Temperature_Density = [32, 40, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 200, 212];                          % (F) Water Temperature

Density = interp1(Temperature_Density, Water_Density, Water_Temp)*CuFEETperGAL; % (lbm/gal) Water Density

FlowRate = WaterHeater_WaterFlow*Density;   % (lbm/s or lbm/min) Water Flow Rate


% Calculate Water Heater Power Demand (Vary Between 3000 and 6000 W)

if (WaterHeater_Inputs(5) + WaterHeater_Inputs(6)*Scaling_Factor(1)) < 3000     % (W) Minimum Water Heater Power Demand (3000 W)
    WaterHeater_Power = 3000;
elseif (WaterHeater_Inputs(5) + WaterHeater_Inputs(6)*Scaling_Factor(1)) > 6000 % (W) Maximum Water Heater Power Demand (6000 W)
    WaterHeater_Power = 6000;
else
    WaterHeater_Power = round2(WaterHeater_Inputs(5) + WaterHeater_Inputs(6)*Scaling_Factor(1), 100);   % (W) Water Heater Power Demand
end

WaterHeater_Power = (WaterHeater_State*WaterHeater_Power)/1000; % (kW) Water Heater Power Demand


% Calculate Water Temperature

Cw = WaterHeater_Volume*Cp*Density; % (kW*s/F or kW*min/F) Heat Capacity Of Water (Thermal Capacitance)

dTw_dt = (WaterHeater_Power - UA*(Water_Temp - Amb_Temp) - FlowRate*Cp*(Water_Temp - WaterInlet_Temp))/Cw;  % (F/s or F/min) Rate of Change In Water Temperature

Water_Temp = Water_Temp + dTw_dt;   % (F) Water Temperature

WaterHeater_Power = WaterHeater_Power*1000; % (W) Water Heater Power Demand

end