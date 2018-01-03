function [complete] = writeoutputfiles(outputdata, time, Simulate_DemandResponse,...                                    % Output Data Directory and Time Scale
    Outdoor_Temp2, Global_Irrad2, Direct_Irrad2, Diffuse_Irrad2,...                                                     % Environmental Parameter Plotting Data
    Wind_Speed2, Peak_Wind_Speed2, Wind_Direction2, Relative_Humidity2,...                                              % Environmental Parameter Plotting Data
    Precipitation2, Accumulated_Precipitation2, Estimated_Pressure2,...                                                 % Environmental Parameter Plotting Data
    Global_Illum2, Direct_Illum2, Diffuse_Illum2,...                                                                    % Environmental Parameter Plotting Data
    HVAC_Power_total, HVAC_Reactive_total, HVAC_Q_total, HVAC_COP_avg,...                                               % HVAC Plotting Data
    Indoor_Temp_avg, Mass_Temp_avg, Envelope_Temp_avg,...                                                               % HVAC Plotting Data
    HVAC_Power_DR_total, HVAC_Reactive_DR_total, HVAC_Q_DR_total, HVAC_COP_DR_avg,...                                   % HVAC Plotting Data
    Indoor_Temp_DR_avg, Mass_Temp_DR_avg, Envelope_Temp_DR_avg,...                                                      % HVAC Plotting Data
    WaterHeater_Power_total, WaterHeater_Reactive_total, WaterHeater_WaterFlow_total,...                                % Water Heater Plotting Data
    WaterHeater_Temp_avg, WaterHeater_TempU_avg, WaterHeater_TempL_avg,...                                              % Water Heater Plotting Data
    WaterHeater_Power_DR_total, WaterHeater_Reactive_DR_total, WaterHeater_WaterFlow_DR_total,...                       % Water Heater Plotting Data
    WaterHeater_Temp_DR_avg, WaterHeater_TempU_DR_avg, WaterHeater_TempL_DR_avg,...                                     % Water Heater Plotting Data
    Refrigerator_Power_total, Refrigerator_Reactive_total, Refrigerator_Temp_avg,...                                    % Refrigerator Plotting Data
    Refrigerator_Power_DR_total, Refrigerator_Reactive_DR_total, Refrigerator_Temp_DR_avg,...                           % Refrigerator Plotting Data
    Freezer_Power_total, Freezer_Reactive_total, Freezer_Temp_avg,...                                                   % Freezer Plotting Data
    Freezer_Power_DR_total, Freezer_Reactive_DR_total, Freezer_Temp_DR_avg,...                                          % Freezer Plotting Data
    Washer_Power_total, Washer_Reactive_total, Washer_WaterFlow_total, Dryer_Power_total,...                            % Deferrable Loads Plotting Data
    Dryer_Reactive_total, Dishwasher_Power_total, Dishwasher_Reactive_total, Dishwasher_WaterFlow_total,...             % Deferrable Loads Plotting Data
    Washer_Power_DR_total, Washer_Reactive_DR_total, Washer_WaterFlow_DR_total, Dryer_Power_DR_total,...                % Deferrable Loads Plotting Data
    Dryer_Reactive_DR_total, Dishwasher_Power_DR_total, Dishwasher_Reactive_DR_total, Dishwasher_WaterFlow_DR_total,... % Deferrable Loads Plotting Data
    Cooking_Power_total, Cooking_Reactive_total, Lighting_Power_total, Lighting_Reactive_total,...                      % Uninterruptible Loads Plotting Data
    Incandescent_Power_total, Incandescent_Reactive_total, Halogen_Power_total, Halogen_Reactive_total,...              % Uninterruptible Loads Plotting Data
    Fluorescent_Power_total, Fluorescent_Reactive_total, CFL_Power_total, CFL_Reactive_total,...                        % Uninterruptible Loads Plotting Data
    LED_Power_total, LED_Reactive_total, Lighting_Power2_total, Lighting_Reactive2_total,...                            % Uninterruptible Loads Plotting Data
    Incandescent_Power2_total, Incandescent_Reactive2_total, Halogen_Power2_total, Halogen_Reactive2_total,...          % Uninterruptible Loads Plotting Data
    Fluorescent_Power2_total, Fluorescent_Reactive2_total, CFL_Power2_total, CFL_Reactive2_total,...                    % Uninterruptible Loads Plotting Data
    LED_Power2_total, LED_Reactive2_total,  Television_Power_total, Television_Reactive_total,...                       % Uninterruptible Loads Plotting Data
    Computer_Power_total, Computer_Reactive_total, Additional_Power_total, Additional_Reactive_total,...                % Uninterruptible Loads Plotting Data
    EV_Power_total, EV_Reactive_total, EV_SOC_avg, EV1_Power_total, EV1_Reactive_total, EV1_SOC_avg,...                 % Electric Vehicle Plotting Data
    EV2_Power_total, EV2_Reactive_total, EV2_SOC_avg, EV3_Power_total, EV3_Reactive_total, EV3_SOC_avg,...              % Electric Vehicle Plotting Data
    WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob, NF_Occ_Act_Prob,...                                              % Simulated Occupant Behavior Plotting Data
    C_Occ_Act_Prob, Tot_Occ_Act_Prob, Tot_Prob_Model,...                                                                % Simulated Occupant Behavior Plotting Data
    WM_Error, NM_Error, WF_Error, NF_Error, C_Error, Tot_Error,...                                                      % Simulated Occupant Behavior Plotting Data
    WM_Avg_Error, NM_Avg_Error, WF_Avg_Error, NF_Avg_Error, C_Avg_Error, Tot_Avg_Error,...                              % Simulated Occupant Behavior Plotting Data
    WM_Max_Error, NM_Max_Error, WF_Max_Error, NF_Max_Error, C_Max_Error, Tot_Max_Error)                                 % Simulated Occupant Behavior Plotting Data
% Write Text Files used for Plotting Program Outputs
%   This function creates text files for each of the program's outputs
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


% Write Results to Text Files

cd(fullfile(outputdata,'Text Files'));


%% Total Power Demand

% Total Power Demand

Total_Power = HVAC_Power_total + WaterHeater_Power_total +...
    Refrigerator_Power_total + Freezer_Power_total +...
    Washer_Power_total + Dryer_Power_total + Dishwasher_Power_total +...
    Cooking_Power_total + Lighting_Power_total + Television_Power_total +...
    Computer_Power_total + Additional_Power_total + EV_Power_total;

fid = fopen('TotalPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Total_Power(w));
end
fclose(fid);

% Total Reactive Power Demand

Total_Reactive = HVAC_Reactive_total + WaterHeater_Reactive_total +...
    Refrigerator_Reactive_total + Freezer_Reactive_total +...
    Washer_Reactive_total + Dryer_Reactive_total + Dishwasher_Reactive_total +...
    Cooking_Reactive_total + Lighting_Reactive_total + Television_Reactive_total +...
    Computer_Reactive_total + Additional_Reactive_total + EV_Reactive_total;

fid = fopen('TotalReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Total_Reactive(w));
end
fclose(fid);

% Total Power Demand (Demand Response)

if Simulate_DemandResponse == 1
    
    Total_Power_DR = HVAC_Power_DR_total + WaterHeater_Power_DR_total +...
        Refrigerator_Power_DR_total + Freezer_Power_DR_total +...
        Washer_Power_DR_total + Dryer_Power_DR_total + Dishwasher_Power_DR_total +...
        Cooking_Power_total + Lighting_Power_total + Television_Power_total +...
        Computer_Power_total + Additional_Power_total + EV_Power_total;
else
    Total_Power_DR = zeros(1,length(time));
end

fid = fopen('TotalPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Total_Power_DR(w));
end
fclose(fid);

% Total Reactive Power Demand (Demand Response)

if Simulate_DemandResponse == 1
    
    Total_Reactive_DR = HVAC_Reactive_DR_total + WaterHeater_Reactive_DR_total +...
        Refrigerator_Reactive_DR_total + Freezer_Reactive_DR_total +...
        Washer_Reactive_DR_total + Dryer_Reactive_DR_total + Dishwasher_Reactive_DR_total +...
        Cooking_Reactive_total + Lighting_Reactive_total + Television_Reactive_total +...
        Computer_Reactive_total + Additional_Reactive_total + EV_Reactive_total;
else
    Total_Reactive_DR = zeros(1,length(time));
end

fid = fopen('TotalReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Total_Reactive_DR(w));
end
fclose(fid);


%% Environmental

% Outdoor Air Temperature

fid = fopen('OutdoorAirTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Outdoor_Temp2(w));
end;
fclose(fid);

% Global Horizontal Irradiance

fid = fopen('GlobalHorizontalIrradiance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Global_Irrad2(w));
end;
fclose(fid);

% Direct Normal Irradiance

fid = fopen('DirectNormalIrradiance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Direct_Irrad2(w));
end;
fclose(fid);

% Diffuse Horizontal Irradiance

fid = fopen('DiffuseHorizontalIrradiance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Diffuse_Irrad2(w));
end;
fclose(fid);

% Wind Speed

fid = fopen('WindSpeed.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Wind_Speed2(w));
end;
fclose(fid);

% Peak Wind Speed

fid = fopen('PeakWindSpeed.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Peak_Wind_Speed2(w));
end;
fclose(fid);

% Wind Direction

fid = fopen('WindDirection.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Wind_Direction2(w));
end;
fclose(fid);

% Relative Humidity

fid = fopen('RelativeHumidity.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Relative_Humidity2(w));
end;
fclose(fid);

% Precipitation

fid = fopen('Precipitation.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Precipitation2(w));
end;
fclose(fid);

% Accumulated Precipitation

fid = fopen('AccumulatedPrecipitation.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Accumulated_Precipitation2(w));
end;
fclose(fid);

% Estimated Pressure

fid = fopen('EstimatedPressure.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Estimated_Pressure2(w));
end;
fclose(fid);

% Global Horizontal Illuminance

fid = fopen('GlobalHorizontalIlluminance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Global_Illum2(w));
end;
fclose(fid);

% Direct Normal Illuminance

fid = fopen('DirectNormalIlluminance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Direct_Illum2(w));
end;
fclose(fid);

% Diffuse Horizontal Illuminance

fid = fopen('DiffuseHorizontalIlluminance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Diffuse_Illum2(w));
end;
fclose(fid);


%% HVAC

% HVAC Power Demand

fid = fopen('HVACPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Power_total(w));
end
fclose(fid);

% HVAC Reactive Power Demand

fid = fopen('HVACReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Reactive_total(w));
end
fclose(fid);

% HVAC Heat Transfer to Home

fid = fopen('HVACHeatTransfer.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Q_total(w));
end
fclose(fid);

% HVAC Coefficient of Performance

fid = fopen('HVACCoefficientOfPerformance.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_COP_avg(w));
end
fclose(fid);

% Indoor Air Temperature

fid = fopen('IndoorAirTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Indoor_Temp_avg(w));
end
fclose(fid);

% Mass Temperature

fid = fopen('MassTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Mass_Temp_avg(w));
end
fclose(fid);

% Envelope Temperature

fid = fopen('EnvelopeTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Envelope_Temp_avg(w));
end
fclose(fid);

% HVAC Power Demand (Demand Response)

fid = fopen('HVACPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Power_DR_total(w));
end
fclose(fid);

% HVAC Reactive Power Demand (Demand Response)

fid = fopen('HVACReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Reactive_DR_total(w));
end
fclose(fid);

% HVAC Heat Transfer to Home (Demand Response)

fid = fopen('HVACHeatTransfer_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Q_DR_total(w));
end
fclose(fid);

% HVAC Coefficient of Performance (Demand Response)

fid = fopen('HVACCoefficientOfPerformance_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_COP_DR_avg(w));
end
fclose(fid);

% Indoor Air Temperature (Demand Response)

fid = fopen('IndoorAirTemperature_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Indoor_Temp_DR_avg(w));
end
fclose(fid);

% Mass Temperature (Demand Response)

fid = fopen('MassTemperature_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Mass_Temp_DR_avg(w));
end
fclose(fid);

% Envelope Temperature (Demand Response)

fid = fopen('EnvelopeTemperature_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Envelope_Temp_DR_avg(w));
end
fclose(fid);


%% Water Heater

% Water Heater Power Demand

fid = fopen('WaterHeaterPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Power_total(w));
end
fclose(fid);

% Water Heater Reactive Power Demand

fid = fopen('WaterHeaterReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Reactive_total(w));
end
fclose(fid);

% Water Heater Hot Water Demand

fid = fopen('WaterHeaterHotWaterDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_WaterFlow_total(w));
end
fclose(fid);

% Water Heater Water Temperature

fid = fopen('WaterHeaterWaterTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Temp_avg(w));
end
fclose(fid);

% Water Heater Water Temperature (Upper Layer)

fid = fopen('WaterHeaterWaterTemperatureUpper.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_TempU_avg(w));
end
fclose(fid);

% Water Heater Water Temperature (Lower Layer)

fid = fopen('WaterHeaterWaterTemperatureLower.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_TempL_avg(w));
end
fclose(fid);

% Water Heater Power Demand (Demand Response)

fid = fopen('WaterHeaterPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Power_DR_total(w));
end
fclose(fid);

% Water Heater Reactive Power Demand (Demand Response)

fid = fopen('WaterHeaterReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Reactive_DR_total(w));
end
fclose(fid);

% Water Heater Hot Water Demand (Demand Response)

fid = fopen('WaterHeaterHotWaterDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_WaterFlow_DR_total(w));
end
fclose(fid);

% Water Heater Water Temperature (Demand Response)

fid = fopen('WaterHeaterWaterTemperature_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Temp_DR_avg(w));
end
fclose(fid);

% Water Heater Water Temperature (Upper Layer) (Demand Response)

fid = fopen('WaterHeaterWaterTemperatureUpper_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_TempU_DR_avg(w));
end
fclose(fid);

% Water Heater Water Temperature (Lower Layer) (Demand Response)

fid = fopen('WaterHeaterWaterTemperatureLower_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_TempL_DR_avg(w));
end
fclose(fid);


%% Refrigerator

% Refrigerator Power Demand

fid = fopen('RefrigeratorPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Power_total(w));
end
fclose(fid);

% Refrigerator Reactive Power Demand

fid = fopen('RefrigeratorReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Reactive_total(w));
end
fclose(fid);

% Refrigerator Interior Air Temperature

fid = fopen('RefrigeratorAirTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Temp_avg(w));
end
fclose(fid);

% Refrigerator Power Demand (Demand Response)

fid = fopen('RefrigeratorPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Power_DR_total(w));
end
fclose(fid);

% Refrigerator Reactive Power Demand (Demand Response)

fid = fopen('RefrigeratorReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Reactive_DR_total(w));
end
fclose(fid);

% Refrigerator Interior Air Temperature (Demand Response)

fid = fopen('RefrigeratorAirTemperature_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Temp_DR_avg(w));
end
fclose(fid);


%% Freezer

% Freezer Power Demand

fid = fopen('FreezerPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Freezer_Power_total(w));
end
fclose(fid);

% Freezer Reactive Power Demand

fid = fopen('FreezerReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Freezer_Reactive_total(w));
end
fclose(fid);

% Freezer Interior Air Temperature

fid = fopen('FreezerAirTemperature.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Freezer_Temp_avg(w));
end
fclose(fid);

% Freezer Power Demand (Demand Response)

fid = fopen('FreezerPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Freezer_Power_DR_total(w));
end
fclose(fid);

% Freezer Reactive Power Demand (Demand Response)

fid = fopen('FreezerReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Freezer_Reactive_DR_total(w));
end
fclose(fid);

% Freezer Interior Air Temperature (Demand Response)

fid = fopen('FreezerAirTemperature_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Freezer_Temp_DR_avg(w));
end
fclose(fid);


%% Washer

% Washer Power Demand

fid = fopen('WasherPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_Power_total(w));
end
fclose(fid);

% Washer Reactive Power Demand

fid = fopen('WasherReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_Reactive_total(w));
end
fclose(fid);

% Washer Hot Water Demand

fid = fopen('WasherHotWaterDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_WaterFlow_total(w));
end
fclose(fid);

% Washer Power Demand (Demand Response)

fid = fopen('WasherPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_Power_DR_total(w));
end
fclose(fid);

% Washer Reactive Power Demand (Demand Response)

fid = fopen('WasherReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_Reactive_DR_total(w));
end
fclose(fid);

% Washer Hot Water Demand (Demand Response)

fid = fopen('WasherHotWaterDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_WaterFlow_DR_total(w));
end
fclose(fid);


%% Dryer

% Dryer Power Demand

fid = fopen('DryerPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dryer_Power_total(w));
end
fclose(fid);

% Dryer Reactive Power Demand

fid = fopen('DryerReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dryer_Reactive_total(w));
end
fclose(fid);

% Dryer Power Demand (Demand Response)

fid = fopen('DryerPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dryer_Power_DR_total(w));
end
fclose(fid);

% Dryer Reactive Power Demand (Demand Response)

fid = fopen('DryerReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dryer_Reactive_DR_total(w));
end
fclose(fid);


%% Dishwasher

% Dishwasher Power Demand

fid = fopen('DishwasherPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_Power_total(w));
end
fclose(fid);

% Dishwasher Reactive Power Demand

fid = fopen('DishwasherReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_Reactive_total(w));
end
fclose(fid);

% Dishwasher Hot Water Demand

fid = fopen('DishwasherHotWaterDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_WaterFlow_total(w));
end
fclose(fid);

% Dishwasher Power Demand (Demand Response)

fid = fopen('DishwasherPowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_Power_DR_total(w));
end
fclose(fid);

% Dishwasher Reactive Power Demand (Demand Response)

fid = fopen('DishwasherReactivePowerDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_Reactive_DR_total(w));
end
fclose(fid);

% Dishwasher Hot Water Demand (Demand Response)

fid = fopen('DishwasherHotWaterDemand_DR.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_WaterFlow_DR_total(w));
end
fclose(fid);


%% Cooking

% Cooking Power Demand

fid = fopen('CookingPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Cooking_Power_total(w));
end
fclose(fid);

% Cooking Reactive Power Demand

fid = fopen('CookingReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Cooking_Reactive_total(w));
end
fclose(fid);


%% Lighting (Daylight Adjusted)

% Lighting Power Demand

fid = fopen('LightingPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Lighting_Power_total(w));
end
fclose(fid);

% Lighting Reactive Power Demand

fid = fopen('LightingReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Lighting_Reactive_total(w));
end
fclose(fid);

% Incandescent Lighting Power Demand

fid = fopen('IncandescentPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Incandescent_Power_total(w));
end
fclose(fid);

% Incandescent Lighting Reactive Power Demand

fid = fopen('IncandescentReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Incandescent_Reactive_total(w));
end
fclose(fid);

% Halogen Lighting Power Demand

fid = fopen('HalogenPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Halogen_Power_total(w));
end
fclose(fid);

% Halogen Lighting Reactive Power Demand

fid = fopen('HalogenReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Halogen_Reactive_total(w));
end
fclose(fid);

% Linear Fluorescent Lighting Power Demand

fid = fopen('LinearFluorescentPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Fluorescent_Power_total(w));
end
fclose(fid);

% Linear Fluorescent Lighting Reactive Power Demand

fid = fopen('LinearFluorescentReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Fluorescent_Reactive_total(w));
end
fclose(fid);

% Compact Fluorescent Lighting Power Demand

fid = fopen('CFLPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', CFL_Power_total(w));
end
fclose(fid);

% Compact Fluorescent Lighting Reactive Power Demand

fid = fopen('CFLReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', CFL_Reactive_total(w));
end
fclose(fid);

% LED Lighting Power Demand

fid = fopen('LEDPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', LED_Power_total(w));
end
fclose(fid);

% LED Lighting Reactive Power Demand

fid = fopen('LEDReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', LED_Reactive_total(w));
end
fclose(fid);


%% Lighting (Unadjusted)

% Lighting Power Demand

fid = fopen('LightingPowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Lighting_Power2_total(w));
end
fclose(fid);

% Lighting Reactive Power Demand

fid = fopen('LightingReactivePowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Lighting_Reactive2_total(w));
end
fclose(fid);

% Incandescent Lighting Power Demand

fid = fopen('IncandescentPowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Incandescent_Power2_total(w));
end
fclose(fid);

% Incandescent Lighting Reactive Power Demand

fid = fopen('IncandescentReactivePowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Incandescent_Reactive2_total(w));
end
fclose(fid);

% Halogen Lighting Power Demand

fid = fopen('HalogenPowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Halogen_Power2_total(w));
end
fclose(fid);

% Halogen Lighting Reactive Power Demand

fid = fopen('HalogenReactivePowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Halogen_Reactive2_total(w));
end
fclose(fid);

% Linear Fluorescent Lighting Power Demand

fid = fopen('LinearFluorescentPowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Fluorescent_Power2_total(w));
end
fclose(fid);

% Linear Fluorescent Lighting Reactive Power Demand

fid = fopen('LinearFluorescentReactivePowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Fluorescent_Reactive2_total(w));
end
fclose(fid);

% Compact Fluorescent Lighting Power Demand

fid = fopen('CFLPowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', CFL_Power2_total(w));
end
fclose(fid);

% Compact Fluorescent Lighting Reactive Power Demand

fid = fopen('CFLReactivePowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', CFL_Reactive2_total(w));
end
fclose(fid);

% LED Lighting Power Demand

fid = fopen('LEDPowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', LED_Power2_total(w));
end
fclose(fid);

% LED Lighting Reactive Power Demand

fid = fopen('LEDReactivePowerDemand2.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', LED_Reactive2_total(w));
end
fclose(fid);


%% Electronics

% Television Power Demand

fid = fopen('TelevisionPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Television_Power_total(w));
end
fclose(fid);

% Television Reactive Power Demand

fid = fopen('TelevisionReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Television_Reactive_total(w));
end
fclose(fid);

% Computer Power Demand

fid = fopen('ComputerPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Computer_Power_total(w));
end
fclose(fid);

% Computer Reactive Power Demand

fid = fopen('ComputerReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Computer_Reactive_total(w));
end
fclose(fid);


%% Additional

% Additional Power Demand

fid = fopen('AdditionalPowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Additional_Power_total(w));
end
fclose(fid);

% Additional Reactive Power Demand

fid = fopen('AdditionalReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Additional_Reactive_total(w));
end
fclose(fid);


%% Electric Vehicle

% Electric Vehicle Power Demand

fid = fopen('ElectricVehiclePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV_Power_total(w));
end
fclose(fid);

% Electric Vehicle Reactive Power Demand

fid = fopen('ElectricVehicleReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV_Reactive_total(w));
end
fclose(fid);

% Electric Vehicle State of Charge

fid = fopen('ElectricVehicleStateOfCharge.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV_SOC_avg(w));
end
fclose(fid);

% Electric Vehicle Power Demand (Level 1 Charger)

fid = fopen('Level1ElectricVehiclePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV1_Power_total(w));
end
fclose(fid);

% Electric Vehicle Reactive Power Demand (Level 1 Charger)

fid = fopen('Level1ElectricVehicleReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV1_Reactive_total(w));
end
fclose(fid);

% Electric Vehicle State of Charge (Level 1 Charger)

fid = fopen('Level1ElectricVehicleStateOfCharge.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV1_SOC_avg(w));
end
fclose(fid);

% Electric Vehicle Power Demand (Level 2 Charger)

fid = fopen('Level2ElectricVehiclePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV2_Power_total(w));
end
fclose(fid);

% Electric Vehicle Reactive Power Demand (Level 2 Charger)

fid = fopen('Level2ElectricVehicleReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV2_Reactive_total(w));
end
fclose(fid);

% Electric Vehicle State of Charge (Level 2 Charger)

fid = fopen('Level2ElectricVehicleStateOfCharge.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV2_SOC_avg(w));
end
fclose(fid);

% Electric Vehicle Power Demand (Level 3 Charger)

fid = fopen('Level3ElectricVehiclePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV3_Power_total(w));
end
fclose(fid);

% Electric Vehicle Reactive Power Demand (Level 3 Charger)

fid = fopen('Level3ElectricVehicleReactivePowerDemand.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV3_Reactive_total(w));
end
fclose(fid);

% Electric Vehicle State of Charge (Level 3 Charger)

fid = fopen('Level3ElectricVehicleStateOfCharge.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', EV3_SOC_avg(w));
end
fclose(fid);


%% Occupant Behavior Models

% Working Male Occupant

csvwrite(fullfile('Simulated_Working_Male_Probability_Matrix.csv'), WM_Occ_Act_Prob)
csvwrite(fullfile('Simulated_Working_Male_Error.csv'), WM_Error)
csvwrite(fullfile('Simulated_Working_Male_Average_Error.csv'), WM_Avg_Error)
csvwrite(fullfile('Simulated_Working_Male_Maximum_Error.csv'), WM_Max_Error)

% Nonworking Male Occupant

csvwrite(fullfile('Simulated_Nonworking_Male_Probability_Matrix.csv'), NM_Occ_Act_Prob)
csvwrite(fullfile('Simulated_Nonworking_Male_Error.csv'), NM_Error)
csvwrite(fullfile('Simulated_Nonworking_Male_Average_Error.csv'), NM_Avg_Error)
csvwrite(fullfile('Simulated_Nonworking_Male_Maximum_Error.csv'), NM_Max_Error)

% Working Female Occupant

csvwrite(fullfile('Simulated_Working_Female_Probability_Matrix.csv'), WF_Occ_Act_Prob)
csvwrite(fullfile('Simulated_Working_Female_Error.csv'), WF_Error)
csvwrite(fullfile('Simulated_Working_Female_Average_Error.csv'), WF_Avg_Error)
csvwrite(fullfile('Simulated_Working_Female_Maximum_Error.csv'), WF_Max_Error)

% Nonworking Female Occupant

csvwrite(fullfile('Simulated_Nonworking_Female_Probability_Matrix.csv'), NF_Occ_Act_Prob)
csvwrite(fullfile('Simulated_Nonworking_Female_Error.csv'), NF_Error)
csvwrite(fullfile('Simulated_Nonworking_Female_Average_Error.csv'), NF_Avg_Error)
csvwrite(fullfile('Simulated_Nonworking_Female_Maximum_Error.csv'), NF_Max_Error)

% Child Occupant

csvwrite(fullfile('Simulated_Child_Probability_Matrix.csv'), C_Occ_Act_Prob)
csvwrite(fullfile('Simulated_Child_Error.csv'), C_Error)
csvwrite(fullfile('Simulated_Child_Average_Error.csv'), C_Avg_Error)
csvwrite(fullfile('Simulated_Child_Maximum_Error.csv'), C_Max_Error)

% Total Occupant

csvwrite(fullfile('Total_Probability_Matrix.csv'), Tot_Prob_Model)
csvwrite(fullfile('Simulated_Total_Probability_Matrix.csv'), Tot_Occ_Act_Prob)
csvwrite(fullfile('Simulated_Total_Error.csv'), Tot_Error)
csvwrite(fullfile('Simulated_Total_Average_Error.csv'), Tot_Avg_Error)
csvwrite(fullfile('Simulated_Total_Maximum_Error.csv'), Tot_Max_Error)


complete = 1;

end