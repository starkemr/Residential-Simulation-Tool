function varargout = DemandResponseParameters(varargin)
% DEMANDRESPONSEPARAMETERS MATLAB code for DemandResponseParameters.fig
%      DEMANDRESPONSEPARAMETERS, by itself, creates a new DEMANDRESPONSEPARAMETERS or raises the existing
%      singleton*.
%
%      H = DEMANDRESPONSEPARAMETERS returns the handle to a new DEMANDRESPONSEPARAMETERS or the handle to
%      the existing singleton*.
%
%      DEMANDRESPONSEPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMANDRESPONSEPARAMETERS.M with the given input arguments.
%
%      DEMANDRESPONSEPARAMETERS('Property','Value',...) creates a new DEMANDRESPONSEPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DemandResponseParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DemandResponseParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DemandResponseParameters

% Last Modified by GUIDE v2.5 12-Aug-2013 19:03:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DemandResponseParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @DemandResponseParameters_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DemandResponseParameters is made visible.
function DemandResponseParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DemandResponseParameters (see VARARGIN)

% Choose default command line output for DemandResponseParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DemandResponseParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% HVAC Demand Response Settings

% Load Inputs

if exist(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'),'file') == 2
    HVACDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'));
else
    HVACDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','HVACDemandResponse_Default.txt'));
end


% Set Inputs

set(handles.HVACDRPercentage_Input, 'Value', HVACDemandResponse_Inputs(1));
set(handles.HVACDRPercentage_Input, 'String', strcat(num2str(HVACDemandResponse_Inputs(1)),' %'));

set(handles.HVACLoadShed_CheckBox, 'Value', HVACDemandResponse_Inputs(2));

set(handles.HVACLoadShed_Hour, 'Value', HVACDemandResponse_Inputs(3));

set(handles.HVACLoadShed_Minute, 'Value', HVACDemandResponse_Inputs(4) + 1);

set(handles.HVACLoadShed_AMPM, 'Value', HVACDemandResponse_Inputs(5));

set(handles.HVACLoadShed_DayInput, 'Value', HVACDemandResponse_Inputs(6));
set(handles.HVACLoadShed_DayInput, 'String', num2str(HVACDemandResponse_Inputs(6)));

set(handles.HVACLoadShed_SpreadOverInput, 'Value', HVACDemandResponse_Inputs(7));
set(handles.HVACLoadShed_SpreadOverInput, 'String', strcat(num2str(HVACDemandResponse_Inputs(7)),' Minutes'));

set(handles.HVACAdjustThermostat_CheckBox, 'Value', HVACDemandResponse_Inputs(8));

set(handles.HVACAdjustThermostat_TemperatureInput, 'Value', HVACDemandResponse_Inputs(9));
set(handles.HVACAdjustThermostat_TemperatureInput, 'String', strcat(num2str(HVACDemandResponse_Inputs(9)),' F'));

set(handles.HVACAdjustThermostat_Hour, 'Value', HVACDemandResponse_Inputs(10));

set(handles.HVACAdjustThermostat_Minute, 'Value', HVACDemandResponse_Inputs(11) + 1);

set(handles.HVACAdjustThermostat_AMPM, 'Value', HVACDemandResponse_Inputs(12));

set(handles.HVACAdjustThermostat_DayInput, 'Value', HVACDemandResponse_Inputs(13));
set(handles.HVACAdjustThermostat_DayInput, 'String', num2str(HVACDemandResponse_Inputs(13)));

set(handles.HVACAdjustThermostat_SpreadOverInput, 'Value', HVACDemandResponse_Inputs(14));
set(handles.HVACAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(HVACDemandResponse_Inputs(14)),' Minutes'));

set(handles.HVACAdjustThermostat_Hour2, 'Value', HVACDemandResponse_Inputs(15));

set(handles.HVACAdjustThermostat_Minute2, 'Value', HVACDemandResponse_Inputs(16) + 1);

set(handles.HVACAdjustThermostat_AMPM2, 'Value', HVACDemandResponse_Inputs(17));

set(handles.HVACAdjustThermostat_DayInput2, 'Value', HVACDemandResponse_Inputs(18));
set(handles.HVACAdjustThermostat_DayInput2, 'String', num2str(HVACDemandResponse_Inputs(18)));

set(handles.HVACAdjustThermostat_SpreadOverInput2, 'Value', HVACDemandResponse_Inputs(19));
set(handles.HVACAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(HVACDemandResponse_Inputs(19)),' Minutes'));


% Water Heater Demand Response Settings

% Load Inputs

if exist(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'),'file') == 2
    WaterHeaterDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'));
else
    WaterHeaterDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','WaterHeaterDemandResponse_Default.txt'));
end


% Set Inputs

set(handles.WaterHeaterDRPercentage_Input, 'Value', WaterHeaterDemandResponse_Inputs(1));
set(handles.WaterHeaterDRPercentage_Input, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(1)),' %'));

set(handles.WaterHeaterLoadShed_CheckBox, 'Value', WaterHeaterDemandResponse_Inputs(2));

set(handles.WaterHeaterLoadShed_Hour, 'Value', WaterHeaterDemandResponse_Inputs(3));

set(handles.WaterHeaterLoadShed_Minute, 'Value', WaterHeaterDemandResponse_Inputs(4) + 1);

set(handles.WaterHeaterLoadShed_AMPM, 'Value', WaterHeaterDemandResponse_Inputs(5));

set(handles.WaterHeaterLoadShed_DayInput, 'Value', WaterHeaterDemandResponse_Inputs(6));
set(handles.WaterHeaterLoadShed_DayInput, 'String', num2str(WaterHeaterDemandResponse_Inputs(6)));

set(handles.WaterHeaterLoadShed_SpreadOverInput, 'Value', WaterHeaterDemandResponse_Inputs(7));
set(handles.WaterHeaterLoadShed_SpreadOverInput, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(7)),' Minutes'));

set(handles.WaterHeaterAdjustThermostat_CheckBox, 'Value', WaterHeaterDemandResponse_Inputs(8));

set(handles.WaterHeaterAdjustThermostat_TemperatureInput, 'Value', WaterHeaterDemandResponse_Inputs(9));
set(handles.WaterHeaterAdjustThermostat_TemperatureInput, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(9)),' F'));

set(handles.WaterHeaterAdjustThermostat_Hour, 'Value', WaterHeaterDemandResponse_Inputs(10));

set(handles.WaterHeaterAdjustThermostat_Minute, 'Value', WaterHeaterDemandResponse_Inputs(11) + 1);

set(handles.WaterHeaterAdjustThermostat_AMPM, 'Value', WaterHeaterDemandResponse_Inputs(12));

set(handles.WaterHeaterAdjustThermostat_DayInput, 'Value', WaterHeaterDemandResponse_Inputs(13));
set(handles.WaterHeaterAdjustThermostat_DayInput, 'String', num2str(WaterHeaterDemandResponse_Inputs(13)));

set(handles.WaterHeaterAdjustThermostat_SpreadOverInput, 'Value', WaterHeaterDemandResponse_Inputs(14));
set(handles.WaterHeaterAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(14)),' Minutes'));

set(handles.WaterHeaterAdjustThermostat_Hour2, 'Value', WaterHeaterDemandResponse_Inputs(15));

set(handles.WaterHeaterAdjustThermostat_Minute2, 'Value', WaterHeaterDemandResponse_Inputs(16) + 1);

set(handles.WaterHeaterAdjustThermostat_AMPM2, 'Value', WaterHeaterDemandResponse_Inputs(17));

set(handles.WaterHeaterAdjustThermostat_DayInput2, 'Value', WaterHeaterDemandResponse_Inputs(18));
set(handles.WaterHeaterAdjustThermostat_DayInput2, 'String', num2str(WaterHeaterDemandResponse_Inputs(18)));

set(handles.WaterHeaterAdjustThermostat_SpreadOverInput2, 'Value', WaterHeaterDemandResponse_Inputs(19));
set(handles.WaterHeaterAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(19)),' Minutes'));


% Refrigerator Demand Response Settings

% Load Inputs

if exist(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'),'file') == 2
    RefrigeratorDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'));
else
    RefrigeratorDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','RefrigeratorDemandResponse_Default.txt'));
end


% Set Inputs

set(handles.RefrigeratorDRPercentage_Input, 'Value', RefrigeratorDemandResponse_Inputs(1));
set(handles.RefrigeratorDRPercentage_Input, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(1)),' %'));

set(handles.RefrigeratorLoadShed_CheckBox, 'Value', RefrigeratorDemandResponse_Inputs(2));

set(handles.RefrigeratorLoadShed_Hour, 'Value', RefrigeratorDemandResponse_Inputs(3));

set(handles.RefrigeratorLoadShed_Minute, 'Value', RefrigeratorDemandResponse_Inputs(4) + 1);

set(handles.RefrigeratorLoadShed_AMPM, 'Value', RefrigeratorDemandResponse_Inputs(5));

set(handles.RefrigeratorLoadShed_DayInput, 'Value', RefrigeratorDemandResponse_Inputs(6));
set(handles.RefrigeratorLoadShed_DayInput, 'String', num2str(RefrigeratorDemandResponse_Inputs(6)));

set(handles.RefrigeratorLoadShed_SpreadOverInput, 'Value', RefrigeratorDemandResponse_Inputs(7));
set(handles.RefrigeratorLoadShed_SpreadOverInput, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(7)),' Minutes'));

set(handles.RefrigeratorAdjustThermostat_CheckBox, 'Value', RefrigeratorDemandResponse_Inputs(8));

set(handles.RefrigeratorAdjustThermostat_TemperatureInput, 'Value', RefrigeratorDemandResponse_Inputs(9));
set(handles.RefrigeratorAdjustThermostat_TemperatureInput, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(9)),' F'));

set(handles.RefrigeratorAdjustThermostat_Hour, 'Value', RefrigeratorDemandResponse_Inputs(10));

set(handles.RefrigeratorAdjustThermostat_Minute, 'Value', RefrigeratorDemandResponse_Inputs(11) + 1);

set(handles.RefrigeratorAdjustThermostat_AMPM, 'Value', RefrigeratorDemandResponse_Inputs(12));

set(handles.RefrigeratorAdjustThermostat_DayInput, 'Value', RefrigeratorDemandResponse_Inputs(13));
set(handles.RefrigeratorAdjustThermostat_DayInput, 'String', num2str(RefrigeratorDemandResponse_Inputs(13)));

set(handles.RefrigeratorAdjustThermostat_SpreadOverInput, 'Value', RefrigeratorDemandResponse_Inputs(14));
set(handles.RefrigeratorAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(14)),' Minutes'));

set(handles.RefrigeratorAdjustThermostat_Hour2, 'Value', RefrigeratorDemandResponse_Inputs(15));

set(handles.RefrigeratorAdjustThermostat_Minute2, 'Value', RefrigeratorDemandResponse_Inputs(16) + 1);

set(handles.RefrigeratorAdjustThermostat_AMPM2, 'Value', RefrigeratorDemandResponse_Inputs(17));

set(handles.RefrigeratorAdjustThermostat_DayInput2, 'Value', RefrigeratorDemandResponse_Inputs(18));
set(handles.RefrigeratorAdjustThermostat_DayInput2, 'String', num2str(RefrigeratorDemandResponse_Inputs(18)));

set(handles.RefrigeratorAdjustThermostat_SpreadOverInput2, 'Value', RefrigeratorDemandResponse_Inputs(19));
set(handles.RefrigeratorAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(19)),' Minutes'));


% Freezer Demand Response Settings

% Load Inputs

if exist(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'),'file') == 2
    FreezerDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'));
else
    FreezerDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','FreezerDemandResponse_Default.txt'));
end


% Set Inputs

set(handles.FreezerDRPercentage_Input, 'Value', FreezerDemandResponse_Inputs(1));
set(handles.FreezerDRPercentage_Input, 'String', strcat(num2str(FreezerDemandResponse_Inputs(1)),' %'));

set(handles.FreezerLoadShed_CheckBox, 'Value', FreezerDemandResponse_Inputs(2));

set(handles.FreezerLoadShed_Hour, 'Value', FreezerDemandResponse_Inputs(3));

set(handles.FreezerLoadShed_Minute, 'Value', FreezerDemandResponse_Inputs(4) + 1);

set(handles.FreezerLoadShed_AMPM, 'Value', FreezerDemandResponse_Inputs(5));

set(handles.FreezerLoadShed_DayInput, 'Value', FreezerDemandResponse_Inputs(6));
set(handles.FreezerLoadShed_DayInput, 'String', num2str(FreezerDemandResponse_Inputs(6)));

set(handles.FreezerLoadShed_SpreadOverInput, 'Value', FreezerDemandResponse_Inputs(7));
set(handles.FreezerLoadShed_SpreadOverInput, 'String', strcat(num2str(FreezerDemandResponse_Inputs(7)),' Minutes'));

set(handles.FreezerAdjustThermostat_CheckBox, 'Value', FreezerDemandResponse_Inputs(8));

set(handles.FreezerAdjustThermostat_TemperatureInput, 'Value', FreezerDemandResponse_Inputs(9));
set(handles.FreezerAdjustThermostat_TemperatureInput, 'String', strcat(num2str(FreezerDemandResponse_Inputs(9)),' F'));

set(handles.FreezerAdjustThermostat_Hour, 'Value', FreezerDemandResponse_Inputs(10));

set(handles.FreezerAdjustThermostat_Minute, 'Value', FreezerDemandResponse_Inputs(11) + 1);

set(handles.FreezerAdjustThermostat_AMPM, 'Value', FreezerDemandResponse_Inputs(12));

set(handles.FreezerAdjustThermostat_DayInput, 'Value', FreezerDemandResponse_Inputs(13));
set(handles.FreezerAdjustThermostat_DayInput, 'String', num2str(FreezerDemandResponse_Inputs(13)));

set(handles.FreezerAdjustThermostat_SpreadOverInput, 'Value', FreezerDemandResponse_Inputs(14));
set(handles.FreezerAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(FreezerDemandResponse_Inputs(14)),' Minutes'));

set(handles.FreezerAdjustThermostat_Hour2, 'Value', FreezerDemandResponse_Inputs(15));

set(handles.FreezerAdjustThermostat_Minute2, 'Value', FreezerDemandResponse_Inputs(16) + 1);

set(handles.FreezerAdjustThermostat_AMPM2, 'Value', FreezerDemandResponse_Inputs(17));

set(handles.FreezerAdjustThermostat_DayInput2, 'Value', FreezerDemandResponse_Inputs(18));
set(handles.FreezerAdjustThermostat_DayInput2, 'String', num2str(FreezerDemandResponse_Inputs(18)));

set(handles.FreezerAdjustThermostat_SpreadOverInput2, 'Value', FreezerDemandResponse_Inputs(19));
set(handles.FreezerAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(FreezerDemandResponse_Inputs(19)),' Minutes'));


% Washer/Dryer Demand Response Settings

% Load Inputs

if exist(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'),'file') == 2
    WasherDryerDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'));
else
    WasherDryerDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','WasherDryerDemandResponse_Default.txt'));
end


% Set Inputs

set(handles.WasherDryerDRPercentage_Input, 'Value', WasherDryerDemandResponse_Inputs(1));
set(handles.WasherDryerDRPercentage_Input, 'String', strcat(num2str(WasherDryerDemandResponse_Inputs(1)),' %'));

set(handles.WasherDryerDeferLoad_CheckBox, 'Value', WasherDryerDemandResponse_Inputs(2));

set(handles.WasherDryerDeferLoad_Hour, 'Value', WasherDryerDemandResponse_Inputs(3));

set(handles.WasherDryerDeferLoad_Minute, 'Value', WasherDryerDemandResponse_Inputs(4) + 1);

set(handles.WasherDryerDeferLoad_AMPM, 'Value', WasherDryerDemandResponse_Inputs(5));

set(handles.WasherDryerDeferLoad_Hour2, 'Value', WasherDryerDemandResponse_Inputs(6));

set(handles.WasherDryerDeferLoad_Minute2, 'Value', WasherDryerDemandResponse_Inputs(7) + 1);

set(handles.WasherDryerDeferLoad_AMPM2, 'Value', WasherDryerDemandResponse_Inputs(8));


% Dishwasher Demand Response Settings

% Load Inputs

if exist(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'),'file') == 2
    DishwasherDemandResponse_Inputs = load(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'));
else
    DishwasherDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','DishwasherDemandResponse_Default.txt'));
end


% Set Inputs

set(handles.DishwasherDRPercentage_Input, 'Value', DishwasherDemandResponse_Inputs(1));
set(handles.DishwasherDRPercentage_Input, 'String', strcat(num2str(DishwasherDemandResponse_Inputs(1)),' %'));

set(handles.DishwasherDeferLoad_CheckBox, 'Value', DishwasherDemandResponse_Inputs(2));

set(handles.DishwasherDeferLoad_Hour, 'Value', DishwasherDemandResponse_Inputs(3));

set(handles.DishwasherDeferLoad_Minute, 'Value', DishwasherDemandResponse_Inputs(4) + 1);

set(handles.DishwasherDeferLoad_AMPM, 'Value', DishwasherDemandResponse_Inputs(5));

set(handles.DishwasherDeferLoad_Hour2, 'Value', DishwasherDemandResponse_Inputs(6));

set(handles.DishwasherDeferLoad_Minute2, 'Value', DishwasherDemandResponse_Inputs(7) + 1);

set(handles.DishwasherDeferLoad_AMPM2, 'Value', DishwasherDemandResponse_Inputs(8));


% --- Outputs from this function are returned to the command line.
function varargout = DemandResponseParameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SaveParameters_Button.
function SaveParameters_Button_Callback(hObject, eventdata, handles)
% hObject    handle to SaveParameters_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
inputdata = struct.inputdata;


% HVAC Demand Response Settings

% Get User Settings

p1 = get(handles.HVACDRPercentage_Input);
p2 = get(handles.HVACLoadShed_CheckBox);
p3 = get(handles.HVACLoadShed_Hour);
p4 = get(handles.HVACLoadShed_Minute);
p5 = get(handles.HVACLoadShed_AMPM);
p6 = get(handles.HVACLoadShed_DayInput);
p7 = get(handles.HVACLoadShed_SpreadOverInput);
p8 = get(handles.HVACAdjustThermostat_CheckBox);
p9 = get(handles.HVACAdjustThermostat_TemperatureInput);
p10 = get(handles.HVACAdjustThermostat_Hour);
p11 = get(handles.HVACAdjustThermostat_Minute);
p12 = get(handles.HVACAdjustThermostat_AMPM);
p13 = get(handles.HVACAdjustThermostat_DayInput);
p14 = get(handles.HVACAdjustThermostat_SpreadOverInput);
p15 = get(handles.HVACAdjustThermostat_Hour2);
p16 = get(handles.HVACAdjustThermostat_Minute2);
p17 = get(handles.HVACAdjustThermostat_AMPM2);
p18 = get(handles.HVACAdjustThermostat_DayInput2);
p19 = get(handles.HVACAdjustThermostat_SpreadOverInput2);

a(1) = p1.Value;
a(2) = p2.Value;
a(3) = p3.Value;
a(4) = p4.Value - 1;
a(5) = p5.Value;
a(6) = p6.Value;
a(7) = p7.Value;
a(8) = p8.Value;
a(9) = p9.Value;
a(10) = p10.Value;
a(11) = p11.Value - 1;
a(12) = p12.Value;
a(13) = p13.Value;
a(14) = p14.Value;
a(15) = p15.Value;
a(16) = p16.Value - 1;
a(17) = p17.Value;
a(18) = p18.Value;
a(19) = p19.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('HVACDemandResponse_Data.txt','w');
for w = 1:length(a)
    fprintf(fid,'%f\n', a(w));
end
fclose(fid);


% Water Heater Demand Response Settings

% Get User Settings

p1 = get(handles.WaterHeaterDRPercentage_Input);
p2 = get(handles.WaterHeaterLoadShed_CheckBox);
p3 = get(handles.WaterHeaterLoadShed_Hour);
p4 = get(handles.WaterHeaterLoadShed_Minute);
p5 = get(handles.WaterHeaterLoadShed_AMPM);
p6 = get(handles.WaterHeaterLoadShed_DayInput);
p7 = get(handles.WaterHeaterLoadShed_SpreadOverInput);
p8 = get(handles.WaterHeaterAdjustThermostat_CheckBox);
p9 = get(handles.WaterHeaterAdjustThermostat_TemperatureInput);
p10 = get(handles.WaterHeaterAdjustThermostat_Hour);
p11 = get(handles.WaterHeaterAdjustThermostat_Minute);
p12 = get(handles.WaterHeaterAdjustThermostat_AMPM);
p13 = get(handles.WaterHeaterAdjustThermostat_DayInput);
p14 = get(handles.WaterHeaterAdjustThermostat_SpreadOverInput);
p15 = get(handles.WaterHeaterAdjustThermostat_Hour2);
p16 = get(handles.WaterHeaterAdjustThermostat_Minute2);
p17 = get(handles.WaterHeaterAdjustThermostat_AMPM2);
p18 = get(handles.WaterHeaterAdjustThermostat_DayInput2);
p19 = get(handles.WaterHeaterAdjustThermostat_SpreadOverInput2);

b(1) = p1.Value;
b(2) = p2.Value;
b(3) = p3.Value;
b(4) = p4.Value - 1;
b(5) = p5.Value;
b(6) = p6.Value;
b(7) = p7.Value;
b(8) = p8.Value;
b(9) = p9.Value;
b(10) = p10.Value;
b(11) = p11.Value - 1;
b(12) = p12.Value;
b(13) = p13.Value;
b(14) = p14.Value;
b(15) = p15.Value;
b(16) = p16.Value - 1;
b(17) = p17.Value;
b(18) = p18.Value;
b(19) = p19.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('WaterHeaterDemandResponse_Data.txt','w');
for w = 1:length(b)
    fprintf(fid,'%f\n', b(w));
end
fclose(fid);


% Refrigerator Demand Response Settings

% Get User Settings

p1 = get(handles.RefrigeratorDRPercentage_Input);
p2 = get(handles.RefrigeratorLoadShed_CheckBox);
p3 = get(handles.RefrigeratorLoadShed_Hour);
p4 = get(handles.RefrigeratorLoadShed_Minute);
p5 = get(handles.RefrigeratorLoadShed_AMPM);
p6 = get(handles.RefrigeratorLoadShed_DayInput);
p7 = get(handles.RefrigeratorLoadShed_SpreadOverInput);
p8 = get(handles.RefrigeratorAdjustThermostat_CheckBox);
p9 = get(handles.RefrigeratorAdjustThermostat_TemperatureInput);
p10 = get(handles.RefrigeratorAdjustThermostat_Hour);
p11 = get(handles.RefrigeratorAdjustThermostat_Minute);
p12 = get(handles.RefrigeratorAdjustThermostat_AMPM);
p13 = get(handles.RefrigeratorAdjustThermostat_DayInput);
p14 = get(handles.RefrigeratorAdjustThermostat_SpreadOverInput);
p15 = get(handles.RefrigeratorAdjustThermostat_Hour2);
p16 = get(handles.RefrigeratorAdjustThermostat_Minute2);
p17 = get(handles.RefrigeratorAdjustThermostat_AMPM2);
p18 = get(handles.RefrigeratorAdjustThermostat_DayInput2);
p19 = get(handles.RefrigeratorAdjustThermostat_SpreadOverInput2);

c(1) = p1.Value;
c(2) = p2.Value;
c(3) = p3.Value;
c(4) = p4.Value - 1;
c(5) = p5.Value;
c(6) = p6.Value;
c(7) = p7.Value;
c(8) = p8.Value;
c(9) = p9.Value;
c(10) = p10.Value;
c(11) = p11.Value - 1;
c(12) = p12.Value;
c(13) = p13.Value;
c(14) = p14.Value;
c(15) = p15.Value;
c(16) = p16.Value - 1;
c(17) = p17.Value;
c(18) = p18.Value;
c(19) = p19.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('RefrigeratorDemandResponse_Data.txt','w');
for w = 1:length(c)
    fprintf(fid,'%f\n', c(w));
end
fclose(fid);


% Freezer Demand Response Settings

% Get User Settings

p1 = get(handles.FreezerDRPercentage_Input);
p2 = get(handles.FreezerLoadShed_CheckBox);
p3 = get(handles.FreezerLoadShed_Hour);
p4 = get(handles.FreezerLoadShed_Minute);
p5 = get(handles.FreezerLoadShed_AMPM);
p6 = get(handles.FreezerLoadShed_DayInput);
p7 = get(handles.FreezerLoadShed_SpreadOverInput);
p8 = get(handles.FreezerAdjustThermostat_CheckBox);
p9 = get(handles.FreezerAdjustThermostat_TemperatureInput);
p10 = get(handles.FreezerAdjustThermostat_Hour);
p11 = get(handles.FreezerAdjustThermostat_Minute);
p12 = get(handles.FreezerAdjustThermostat_AMPM);
p13 = get(handles.FreezerAdjustThermostat_DayInput);
p14 = get(handles.FreezerAdjustThermostat_SpreadOverInput);
p15 = get(handles.FreezerAdjustThermostat_Hour2);
p16 = get(handles.FreezerAdjustThermostat_Minute2);
p17 = get(handles.FreezerAdjustThermostat_AMPM2);
p18 = get(handles.FreezerAdjustThermostat_DayInput2);
p19 = get(handles.FreezerAdjustThermostat_SpreadOverInput2);

d(1) = p1.Value;
d(2) = p2.Value;
d(3) = p3.Value;
d(4) = p4.Value - 1;
d(5) = p5.Value;
d(6) = p6.Value;
d(7) = p7.Value;
d(8) = p8.Value;
d(9) = p9.Value;
d(10) = p10.Value;
d(11) = p11.Value - 1;
d(12) = p12.Value;
d(13) = p13.Value;
d(14) = p14.Value;
d(15) = p15.Value;
d(16) = p16.Value - 1;
d(17) = p17.Value;
d(18) = p18.Value;
d(19) = p19.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('FreezerDemandResponse_Data.txt','w');
for w = 1:length(d)
    fprintf(fid,'%f\n', d(w));
end
fclose(fid);


% Washer/Dryer Demand Response Settings

% Get User Settings

p1 = get(handles.WasherDryerDRPercentage_Input);
p2 = get(handles.WasherDryerDeferLoad_CheckBox);
p3 = get(handles.WasherDryerDeferLoad_Hour);
p4 = get(handles.WasherDryerDeferLoad_Minute);
p5 = get(handles.WasherDryerDeferLoad_AMPM);
p6 = get(handles.WasherDryerDeferLoad_Hour2);
p7 = get(handles.WasherDryerDeferLoad_Minute2);
p8 = get(handles.WasherDryerDeferLoad_AMPM2);

e(1) = p1.Value;
e(2) = p2.Value;
e(3) = p3.Value;
e(4) = p4.Value - 1;
e(5) = p5.Value;
e(6) = p6.Value;
e(7) = p7.Value - 1;
e(8) = p8.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('WasherDryerDemandResponse_Data.txt','w');
for w = 1:length(e)
    fprintf(fid,'%f\n', e(w));
end
fclose(fid);


% Dishwasher Demand Response Settings

% Get User Settings

p1 = get(handles.DishwasherDRPercentage_Input);
p2 = get(handles.DishwasherDeferLoad_CheckBox);
p3 = get(handles.DishwasherDeferLoad_Hour);
p4 = get(handles.DishwasherDeferLoad_Minute);
p5 = get(handles.DishwasherDeferLoad_AMPM);
p6 = get(handles.DishwasherDeferLoad_Hour2);
p7 = get(handles.DishwasherDeferLoad_Minute2);
p8 = get(handles.DishwasherDeferLoad_AMPM2);

f(1) = p1.Value;
f(2) = p2.Value;
f(3) = p3.Value;
f(4) = p4.Value - 1;
f(5) = p5.Value;
f(6) = p6.Value;
f(7) = p7.Value - 1;
f(8) = p8.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('DishwasherDemandResponse_Data.txt','w');
for w = 1:length(f)
    fprintf(fid,'%f\n', f(w));
end
fclose(fid);

cd(home);


% --- Executes on button press in RestoreDefaults_Button.
function RestoreDefaults_Button_Callback(hObject, eventdata, handles)
% hObject    handle to RestoreDefaults_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% HVAC Demand Response Settings

% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','HVACDemandResponse_Data.txt'));
end


% Load Default Inputs

HVACDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','HVACDemandResponse_Default.txt'));


% Reset Inputs to Default

set(handles.HVACDRPercentage_Input, 'Value', HVACDemandResponse_Inputs(1));
set(handles.HVACDRPercentage_Input, 'String', strcat(num2str(HVACDemandResponse_Inputs(1)),' %'));

set(handles.HVACLoadShed_CheckBox, 'Value', HVACDemandResponse_Inputs(2));

set(handles.HVACLoadShed_Hour, 'Value', HVACDemandResponse_Inputs(3));

set(handles.HVACLoadShed_Minute, 'Value', HVACDemandResponse_Inputs(4) + 1);

set(handles.HVACLoadShed_AMPM, 'Value', HVACDemandResponse_Inputs(5));

set(handles.HVACLoadShed_DayInput, 'Value', HVACDemandResponse_Inputs(6));
set(handles.HVACLoadShed_DayInput, 'String', num2str(HVACDemandResponse_Inputs(6)));

set(handles.HVACLoadShed_SpreadOverInput, 'Value', HVACDemandResponse_Inputs(7));
set(handles.HVACLoadShed_SpreadOverInput, 'String', strcat(num2str(HVACDemandResponse_Inputs(7)),' Minutes'));

set(handles.HVACAdjustThermostat_CheckBox, 'Value', HVACDemandResponse_Inputs(8));

set(handles.HVACAdjustThermostat_TemperatureInput, 'Value', HVACDemandResponse_Inputs(9));
set(handles.HVACAdjustThermostat_TemperatureInput, 'String', strcat(num2str(HVACDemandResponse_Inputs(9)),' F'));

set(handles.HVACAdjustThermostat_Hour, 'Value', HVACDemandResponse_Inputs(10));

set(handles.HVACAdjustThermostat_Minute, 'Value', HVACDemandResponse_Inputs(11) + 1);

set(handles.HVACAdjustThermostat_AMPM, 'Value', HVACDemandResponse_Inputs(12));

set(handles.HVACAdjustThermostat_DayInput, 'Value', HVACDemandResponse_Inputs(13));
set(handles.HVACAdjustThermostat_DayInput, 'String', num2str(HVACDemandResponse_Inputs(13)));

set(handles.HVACAdjustThermostat_SpreadOverInput, 'Value', HVACDemandResponse_Inputs(14));
set(handles.HVACAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(HVACDemandResponse_Inputs(14)),' Minutes'));

set(handles.HVACAdjustThermostat_Hour2, 'Value', HVACDemandResponse_Inputs(15));

set(handles.HVACAdjustThermostat_Minute2, 'Value', HVACDemandResponse_Inputs(16) + 1);

set(handles.HVACAdjustThermostat_AMPM2, 'Value', HVACDemandResponse_Inputs(17));

set(handles.HVACAdjustThermostat_DayInput2, 'Value', HVACDemandResponse_Inputs(18));
set(handles.HVACAdjustThermostat_DayInput2, 'String', num2str(HVACDemandResponse_Inputs(18)));

set(handles.HVACAdjustThermostat_SpreadOverInput2, 'Value', HVACDemandResponse_Inputs(19));
set(handles.HVACAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(HVACDemandResponse_Inputs(19)),' Minutes'));


% Water Heater Demand Response Settings

% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','WaterHeaterDemandResponse_Data.txt'));
end


% Load Default Inputs

WaterHeaterDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','WaterHeaterDemandResponse_Default.txt'));


% Reset Inputs to Default

set(handles.WaterHeaterDRPercentage_Input, 'Value', WaterHeaterDemandResponse_Inputs(1));
set(handles.WaterHeaterDRPercentage_Input, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(1)),' %'));

set(handles.WaterHeaterLoadShed_CheckBox, 'Value', WaterHeaterDemandResponse_Inputs(2));

set(handles.WaterHeaterLoadShed_Hour, 'Value', WaterHeaterDemandResponse_Inputs(3));

set(handles.WaterHeaterLoadShed_Minute, 'Value', WaterHeaterDemandResponse_Inputs(4) + 1);

set(handles.WaterHeaterLoadShed_AMPM, 'Value', WaterHeaterDemandResponse_Inputs(5));

set(handles.WaterHeaterLoadShed_DayInput, 'Value', WaterHeaterDemandResponse_Inputs(6));
set(handles.WaterHeaterLoadShed_DayInput, 'String', num2str(WaterHeaterDemandResponse_Inputs(6)));

set(handles.WaterHeaterLoadShed_SpreadOverInput, 'Value', WaterHeaterDemandResponse_Inputs(7));
set(handles.WaterHeaterLoadShed_SpreadOverInput, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(7)),' Minutes'));

set(handles.WaterHeaterAdjustThermostat_CheckBox, 'Value', WaterHeaterDemandResponse_Inputs(8));

set(handles.WaterHeaterAdjustThermostat_TemperatureInput, 'Value', WaterHeaterDemandResponse_Inputs(9));
set(handles.WaterHeaterAdjustThermostat_TemperatureInput, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(9)),' F'));

set(handles.WaterHeaterAdjustThermostat_Hour, 'Value', WaterHeaterDemandResponse_Inputs(10));

set(handles.WaterHeaterAdjustThermostat_Minute, 'Value', WaterHeaterDemandResponse_Inputs(11) + 1);

set(handles.WaterHeaterAdjustThermostat_AMPM, 'Value', WaterHeaterDemandResponse_Inputs(12));

set(handles.WaterHeaterAdjustThermostat_DayInput, 'Value', WaterHeaterDemandResponse_Inputs(13));
set(handles.WaterHeaterAdjustThermostat_DayInput, 'String', num2str(WaterHeaterDemandResponse_Inputs(13)));

set(handles.WaterHeaterAdjustThermostat_SpreadOverInput, 'Value', WaterHeaterDemandResponse_Inputs(14));
set(handles.WaterHeaterAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(14)),' Minutes'));

set(handles.WaterHeaterAdjustThermostat_Hour2, 'Value', WaterHeaterDemandResponse_Inputs(15));

set(handles.WaterHeaterAdjustThermostat_Minute2, 'Value', WaterHeaterDemandResponse_Inputs(16) + 1);

set(handles.WaterHeaterAdjustThermostat_AMPM2, 'Value', WaterHeaterDemandResponse_Inputs(17));

set(handles.WaterHeaterAdjustThermostat_DayInput2, 'Value', WaterHeaterDemandResponse_Inputs(18));
set(handles.WaterHeaterAdjustThermostat_DayInput2, 'String', num2str(WaterHeaterDemandResponse_Inputs(18)));

set(handles.WaterHeaterAdjustThermostat_SpreadOverInput2, 'Value', WaterHeaterDemandResponse_Inputs(19));
set(handles.WaterHeaterAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(WaterHeaterDemandResponse_Inputs(19)),' Minutes'));


% Refrigerator Demand Response Settings

% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','RefrigeratorDemandResponse_Data.txt'));
end


% Load Default Inputs

RefrigeratorDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','RefrigeratorDemandResponse_Default.txt'));


% Reset Inputs to Default

set(handles.RefrigeratorDRPercentage_Input, 'Value', RefrigeratorDemandResponse_Inputs(1));
set(handles.RefrigeratorDRPercentage_Input, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(1)),' %'));

set(handles.RefrigeratorLoadShed_CheckBox, 'Value', RefrigeratorDemandResponse_Inputs(2));

set(handles.RefrigeratorLoadShed_Hour, 'Value', RefrigeratorDemandResponse_Inputs(3));

set(handles.RefrigeratorLoadShed_Minute, 'Value', RefrigeratorDemandResponse_Inputs(4) + 1);

set(handles.RefrigeratorLoadShed_AMPM, 'Value', RefrigeratorDemandResponse_Inputs(5));

set(handles.RefrigeratorLoadShed_DayInput, 'Value', RefrigeratorDemandResponse_Inputs(6));
set(handles.RefrigeratorLoadShed_DayInput, 'String', num2str(RefrigeratorDemandResponse_Inputs(6)));

set(handles.RefrigeratorLoadShed_SpreadOverInput, 'Value', RefrigeratorDemandResponse_Inputs(7));
set(handles.RefrigeratorLoadShed_SpreadOverInput, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(7)),' Minutes'));

set(handles.RefrigeratorAdjustThermostat_CheckBox, 'Value', RefrigeratorDemandResponse_Inputs(8));

set(handles.RefrigeratorAdjustThermostat_TemperatureInput, 'Value', RefrigeratorDemandResponse_Inputs(9));
set(handles.RefrigeratorAdjustThermostat_TemperatureInput, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(9)),' F'));

set(handles.RefrigeratorAdjustThermostat_Hour, 'Value', RefrigeratorDemandResponse_Inputs(10));

set(handles.RefrigeratorAdjustThermostat_Minute, 'Value', RefrigeratorDemandResponse_Inputs(11) + 1);

set(handles.RefrigeratorAdjustThermostat_AMPM, 'Value', RefrigeratorDemandResponse_Inputs(12));

set(handles.RefrigeratorAdjustThermostat_DayInput, 'Value', RefrigeratorDemandResponse_Inputs(13));
set(handles.RefrigeratorAdjustThermostat_DayInput, 'String', num2str(RefrigeratorDemandResponse_Inputs(13)));

set(handles.RefrigeratorAdjustThermostat_SpreadOverInput, 'Value', RefrigeratorDemandResponse_Inputs(14));
set(handles.RefrigeratorAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(14)),' Minutes'));

set(handles.RefrigeratorAdjustThermostat_Hour2, 'Value', RefrigeratorDemandResponse_Inputs(15));

set(handles.RefrigeratorAdjustThermostat_Minute2, 'Value', RefrigeratorDemandResponse_Inputs(16) + 1);

set(handles.RefrigeratorAdjustThermostat_AMPM2, 'Value', RefrigeratorDemandResponse_Inputs(17));

set(handles.RefrigeratorAdjustThermostat_DayInput2, 'Value', RefrigeratorDemandResponse_Inputs(18));
set(handles.RefrigeratorAdjustThermostat_DayInput2, 'String', num2str(RefrigeratorDemandResponse_Inputs(18)));

set(handles.RefrigeratorAdjustThermostat_SpreadOverInput2, 'Value', RefrigeratorDemandResponse_Inputs(19));
set(handles.RefrigeratorAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(RefrigeratorDemandResponse_Inputs(19)),' Minutes'));


% Freezer Demand Response Settings

% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','FreezerDemandResponse_Data.txt'));
end


% Load Default Inputs

FreezerDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','FreezerDemandResponse_Default.txt'));


% Reset Inputs to Default

set(handles.FreezerDRPercentage_Input, 'Value', FreezerDemandResponse_Inputs(1));
set(handles.FreezerDRPercentage_Input, 'String', strcat(num2str(FreezerDemandResponse_Inputs(1)),' %'));

set(handles.FreezerLoadShed_CheckBox, 'Value', FreezerDemandResponse_Inputs(2));

set(handles.FreezerLoadShed_Hour, 'Value', FreezerDemandResponse_Inputs(3));

set(handles.FreezerLoadShed_Minute, 'Value', FreezerDemandResponse_Inputs(4) + 1);

set(handles.FreezerLoadShed_AMPM, 'Value', FreezerDemandResponse_Inputs(5));

set(handles.FreezerLoadShed_DayInput, 'Value', FreezerDemandResponse_Inputs(6));
set(handles.FreezerLoadShed_DayInput, 'String', num2str(FreezerDemandResponse_Inputs(6)));

set(handles.FreezerLoadShed_SpreadOverInput, 'Value', FreezerDemandResponse_Inputs(7));
set(handles.FreezerLoadShed_SpreadOverInput, 'String', strcat(num2str(FreezerDemandResponse_Inputs(7)),' Minutes'));

set(handles.FreezerAdjustThermostat_CheckBox, 'Value', FreezerDemandResponse_Inputs(8));

set(handles.FreezerAdjustThermostat_TemperatureInput, 'Value', FreezerDemandResponse_Inputs(9));
set(handles.FreezerAdjustThermostat_TemperatureInput, 'String', strcat(num2str(FreezerDemandResponse_Inputs(9)),' F'));

set(handles.FreezerAdjustThermostat_Hour, 'Value', FreezerDemandResponse_Inputs(10));

set(handles.FreezerAdjustThermostat_Minute, 'Value', FreezerDemandResponse_Inputs(11) + 1);

set(handles.FreezerAdjustThermostat_AMPM, 'Value', FreezerDemandResponse_Inputs(12));

set(handles.FreezerAdjustThermostat_DayInput, 'Value', FreezerDemandResponse_Inputs(13));
set(handles.FreezerAdjustThermostat_DayInput, 'String', num2str(FreezerDemandResponse_Inputs(13)));

set(handles.FreezerAdjustThermostat_SpreadOverInput, 'Value', FreezerDemandResponse_Inputs(14));
set(handles.FreezerAdjustThermostat_SpreadOverInput, 'String', strcat(num2str(FreezerDemandResponse_Inputs(14)),' Minutes'));

set(handles.FreezerAdjustThermostat_Hour2, 'Value', FreezerDemandResponse_Inputs(15));

set(handles.FreezerAdjustThermostat_Minute2, 'Value', FreezerDemandResponse_Inputs(16) + 1);

set(handles.FreezerAdjustThermostat_AMPM2, 'Value', FreezerDemandResponse_Inputs(17));

set(handles.FreezerAdjustThermostat_DayInput2, 'Value', FreezerDemandResponse_Inputs(18));
set(handles.FreezerAdjustThermostat_DayInput2, 'String', num2str(FreezerDemandResponse_Inputs(18)));

set(handles.FreezerAdjustThermostat_SpreadOverInput2, 'Value', FreezerDemandResponse_Inputs(19));
set(handles.FreezerAdjustThermostat_SpreadOverInput2, 'String', strcat(num2str(FreezerDemandResponse_Inputs(19)),' Minutes'));


% Washer/Dryer Demand Response Settings

% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','WasherDryerDemandResponse_Data.txt'));
end


% Load Default Inputs

WasherDryerDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','WasherDryerDemandResponse_Default.txt'));


% Reset Inputs to Default

set(handles.WasherDryerDRPercentage_Input, 'Value', WasherDryerDemandResponse_Inputs(1));
set(handles.WasherDryerDRPercentage_Input, 'String', strcat(num2str(WasherDryerDemandResponse_Inputs(1)),' %'));

set(handles.WasherDryerDeferLoad_CheckBox, 'Value', WasherDryerDemandResponse_Inputs(2));

set(handles.WasherDryerDeferLoad_Hour, 'Value', WasherDryerDemandResponse_Inputs(3));

set(handles.WasherDryerDeferLoad_Minute, 'Value', WasherDryerDemandResponse_Inputs(4) + 1);

set(handles.WasherDryerDeferLoad_AMPM, 'Value', WasherDryerDemandResponse_Inputs(5));

set(handles.WasherDryerDeferLoad_Hour2, 'Value', WasherDryerDemandResponse_Inputs(6));

set(handles.WasherDryerDeferLoad_Minute2, 'Value', WasherDryerDemandResponse_Inputs(7) + 1);

set(handles.WasherDryerDeferLoad_AMPM2, 'Value', WasherDryerDemandResponse_Inputs(8));


% Dishwasher Demand Response Settings

% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','DishwasherDemandResponse_Data.txt'));
end


% Load Default Inputs

DishwasherDemandResponse_Inputs = load(fullfile(inputdata,'Default Settings','DishwasherDemandResponse_Default.txt'));


% Reset Inputs to Default

set(handles.DishwasherDRPercentage_Input, 'Value', DishwasherDemandResponse_Inputs(1));
set(handles.DishwasherDRPercentage_Input, 'String', strcat(num2str(DishwasherDemandResponse_Inputs(1)),' %'));

set(handles.DishwasherDeferLoad_CheckBox, 'Value', DishwasherDemandResponse_Inputs(2));

set(handles.DishwasherDeferLoad_Hour, 'Value', DishwasherDemandResponse_Inputs(3));

set(handles.DishwasherDeferLoad_Minute, 'Value', DishwasherDemandResponse_Inputs(4) + 1);

set(handles.DishwasherDeferLoad_AMPM, 'Value', DishwasherDemandResponse_Inputs(5));

set(handles.DishwasherDeferLoad_Hour2, 'Value', DishwasherDemandResponse_Inputs(6));

set(handles.DishwasherDeferLoad_Minute2, 'Value', DishwasherDemandResponse_Inputs(7) + 1);

set(handles.DishwasherDeferLoad_AMPM2, 'Value', DishwasherDemandResponse_Inputs(8));


function HVACDRPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to HVACDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACDRPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of HVACDRPercentage_Input as a double

% Read in and Store HVAC Demand Response Percentage Input

HVACDRPercentage = str2double(get(hObject,'String'));
if isnan(HVACDRPercentage)
    HVACDRPercentage = [];
    set(hObject,'String',HVACDRPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACDRPercentage < 0
    HVACDRPercentage = [];
    set(hObject,'String',HVACDRPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if HVACDRPercentage > 100
    HVACDRPercentage = [];
    set(hObject,'String',HVACDRPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.HVACDRPercentage_Input, 'Value', HVACDRPercentage);


% --- Executes during object creation, after setting all properties.
function HVACDRPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HVACLoadShed_CheckBox.
function HVACLoadShed_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HVACLoadShed_CheckBox


% --- Executes on selection change in HVACLoadShed_Hour.
function HVACLoadShed_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACLoadShed_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACLoadShed_Hour


% --- Executes during object creation, after setting all properties.
function HVACLoadShed_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACLoadShed_Minute.
function HVACLoadShed_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACLoadShed_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACLoadShed_Minute


% --- Executes during object creation, after setting all properties.
function HVACLoadShed_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACLoadShed_AMPM.
function HVACLoadShed_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACLoadShed_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACLoadShed_AMPM


% --- Executes during object creation, after setting all properties.
function HVACLoadShed_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HVACLoadShed_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACLoadShed_DayInput as text
%        str2double(get(hObject,'String')) returns contents of HVACLoadShed_DayInput as a double

% Read in and Store HVAC Load Shed Day Input

HVACLoadShed_Day = str2double(get(hObject,'String'));
if isnan(HVACLoadShed_Day)
    HVACLoadShed_Day = [];
    set(hObject,'String',HVACLoadShed_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACLoadShed_Day <= 0 || mod(HVACLoadShed_Day,1) ~= 0
    HVACLoadShed_Day = [];
    set(hObject,'String',HVACLoadShed_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.HVACLoadShed_DayInput, 'Value', HVACLoadShed_Day);


% --- Executes during object creation, after setting all properties.
function HVACLoadShed_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HVACLoadShed_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACLoadShed_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of HVACLoadShed_SpreadOverInput as a double

% Read in and Store HVAC Load Shed Spread Over Input

HVACLoadShed_SpreadOver = str2double(get(hObject,'String'));
if isnan(HVACLoadShed_SpreadOver)
    HVACLoadShed_SpreadOver = [];
    set(hObject,'String',HVACLoadShed_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACLoadShed_SpreadOver < 0 || mod(HVACLoadShed_SpreadOver,1) ~= 0
    HVACLoadShed_SpreadOver = [];
    set(hObject,'String',HVACLoadShed_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.HVACLoadShed_SpreadOverInput, 'Value', HVACLoadShed_SpreadOver);


% --- Executes during object creation, after setting all properties.
function HVACLoadShed_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in HVACAdjustThermostat_CheckBox.
function HVACAdjustThermostat_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HVACAdjustThermostat_CheckBox


function HVACAdjustThermostat_TemperatureInput_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACAdjustThermostat_TemperatureInput as text
%        str2double(get(hObject,'String')) returns contents of HVACAdjustThermostat_TemperatureInput as a double

% Read in and Store HVAC Adjust Thermostat Temperature Input

HVACAdjustThermostat_Temperature = str2double(get(hObject,'String'));
if isnan(HVACAdjustThermostat_Temperature)
    HVACAdjustThermostat_Temperature = [];
    set(hObject,'String',HVACAdjustThermostat_Temperature);
    errordlg('Input Must be a Number', 'Error')
    return
end

set(handles.HVACAdjustThermostat_TemperatureInput, 'Value', HVACAdjustThermostat_Temperature);


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_TemperatureInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACAdjustThermostat_Hour.
function HVACAdjustThermostat_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACAdjustThermostat_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACAdjustThermostat_Hour


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACAdjustThermostat_Minute.
function HVACAdjustThermostat_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACAdjustThermostat_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACAdjustThermostat_Minute


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACAdjustThermostat_AMPM.
function HVACAdjustThermostat_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACAdjustThermostat_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACAdjustThermostat_AMPM


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HVACAdjustThermostat_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACAdjustThermostat_DayInput as text
%        str2double(get(hObject,'String')) returns contents of HVACAdjustThermostat_DayInput as a double

% Read in and Store HVAC Adjust Thermostat Day Input

HVACAdjustThermostat_Day = str2double(get(hObject,'String'));
if isnan(HVACAdjustThermostat_Day)
    HVACAdjustThermostat_Day = [];
    set(hObject,'String',HVACAdjustThermostat_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACAdjustThermostat_Day <= 0 || mod(HVACAdjustThermostat_Day,1) ~= 0
    HVACAdjustThermostat_Day = [];
    set(hObject,'String',HVACAdjustThermostat_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.HVACAdjustThermostat_DayInput, 'Value', HVACAdjustThermostat_Day);


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HVACAdjustThermostat_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACAdjustThermostat_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of HVACAdjustThermostat_SpreadOverInput as a double

% Read in and Store HVAC Adjust Thermostat Spread Over Input

HVACAdjustThermostat_SpreadOver = str2double(get(hObject,'String'));
if isnan(HVACAdjustThermostat_SpreadOver)
    HVACAdjustThermostat_SpreadOver = [];
    set(hObject,'String',HVACAdjustThermostat_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACAdjustThermostat_SpreadOver < 0 || mod(HVACAdjustThermostat_SpreadOver,1) ~= 0
    HVACAdjustThermostat_SpreadOver = [];
    set(hObject,'String',HVACAdjustThermostat_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.HVACAdjustThermostat_SpreadOverInput, 'Value', HVACAdjustThermostat_SpreadOver);


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACAdjustThermostat_Hour2.
function HVACAdjustThermostat_Hour2_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACAdjustThermostat_Hour2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACAdjustThermostat_Hour2


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_Hour2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACAdjustThermostat_Minute2.
function HVACAdjustThermostat_Minute2_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACAdjustThermostat_Minute2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACAdjustThermostat_Minute2


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_Minute2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in HVACAdjustThermostat_AMPM2.
function HVACAdjustThermostat_AMPM2_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns HVACAdjustThermostat_AMPM2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from HVACAdjustThermostat_AMPM2


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_AMPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HVACAdjustThermostat_DayInput2_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACAdjustThermostat_DayInput2 as text
%        str2double(get(hObject,'String')) returns contents of HVACAdjustThermostat_DayInput2 as a double

% Read in and Store HVAC Adjust Thermostat Day Input 2

HVACAdjustThermostat_Day2 = str2double(get(hObject,'String'));
if isnan(HVACAdjustThermostat_Day2)
    HVACAdjustThermostat_Day2 = [];
    set(hObject,'String',HVACAdjustThermostat_Day2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACAdjustThermostat_Day2 <= 0 || mod(HVACAdjustThermostat_Day2,1) ~= 0
    HVACAdjustThermostat_Day2 = [];
    set(hObject,'String',HVACAdjustThermostat_Day2);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.HVACAdjustThermostat_DayInput2, 'Value', HVACAdjustThermostat_Day2);


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_DayInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HVACAdjustThermostat_SpreadOverInput2_Callback(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HVACAdjustThermostat_SpreadOverInput2 as text
%        str2double(get(hObject,'String')) returns contents of HVACAdjustThermostat_SpreadOverInput2 as a double

% Read in and Store HVAC Adjust Thermostat Spread Over Input 2

HVACAdjustThermostat_SpreadOver2 = str2double(get(hObject,'String'));
if isnan(HVACAdjustThermostat_SpreadOver2)
    HVACAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',HVACAdjustThermostat_SpreadOver2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HVACAdjustThermostat_SpreadOver2 < 0 || mod(HVACAdjustThermostat_SpreadOver2,1) ~= 0
    HVACAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',HVACAdjustThermostat_SpreadOver2);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.HVACAdjustThermostat_SpreadOverInput2, 'Value', HVACAdjustThermostat_SpreadOver2);


% --- Executes during object creation, after setting all properties.
function HVACAdjustThermostat_SpreadOverInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HVACAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterDRPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterDRPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterDRPercentage_Input as a double

% Read in and Store Water Heater Demand Response Percentage Input

WaterHeaterDRPercentage = str2double(get(hObject,'String'));
if isnan(WaterHeaterDRPercentage)
    WaterHeaterDRPercentage = [];
    set(hObject,'String',WaterHeaterDRPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterDRPercentage < 0
    WaterHeaterDRPercentage = [];
    set(hObject,'String',WaterHeaterDRPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if WaterHeaterDRPercentage > 100
    WaterHeaterDRPercentage = [];
    set(hObject,'String',WaterHeaterDRPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.WaterHeaterDRPercentage_Input, 'Value', WaterHeaterDRPercentage);


% --- Executes during object creation, after setting all properties.
function WaterHeaterDRPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in WaterHeaterLoadShed_CheckBox.
function WaterHeaterLoadShed_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WaterHeaterLoadShed_CheckBox


% --- Executes on selection change in WaterHeaterLoadShed_Hour.
function WaterHeaterLoadShed_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterLoadShed_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterLoadShed_Hour


% --- Executes during object creation, after setting all properties.
function WaterHeaterLoadShed_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterLoadShed_Minute.
function WaterHeaterLoadShed_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterLoadShed_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterLoadShed_Minute


% --- Executes during object creation, after setting all properties.
function WaterHeaterLoadShed_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterLoadShed_AMPM.
function WaterHeaterLoadShed_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterLoadShed_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterLoadShed_AMPM


% --- Executes during object creation, after setting all properties.
function WaterHeaterLoadShed_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterLoadShed_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterLoadShed_DayInput as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterLoadShed_DayInput as a double

% Read in and Store Water Heater Load Shed Day Input

WaterHeaterLoadShed_Day = str2double(get(hObject,'String'));
if isnan(WaterHeaterLoadShed_Day)
    WaterHeaterLoadShed_Day = [];
    set(hObject,'String',WaterHeaterLoadShed_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterLoadShed_Day <= 0 || mod(WaterHeaterLoadShed_Day,1) ~= 0
    WaterHeaterLoadShed_Day = [];
    set(hObject,'String',WaterHeaterLoadShed_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.WaterHeaterLoadShed_DayInput, 'Value', WaterHeaterLoadShed_Day);


% --- Executes during object creation, after setting all properties.
function WaterHeaterLoadShed_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterLoadShed_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterLoadShed_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterLoadShed_SpreadOverInput as a double

% Read in and Store Water Heater Load Shed Spread Over Input

WaterHeaterLoadShed_SpreadOver = str2double(get(hObject,'String'));
if isnan(WaterHeaterLoadShed_SpreadOver)
    WaterHeaterLoadShed_SpreadOver = [];
    set(hObject,'String',WaterHeaterLoadShed_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterLoadShed_SpreadOver < 0 || mod(WaterHeaterLoadShed_SpreadOver,1) ~= 0
    WaterHeaterLoadShed_SpreadOver = [];
    set(hObject,'String',WaterHeaterLoadShed_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.WaterHeaterLoadShed_SpreadOverInput, 'Value', WaterHeaterLoadShed_SpreadOver);


% --- Executes during object creation, after setting all properties.
function WaterHeaterLoadShed_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in WaterHeaterAdjustThermostat_CheckBox.
function WaterHeaterAdjustThermostat_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WaterHeaterAdjustThermostat_CheckBox


function WaterHeaterAdjustThermostat_TemperatureInput_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterAdjustThermostat_TemperatureInput as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterAdjustThermostat_TemperatureInput as a double

% Read in and Store Water Heater Adjust Thermostat Temperature Input

WaterHeaterAdjustThermostat_Temperature = str2double(get(hObject,'String'));
if isnan(WaterHeaterAdjustThermostat_Temperature)
    WaterHeaterAdjustThermostat_Temperature = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_Temperature);
    errordlg('Input Must be a Number', 'Error')
    return
end

set(handles.WaterHeaterAdjustThermostat_TemperatureInput, 'Value', WaterHeaterAdjustThermostat_Temperature);


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_TemperatureInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterAdjustThermostat_Hour.
function WaterHeaterAdjustThermostat_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterAdjustThermostat_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterAdjustThermostat_Hour


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterAdjustThermostat_Minute.
function WaterHeaterAdjustThermostat_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterAdjustThermostat_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterAdjustThermostat_Minute


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterAdjustThermostat_AMPM.
function WaterHeaterAdjustThermostat_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterAdjustThermostat_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterAdjustThermostat_AMPM


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterAdjustThermostat_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterAdjustThermostat_DayInput as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterAdjustThermostat_DayInput as a double

% Read in and Store Water Heater Adjust Thermostat Day Input

WaterHeaterAdjustThermostat_Day = str2double(get(hObject,'String'));
if isnan(WaterHeaterAdjustThermostat_Day)
    WaterHeaterAdjustThermostat_Day = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterAdjustThermostat_Day <= 0 || mod(WaterHeaterAdjustThermostat_Day,1) ~= 0
    WaterHeaterAdjustThermostat_Day = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.WaterHeaterAdjustThermostat_DayInput, 'Value', WaterHeaterAdjustThermostat_Day);


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterAdjustThermostat_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterAdjustThermostat_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterAdjustThermostat_SpreadOverInput as a double

% Read in and Store Water Heater Adjust Thermostat Spread Over Input

WaterHeaterAdjustThermostat_SpreadOver = str2double(get(hObject,'String'));
if isnan(WaterHeaterAdjustThermostat_SpreadOver)
    WaterHeaterAdjustThermostat_SpreadOver = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterAdjustThermostat_SpreadOver < 0 || mod(WaterHeaterAdjustThermostat_SpreadOver,1) ~= 0
    WaterHeaterAdjustThermostat_SpreadOver = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.WaterHeaterAdjustThermostat_SpreadOverInput, 'Value', WaterHeaterAdjustThermostat_SpreadOver);


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterAdjustThermostat_Hour2.
function WaterHeaterAdjustThermostat_Hour2_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterAdjustThermostat_Hour2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterAdjustThermostat_Hour2


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_Hour2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterAdjustThermostat_Minute2.
function WaterHeaterAdjustThermostat_Minute2_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterAdjustThermostat_Minute2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterAdjustThermostat_Minute2


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_Minute2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WaterHeaterAdjustThermostat_AMPM2.
function WaterHeaterAdjustThermostat_AMPM2_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WaterHeaterAdjustThermostat_AMPM2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WaterHeaterAdjustThermostat_AMPM2


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_AMPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterAdjustThermostat_DayInput2_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterAdjustThermostat_DayInput2 as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterAdjustThermostat_DayInput2 as a double

% Read in and Store Water Heater Adjust Thermostat Day Input 2

WaterHeaterAdjustThermostat_Day2 = str2double(get(hObject,'String'));
if isnan(WaterHeaterAdjustThermostat_Day2)
    WaterHeaterAdjustThermostat_Day2 = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_Day2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterAdjustThermostat_Day2 <= 0 || mod(WaterHeaterAdjustThermostat_Day2,1) ~= 0
    WaterHeaterAdjustThermostat_Day2 = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_Day2);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.WaterHeaterAdjustThermostat_DayInput2, 'Value', WaterHeaterAdjustThermostat_Day2);


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_DayInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WaterHeaterAdjustThermostat_SpreadOverInput2_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterAdjustThermostat_SpreadOverInput2 as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterAdjustThermostat_SpreadOverInput2 as a double

% Read in and Store Water Heater Adjust Thermostat Spread Over Input 2

WaterHeaterAdjustThermostat_SpreadOver2 = str2double(get(hObject,'String'));
if isnan(WaterHeaterAdjustThermostat_SpreadOver2)
    WaterHeaterAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_SpreadOver2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterAdjustThermostat_SpreadOver2 < 0 || mod(WaterHeaterAdjustThermostat_SpreadOver2,1) ~= 0
    WaterHeaterAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',WaterHeaterAdjustThermostat_SpreadOver2);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.WaterHeaterAdjustThermostat_SpreadOverInput2, 'Value', WaterHeaterAdjustThermostat_SpreadOver2);


% --- Executes during object creation, after setting all properties.
function WaterHeaterAdjustThermostat_SpreadOverInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorDRPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorDRPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorDRPercentage_Input as a double

% Read in and Store Refrigerator Demand Response Percentage Input

RefrigeratorDRPercentage = str2double(get(hObject,'String'));
if isnan(RefrigeratorDRPercentage)
    RefrigeratorDRPercentage = [];
    set(hObject,'String',RefrigeratorDRPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorDRPercentage < 0
    RefrigeratorDRPercentage = [];
    set(hObject,'String',RefrigeratorDRPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if RefrigeratorDRPercentage > 100
    RefrigeratorDRPercentage = [];
    set(hObject,'String',RefrigeratorDRPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.RefrigeratorDRPercentage_Input, 'Value', RefrigeratorDRPercentage);


% --- Executes during object creation, after setting all properties.
function RefrigeratorDRPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RefrigeratorLoadShed_CheckBox.
function RefrigeratorLoadShed_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RefrigeratorLoadShed_CheckBox


% --- Executes on selection change in RefrigeratorLoadShed_Hour.
function RefrigeratorLoadShed_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorLoadShed_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorLoadShed_Hour


% --- Executes during object creation, after setting all properties.
function RefrigeratorLoadShed_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorLoadShed_Minute.
function RefrigeratorLoadShed_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorLoadShed_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorLoadShed_Minute


% --- Executes during object creation, after setting all properties.
function RefrigeratorLoadShed_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorLoadShed_AMPM.
function RefrigeratorLoadShed_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorLoadShed_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorLoadShed_AMPM


% --- Executes during object creation, after setting all properties.
function RefrigeratorLoadShed_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorLoadShed_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorLoadShed_DayInput as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorLoadShed_DayInput as a double

% Read in and Store Refrigerator Load Shed Day Input

RefrigeratorLoadShed_Day = str2double(get(hObject,'String'));
if isnan(RefrigeratorLoadShed_Day)
    RefrigeratorLoadShed_Day = [];
    set(hObject,'String',RefrigeratorLoadShed_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorLoadShed_Day <= 0 || mod(RefrigeratorLoadShed_Day,1) ~= 0
    RefrigeratorLoadShed_Day = [];
    set(hObject,'String',RefrigeratorLoadShed_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.RefrigeratorLoadShed_DayInput, 'Value', RefrigeratorLoadShed_Day);


% --- Executes during object creation, after setting all properties.
function RefrigeratorLoadShed_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorLoadShed_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorLoadShed_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorLoadShed_SpreadOverInput as a double

% Read in and Store Refrigerator Load Shed Spread Over Input

RefrigeratorLoadShed_SpreadOver = str2double(get(hObject,'String'));
if isnan(RefrigeratorLoadShed_SpreadOver)
    RefrigeratorLoadShed_SpreadOver = [];
    set(hObject,'String',RefrigeratorLoadShed_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorLoadShed_SpreadOver < 0 || mod(RefrigeratorLoadShed_SpreadOver,1) ~= 0
    RefrigeratorLoadShed_SpreadOver = [];
    set(hObject,'String',RefrigeratorLoadShed_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.RefrigeratorLoadShed_SpreadOverInput, 'Value', RefrigeratorLoadShed_SpreadOver);


% --- Executes during object creation, after setting all properties.
function RefrigeratorLoadShed_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RefrigeratorAdjustThermostat_CheckBox.
function RefrigeratorAdjustThermostat_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RefrigeratorAdjustThermostat_CheckBox


function RefrigeratorAdjustThermostat_TemperatureInput_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorAdjustThermostat_TemperatureInput as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorAdjustThermostat_TemperatureInput as a double

% Read in and Store Refrigerator Adjust Thermostat Temperature Input

RefrigeratorAdjustThermostat_Temperature = str2double(get(hObject,'String'));
if isnan(RefrigeratorAdjustThermostat_Temperature)
    RefrigeratorAdjustThermostat_Temperature = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_Temperature);
    errordlg('Input Must be a Number', 'Error')
    return
end

set(handles.RefrigeratorAdjustThermostat_TemperatureInput, 'Value', RefrigeratorAdjustThermostat_Temperature);


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_TemperatureInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorAdjustThermostat_Hour.
function RefrigeratorAdjustThermostat_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorAdjustThermostat_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorAdjustThermostat_Hour


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorAdjustThermostat_Minute.
function RefrigeratorAdjustThermostat_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorAdjustThermostat_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorAdjustThermostat_Minute


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorAdjustThermostat_AMPM.
function RefrigeratorAdjustThermostat_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorAdjustThermostat_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorAdjustThermostat_AMPM


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorAdjustThermostat_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorAdjustThermostat_DayInput as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorAdjustThermostat_DayInput as a double

% Read in and Store Refrigerator Adjust Thermostat Day Input

RefrigeratorAdjustThermostat_Day = str2double(get(hObject,'String'));
if isnan(RefrigeratorAdjustThermostat_Day)
    RefrigeratorAdjustThermostat_Day = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorAdjustThermostat_Day <= 0 || mod(RefrigeratorAdjustThermostat_Day,1) ~= 0
    RefrigeratorAdjustThermostat_Day = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.RefrigeratorAdjustThermostat_DayInput, 'Value', RefrigeratorAdjustThermostat_Day);


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorAdjustThermostat_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorAdjustThermostat_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorAdjustThermostat_SpreadOverInput as a double

% Read in and Store Refrigerator Adjust Thermostat Spread Over Input

RefrigeratorAdjustThermostat_SpreadOver = str2double(get(hObject,'String'));
if isnan(RefrigeratorAdjustThermostat_SpreadOver)
    RefrigeratorAdjustThermostat_SpreadOver = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorAdjustThermostat_SpreadOver < 0 || mod(RefrigeratorAdjustThermostat_SpreadOver,1) ~= 0
    RefrigeratorAdjustThermostat_SpreadOver = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.RefrigeratorAdjustThermostat_SpreadOverInput, 'Value', RefrigeratorAdjustThermostat_SpreadOver);


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorAdjustThermostat_Hour2.
function RefrigeratorAdjustThermostat_Hour2_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorAdjustThermostat_Hour2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorAdjustThermostat_Hour2


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_Hour2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorAdjustThermostat_Minute2.
function RefrigeratorAdjustThermostat_Minute2_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorAdjustThermostat_Minute2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorAdjustThermostat_Minute2


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_Minute2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in RefrigeratorAdjustThermostat_AMPM2.
function RefrigeratorAdjustThermostat_AMPM2_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns RefrigeratorAdjustThermostat_AMPM2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from RefrigeratorAdjustThermostat_AMPM2


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_AMPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorAdjustThermostat_DayInput2_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorAdjustThermostat_DayInput2 as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorAdjustThermostat_DayInput2 as a double

% Read in and Store Refrigerator Adjust Thermostat Day Input 2

RefrigeratorAdjustThermostat_Day2 = str2double(get(hObject,'String'));
if isnan(RefrigeratorAdjustThermostat_Day2)
    RefrigeratorAdjustThermostat_Day2 = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_Day2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorAdjustThermostat_Day2 <= 0 || mod(RefrigeratorAdjustThermostat_Day2,1) ~= 0
    RefrigeratorAdjustThermostat_Day2 = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_Day2);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.RefrigeratorAdjustThermostat_DayInput2, 'Value', RefrigeratorAdjustThermostat_Day2);


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_DayInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorAdjustThermostat_SpreadOverInput2_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorAdjustThermostat_SpreadOverInput2 as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorAdjustThermostat_SpreadOverInput2 as a double

% Read in and Store Refrigerator Adjust Thermostat Spread Over Input 2

RefrigeratorAdjustThermostat_SpreadOver2 = str2double(get(hObject,'String'));
if isnan(RefrigeratorAdjustThermostat_SpreadOver2)
    RefrigeratorAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_SpreadOver2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorAdjustThermostat_SpreadOver2 < 0 || mod(RefrigeratorAdjustThermostat_SpreadOver2,1) ~= 0
    RefrigeratorAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',RefrigeratorAdjustThermostat_SpreadOver2);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.RefrigeratorAdjustThermostat_SpreadOverInput2, 'Value', RefrigeratorAdjustThermostat_SpreadOver2);


% --- Executes during object creation, after setting all properties.
function RefrigeratorAdjustThermostat_SpreadOverInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerDRPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerDRPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of FreezerDRPercentage_Input as a double

% Read in and Store Freezer Demand Response Percentage Input

FreezerDRPercentage = str2double(get(hObject,'String'));
if isnan(FreezerDRPercentage)
    FreezerDRPercentage = [];
    set(hObject,'String',FreezerDRPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerDRPercentage < 0
    FreezerDRPercentage = [];
    set(hObject,'String',FreezerDRPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if FreezerDRPercentage > 100
    FreezerDRPercentage = [];
    set(hObject,'String',FreezerDRPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.FreezerDRPercentage_Input, 'Value', FreezerDRPercentage);


% --- Executes during object creation, after setting all properties.
function FreezerDRPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FreezerLoadShed_CheckBox.
function FreezerLoadShed_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FreezerLoadShed_CheckBox


% --- Executes on selection change in FreezerLoadShed_Hour.
function FreezerLoadShed_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerLoadShed_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerLoadShed_Hour


% --- Executes during object creation, after setting all properties.
function FreezerLoadShed_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerLoadShed_Minute.
function FreezerLoadShed_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerLoadShed_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerLoadShed_Minute


% --- Executes during object creation, after setting all properties.
function FreezerLoadShed_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerLoadShed_AMPM.
function FreezerLoadShed_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerLoadShed_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerLoadShed_AMPM


% --- Executes during object creation, after setting all properties.
function FreezerLoadShed_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerLoadShed_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerLoadShed_DayInput as text
%        str2double(get(hObject,'String')) returns contents of FreezerLoadShed_DayInput as a double

% Read in and Store Freezer Load Shed Day Input

FreezerLoadShed_Day = str2double(get(hObject,'String'));
if isnan(FreezerLoadShed_Day)
    FreezerLoadShed_Day = [];
    set(hObject,'String',FreezerLoadShed_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerLoadShed_Day <= 0 || mod(FreezerLoadShed_Day,1) ~= 0
    FreezerLoadShed_Day = [];
    set(hObject,'String',FreezerLoadShed_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.FreezerLoadShed_DayInput, 'Value', FreezerLoadShed_Day);


% --- Executes during object creation, after setting all properties.
function FreezerLoadShed_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerLoadShed_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerLoadShed_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of FreezerLoadShed_SpreadOverInput as a double

% Read in and Store Freezer Load Shed Spread Over Input

FreezerLoadShed_SpreadOver = str2double(get(hObject,'String'));
if isnan(FreezerLoadShed_SpreadOver)
    FreezerLoadShed_SpreadOver = [];
    set(hObject,'String',FreezerLoadShed_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerLoadShed_SpreadOver < 0 || mod(FreezerLoadShed_SpreadOver,1) ~= 0
    FreezerLoadShed_SpreadOver = [];
    set(hObject,'String',FreezerLoadShed_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.FreezerLoadShed_SpreadOverInput, 'Value', FreezerLoadShed_SpreadOver);


% --- Executes during object creation, after setting all properties.
function FreezerLoadShed_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerLoadShed_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FreezerAdjustThermostat_CheckBox.
function FreezerAdjustThermostat_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FreezerAdjustThermostat_CheckBox


function FreezerAdjustThermostat_TemperatureInput_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerAdjustThermostat_TemperatureInput as text
%        str2double(get(hObject,'String')) returns contents of FreezerAdjustThermostat_TemperatureInput as a double

% Read in and Store Freezer Adjust Thermostat Temperature Input

FreezerAdjustThermostat_Temperature = str2double(get(hObject,'String'));
if isnan(FreezerAdjustThermostat_Temperature)
    FreezerAdjustThermostat_Temperature = [];
    set(hObject,'String',FreezerAdjustThermostat_Temperature);
    errordlg('Input Must be a Number', 'Error')
    return
end

set(handles.FreezerAdjustThermostat_TemperatureInput, 'Value', FreezerAdjustThermostat_Temperature);


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_TemperatureInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_TemperatureInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerAdjustThermostat_Hour.
function FreezerAdjustThermostat_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerAdjustThermostat_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerAdjustThermostat_Hour


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerAdjustThermostat_Minute.
function FreezerAdjustThermostat_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerAdjustThermostat_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerAdjustThermostat_Minute


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerAdjustThermostat_AMPM.
function FreezerAdjustThermostat_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerAdjustThermostat_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerAdjustThermostat_AMPM


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerAdjustThermostat_DayInput_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerAdjustThermostat_DayInput as text
%        str2double(get(hObject,'String')) returns contents of FreezerAdjustThermostat_DayInput as a double

% Read in and Store Freezer Adjust Thermostat Day Input

FreezerAdjustThermostat_Day = str2double(get(hObject,'String'));
if isnan(FreezerAdjustThermostat_Day)
    FreezerAdjustThermostat_Day = [];
    set(hObject,'String',FreezerAdjustThermostat_Day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerAdjustThermostat_Day <= 0 || mod(FreezerAdjustThermostat_Day,1) ~= 0
    FreezerAdjustThermostat_Day = [];
    set(hObject,'String',FreezerAdjustThermostat_Day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.FreezerAdjustThermostat_DayInput, 'Value', FreezerAdjustThermostat_Day);


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_DayInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_DayInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerAdjustThermostat_SpreadOverInput_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerAdjustThermostat_SpreadOverInput as text
%        str2double(get(hObject,'String')) returns contents of FreezerAdjustThermostat_SpreadOverInput as a double

% Read in and Store Freezer Adjust Thermostat Spread Over Input

FreezerAdjustThermostat_SpreadOver = str2double(get(hObject,'String'));
if isnan(FreezerAdjustThermostat_SpreadOver)
    FreezerAdjustThermostat_SpreadOver = [];
    set(hObject,'String',FreezerAdjustThermostat_SpreadOver);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerAdjustThermostat_SpreadOver < 0 || mod(FreezerAdjustThermostat_SpreadOver,1) ~= 0
    FreezerAdjustThermostat_SpreadOver = [];
    set(hObject,'String',FreezerAdjustThermostat_SpreadOver);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.FreezerAdjustThermostat_SpreadOverInput, 'Value', FreezerAdjustThermostat_SpreadOver);


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_SpreadOverInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_SpreadOverInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerAdjustThermostat_Hour2.
function FreezerAdjustThermostat_Hour2_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerAdjustThermostat_Hour2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerAdjustThermostat_Hour2


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_Hour2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerAdjustThermostat_Minute2.
function FreezerAdjustThermostat_Minute2_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerAdjustThermostat_Minute2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerAdjustThermostat_Minute2


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_Minute2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in FreezerAdjustThermostat_AMPM2.
function FreezerAdjustThermostat_AMPM2_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns FreezerAdjustThermostat_AMPM2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from FreezerAdjustThermostat_AMPM2


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_AMPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerAdjustThermostat_DayInput2_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerAdjustThermostat_DayInput2 as text
%        str2double(get(hObject,'String')) returns contents of FreezerAdjustThermostat_DayInput2 as a double

% Read in and Store Freezer Adjust Thermostat Day Input 2

FreezerAdjustThermostat_Day2 = str2double(get(hObject,'String'));
if isnan(FreezerAdjustThermostat_Day2)
    FreezerAdjustThermostat_Day2 = [];
    set(hObject,'String',FreezerAdjustThermostat_Day2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerAdjustThermostat_Day2 <= 0 || mod(FreezerAdjustThermostat_Day2,1) ~= 0
    FreezerAdjustThermostat_Day2 = [];
    set(hObject,'String',FreezerAdjustThermostat_Day2);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end

set(handles.FreezerAdjustThermostat_DayInput2, 'Value', FreezerAdjustThermostat_Day2);


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_DayInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_DayInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerAdjustThermostat_SpreadOverInput2_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerAdjustThermostat_SpreadOverInput2 as text
%        str2double(get(hObject,'String')) returns contents of FreezerAdjustThermostat_SpreadOverInput2 as a double

% Read in and Store Freezer Adjust Thermostat Spread Over Input 2

FreezerAdjustThermostat_SpreadOver2 = str2double(get(hObject,'String'));
if isnan(FreezerAdjustThermostat_SpreadOver2)
    FreezerAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',FreezerAdjustThermostat_SpreadOver2);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerAdjustThermostat_SpreadOver2 < 0 || mod(FreezerAdjustThermostat_SpreadOver2,1) ~= 0
    FreezerAdjustThermostat_SpreadOver2 = [];
    set(hObject,'String',FreezerAdjustThermostat_SpreadOver2);
    errordlg('Input Must be Zero or a Positive Integer', 'Error')
    return
end

set(handles.FreezerAdjustThermostat_SpreadOverInput2, 'Value', FreezerAdjustThermostat_SpreadOver2);


% --- Executes during object creation, after setting all properties.
function FreezerAdjustThermostat_SpreadOverInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerAdjustThermostat_SpreadOverInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WasherDryerDRPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WasherDryerDRPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of WasherDryerDRPercentage_Input as a double

% Read in and Store Washer/Dryer Demand Response Percentage Input

WasherDryerDRPercentage = str2double(get(hObject,'String'));
if isnan(WasherDryerDRPercentage)
    WasherDryerDRPercentage = [];
    set(hObject,'String',WasherDryerDRPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WasherDryerDRPercentage < 0
    WasherDryerDRPercentage = [];
    set(hObject,'String',WasherDryerDRPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if WasherDryerDRPercentage > 100
    WasherDryerDRPercentage = [];
    set(hObject,'String',WasherDryerDRPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.WasherDryerDRPercentage_Input, 'Value', WasherDryerDRPercentage);


% --- Executes during object creation, after setting all properties.
function WasherDryerDRPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in WasherDryerDeferLoad_CheckBox.
function WasherDryerDeferLoad_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WasherDryerDeferLoad_CheckBox


% --- Executes on selection change in WasherDryerDeferLoad_Hour.
function WasherDryerDeferLoad_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WasherDryerDeferLoad_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WasherDryerDeferLoad_Hour


% --- Executes during object creation, after setting all properties.
function WasherDryerDeferLoad_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WasherDryerDeferLoad_Minute.
function WasherDryerDeferLoad_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WasherDryerDeferLoad_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WasherDryerDeferLoad_Minute


% --- Executes during object creation, after setting all properties.
function WasherDryerDeferLoad_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WasherDryerDeferLoad_AMPM.
function WasherDryerDeferLoad_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WasherDryerDeferLoad_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WasherDryerDeferLoad_AMPM


% --- Executes during object creation, after setting all properties.
function WasherDryerDeferLoad_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WasherDryerDeferLoad_Hour2.
function WasherDryerDeferLoad_Hour2_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WasherDryerDeferLoad_Hour2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WasherDryerDeferLoad_Hour2


% --- Executes during object creation, after setting all properties.
function WasherDryerDeferLoad_Hour2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WasherDryerDeferLoad_Minute2.
function WasherDryerDeferLoad_Minute2_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WasherDryerDeferLoad_Minute2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WasherDryerDeferLoad_Minute2


% --- Executes during object creation, after setting all properties.
function WasherDryerDeferLoad_Minute2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in WasherDryerDeferLoad_AMPM2.
function WasherDryerDeferLoad_AMPM2_Callback(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns WasherDryerDeferLoad_AMPM2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from WasherDryerDeferLoad_AMPM2


% --- Executes during object creation, after setting all properties.
function WasherDryerDeferLoad_AMPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherDryerDeferLoad_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function DishwasherDRPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DishwasherDRPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of DishwasherDRPercentage_Input as a double

% Read in and Store Dishwasher Demand Response Percentage Input

DishwasherDRPercentage = str2double(get(hObject,'String'));
if isnan(DishwasherDRPercentage)
    DishwasherDRPercentage = [];
    set(hObject,'String',DishwasherDRPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if DishwasherDRPercentage < 0
    DishwasherDRPercentage = [];
    set(hObject,'String',DishwasherDRPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if DishwasherDRPercentage > 100
    DishwasherDRPercentage = [];
    set(hObject,'String',DishwasherDRPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.DishwasherDRPercentage_Input, 'Value', DishwasherDRPercentage);


% --- Executes during object creation, after setting all properties.
function DishwasherDRPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDRPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DishwasherDeferLoad_CheckBox.
function DishwasherDeferLoad_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DishwasherDeferLoad_CheckBox


% --- Executes on selection change in DishwasherDeferLoad_Hour.
function DishwasherDeferLoad_Hour_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DishwasherDeferLoad_Hour contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DishwasherDeferLoad_Hour


% --- Executes during object creation, after setting all properties.
function DishwasherDeferLoad_Hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DishwasherDeferLoad_Minute.
function DishwasherDeferLoad_Minute_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DishwasherDeferLoad_Minute contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DishwasherDeferLoad_Minute


% --- Executes during object creation, after setting all properties.
function DishwasherDeferLoad_Minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DishwasherDeferLoad_AMPM.
function DishwasherDeferLoad_AMPM_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DishwasherDeferLoad_AMPM contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DishwasherDeferLoad_AMPM


% --- Executes during object creation, after setting all properties.
function DishwasherDeferLoad_AMPM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_AMPM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DishwasherDeferLoad_Hour2.
function DishwasherDeferLoad_Hour2_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DishwasherDeferLoad_Hour2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DishwasherDeferLoad_Hour2


% --- Executes during object creation, after setting all properties.
function DishwasherDeferLoad_Hour2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Hour2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DishwasherDeferLoad_Minute2.
function DishwasherDeferLoad_Minute2_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DishwasherDeferLoad_Minute2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DishwasherDeferLoad_Minute2


% --- Executes during object creation, after setting all properties.
function DishwasherDeferLoad_Minute2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_Minute2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DishwasherDeferLoad_AMPM2.
function DishwasherDeferLoad_AMPM2_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DishwasherDeferLoad_AMPM2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DishwasherDeferLoad_AMPM2


% --- Executes during object creation, after setting all properties.
function DishwasherDeferLoad_AMPM2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherDeferLoad_AMPM2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
