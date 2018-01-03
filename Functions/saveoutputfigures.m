function [complete] = saveoutputfigures(outputdata, time, time_step, Simulate_DemandResponse,...                        % Output Data Directory and Time Scale
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
    EV2_Power_total, EV2_Reactive_total, EV2_SOC_avg, EV3_Power_total, EV3_Reactive_total, EV3_SOC_avg)                 % Electric Vehicle Plotting Data
% Plot Output Data
%   This function saves plots of the output data of the program.
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


% Plot Results

cd(fullfile(outputdata,'Figures'));


%% Total Power Consumption

% Total Power Demand

Total_Power = HVAC_Power_total + WaterHeater_Power_total +...
    Refrigerator_Power_total + Freezer_Power_total +...
    Washer_Power_total + Dryer_Power_total + Dishwasher_Power_total +...
    Cooking_Power_total + Lighting_Power_total + Television_Power_total +...
    Computer_Power_total + Additional_Power_total + EV_Power_total;

% Total Reactive Power Demand

Total_Reactive = HVAC_Reactive_total + WaterHeater_Reactive_total +...
    Refrigerator_Reactive_total + Freezer_Reactive_total +...
    Washer_Reactive_total + Dryer_Reactive_total + Dishwasher_Reactive_total +...
    Cooking_Reactive_total + Lighting_Reactive_total + Television_Reactive_total +...
    Computer_Reactive_total + Additional_Reactive_total + EV_Reactive_total;

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

figure(1)
plot(time, Total_Power/1000, 'b-', time, Total_Reactive/1000, 'g-', time, Total_Power_DR/1000, 'r--', time, Total_Reactive_DR/1000, 'c--')
grid on
title('Total Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','TotalPowerDemand.png'));
close(figure(1))

% Total Real Power Demand (Area Plot)

Total_Power_Area = [Additional_Power_total', Computer_Power_total', Television_Power_total', Lighting_Power_total', Cooking_Power_total', Dishwasher_Power_total',...
    Dryer_Power_total', Washer_Power_total', Freezer_Power_total', Refrigerator_Power_total', WaterHeater_Power_total', HVAC_Power_total', EV_Power_total'];

figure(1)
area(Total_Power_Area/1000)
grid on
colormap([jet(size(Total_Power_Area,2) - 1); 0.5,0.5,0.5])
set(gca,'Layer','top')
title('Total Real Power Demand')
legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
ylabel('Power Demand (kW)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','TotalRealPowerDemandArea.png'));
close(figure(1))

% Total Reactive Power Demand (Area Plot)

Total_Reactive_Area = [Additional_Reactive_total', Computer_Reactive_total', Television_Reactive_total', Lighting_Reactive_total', Cooking_Reactive_total', Dishwasher_Reactive_total',...
    Dryer_Reactive_total', Washer_Reactive_total', Freezer_Reactive_total', Refrigerator_Reactive_total', WaterHeater_Reactive_total', HVAC_Reactive_total', EV_Reactive_total'];

figure(1)
area(Total_Reactive_Area/1000)
grid on
colormap([jet(size(Total_Reactive_Area,2) - 1); 0.5,0.5,0.5])
set(gca,'Layer','top')
title('Total Reactive Power Demand')
legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
ylabel('Power Demand (kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','TotalReactivePowerDemandArea.png'));
close(figure(1))

% Total Real Power Demand (Demand Response) (Area Plot)

if Simulate_DemandResponse == 1
    
    Total_Power_DR_Area = [Additional_Power_total', Computer_Power_total', Television_Power_total', Lighting_Power_total', Cooking_Power_total', Dishwasher_Power_DR_total',...
        Dryer_Power_DR_total', Washer_Power_DR_total', Freezer_Power_DR_total', Refrigerator_Power_DR_total', WaterHeater_Power_DR_total', HVAC_Power_DR_total', EV_Power_total'];
else
    Total_Power_DR_Area = zeros(length(time), size(Total_Power_Area,2));
end

figure(1)
area(Total_Power_DR_Area/1000)
grid on
colormap([jet(size(Total_Power_DR_Area,2) - 1); 0.5,0.5,0.5])
set(gca,'Layer','top')
title('Total Real Power Demand (Demand Response)')
legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
ylabel('Power Demand (kW)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','TotalRealPowerDemandArea_DR.png'));
close(figure(1))

% Total Reactive Power Demand (Demand Response) (Area Plot)

if Simulate_DemandResponse == 1
    
    Total_Reactive_DR_Area = [Additional_Reactive_total', Computer_Reactive_total', Television_Reactive_total', Lighting_Reactive_total', Cooking_Reactive_total', Dishwasher_Reactive_DR_total',...
        Dryer_Reactive_DR_total', Washer_Reactive_DR_total', Freezer_Reactive_DR_total', Refrigerator_Reactive_DR_total', WaterHeater_Reactive_DR_total', HVAC_Reactive_DR_total', EV_Reactive_total'];
else
    Total_Reactive_DR_Area = zeros(length(time), size(Total_Reactive_Area,2));
end

figure(1)
area(Total_Reactive_DR_Area/1000)
grid on
colormap([jet(size(Total_Reactive_DR_Area,2) - 1); 0.5,0.5,0.5])
set(gca,'Layer','top')
title('Total Reactive Power Demand (Demand Response)')
legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
ylabel('Power Demand (kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','TotalReactivePowerDemandArea_DR.png'));
close(figure(1))


%% Environmental

% Outdoor Air Temperature

figure(1)
plot(time, Outdoor_Temp2, 'b-', time, Outdoor_Temp2 + 2.5, 'm--', time, Outdoor_Temp2 - 2.5, 'm--')
grid on
title('Outdoor Air Temperature')
ylabel('Temperature (F)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','OutdoorAirTemperature.png'));
close(figure(1))

% Global Horizontal Irradiance

figure(1)
plot(time, Global_Irrad2)
grid on
title('Global Horizontal Irradiance')
ylabel('Global Horizontal Irradiance (W/m^2)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','GlobalHorizontalIrradiance.png'));
close(figure(1))

% Direct Normal Irradiance

figure(1)
plot(time, Direct_Irrad2, 'b-', time, 0.9*Direct_Irrad2, 'm--', time, 1.1*Direct_Irrad2, 'm--')
grid on
title('Direct Normal Irradiance')
ylabel('Direct Normal Irradiance (W/m^2)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DirectNormalIrradiance.png'));
close(figure(1))

% Diffuse Horizontal Irradiance

figure(1)
plot(time, Diffuse_Irrad2, 'b-', time, 0.9*Diffuse_Irrad2, 'm--', time, 1.1*Diffuse_Irrad2, 'm--')
grid on
title('Diffuse Horizontal Irradiance')
ylabel('Diffuse Horizontal Irradiance (W/m^2)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DiffuseHorizontalIrradiance.png'));
close(figure(1))

% Global Horizontal Illuminance

figure(1)
plot(time, Global_Illum2)
grid on
title('Global Horizontal Illuminance')
ylabel('Global Horizontal Illuminance (lux)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','GlobalHorizontalIlluminance.png'));
close(figure(1))

% Direct Normal Illuminace

figure(1)
plot(time, Direct_Illum2)
grid on
title('Direct Normal Illuminance')
ylabel('Direct Normal Illuminance (lux)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DirectNormalIlluminance.png'));
close(figure(1))

% Diffuse Horizontal Illuminance

figure(1)
plot(time, Diffuse_Illum2, 'b-', time, 0.9*Diffuse_Illum2, 'm--', time, 1.1*Diffuse_Illum2, 'm--')
grid on
title('Diffuse Horizontal Illuminance')
ylabel('Diffuse Horizontal Illuminance (lux)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DiffuseHorizontalIlluminance.png'));
close(figure(1))

% Wind Speed

figure(1)
plot(time, Wind_Speed2)
grid on
title('Average Wind Speed at 42 ft')
ylabel('Average Wind Speed (m/s)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WindSpeed.png'));
close(figure(1))

% Peak Wind Speed

figure(1)
plot(time, Peak_Wind_Speed2)
grid on
title('Peak Wind Speed at 42 ft')
ylabel('Peak Wind Speed (m/s)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','PeakWindSpeed.png'));
close(figure(1))

% Wind Direction

figure(1)
plot(time, Wind_Direction2)
grid on
title('Average Wind Direction at 42 ft')
ylabel('Average Wind Direction (Degrees from North)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WindDirection.png'));
close(figure(1))

% Relative Humidity

figure(1)
plot(time, Relative_Humidity2)
grid on
title('Relative Humidity')
ylabel('Relative Humidity (%)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','RelativeHumidity.png'));
close(figure(1))

% Precipitation

figure(1)
plot(time, Precipitation2)
grid on
title('Precipitation')
ylabel('Precipitation (mm)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Precipitation.png'));
close(figure(1))

% Accumulated Precipitation

figure(1)
plot(time, Accumulated_Precipitation2)
grid on
title('Accumulated Precipitation')
ylabel('Accumulated Precipitation (mm)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','AccumulatedPrecipitation.png'));
close(figure(1))

% Estimated Pressure

figure(1)
plot(time, Estimated_Pressure2)
grid on
title('Estimated Pressure')
ylabel('Estimated Pressure (mBar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','EstimatedPressure.png'));
close(figure(1))


%% HVAC

% Power Demand and Heat Transfer

figure(1)
plot(time, abs(HVAC_Q_total)/1000, 'r-', time, HVAC_Power_total/1000, 'b-', time, HVAC_Reactive_total/1000, 'g-', time, abs(HVAC_Q_DR_total)/1000, 'y--', time, HVAC_Power_DR_total/1000, 'r--', time, HVAC_Reactive_DR_total/1000, 'c--')
grid on
title('Total HVAC Power Demand and Heat Transfer')
legend('Heat Transfer', 'Real Power', 'Reactive Power', 'Heat Transfer (Demand Response)', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','HVACPowerDemandAndHeatTransfer.png'));
close(figure(1))

% Coefficent of Performance

figure(1)
plot(time, HVAC_COP_avg, 'b-', time, HVAC_COP_DR_avg, 'r--')
grid on
title('Average HVAC Coefficient of Performance')
legend('COP', 'COP (Demand Response)', 'Location', 'Best')
ylabel('Coefficient of Performance')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','HVACCoefficientOfPerformance.png'));
close(figure(1))

% Indoor Air Temperature

figure(1)
plot(time, Indoor_Temp_avg, 'b-', time, Indoor_Temp_DR_avg, 'r--')
grid on
title('Average Indoor Air Temperature')
legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
ylabel('Temperature (F)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','IndoorAirTemperature.png'));
close(figure(1))

% Mass Temperature

figure(1)
plot(time, Mass_Temp_avg, 'b-', time, Mass_Temp_DR_avg, 'r--')
grid on
title('Average Mass Temperature')
legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
ylabel('Temperature (F)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','MassTemperature.png'));
close(figure(1))

% Envelope Temperature

figure(1)
plot(time, Envelope_Temp_avg, 'b-', time, Envelope_Temp_DR_avg, 'r--')
grid on
title('Average Envelope Temperature')
legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
ylabel('Temperature (F)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','EnvelopeTemperature.png'));
close(figure(1))


%% Water Heater

% Power Demand

figure(1)
plot(time, WaterHeater_Power_total/1000, 'b-', time, WaterHeater_Reactive_total/1000, 'g-', time, WaterHeater_Power_DR_total/1000, 'r--', time, WaterHeater_Reactive_DR_total/1000, 'c--')
grid on
title('Total Water Heater Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WaterHeaterPowerDemand.png'));
close(figure(1))

% Water Temperature

if max(WaterHeater_Temp_avg) > 0
    
    figure(1)
    plot(time, WaterHeater_Temp_avg, 'b-', time, WaterHeater_Temp_DR_avg, 'r--')
    grid on
    title('Average Water Heater Water Temperature')
    legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
    ylabel('Temperature (F)')
    xlim([1 length(time)+1])
else
    figure(1)
    plot(time, WaterHeater_TempU_avg, 'r-', time, WaterHeater_TempL_avg, 'b-', time, WaterHeater_TempU_DR_avg, 'g--', time, WaterHeater_TempL_DR_avg, 'c--')
    grid on
    title('Average Water Heater Water Temperature')
    legend('Upper Water Layer', 'Lower Water Layer', 'Upper Water Layer (Demand Response)', 'Lower Water Layer (Demand Response)', 'Location', 'Best')
    ylabel('Temperature (F)')
    xlim([1 length(time)+1])
end

if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WaterHeaterWaterTemperature.png'));
close(figure(1))

% Hot Water Demand

figure(1)
plot(time, WaterHeater_WaterFlow_total, 'b-', time, WaterHeater_WaterFlow_DR_total, 'r--')
grid on
title('Total Water Heater Hot Water Demand')
legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
ylabel('Hot Water Demand (gal)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WaterHeaterHotWaterDemand.png'));
close(figure(1))


%% Refrigerator

% Power Demand

figure(1)
plot(time, Refrigerator_Power_total/1000, 'b-', time, Refrigerator_Reactive_total/1000, 'g-', time, Refrigerator_Power_DR_total/1000, 'r--', time, Refrigerator_Reactive_DR_total/1000, 'c--')
grid on
title('Total Refrigerator Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','RefrigeratorPowerDemand.png'));
close(figure(1))

% Refrigerator Air Temperature

figure(1)
plot(time, Refrigerator_Temp_avg, 'b-', time, Refrigerator_Temp_DR_avg, 'r--')
grid on
title('Average Refrigerator Interior Air Temperature')
legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
ylabel('Temperature (F)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','RefrigeratorAirTemperature.png'));
close(figure(1))


%% Freezer

% Power Demand

figure(1)
plot(time, Freezer_Power_total/1000, 'b-', time, Freezer_Reactive_total/1000, 'g-', time, Freezer_Power_DR_total/1000, 'r--', time, Freezer_Reactive_DR_total/1000, 'c--')
grid on
title('Total Freezer Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','FreezerPowerDemand.png'));
close(figure(1))

% Freezer Air Temperature

figure(1)
plot(time, Freezer_Temp_avg, 'b-', time, Freezer_Temp_DR_avg, 'r--')
grid on
title('Average Freezer Interior Air Temperature')
legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
ylabel('Temperature (F)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','FreezerAirTemperature.png'));
close(figure(1))


%% Washer

% Power Demand

figure(1)
plot(time, Washer_Power_total/1000, 'b-', time, Washer_Reactive_total/1000, 'g-', time, Washer_Power_DR_total/1000, 'r--', time, Washer_Reactive_DR_total/1000, 'c--')
grid on
title('Total Washer Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WasherPowerDemand.png'));
close(figure(1))

% Hot Water Demand

figure(1)
plot(time, Washer_WaterFlow_total, 'b-', time, Washer_WaterFlow_DR_total, 'r--')
grid on
title('Total Washer Hot Water Demand')
legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
ylabel('Hot Water Demand (gal)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','WasherHotWaterDemand.png'));
close(figure(1))


%% Dryer

% Power Demand

figure(1)
plot(time, Dryer_Power_total/1000, 'b-', time, Dryer_Reactive_total/1000, 'g-', time, Dryer_Power_DR_total/1000, 'r--', time, Dryer_Reactive_DR_total/1000, 'c--')
grid on
title('Total Dryer Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DryerPowerDemand.png'));
close(figure(1))


%% Dishwasher

% Power Demand

figure(1)
plot(time, Dishwasher_Power_total/1000, 'b-', time, Dishwasher_Reactive_total/1000, 'g-', time, Dishwasher_Power_DR_total/1000, 'r--', time, Dishwasher_Reactive_DR_total/1000, 'c--')
grid on
title('Total Dishwasher Power Demand')
legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DishwasherPowerDemand.png'));
close(figure(1))

% Hot Water Demand

figure(1)
plot(time, Dishwasher_WaterFlow_total, 'b-', time, Dishwasher_WaterFlow_DR_total, 'r--')
grid on
title('Total Dishwasher Hot Water Demand')
legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
ylabel('Hot Water Demand (gal)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','DishwasherHotWaterDemand.png'));
close(figure(1))


%% Cooking

% Power Demand

figure(1)
plot(time, Cooking_Power_total/1000, 'b-', time, Cooking_Reactive_total/1000, 'g-')
grid on
title('Total Cooking Power Demand')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','CookingPowerDemand.png'));
close(figure(1))


%% Lighting

% Lighting Power Demand

figure(1)
plot(time, Lighting_Power_total/1000, 'b-', time, Lighting_Reactive_total/1000, 'g-', time, Lighting_Power2_total/1000, 'r--', time, Lighting_Reactive2_total/1000, 'c--')
grid on
title('Total Lighting Power Demand')
legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','LightingPowerDemand.png'));
close(figure(1))

% Incandescent Lighting Power Demand

figure(1)
plot(time, Incandescent_Power_total/1000, 'b-', time, Incandescent_Reactive_total/1000, 'g-', time, Incandescent_Power2_total/1000, 'r--', time, Incandescent_Reactive2_total/1000, 'c--')
grid on
title('Total Incandescent Lighting Power Demand')
legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','IncandescentPowerDemand.png'));
close(figure(1))

% Halogen Lighting Power Demand

figure(1)
plot(time, Halogen_Power_total/1000, 'b-', time, Halogen_Reactive_total/1000, 'g-', time, Halogen_Power2_total/1000, 'r--', time, Halogen_Reactive2_total/1000, 'c--')
grid on
title('Total Halogen Lighting Power Demand')
legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','HalogenPowerDemand.png'));
close(figure(1))

% Linear Fluorescent Lighting Power Demand

figure(1)
plot(time, Fluorescent_Power_total/1000, 'b-', time, Fluorescent_Reactive_total/1000, 'g-', time, Fluorescent_Power2_total/1000, 'r--', time, Fluorescent_Reactive2_total/1000, 'c--')
grid on
title('Total Linear Fluorescent Lighting Power Demand')
legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','LinearFluorescentPowerDemand.png'));
close(figure(1))

% Compact Fluorescent Lighting Power Demand

figure(1)
plot(time, CFL_Power_total/1000, 'b-', time, CFL_Reactive_total/1000, 'g-', time, CFL_Power2_total/1000, 'r--', time, CFL_Reactive2_total/1000, 'c--')
grid on
title('Total Compact Fluorescent Lighting Power Demand')
legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','CFLPowerDemand.png'));
close(figure(1))

% LED Lighting Power Demand

figure(1)
plot(time, LED_Power_total/1000, 'b-', time, LED_Reactive_total/1000, 'g-', time, LED_Power2_total/1000, 'r--', time, LED_Reactive2_total/1000, 'c--')
grid on
title('Total LED Lighting Power Demand')
legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','LEDPowerDemand.png'));
close(figure(1))


%% Electronics

% Television Power Demand

figure(1)
plot(time, Television_Power_total/1000, 'b-', time, Television_Reactive_total/1000, 'g-')
grid on
title('Total Television Power Demand')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','TelevisionPowerDemand.png'));
close(figure(1))

% Computer Power Demand

figure(1)
plot(time, Computer_Power_total/1000, 'b-', time, Computer_Reactive_total/1000, 'g-')
grid on
title('Total Computer Power Demand')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','ComputerPowerDemand.png'));
close(figure(1))


%% Additional

% Power Demand

figure(1)
plot(time, Additional_Power_total/1000, 'b-', time, Additional_Reactive_total/1000, 'g-')
grid on
title('Total Additional Power Demand')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','AdditionalPowerDemand.png'));
close(figure(1))


%% Electric Vehicle

% Power Demand

figure(1)
plot(time, EV_Power_total/1000, 'b-', time, EV_Reactive_total/1000, 'g-')
grid on
title('Total Electric Vehicle Power Demand')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','ElectricVehiclePowerDemand.png'));
close(figure(1))

% State of Charge

figure(1)
plot(time, 100*EV_SOC_avg)
grid on
title('Average Electric Vehicle State of Charge')
ylabel('State of Charge (%)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','ElectricVehicleStateOfCharge.png'));
close(figure(1))

% Power Demand (Level 1 Charger)

figure(1)
plot(time, EV1_Power_total/1000, 'b-', time, EV1_Reactive_total/1000, 'g-')
grid on
title('Total Electric Vehicle Power Demand (Level 1 Charger)')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Level1ElectricVehiclePowerDemand.png'));
close(figure(1))

% State of Charge (Level 1 Charger)

figure(1)
plot(time, 100*EV1_SOC_avg)
grid on
title('Average Electric Vehicle State of Charge (Level 1 Charger)')
ylabel('State of Charge (%)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Level1ElectricVehicleStateOfCharge.png'));
close(figure(1))

% Power Demand (Level 2 Charger)

figure(1)
plot(time, EV2_Power_total/1000, 'b-', time, EV2_Reactive_total/1000, 'g-')
grid on
title('Total Electric Vehicle Power Demand (Level 2 Charger)')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Level2ElectricVehiclePowerDemand.png'));
close(figure(1))

% State of Charge (Level 2 Charger)

figure(1)
plot(time, 100*EV2_SOC_avg)
grid on
title('Average Electric Vehicle State of Charge (Level 2 Charger)')
ylabel('State of Charge (%)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Level2ElectricVehicleStateOfCharge.png'));
close(figure(1))

% Power Demand (Level 3 Charger)

figure(1)
plot(time, EV3_Power_total/1000, 'b-', time, EV3_Reactive_total/1000, 'g-')
grid on
title('Total Electric Vehicle Power Demand (Level 3 Charger)')
legend('Real Power', 'Reactive Power', 'Location', 'Best')
ylabel('Power Demand (kW/kVar)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Level3ElectricVehiclePowerDemand.png'));
close(figure(1))

% State of Charge (Level 3 Charger)

figure(1)
plot(time, 100*EV3_SOC_avg)
grid on
title('Average Electric Vehicle State of Charge (Level 3 Charger)')
ylabel('State of Charge (%)')
xlim([1 length(time)+1])
if length(time) <= 24*60*time_step
    set(gca,'XTick',1:60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
        '7am','8am','9am','10am','11am','12pm'...
        '1pm','2pm','3pm','4pm','5pm','6pm'...
        '7pm','8pm','9pm','10pm','11pm','12am'})
elseif length(time) <= 7*24*60*time_step
    set(gca,'XTick',1:6*60*time_step:length(time)+1)
    set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
        '6am','12pm','6pm','12am'})
elseif time_step == 60
    xlabel('Time (second)')
elseif time_step == 1
    xlabel('Time (minute)')
end
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0.25 2.5 13.0 7.0]);
print(figure(1),'-dpng',fullfile(outputdata,'Figures','Level3ElectricVehicleStateOfCharge.png'));
close(figure(1))


%% Complete

complete = 1;

end