function [HVAC_Power_Data, WaterHeater_Power_Data, Refrigerator_Power_Data, Washer_Power_Data,...
    Dryer_Power_Data, Dishwasher_Power_Data, RangeOven_Power_Data] = loadconsumptiondata...
    (home, outputdata, start_min, simlength, time)
% Load Recorded Electricity Consumption Data
%   This program loads electricity consumption data at one minute
%   resolution, and outputs it at second resolution
%
%--------------------------------------------------------------------------
% Brandon Johnson
% University of Tennessee
%
% Oak Ridge National Laboratory
% Electrical and Electronics Systems Research Division
% Residential Load Modeling Project
%
% Last Updated: 7/10/2013
%--------------------------------------------------------------------------


% Write Results to Text Files

cd(fullfile(outputdata,'Text Files'));


% Set Time Scales

time_actual_min = 1:60:24*60*60*simlength;      % Time Scale in Minutes


% HVAC Electricity Usage Data (Atlanta [New York Street] Home)

HVAC_Power_NY = load(fullfile(home,'Power Consumption Data','New York Street January-August 2012 Data','HVAC_Power_1_to_8_2012.txt'));  % (W*min) Electricity Usage

% HVAC_Power_Data = interp1(time_actual_min, HVAC_Power_NY(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
% I = isnan(HVAC_Power_Data);
% HVAC_Power_Data(I) = HVAC_Power_Data(find(I == 0, 1, 'last'));
%
% fid = fopen('HVACPowerConsumptionData.txt','w');
% for w = 1:length(time)
%     fprintf(fid,'%f\n', HVAC_Power_Data(w));
% end
% fclose(fid);


% HVAC Electricity Usage Data (Campbell Creek Home)

HVAC1_Power_CC = load(fullfile(home,'Power Consumption Data','Campbell Creek January 2010 Data','HP1_Power_1_2010.txt'))*60;    % (W*min) Electricity Usage
HVAC2_Power_CC = load(fullfile(home,'Power Consumption Data','Campbell Creek January 2010 Data','HP2_Power_1_2010.txt'))*60;    % (W*min) Electricity Usage

HVAC_Power_CC = HVAC1_Power_CC + HVAC2_Power_CC;    % (W*min) Electricity Usage

% Append Zeros to Missing Electricity Usage Data Data

Data_Difference = length(HVAC_Power_NY) - length(HVAC_Power_CC);

Zeros_Matrix = zeros(Data_Difference, 1);

HVAC_Power_CC = [HVAC_Power_CC; Zeros_Matrix];

HVAC_Power_Data = interp1(time_actual_min, HVAC_Power_CC(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
I = isnan(HVAC_Power_Data);
HVAC_Power_Data(I) = HVAC_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('HVACPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', HVAC_Power_Data(w));
end
fclose(fid);


% Water Heater Electricity Usage Data (Campbell Creek Home)

WaterHeater_Power_CC = load(fullfile(home,'Power Consumption Data','Campbell Creek January 2010 Data','Water_Heater_Power_1_2010.txt'))*60; % (W*min) Electricity Usage

% Append Zeros to Missing Electricity Usage Data Data

Data_Difference = length(HVAC_Power_NY) - length(WaterHeater_Power_CC);

Zeros_Matrix = zeros(Data_Difference, 1);

WaterHeater_Power_CC = [WaterHeater_Power_CC; Zeros_Matrix];

WaterHeater_Power_Data = interp1(time_actual_min, WaterHeater_Power_CC(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');  % (W*s) Electricity Usage
I = isnan(WaterHeater_Power_Data);
WaterHeater_Power_Data(I) = WaterHeater_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('WaterHeaterPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', WaterHeater_Power_Data(w));
end
fclose(fid);


% Refrigerator Electricity Usage Data (Atlanta [New York Street] Home)

Refrigerator_Power_NY = load(fullfile(home,'Power Consumption Data','New York Street January-August 2012 Data','Refrigerator_Power_1_to_8_2012.txt'));  % (W*min) Electricity Usage

Refrigerator_Power_Data = interp1(time_actual_min, Refrigerator_Power_NY(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
I = isnan(Refrigerator_Power_Data);
Refrigerator_Power_Data(I) = Refrigerator_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('RefrigeratorPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Refrigerator_Power_Data(w));
end
fclose(fid);


% % Washer Electricity Usage Data (Atlanta [New York Street] Home)
%
% Washer_Power_NY = load(fullfile(home,'Power Consumption Data','New York Street January-August 2012 Data','WasherChest_Power_1_to_8_2012.txt')); % (W*min) Electricity Usage
%
% Washer_Power_Data = interp1(time_actual_min, Washer_Power_NY(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
% I = isnan(Washer_Power_Data);
% Washer_Power_Data(I) = Washer_Power_Data(find(I == 0, 1, 'last'));
%
% fid = fopen('WasherPowerConsumptionData.txt','w');
% for w = 1:length(time)
%     fprintf(fid,'%f\n', Washer_Power_Data(w));
% end
% fclose(fid);


% Washer Electricity Usage Data (Campbell Creek Home)

Washer_Power_CC = load(fullfile(home,'Power Consumption Data','Campbell Creek January 2010 Data','Washer_Power_1_2010.txt'))*60;    % (W*min) Electricity Usage

% Append Zeros to Missing Electricity Usage Data

Data_Difference = length(HVAC_Power_NY) - length(Washer_Power_CC);

Zeros_Matrix = zeros(Data_Difference, 1);

Washer_Power_CC = [Washer_Power_CC; Zeros_Matrix];

Washer_Power_Data = interp1(time_actual_min, Washer_Power_CC(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
I = isnan(Washer_Power_Data);
Washer_Power_Data(I) = Washer_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('WasherPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Washer_Power_Data(w));
end
fclose(fid);


% % Dryer Electricity Usage Data (Atlanta [New York Street] Home)
%
% Dryer_Power_NY = load(fullfile(home,'Power Consumption Data','New York Street January-August 2012 Data','Dryer_Power_1_to_8_2012.txt'));    % (W*min) Electricity Usage
%
% Dryer_Power_Data = interp1(time_actual_min, Dryer_Power_NY(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');  % (W*s) Electricity Usage
% I = isnan(Dryer_Power_Data);
% Dryer_Power_Data(I) = Dryer_Power_Data(find(I == 0, 1, 'last'));
%
% fid = fopen('DryerPowerConsumptionData.txt','w');
% for w = 1:length(time)
%     fprintf(fid,'%f\n', Dryer_Power_Data(w));
% end
% fclose(fid);


% Dryer Electricity Usage Data (Campbell Creek Home)

Dryer_Power_CC = load(fullfile(home,'Power Consumption Data','Campbell Creek January 2010 Data','Dryer_Power_1_2010.txt'))*60;  % (W*min) Electricity Usage

% Append Zeros to Missing Electricity Usage Data

Data_Difference = length(HVAC_Power_NY) - length(Dryer_Power_CC);

Zeros_Matrix = zeros(Data_Difference, 1);

Dryer_Power_CC = [Dryer_Power_CC; Zeros_Matrix];

Dryer_Power_Data = interp1(time_actual_min, Dryer_Power_CC(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (W*s) Electricity Usage
I = isnan(Dryer_Power_Data);
Dryer_Power_Data(I) = Dryer_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('DryerPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dryer_Power_Data(w));
end
fclose(fid);


% % Dishwasher Electricity Usage Data (Atlanta [New York Street] Home)
%
% Dishwasher_Power_NY = load(fullfile(home,'Power Consumption Data','New York Street January-August 2012 Data','Dishwasher_Power_1_to_8_2012.txt'));  % (W*min) Electricity Usage
%
% Dishwasher_Power_Data = interp1(time_actual_min, Dishwasher_Power_NY(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
% I = isnan(Dishwasher_Power_Data);
% Dishwasher_Power_Data(I) = Dishwasher_Power_Data(find(I == 0, 1, 'last'));
%
% fid = fopen('DishwasherPowerConsumptionData.txt','w');
% for w = 1:length(time)
%     fprintf(fid,'%f\n', Dishwasher_Power_Data(w));
% end
% fclose(fid);


% Dishwasher Electricity Usage Data (Campbell Creek Home)

Dishwasher_Power_CC = load(fullfile(home,'Power Consumption Data','Campbell Creek January 2010 Data','Dishwasher_Power_1_2010.txt'))*60;    % (W*min) Electricity Usage

% Append Zeros to Missing Electricity Usage Data

Data_Difference = length(HVAC_Power_NY) - length(Dishwasher_Power_CC);

Zeros_Matrix = zeros(Data_Difference, 1);

Dishwasher_Power_CC = [Dishwasher_Power_CC; Zeros_Matrix];

Dishwasher_Power_Data = interp1(time_actual_min, Dishwasher_Power_CC(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');    % (W*s) Electricity Usage
I = isnan(Dishwasher_Power_Data);
Dishwasher_Power_Data(I) = Dishwasher_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('DishwasherPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', Dishwasher_Power_Data(w));
end
fclose(fid);


% Range/Oven Electricity Usage Data (Atlanta [New York Street] Home)

RangeOven_Power_NY = load(fullfile(home,'Power Consumption Data','New York Street January-August 2012 Data','RangeOven_Power_1_to_8_2012.txt'));    % (W*min) Electricity Usage

RangeOven_Power_Data = interp1(time_actual_min, RangeOven_Power_NY(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');  % (W*s) Electricity Usage
I = isnan(RangeOven_Power_Data);
RangeOven_Power_Data(I) = RangeOven_Power_Data(find(I == 0, 1, 'last'));

fid = fopen('RangeOvenPowerConsumptionData.txt','w');
for w = 1:length(time)
    fprintf(fid,'%f\n', RangeOven_Power_Data(w));
end
fclose(fid);

end