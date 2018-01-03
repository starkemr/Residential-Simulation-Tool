function varargout = ResidentialSimulator(varargin)
% RESIDENTIALSIMULATOR MATLAB code for ResidentialSimulator.fig
%      RESIDENTIALSIMULATOR, by itself, creates a new RESIDENTIALSIMULATOR or raises the existing
%      singleton*.
%
%      H = RESIDENTIALSIMULATOR returns the handle to a new RESIDENTIALSIMULATOR or the handle to
%      the existing singleton*.
%
%      RESIDENTIALSIMULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESIDENTIALSIMULATOR.M with the given input arguments.
%
%      RESIDENTIALSIMULATOR('Property','Value',...) creates a new RESIDENTIALSIMULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ResidentialSimulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ResidentialSimulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ResidentialSimulator

% Last Modified by GUIDE v2.5 16-Jul-2014 10:37:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ResidentialSimulator_OpeningFcn, ...
                   'gui_OutputFcn',  @ResidentialSimulator_OutputFcn, ...
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


% --- Executes just before ResidentialSimulator is made visible.
function ResidentialSimulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ResidentialSimulator (see VARARGIN)

% Choose default command line output for ResidentialSimulator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ResidentialSimulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ResidentialSimulator_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% Clear History

clear all;
clc;


% Include Directories

home = cd;
addpath(fullfile(home,'GUI Files'));
addpath(fullfile(home,'Functions'));
addpath(fullfile(home,'Load Models'));
addpath(fullfile(home,'Input Data'));
addpath(fullfile(home,'Output Data'));

% Define Directories

guifiles = fullfile(home,'GUI Files');
functions = fullfile(home,'Functions');
loadmodels = fullfile(home,'Load Models');
inputdata = fullfile(home,'Input Data');
outputdata = fullfile(home,'Output Data');


% Store All Directories in a Structure

struct.home = home;
struct.guifiles = guifiles;
struct.functions = functions;
struct.loadmodels = loadmodels;
struct.inputdata = inputdata;
struct.outputdata = outputdata;


% Save Structure to be Passed between Functions and GUIs

setappdata(0,'MyStruct', struct)


% --- Executes on button press in Environmental_Button.
function Environmental_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Environmental_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

EnvironmentalInputData


% --- Executes on button press in Occupant_Button.
function Occupant_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Occupant_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

OccupantBehaviorModels


% --- Executes on button press in HomeAppliance_Button.
function HomeAppliance_Button_Callback(hObject, eventdata, handles)
% hObject    handle to HomeAppliance_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

HomeApplianceParameters


% --- Executes on button press in DemandResponse_Button.
function DemandResponse_Button_Callback(hObject, eventdata, handles)
% hObject    handle to DemandResponse_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DemandResponseParameters


% --- Executes on button press in RestoreDefaults_Button.
function RestoreDefaults_Button_Callback(hObject, eventdata, handles)
% hObject    handle to RestoreDefaults_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Remove User Setting Files

if isdir(fullfile(inputdata,'User Settings'))
    rmdir(fullfile(inputdata,'User Settings'),'s');
end
mkdir(fullfile(inputdata,'User Settings'));


% --- Executes on button press in Heating_RadioButton.
function Heating_RadioButton_Callback(hObject, eventdata, handles)
% hObject    handle to Heating_RadioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Heating_RadioButton


% --- Executes on button press in Cooling_RadioButton.
function Cooling_RadioButton_Callback(hObject, eventdata, handles)
% hObject    handle to Cooling_RadioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cooling_RadioButton


% --- Executes on button press in Auto_RadioButton.
function Auto_RadioButton_Callback(hObject, eventdata, handles)
% hObject    handle to Auto_RadioButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Auto_RadioButton


% --- Executes on selection change in Environment_ListBox.
function Environment_ListBox_Callback(hObject, eventdata, handles)
% hObject    handle to Environment_ListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Environment_ListBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Environment_ListBox

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
inputdata = struct.inputdata;


% Change Current Directory

cd(fullfile(inputdata,'Environmental Input Data'));


% Obtain a List of all Files in the Current Directory

File_List = dir;


% Load File Names into a Cell Structure

for i = 1:length(File_List)-2
    
    File_Names{i} = File_List(i+2).name;
end


% Remove Specific Files from the List

I = find(strcmp('.DS_Store',File_Names));
File_Names(:,I) = [];


% Remove File Extensions From File Names

for i = 1:length(File_Names)
    
    File_Names{1,i} = File_Names{1,i}(1,1:strfind(File_Names{1,i}, '.' )-1);
end


% Display the File Names in the List Box

set(handles.Environment_ListBox,'String',File_Names)

handles.File_Names = File_Names;

guidata(hObject,handles)

cd(home)


% --- Executes during object creation, after setting all properties.
function Environment_ListBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Environment_ListBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Month_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Month_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Month_Input as text
%        str2double(get(hObject,'String')) returns contents of Month_Input as a double

% Read in and Store Month Input

month = str2double(get(hObject,'String'));
if isnan(month)
    month = [];
    set(hObject,'String',month);
    errordlg('Input Must be a Number', 'Error')
    return
end
if month < 0 || mod(month,1) ~= 0
    month = [];
    set(hObject,'String',month);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end
if month > 12
    month = [];
    set(hObject,'String',month);
    errordlg('Input Must be Less than 12', 'Error')
    return
end
handles.month = month;

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function Month_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Month_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Day_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Day_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Day_Input as text
%        str2double(get(hObject,'String')) returns contents of Day_Input as a double

% Read in and Store Day Input

day = str2double(get(hObject,'String'));
if isnan(day)
    day = [];
    set(hObject,'String',day);
    errordlg('Input Must be a Number', 'Error')
    return
end
if day < 0 || mod(day,1) ~= 0
    day = [];
    set(hObject,'String',day);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end
if day > 31
    day = [];
    set(hObject,'String',day);
    errordlg('Input Must be Less than 31', 'Error')
    return
end
handles.day = day;

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function Day_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Day_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Length_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Length_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Length_Input as text
%        str2double(get(hObject,'String')) returns contents of Length_Input as a double

% Read in and Store Simulation Length Input

simlength = str2double(get(hObject,'String'));
if isnan(simlength)
    simlength = [];
    set(hObject,'String',simlength);
    errordlg('Input Must be a Number', 'Error')
    return
end
if simlength < 0 || mod(simlength,1) ~= 0
    simlength = [];
    set(hObject,'String',simlength);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end
if simlength > 366
    simlength = [];
    set(hObject,'String',simlength);
    errordlg('Input Must be Less than 366', 'Error')
    return
end
handles.simlength = simlength;

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function Length_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Length_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Homes_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Homes_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Homes_Input as text
%        str2double(get(hObject,'String')) returns contents of Homes_Input as a double

% Read in and Store Number of Homes Input

numberofhomes = str2double(get(hObject,'String'));
if isnan(numberofhomes)
    numberofhomes = [];
    set(hObject,'String',numberofhomes);
    errordlg('Input Must be a Number', 'Error')
    return
end
if numberofhomes < 0 || mod(numberofhomes,1) ~= 0
    numberofhomes = [];
    set(hObject,'String',numberofhomes);
    errordlg('Input Must be a Positive Integer', 'Error')
    return
end
handles.numberofhomes = numberofhomes;

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function Homes_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Homes_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in DayofWeek.
function DayofWeek_Callback(hObject, eventdata, handles)
% hObject    handle to DayofWeek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DayofWeek contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DayofWeek

% Get Handles

a = get(handles.DayofWeek, 'Value');

if a == 1
    dayofweek = 0;
elseif a == 2
    dayofweek = 1;
elseif a == 3
    dayofweek = 2;
elseif a == 4
    dayofweek = 3;
elseif a == 5
    dayofweek = 4;
elseif a == 6
    dayofweek = 5;
elseif a == 7
    dayofweek = 6;
elseif a == 8
    dayofweek = 7;
end
handles.dayofweek = dayofweek;

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function DayofWeek_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DayofWeek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in DemandResponse_CheckBox.
function DemandResponse_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to DemandResponse_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DemandResponse_CheckBox


% --- Executes on button press in Run_Button.
function Run_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Run_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
inputdata = struct.inputdata;
outputdata = struct.outputdata;


% If All Fields are Not Complete Display an Error Message

if isfield(handles, 'month') && isfield(handles, 'day') && isfield(handles, 'File_Names') &&...
        isfield(handles, 'simlength') && isfield(handles, 'numberofhomes') && isfield(handles, 'dayofweek') && handles.dayofweek ~= 0
else
    errordlg('Please Complete All Fields', 'Error')
    return
end


ticTOTAL = tic; % Start Timer


% Remove Previous Output Data

if isdir(outputdata)
    if isdir(fullfile(outputdata,'Text Files'))
        rmdir(fullfile(outputdata,'Text Files'),'s');
    end
    if isdir(fullfile(outputdata,'Figures'))
        rmdir(fullfile(outputdata,'Figures'),'s');
    end
end
mkdir(fullfile(outputdata,'Text Files'));
mkdir(fullfile(outputdata,'Figures'));


% Display Program Status

set(handles.ProgramStatus, 'String', 'Reading Input Files...');
set(handles.ProgramStatus2, 'String', '');
pause(0.001);


% Define Simulation Start Time and Length
    
month = handles.month;  % (Month) Month to Start Analysis
day = handles.day;      % (Day) Day to Start Analysis

environmentaldata = get(handles.Environment_ListBox);   % Environmental Data to Use
File_Names = handles.File_Names;                        % Environmental Data File Names

Environmental_Data = File_Names{environmentaldata.Value};   % Selected Environmental Data

year = str2double(Environmental_Data(end-3:end));   % Determine the Year (Last Four Characters of the File Name Needs to be the Year)

[start_min, start_hour] = determinestart(month, day, year); % Starting Minute and Hour

simlength = handles.simlength;  % (Days) Number of days to analyze

numberofhomes = handles.numberofhomes;  % Total Number of Homes to Simulate

dayofweek = handles.dayofweek;  % (Day) Day to Start Simulation

start_time = (dayofweek - 1)*60*24 + 1; % (Min) Initial Time of Simulation (Only Used for Occupant Model)


% Determine if User is Simulating Demand Response

Simulate_DemandResponse = get(handles.DemandResponse_CheckBox, 'Value');


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Dependent Variables (Variables which are dependent on the home, its occupants, and its appliances)

[Occupant_Inputs, OccupantsPerHome_Inputs, HomeHVAC_Inputs, WaterHeater_Inputs,...
    RefrigeratorFreezer_Inputs, RefrigeratorFreezer_Inputs2, Deferrable_Inputs,...
    Uninterruptible_Inputs, ElectricVehicle_Inputs, HVACDemandResponse_Inputs,...
    WaterHeaterDemandResponse_Inputs, RefrigeratorDemandResponse_Inputs,...
    FreezerDemandResponse_Inputs, WasherDryerDemandResponse_Inputs,...
    DishwasherDemandResponse_Inputs] = loadparameters(inputdata);


% Environmental and Occupant Activity Variables (Variables which are independent of the home)

[Outdoor_Temp, Global_Irrad, Direct_Irrad, Diffuse_Irrad, Wind_Speed, Peak_Wind_Speed,...
    Wind_Direction, Relative_Humidity, Precipitation, Accumulated_Precipitation,...
    Estimated_Pressure, WM_Markov_Model, WM_Prob_Model, NM_Markov_Model, NM_Prob_Model,...
    WF_Markov_Model, WF_Prob_Model, NF_Markov_Model, NF_Prob_Model, C_Markov_Model,...
    C_Prob_Model, Tot_Prob_Model] = loadinputdata(inputdata, Occupant_Inputs, Environmental_Data);


% Interpolate Input Data (1 Second or 1 Minute Resolution)

[time, Outdoor_Temp2, Global_Irrad2, Direct_Irrad2, Diffuse_Irrad2, Wind_Speed2, Peak_Wind_Speed2,...
    Wind_Direction2, Relative_Humidity2, Precipitation2, Accumulated_Precipitation2,...
    Estimated_Pressure2] = interpolate(start_min, start_hour, simlength, time_step, Outdoor_Temp,...
    Global_Irrad, Direct_Irrad, Diffuse_Irrad, Wind_Speed, Peak_Wind_Speed, Wind_Direction,...
    Relative_Humidity, Precipitation, Accumulated_Precipitation, Estimated_Pressure);


% Calculate Solar Illuminance

Global_Illum2 = 130*Global_Irrad2;      % (lux) Global Horizontal Illuminance (Assumes a Constant Luminous Efficacy of 130 lm/W)
Direct_Illum2 = 104*Direct_Irrad2;      % (lux) Direct Normal Illuminance (Assumes a Constant Luminous Efficacy of 104 lm/W)
Diffuse_Illum2 = 130*Diffuse_Irrad2;    % (lux) Diffuse Horizontal Illuminance (Assumes a Constant Luminous Efficacy of 130 lm/W)


% Initialize Matrices where Values are Stored

HVAC_Power_total = zeros(1,length(time));       % (W) Total HVAC Power Demand
HVAC_Reactive_total = zeros(1,length(time));    % (Var) Total HVAC Reactive Power Demand
HVAC_Q_total = zeros(1,length(time));           % (W) Total HVAC Heat Transfer to Home
HVAC_COP_total = zeros(1,length(time));         % Total HVAC Coefficient of Performance
Indoor_Temp_total = zeros(1,length(time));      % (F) Total Temperature of Air in Home
Mass_Temp_total = zeros(1,length(time));        % (F) Total Temperature of Mass of Home
Envelope_Temp_total = zeros(1,length(time));    % (F) Total Temperature of Envelope of Home
HVAC_Num = zeros(1,length(time));               % HVAC Counter

WaterHeater_Power_total = zeros(1,length(time));        % (W) Total Water Heater Power Demand
WaterHeater_Reactive_total = zeros(1,length(time));     % (Var) Total Water Heater Reactive Power Demand
WaterHeater_WaterFlow_total = zeros(1,length(time));    % (gal/s or gal/min) Total Water Heater Hot Water Demand
WaterHeater_Temp_total = zeros(1,length(time));         % (F) Total Water Heater Water Temperature
WaterHeater_TempU_total = zeros(1,length(time));        % (F) Total Water Heater Water Temperature (Upper Layer)
WaterHeater_TempL_total = zeros(1,length(time));        % (F) Total Water Heater Water Temperature (Lower Layer)
WaterHeater_Num = 0;                                    % Water Heater Counter

Refrigerator_Power_total = zeros(1,length(time));       % (W) Total Refrigerator Power Demand
Refrigerator_Reactive_total = zeros(1,length(time));    % (Var) Total Refrigerator Reactive Power Demand
Refrigerator_Temp_total = zeros(1,length(time));        % (F) Total Temperature of Refrigerator Interior
Refrigerator_Num = 0;                                   % Refrigerator Counter
Freezer_Power_total = zeros(1,length(time));            % (W) Total Freezer Power Demand
Freezer_Reactive_total = zeros(1,length(time));         % (Var) Total Freezer Reactive Power Demand
Freezer_Temp_total = zeros(1,length(time));             % (F) Total Temperature of Freezer Interior
Freezer_Num = 0;                                        % Freezer Counter

Washer_Power_total = zeros(1,length(time));             % (W) Total Washer Power Demand
Washer_Reactive_total = zeros(1,length(time));          % (Var) Total Washer Reactive Power Demand
Washer_WaterFlow_total = zeros(1,length(time));         % (gal/s or gal/min) Total Washer Hot Water Demand
Dryer_Power_total = zeros(1,length(time));              % (W) Total Dryer Power Demand
Dryer_Reactive_total = zeros(1,length(time));           % (Var) Total Dryer Reactive Power Demand
Dishwasher_Power_total = zeros(1,length(time));         % (W) Total Dishwasher Power Demand
Dishwasher_Reactive_total = zeros(1,length(time));      % (Var) Total Dishwasher Reactive Power Demand
Dishwasher_WaterFlow_total = zeros(1,length(time));     % (gal/s or gal/min) Total Dishwasher Hot Water Demand

Cooking_Power_total = zeros(1,length(time));            % (W) Total Cooking Power Demand
Cooking_Reactive_total = zeros(1,length(time));         % (Var) Total Cooking Reactive Power Demand
Lighting_Power_total = zeros(1,length(time));           % (W) Total Lighting Power Demand
Lighting_Reactive_total = zeros(1,length(time));        % (Var) Total Lighting Reactive Power Demand
Incandescent_Power_total = zeros(1,length(time));       % (W) Total Incandescent Lighting Power Demand
Incandescent_Reactive_total = zeros(1,length(time));    % (Var) Total Incandescent Lighting Reactive Power Demand
Halogen_Power_total = zeros(1,length(time));            % (W) Total Halogen Lighting Power Demand
Halogen_Reactive_total = zeros(1,length(time));         % (Var) Total Halogen Lighting Reactive Power Demand
Fluorescent_Power_total = zeros(1,length(time));        % (W) Total Linear Fluorescent Lighting Power Demand
Fluorescent_Reactive_total = zeros(1,length(time));     % (Var) Total Linear Fluorescent Lighting Reactive Power Demand
CFL_Power_total = zeros(1,length(time));                % (W) Total Compact Fluorescent Lighting Power Demand
CFL_Reactive_total = zeros(1,length(time));             % (Var) Total Compact Fluorescent Lighting Reactive Power Demand
LED_Power_total = zeros(1,length(time));                % (W) Total LED Lighting Power Demand
LED_Reactive_total = zeros(1,length(time));             % (Var) Total LED Lighting Reactive Power Demand

Lighting_Power2_total = zeros(1,length(time));          % (W) Total Lighting Power Demand
Lighting_Reactive2_total = zeros(1,length(time));       % (Var) Total Lighting Reactive Power Demand
Incandescent_Power2_total = zeros(1,length(time));      % (W) Total Incandescent Lighting Power Demand
Incandescent_Reactive2_total = zeros(1,length(time));   % (Var) Total Incandescent Lighting Reactive Power Demand
Halogen_Power2_total = zeros(1,length(time));           % (W) Total Halogen Lighting Power Demand
Halogen_Reactive2_total = zeros(1,length(time));        % (Var) Total Halogen Lighting Reactive Power Demand
Fluorescent_Power2_total = zeros(1,length(time));       % (W) Total Linear Fluorescent Lighting Power Demand
Fluorescent_Reactive2_total = zeros(1,length(time));    % (Var) Total Linear Fluorescent Lighting Reactive Power Demand
CFL_Power2_total = zeros(1,length(time));               % (W) Total Compact Fluorescent Lighting Power Demand
CFL_Reactive2_total = zeros(1,length(time));            % (Var) Total Compact Fluorescent Lighting Reactive Power Demand
LED_Power2_total = zeros(1,length(time));               % (W) Total LED Lighting Power Demand
LED_Reactive2_total = zeros(1,length(time));            % (Var) Total LED Lighting Reactive Power Demand

Television_Power_total = zeros(1,length(time));     % (W) Total Television Power Demand
Television_Reactive_total = zeros(1,length(time));  % (Var) Total Television Reactive Power Demand
Computer_Power_total = zeros(1,length(time));       % (W) Total Computer Power Demand
Computer_Reactive_total = zeros(1,length(time));    % (Var) Total Computer Reactive Power Demand
Additional_Power_total = zeros(1,length(time));     % (W) Total Additional Power Demand
Additional_Reactive_total = zeros(1,length(time));  % (Var) Total Additional Reactive Power Demand

EV_Power_total = zeros(1,length(time));     % (W) Total Electric Vehicle Power Demand
EV_Reactive_total = zeros(1,length(time));  % (Var) Total Electric Vehicle Reactive Power Demand
EV_SOC_total = zeros(1,length(time));       % (%) Total Electric Vehicle State of Charge
EV_Num = 0;                                 % Electric Vehicle Counter
EV1_Power_total = zeros(1,length(time));    % (W) Total Electric Vehicle Power Demand (Level 1 Charger)
EV1_Reactive_total = zeros(1,length(time)); % (Var) Total Electric Vehicle Reactive Power Demand (Level 1 Charger)
EV1_SOC_total = zeros(1,length(time));      % (%) Total Electric Vehicle State of Charge (Level 1 Charger)
EV1_Num = 0;                                % Electric Vehicle Counter (Level 1 Charger)
EV2_Power_total = zeros(1,length(time));    % (W) Total Electric Vehicle Power Demand (Level 2 Charger)
EV2_Reactive_total = zeros(1,length(time)); % (Var) Total Electric Vehicle Reactive Power Demand (Level 2 Charger)
EV2_SOC_total = zeros(1,length(time));      % (%) Total Electric Vehicle State of Charge (Level 2 Charger)
EV2_Num = 0;                                % Electric Vehicle Counter (Level 2 Charger)
EV3_Power_total = zeros(1,length(time));    % (W) Total Electric Vehicle Power Demand (Level 3 Charger)
EV3_Reactive_total = zeros(1,length(time)); % (Var) Total Electric Vehicle Reactive Power Demand (Level 3 Charger)
EV3_SOC_total = zeros(1,length(time));      % (%) Total Electric Vehicle State of Charge (Level 3 Charger)
EV3_Num = 0;                                % Electric Vehicle Counter (Level 3 Charger)

WM_Occ_Act_Prob = zeros(60*24*7,10);    % Working Male Occupant Activity Probability Matrix
NM_Occ_Act_Prob = zeros(60*24*7,10);    % Nonworking Male Occupant Activity Probability Matrix
WF_Occ_Act_Prob = zeros(60*24*7,10);    % Working Female Occupant Activity Probability Matrix
NF_Occ_Act_Prob = zeros(60*24*7,10);    % Nonworking Female Occupant Activity Probability Matrix
C_Occ_Act_Prob = zeros(60*24*7,10);     % Child Occupant Activity Probability Matrix
Tot_Occ_Act_Prob = zeros(60*24*7,10);   % Total Occupant Activity Probability Matrix

WM_Error = zeros(60*24*7,10);   % Working Male Occupant Error Matrix
NM_Error = zeros(60*24*7,10);   % Nonworking Male Occupant Error Matrix
WF_Error = zeros(60*24*7,10);   % Working Female Occupant Error Matrix
NF_Error = zeros(60*24*7,10);   % Nonworking Female Occupant Error Matrix
C_Error = zeros(60*24*7,10);    % Child Occupant Error Matrix
Tot_Error = zeros(60*24*7,10);  % Total Occupant Error Matrix

WM_Avg_Error = [];  % Working Male Occupant Average Error
NM_Avg_Error = [];  % Nonworking Male Occupant Average Error
WF_Avg_Error = [];  % Working Female Occupant Average Error
NF_Avg_Error = [];  % Nonworking Male Occupant Average Error
C_Avg_Error = [];   % Child Occupant Average Error
Tot_Avg_Error = []; % Total Occupant Average Error

WM_Max_Error = [];  % Working Male Occupant Maximum Error
NM_Max_Error = [];  % Nonworking Male Occupant Maximum Error
WF_Max_Error = [];  % Working Female Occupant Maximum Error
NF_Max_Error = [];  % Nonworking Female Occupant Maximum Error
C_Max_Error = [];   % Child Occupant Maximum Error
Tot_Max_Error = []; % Total Occupant Maximum Error

WM_Num = 0; % Working Male Occupant Counter
NM_Num = 0; % Nonworking Male Occupant Counter
WF_Num = 0; % Working Female Occupant Counter
NF_Num = 0; % Nonworking Female Occupant Counter
C_Num = 0;  % Child Occupant Counter


% Initialize Matrices where Values are Stored (Demand Response)

HVAC_Power_DR_total = zeros(1,length(time));    % (W) Total HVAC Power Demand (Demand Response)
HVAC_Reactive_DR_total = zeros(1,length(time)); % (Var) Total HVAC Reactive Power Demand (Demand Response)
HVAC_Q_DR_total = zeros(1,length(time));        % (W) Total HVAC Heat Transfer to Home (Demand Response)
HVAC_COP_DR_total = zeros(1,length(time));      % Total HVAC Coefficient of Performance (Demand Response)
Indoor_Temp_DR_total = zeros(1,length(time));   % (F) Total Temperature of Air in Home (Demand Response)
Mass_Temp_DR_total = zeros(1,length(time));     % (F) Total Temperature of Mass of Home (Demand Response)
Envelope_Temp_DR_total = zeros(1,length(time)); % (F) Total Temperature of Envelope of Home (Demand Response)

WaterHeater_Power_DR_total = zeros(1,length(time));     % (W) Total Water Heater Power Demand (Demand Response)
WaterHeater_Reactive_DR_total = zeros(1,length(time));  % (Var) Total Water Heater Reactive Power Demand (Demand Response)
WaterHeater_WaterFlow_DR_total = zeros(1,length(time)); % (gal/s or gal/min) Total Water Heater Hot Water Demand (Demand Response)
WaterHeater_Temp_DR_total = zeros(1,length(time));      % (F) Total Water Heater Water Temperature (Demand Response)
WaterHeater_TempU_DR_total = zeros(1,length(time));     % (F) Total Water Heater Water Temperature (Upper Layer) (Demand Response)
WaterHeater_TempL_DR_total = zeros(1,length(time));     % (F) Total Water Heater Water Temperature (Lower Layer) (Demand Response)

Refrigerator_Power_DR_total = zeros(1,length(time));    % (W) Total Refrigerator Power Demand (Demand Response)
Refrigerator_Reactive_DR_total = zeros(1,length(time)); % (Var) Total Refrigerator Reactive Power Demand (Demand Response)
Refrigerator_Temp_DR_total = zeros(1,length(time));     % (F) Total Temperature of Refrigerator Interior (Demand Response)
Freezer_Power_DR_total = zeros(1,length(time));         % (W) Total Freezer Power Demand (Demand Response)
Freezer_Reactive_DR_total = zeros(1,length(time));      % (Var) Total Freezer Reactive Power Demand (Demand Response)
Freezer_Temp_DR_total = zeros(1,length(time));          % (F) Total Temperature of Freezer Interior (Demand Response)

Washer_Power_DR_total = zeros(1,length(time));          % (W) Total Washer Power Demand (Demand Response)
Washer_Reactive_DR_total = zeros(1,length(time));       % (Var) Total Washer Reactive Power Demand (Demand Response)
Washer_WaterFlow_DR_total = zeros(1,length(time));      % (gal/s or gal/min) Total Washer Hot Water Demand (Demand Response)
Dryer_Power_DR_total = zeros(1,length(time));           % (W) Total Dryer Power Demand (Demand Response)
Dryer_Reactive_DR_total = zeros(1,length(time));        % (Var) Total Dryer Reactive Power Demand (Demand Response)
Dishwasher_Power_DR_total = zeros(1,length(time));      % (W) Total Dishwasher Power Demand (Demand Response)
Dishwasher_Reactive_DR_total = zeros(1,length(time));   % (Var) Total Dishwasher Reactive Power Demand (Demand Response)
Dishwasher_WaterFlow_DR_total = zeros(1,length(time));  % (gal/s or gal/min) Total Dishwasher Hot Water Demand (Demand Response)


% Residential Model Simulation

for i = 1:numberofhomes     % Simulate 1 to Total Number of Homes
    
    % Initialize Matrices where Values are Stored
    
    HVAC_Power_hold = zeros(1,length(time));    % (W) HVAC Power Demand
    HVAC_Reactive_hold = zeros(1,length(time)); % (Var) HVAC Reactive Power Demand
    HVAC_Q_hold = zeros(1,length(time));        % (W) HVAC Heat Transfer to Home
    HVAC_COP_hold = zeros(1,length(time));      % HVAC Coefficient of Performance
    Indoor_Temp_hold = zeros(1,length(time));   % (F) Temperature of Air in Home
    Mass_Temp_hold = zeros(1,length(time));     % (F) Temperature of Mass of Home
    Envelope_Temp_hold = zeros(1,length(time)); % (F) Temperature of Envelope of Home
    HVAC_State = 0;                             % (Heating, Auxilary Heating, Cooling, or Off) State of HVAC
    
    WaterHeater_Power_hold = zeros(1,length(time));     % (W) Water Heater Power Demand
    WaterHeater_Reactive_hold = zeros(1,length(time));  % (Var) Water Heater Reactive Power Demand
    WaterHeater_WaterFlow_hold = zeros(1,length(time)); % (gal/s or gal/min) Water Heater Hot Water Demand
    WaterHeater_Temp_hold = zeros(1,length(time));      % (F) Water Heater Water Temperature
    WaterHeater_State = 0;                              % (On or Off) State of Water Heater
    WaterHeater_TempU_hold = zeros(1,length(time));     % (F) Water Heater Water Temperature (Upper Layer)
    WaterHeater_StateU = 0;                             % (On or Off) State of Water Heater (Upper Coil)
    WaterHeater_TempL_hold = zeros(1,length(time));     % (F) Water Heater Water Temperature (Lower Layer)
    WaterHeater_StateL = 0;                             % (On or Off) State of Water Heater (Lower Coil)
    
    Refrigerator_Power_hold = zeros(1,length(time));    % (W) Refrigerator Power Demand
    Refrigerator_Reactive_hold = zeros(1,length(time)); % (Var) Refrigerator Reactive Power Demand
    Refrigerator_Temp_hold = zeros(1,length(time));     % (F) Temperature of Refrigerator Interior
    Refrigerator_State = 0;                             % (On or Off) State of Refrigerator
    Freezer_Power_hold = zeros(1,length(time));         % (W) Freezer Power Demand
    Freezer_Reactive_hold = zeros(1,length(time));      % (Var) Freezer Reactive Power Demand
    Freezer_Temp_hold = zeros(1,length(time));          % (F) Temperature of Freezer Interior
    Freezer_State = 0;                                  % (On or Off) State of Freezer
    
    Refrigerator_Power2_hold = zeros(1,length(time));   % (W) Second Refrigerator Power Demand
    Refrigerator_Reactive2_hold = zeros(1,length(time));% (Var) Second Refrigerator Reactive Power Demand
    Refrigerator_Temp2_hold = zeros(1,length(time));    % (F) Temperature of Second Refrigerator Interior
    Refrigerator_State2 = 0;                            % (On or Off) State of Second Refrigerator
    Freezer_Power2_hold = zeros(1,length(time));        % (W) Second Freezer Power Demand
    Freezer_Reactive2_hold = zeros(1,length(time));     % (Var) Second Freezer Reactive Power Demand
    Freezer_Temp2_hold = zeros(1,length(time));         % (F) Temperature of Second Freezer Interior
    Freezer_State2 = 0;                                 % (On or Off) State of Second Freezer
    
    Washer_Power_hold = zeros(1,length(time));          % (W) Washer Power Demand
    Washer_Reactive_hold = zeros(1,length(time));       % (Var) Washer Reactive Power Demand
    Washer_WaterFlow_hold = zeros(1,length(time));      % (gal/s or gal/min) Washer Hot Water Demand
    Washer_State = 0;                                   % (Demand Cold Water or Hot Water) State of Washer
    Dryer_Power_hold = zeros(1,length(time));           % (W) Dryer Power Demand
    Dryer_Reactive_hold = zeros(1,length(time));        % (Var) Dryer Reactive Power Demand
    Dishwasher_Power_hold = zeros(1,length(time));      % (W) Dishwasher Power Demand
    Dishwasher_Reactive_hold = zeros(1,length(time));   % (Var) Dishwasher Reactive Power Demand
    Dishwasher_WaterFlow_hold = zeros(1,length(time));  % (gal/s or gal/min) Dishwasher Hot Water Demand
    Dishwasher_State = 0;                               % (Demand Cold Water or Hot Water) State of Dishwasher
    
    Cooking_Power_hold = zeros(1,length(time));         % (W) Cooking Power Demand
    Cooking_Reactive_hold = zeros(1,length(time));      % (Var) Cooking Reactive Power Demand
    Lighting_Power_hold = zeros(1,length(time));        % (W) Lighting Power Demand
    Lighting_Reactive_hold = zeros(1,length(time));     % (Var) Lighting Reactive Power Demand
    Incandescent_Power_hold = zeros(1,length(time));    % (W) Incandescent Lighting Power Demand
    Incandescent_Reactive_hold = zeros(1,length(time)); % (Var) Incandescent Lighting Reactive Power Demand
    Halogen_Power_hold = zeros(1,length(time));         % (W) Halogen Lighting Power Demand
    Halogen_Reactive_hold = zeros(1,length(time));      % (Var) Halogen Lighting Reactive Power Demand
    Fluorescent_Power_hold = zeros(1,length(time));     % (W) Linear Fluorescent Lighting Power Demand
    Fluorescent_Reactive_hold = zeros(1,length(time));  % (Var) Linear Fluorescent Lighting Reactive Power Demand
    CFL_Power_hold = zeros(1,length(time));             % (W) Compact Fluorescent Lighting Power Demand
    CFL_Reactive_hold = zeros(1,length(time));          % (Var) Compact Fluorescent Lighting Reactive Power Demand
    LED_Power_hold = zeros(1,length(time));             % (W) LED Lighting Power Demand
    LED_Reactive_hold = zeros(1,length(time));          % (Var) LED Lighting Reactive Power Demand
    
    Lighting_Power2_hold = zeros(1,length(time));       % (W) Lighting Power Demand
    Lighting_Reactive2_hold = zeros(1,length(time));    % (Var) Lighting Reactive Power Demand
    Incandescent_Power2_hold = zeros(1,length(time));   % (W) Incandescent Lighting Power Demand
    Incandescent_Reactive2_hold = zeros(1,length(time));% (Var) Incandescent Lighting Reactive Power Demand
    Halogen_Power2_hold = zeros(1,length(time));        % (W) Halogen Lighting Power Demand
    Halogen_Reactive2_hold = zeros(1,length(time));     % (Var) Halogen Lighting Reactive Power Demand
    Fluorescent_Power2_hold = zeros(1,length(time));    % (W) Linear Fluorescent Lighting Power Demand
    Fluorescent_Reactive2_hold = zeros(1,length(time)); % (Var) Linear Fluorescent Lighting Reactive Power Demand
    CFL_Power2_hold = zeros(1,length(time));            % (W) Compact Fluorescent Lighting Power Demand
    CFL_Reactive2_hold = zeros(1,length(time));         % (Var) Compact Fluorescent Lighting Reactive Power Demand
    LED_Power2_hold = zeros(1,length(time));            % (W) LED Lighting Power Demand
    LED_Reactive2_hold = zeros(1,length(time));         % (Var) LED Lighting Reactive Power Demand
    
    Television_Power_hold = zeros(1,length(time));      % (W) Television Power Demand
    Television_Reactive_hold = zeros(1,length(time));   % (Var) Television Reactive Power Demand
    Computer_Power_hold = zeros(1,length(time));        % (W) Computer Power Demand
    Computer_Reactive_hold = zeros(1,length(time));     % (Var) Computer Reactive Power Demand
    Additional_Power_hold = zeros(1,length(time));      % (W) Additional Power Demand
    Additional_Reactive_hold = zeros(1,length(time));   % (Var) Additional Reactive Power Demand
    
    EV_Power_hold = zeros(1,length(time));      % (W) Electric Vehicle Power Demand
    EV_Reactive_hold = zeros(1,length(time));   % (Var) Electric Vehicle Reactive Power Demand
    EV_SOC_hold = zeros(1,length(time));        % (%) Electric Vehicle State of Charge
    EV1_Power_hold = zeros(1,length(time));     % (W) Electric Vehicle Power Demand (Level 1 Charger)
    EV1_Reactive_hold = zeros(1,length(time));  % (Var) Electric Vehicle Reactive Power Demand (Level 1 Charger)
    EV1_SOC_hold = zeros(1,length(time));       % (%) Electric Vehicle State of Charge (Level 1 Charger)
    EV2_Power_hold = zeros(1,length(time));     % (W) Electric Vehicle Power Demand (Level 2 Charger)
    EV2_Reactive_hold = zeros(1,length(time));  % (Var) Electric Vehicle Reactive Power Demand (Level 2 Charger)
    EV2_SOC_hold = zeros(1,length(time));       % (%) Electric Vehicle State of Charge (Level 2 Charger)
    EV3_Power_hold = zeros(1,length(time));     % (W) Electric Vehicle Power Demand (Level 3 Charger)
    EV3_Reactive_hold = zeros(1,length(time));  % (Var) Electric Vehicle Reactive Power Demand (Level 3 Charger)
    EV3_SOC_hold = zeros(1,length(time));       % (%) Electric Vehicle State of Charge (Level 3 Charger)
    
    
    % Initialize Matrices where Values are Stored (Demand Response)
    
    HVAC_Power_DR_hold = zeros(1,length(time));     % (W) HVAC Power Demand (Demand Response)
    HVAC_Reactive_DR_hold = zeros(1,length(time));  % (Var) HVAC Reactive Power Demand (Demand Response)
    HVAC_Q_DR_hold = zeros(1,length(time));         % (W) HVAC Heat Transfer to Home (Demand Response)
    HVAC_COP_DR_hold = zeros(1,length(time));       % HVAC Coefficient of Performance (Demand Response)
    Indoor_Temp_DR_hold = zeros(1,length(time));    % (F) Temperature of Air in Home (Demand Response)
    Mass_Temp_DR_hold = zeros(1,length(time));      % (F) Temperature of Mass of Home (Demand Response)
    Envelope_Temp_DR_hold = zeros(1,length(time));  % (F) Temperature of Envelope of Home (Demand Response)
    HVAC_State_DR = 0;                              % (Heating, Auxilary Heating, Cooling, or Off) State of HVAC (Demand Response)
    
    WaterHeater_Power_DR_hold = zeros(1,length(time));      % (W) Water Heater Power Demand (Demand Response)
    WaterHeater_Reactive_DR_hold = zeros(1,length(time));   % (Var) Water Heater Reactive Power Demand (Demand Response)
    WaterHeater_WaterFlow_DR_hold = zeros(1,length(time));  % (gal/s or gal/min) Water Heater Hot Water Demand (Demand Response)
    WaterHeater_Temp_DR_hold = zeros(1,length(time));       % (F) Water Heater Water Temperature (Demand Response)
    WaterHeater_State_DR = 0;                               % (On or Off) State of Water Heater (Demand Response)
    WaterHeater_TempU_DR_hold = zeros(1,length(time));      % (F) Water Heater Water Temperature (Upper Layer) (Demand Response)
    WaterHeater_StateU_DR = 0;                              % (On or Off) State of Water Heater (Upper Coil) (Demand Response)
    WaterHeater_TempL_DR_hold = zeros(1,length(time));      % (F) Water Heater Water Temperature (Lower Layer) (Demand Response)
    WaterHeater_StateL_DR = 0;                              % (On or Off) State of Water Heater (Lower Coil) (Demand Response)
    
    Refrigerator_Power_DR_hold = zeros(1,length(time));     % (W) Refrigerator Power Demand (Demand Response)
    Refrigerator_Reactive_DR_hold = zeros(1,length(time));  % (Var) Refrigerator Reactive Power Demand (Demand Response)
    Refrigerator_Temp_DR_hold = zeros(1,length(time));      % (F) Temperature of Refrigerator Interior (Demand Response)
    Refrigerator_State_DR = 0;                              % (On or Off) State of Refrigerator (Demand Response)
    Freezer_Power_DR_hold = zeros(1,length(time));          % (W) Freezer Power Demand (Demand Response)
    Freezer_Reactive_DR_hold = zeros(1,length(time));       % (Var) Freezer Reactive Power Demand (Demand Response)
    Freezer_Temp_DR_hold = zeros(1,length(time));           % (F) Temperature of Freezer Interior (Demand Response)
    Freezer_State_DR = 0;                                   % (On or Off) State of Freezer (Demand Response)
    
    Refrigerator_Power_DR2_hold = zeros(1,length(time));    % (W) Second Refrigerator Power Demand (Demand Response)
    Refrigerator_Reactive_DR2_hold = zeros(1,length(time)); % (Var) Second Refrigerator Reactive Power Demand (Demand Response)
    Refrigerator_Temp_DR2_hold = zeros(1,length(time));     % (F) Temperature of Second Refrigerator Interior (Demand Response)
    Refrigerator_State2_DR = 0;                             % (On or Off) State of Second Refrigerator (Demand Response)
    Freezer_Power_DR2_hold = zeros(1,length(time));         % (W) Second Freezer Power Demand (Demand Response)
    Freezer_Reactive_DR2_hold = zeros(1,length(time));      % (Var) Second Freezer Reactive Power Demand (Demand Response)
    Freezer_Temp_DR2_hold = zeros(1,length(time));          % (F) Temperature of Second Freezer Interior (Demand Response)
    Freezer_State2_DR = 0;                                  % (On or Off) State of Second Freezer (Demand Response)
    
    Washer_Power_DR_hold = zeros(1,length(time));           % (W) Washer Power Demand (Demand Response)
    Washer_Reactive_DR_hold = zeros(1,length(time));        % (Var) Washer Reactive Power Demand (Demand Response)
    Washer_WaterFlow_DR_hold = zeros(1,length(time));       % (gal/s or gal/min) Washer Hot Water Demand (Demand Response)
    Dryer_Power_DR_hold = zeros(1,length(time));            % (W) Dryer Power Demand (Demand Response)
    Dryer_Reactive_DR_hold = zeros(1,length(time));         % (Var) Dryer Reactive Power Demand (Demand Response)
    Dishwasher_Power_DR_hold = zeros(1,length(time));       % (W) Dishwasher Power Demand (Demand Response)
    Dishwasher_Reactive_DR_hold = zeros(1,length(time));    % (Var) Dishwasher Reactive Power Demand (Demand Response)
    Dishwasher_WaterFlow_DR_hold = zeros(1,length(time));   % (gal/s or gal/min) Dishwasher Hot Water Demand (Demand Response)
    
    
    % Define Appliance and Load Power Factors
    
    HVAC_PowerFactor = 0.97;            % (%) HVAC Power Factor
    WaterHeater_PowerFactor = 1.00;     % (%) Water Heater Power Factor
    Refrigerator_PowerFactor = 0.90;    % (%) Refrigerator Power Factor
    Freezer_PowerFactor = 0.90;         % (%) Freezer Power Factor
    Washer_PowerFactor = 0.90;          % (%) Washer Power Factor
    Dryer_PowerFactor = 0.99;           % (%) Dryer Power Factor
    Dishwasher_PowerFactor = 0.98;      % (%) Dishwasher Power Factor
    Cooking_PowerFactor = 0.85;         % (%) Cooking Power Factor
    Incandescent_PowerFactor = 1.00;    % (%) Incandescent Lighting Power Factor
    Halogen_PowerFactor = 1.00;         % (%) Halogen Lighting Power Factor
    Fluorescent_PowerFactor = 0.95;     % (%) Linear Fluorescent Lighting Power Factor
    CFL_PowerFactor = 0.92;             % (%) Compact Fluorescent Lighting Power Factor
    LED_PowerFactor = 0.90;             % (%) LED Lighting Power Factor
    Television_PowerFactor = 0.90;      % (%) Television Power Factor
    Computer_PowerFactor = 0.90;        % (%) Computer Power Factor
    Additional_PowerFactor = 0.90;      % (%) Additional Power Factor
    EV_PowerFactor = 1.00;              % (%) Electric Vehicle Power Factor
    
    
    % Randomly Generate Scaling Factors (Normal Distribution) (1. Home/Appliance Sizes and Power Demand, 2. Insulation Values, 3. Thermostat Settings)
    
    Scaling_Factor = normrnd(0,1, 3,1); % Generate Scaling Factors (Number of Standard Deviations Away From Mean)
    
    for j = 1:length(Scaling_Factor)    % Scaling Factors Should be Within 3 Standard Deviations of Mean
        if Scaling_Factor(j) > 3
            Scaling_Factor(j) = 3;
        elseif Scaling_Factor(j) < -3
            Scaling_Factor(j) = -3;
        end
    end
    
    
    % Set Appliance Types (Electric, Nonelectric, or Not in Home) (Can be Used to Force Program to Simulate Only Certain Residential Loads)
    
    % Residential Load Override (Overrides Default Percentages on a Home by Home Basis)
    
    if exist(fullfile(inputdata,'User Settings','Load_Override.csv'),'file') == 2   % Use Defined Load Makeup If Given
        
        Load_Matrix = importdata(fullfile(inputdata,'User Settings','Load_Override.csv'));  % Load Matrix (All Homes)
        
        HomeHVAC_Inputs(14) = Load_Matrix.data(1,i);                % Percentage with Heat Pump
        HomeHVAC_Inputs(15) = Load_Matrix.data(2,i);                % Percentage with Resistive Heating
        HomeHVAC_Inputs(16) = Load_Matrix.data(3,i);                % Percentage with Nonelectric Heating
        HomeHVAC_Inputs(17) = Load_Matrix.data(4,i);                % Percentage with Air Conditioning
        WaterHeater_Inputs(2) = Load_Matrix.data(5,i);              % Percentage with Water Heater
        RefrigeratorFreezer_Inputs(1) = Load_Matrix.data(6,i);      % Percentage with Refrigerator
        RefrigeratorFreezer_Inputs(2) = Load_Matrix.data(7,i);      % Percentage with Automatic Defrost (Refrigerator)
        RefrigeratorFreezer_Inputs2(1) = Load_Matrix.data(8,i);     % Percentage with Second Refrigerator
        RefrigeratorFreezer_Inputs2(2) = Load_Matrix.data(9,i);     % Percentage with Automatic Defrost (Second Refrigerator)
        RefrigeratorFreezer_Inputs(8) = Load_Matrix.data(10,i);     % Percentage with Freezer
        RefrigeratorFreezer_Inputs(9) = Load_Matrix.data(11,i);     % Percentage with Automatic Defrost (Freezer)
        RefrigeratorFreezer_Inputs2(8) = Load_Matrix.data(12,i);    % Percentage with Second Freezer
        RefrigeratorFreezer_Inputs2(9) = Load_Matrix.data(13,i);    % Percentage with Automatic Defrost (Second Freezer)
        Deferrable_Inputs(1) = Load_Matrix.data(14,i);              % Percentage with Washer
        Deferrable_Inputs(4) = Load_Matrix.data(15,i);              % Percentage with Electric Dryer
        Deferrable_Inputs(7) = Load_Matrix.data(16,i);              % Percentage with Nonelectric Dryer
        Deferrable_Inputs(10) = Load_Matrix.data(17,i);             % Percentage with Dishwasher
        Uninterruptible_Inputs(1) = Load_Matrix.data(18,i);         % Percentage with Cooking
        Uninterruptible_Inputs(4) = Load_Matrix.data(19,i);         % Number of Televisions per Home
        Uninterruptible_Inputs(8) = Load_Matrix.data(20,i);         % Number of Computers per Home
        Uninterruptible_Inputs(13) = Load_Matrix.data(21,i);        % Percentage with Lighting
        Uninterruptible_Inputs(14) = Load_Matrix.data(22,i);        % Incandescent Lighting Percentage
        Uninterruptible_Inputs(15) = Load_Matrix.data(23,i);        % Halogen Lighting Percentage
        Uninterruptible_Inputs(16) = Load_Matrix.data(24,i);        % Linear Fluorescent Lighting Percentage
        Uninterruptible_Inputs(17) = Load_Matrix.data(25,i);        % Compact Fluorescent Lighting Percentage
        Uninterruptible_Inputs(18) = Load_Matrix.data(26,i);        % LED Lighting Percentage
    end
    
    
    % HVAC and Water Heater Type Variables are Not Dependent upon Other Residential Loads
    
    % Air Conditioning
    
    HVAC_rand = rand(1);    % HVAC Random Variable (If Home Does Not have Heating, it wont have Air Conditioning/Home with a Heat Pump Always Has Both)
    
    if (HVAC_rand <= HomeHVAC_Inputs(17)/100) && (get(handles.HVAC_CheckBox, 'Value') == 1)
        
        HVAC_CoolingType = 1;   % Home has Air Conditioning
    else
        HVAC_CoolingType = 0;   % Home Does Not have Air Conditioning
    end
    
    % Heating
    
    CumSum_HVAC_HeatingType = cumsum([HomeHVAC_Inputs(14:16,1); 100 - sum(HomeHVAC_Inputs(14:16,1), 1)], 1);    % Cumulative Sum of HVAC Heating Types
    HVAC_HeatingType = find(CumSum_HVAC_HeatingType(end,1)*HVAC_rand <= CumSum_HVAC_HeatingType, 1, 'first');   % Randomly Select HVAC Heating Type based on Statistics
    
    if (HVAC_HeatingType == 4) || (get(handles.HVAC_CheckBox, 'Value') == 0)
        
        HVAC_HeatingType = 0;   % Home Does Not have Heating
    end
    
    % Water Heating
    
    if (rand(1) <= WaterHeater_Inputs(2)/100) && (get(handles.WaterHeater_CheckBox, 'Value') == 1)
        
        WaterHeater_Type = 1;   % Home has an Electric Water Heater
        
        WaterHeater_Num = WaterHeater_Num + 1;  % Increment Water Heater Counter
    else
        WaterHeater_Type = 0;   % Home has a Nonelectric Water Heater
    end
    
    
    % Load Type Variables which are Dependent upon Other Residenial Loads (Ex. If Home Does Not have a Washer, it likely wont have a Dryer or Dishwashwer as well)
    
    Type_rand = rand(1);   % Load Type Random Variable
    
    % Electric Vehicle
    
    if (Type_rand <= ElectricVehicle_Inputs(1)/100) && (get(handles.ElectricVehicle_CheckBox, 'Value') == 1)
        
        EV_Num = EV_Num + 1;    % Increment Electric Vehicle Counter
        
        CumSum_EV_Type = cumsum([ElectricVehicle_Inputs(2) ElectricVehicle_Inputs(3) ElectricVehicle_Inputs(4)]);   % Cumulative Sum of Vehicle Types
        EV_Type = find(CumSum_EV_Type(1,end)*rand(1) <= CumSum_EV_Type, 1, 'first');                                % Randomly Select Vehicle Type based on Statistics
        
        if EV_Type == 1
            EV_Position = 0;
        elseif EV_Type == 2
            EV_Position = 14;
        elseif EV_Type == 3
            EV_Position = 28;
        end
        
        CumSum_EV_Type = cumsum([ElectricVehicle_Inputs(10 + EV_Position) ElectricVehicle_Inputs(13 + EV_Position) ElectricVehicle_Inputs(16 + EV_Position)]);  % Cumulative Sum of Electric Vehicle Charging Levels
        EV_Type = find(CumSum_EV_Type(1,end)*rand(1) <= CumSum_EV_Type, 1, 'first');                                                                            % Randomly Select Electric Vehicle Charging Level based on Statistics
        
        if EV_Type == 1;    % If Home has an Electric Vehicle (Level 1 Charger)
            
            EV1_Num = EV1_Num + 1;  % Increment Electric Vehicle Counter (Level 1 Charger)
            
        elseif EV_Type == 2;    % If Home has an Electric Vehicle (Level 2 Charger)
            
            EV2_Num = EV2_Num + 1;  % Increment Electric Vehicle Counter (Level 2 Charger)
            
        elseif EV_Type == 3;    % If Home has an Electric Vehicle (Level 3 Charger)
            
            EV3_Num = EV3_Num + 1;  % Increment Electric Vehicle Counter (Level 3 Charger)
        end
    else
        EV_Type = 0;    % Home Does Not have an Electric Vehicle
    end
    
    % Refrigerator
    
    if (Type_rand <= RefrigeratorFreezer_Inputs(1)/100) && (get(handles.Refrigerator_CheckBox, 'Value') == 1)
        
        Refrigerator_Type = 1;  % Home has a Refrigerator
        
        if rand(1) <= RefrigeratorFreezer_Inputs(2)/100
            
            RefrigeratorDefrost = 1;   % Refrigerator has an Automatic Defroster
        else
            RefrigeratorDefrost = 0;   % Refrigerator Does Not have an Automatic Defroster
        end
        
        Refrigerator_Num = Refrigerator_Num + 1;    % Increment Refrigerator Counter
    else
        Refrigerator_Type = 0;  % Home Does Not have a Refrigerator
    end
    
    % Second Refrigerator
    
    if (Type_rand <= RefrigeratorFreezer_Inputs2(1)/100) && (get(handles.Refrigerator_CheckBox, 'Value') == 1)
        
        Refrigerator_Type2 = 1; % Home has a Second Refrigerator
        
        if rand(1) <= RefrigeratorFreezer_Inputs2(2)/100
            
            RefrigeratorDefrost2 = 1;   % Second Refrigerator has an Automatic Defroster
        else
            RefrigeratorDefrost2 = 0;   % Second Refrigerator Does Not have an Automatic Defroster
        end
        
        Refrigerator_Num = Refrigerator_Num + 1;    % Increment Refrigerator Counter
    else
        Refrigerator_Type2 = 0;  % Home Does Not have a Second Refrigerator
    end
    
    % Freezer
    
    if (Type_rand <= RefrigeratorFreezer_Inputs(8)/100) && (get(handles.Freezer_CheckBox, 'Value') == 1)
        
        Freezer_Type = 1;   % Home has a Freezer
        
        if rand(1) <= RefrigeratorFreezer_Inputs(9)/100
            
            FreezerDefrost = 1; % Freezer has an Automatic Defroster
        else
            FreezerDefrost = 0; % Freezer Does Not have an Automatic Defroster
        end
        
        Freezer_Num = Freezer_Num + 1;  % Increment Freezer Counter
    else
        Freezer_Type = 0;   % Home Does Not have a Freezer
    end
    
    % Second Freezer
    
    if (Type_rand <= RefrigeratorFreezer_Inputs2(8)/100) && (get(handles.Freezer_CheckBox, 'Value') == 1)
        
        Freezer_Type2 = 1;  % Home has a Second Freezer
        
        if rand(1) <= RefrigeratorFreezer_Inputs2(9)/100
            
            FreezerDefrost2 = 1;    % Second Freezer has an Automatic Defroster
        else
            FreezerDefrost2 = 0;    % Second Freezer Does Not have an Automatic Defroster
        end
        
        Freezer_Num = Freezer_Num + 1;  % Increment Freezer Counter
    else
        Freezer_Type2 = 0;  % Home Does Not have a Second Freezer
    end
    
    % Washer
    
    if (Type_rand <= Deferrable_Inputs(1)/100) && (get(handles.Washer_CheckBox, 'Value') == 1)
        
        Washer_Type = 1;    % Home has a Washer
    else
        Washer_Type = 0;    % Home Does Not have a Washer
    end
    
    % Dryer
    
    if (Type_rand <= Deferrable_Inputs(4)/100) && (get(handles.Dryer_CheckBox, 'Value') == 1)
        
        Dryer_Type = 1; % Home has an Electric Dryer
        
    elseif (Type_rand <= (Deferrable_Inputs(4) + Deferrable_Inputs(7))/100) && (get(handles.Dryer_CheckBox, 'Value') == 1)
        
        Dryer_Type = 2; % Home has a Nonelectric Dryer
    else
        Dryer_Type = 0; % Home Does Not have a Dryer
    end
    
    % Dishwasher
    
    if (Type_rand <= Deferrable_Inputs(10)/100) && (get(handles.Dishwasher_CheckBox, 'Value') == 1)
        
        Dishwasher_Type = 1;    % Home has a Dishwasher
    else
        Dishwasher_Type = 0;    % Home Does Not have a Dishwasher
    end
    
    % Lighting
    
    if (Type_rand <= Uninterruptible_Inputs(13)/100) && (get(handles.Lighting_CheckBox, 'Value') == 1)
        
        Lighting_Type = 1;  % Home has Lighting
    else
        Lighting_Type = 0;  % Home Does Not have Lighting
    end
    
    % Cooking
    
    if (Type_rand <= Uninterruptible_Inputs(1)/100) && (get(handles.Cooking_CheckBox, 'Value') == 1)
        
        Cooking_Type = 1;   % Home has a Cooking
    else
        Cooking_Type = 0;   % Home Does Not have a Cooking
    end
    
    % Television
    
    if get(handles.Television_CheckBox, 'Value') == 1
        
        Television_Type = 1;    % Simulate Television Power Demand
    else
        Television_Type = 0;    % Do Not Simulate Television Power Demand
    end
    
    % Computer
    
    if get(handles.Computer_CheckBox, 'Value') == 1
        
        Computer_Type = 1;  % Simulate Computer Power Demand
    else
        Computer_Type = 0;  % Do Not Simulate Computer Power Demand
    end
    
    % Additional
    
    if get(handles.Additional_CheckBox, 'Value') == 1
        
        Additional_Type = 1;   % Simulate Additional Power Demand
    else
        Additional_Type = 0;   % Do Not Simulate Additional Power Demand
    end
    
    
    % Set Demand Response Parameters
    
    if Simulate_DemandResponse == 1 % If User is Simulating Demand Response
        
        if (rand(1) <= HVACDemandResponse_Inputs(1)/100) && (HVAC_CoolingType ~= 0 || HVAC_HeatingType ~= 0)
            
            HVAC_DR_LoadShed = HVACDemandResponse_Inputs(2);            % Determine if Home's HVAC Particpates in Demand Repsonse (Load Shed)
            HVAC_DR_AdjustThermostat = HVACDemandResponse_Inputs(8);    % Determine if Home's HVAC Particpates in Demand Repsonse (Adjust Thermostat)
            
            if HVACDemandResponse_Inputs(3) == 12; HVACDemandResponse_Inputs(3) = 0; end
            if HVACDemandResponse_Inputs(10) == 12; HVACDemandResponse_Inputs(10) = 0; end
            if HVACDemandResponse_Inputs(15) == 12; HVACDemandResponse_Inputs(15) = 0; end
            
            HVAC_LoadShedTime = HVACDemandResponse_Inputs(3)*60*time_step + HVACDemandResponse_Inputs(4)*time_step + (HVACDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
            HVAC_LoadShedTime = HVAC_LoadShedTime + (HVACDemandResponse_Inputs(6) - 1)*24*60*time_step + randi([0, HVACDemandResponse_Inputs(7)*time_step]);
            HVAC_AdjustmentTime = HVACDemandResponse_Inputs(10)*60*time_step + HVACDemandResponse_Inputs(11)*time_step + (HVACDemandResponse_Inputs(12) - 1)*12*60*time_step + 1;
            HVAC_AdjustmentTime = HVAC_AdjustmentTime + (HVACDemandResponse_Inputs(13) - 1)*24*60*time_step + randi([0, HVACDemandResponse_Inputs(14)*time_step]);
            HVAC_AdjustmentTime2 = HVACDemandResponse_Inputs(15)*60*time_step + HVACDemandResponse_Inputs(16)*time_step + (HVACDemandResponse_Inputs(17) - 1)*12*60*time_step + 1;
            HVAC_AdjustmentTime2 = HVAC_AdjustmentTime2 + (HVACDemandResponse_Inputs(18) - 1)*24*60*time_step + randi([0, HVACDemandResponse_Inputs(19)*time_step]);
        else
            HVAC_DR_LoadShed = 0;           % Home's HVAC Does Not Particpate in Demand Repsonse (Load Shed)
            HVAC_DR_AdjustThermostat = 0;   % Home's HVAC Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        end
        
        if (rand(1) <= WaterHeaterDemandResponse_Inputs(1)/100) && (WaterHeater_Type ~= 0)
            
            WaterHeater_DR_LoadShed = WaterHeaterDemandResponse_Inputs(2);          % Determine if Home's Water Heater Particpates in Demand Repsonse (Load Shed)
            WaterHeater_DR_AdjustThermostat = WaterHeaterDemandResponse_Inputs(8);  % Determine if Home's Water Heater Particpates in Demand Repsonse (Adjust Thermostat)
            
            if WaterHeaterDemandResponse_Inputs(3) == 12; WaterHeaterDemandResponse_Inputs(3) = 0; end
            if WaterHeaterDemandResponse_Inputs(10) == 12; WaterHeaterDemandResponse_Inputs(10) = 0; end
            if WaterHeaterDemandResponse_Inputs(15) == 12; WaterHeaterDemandResponse_Inputs(15) = 0; end
            
            WaterHeater_LoadShedTime = WaterHeaterDemandResponse_Inputs(3)*60*time_step + WaterHeaterDemandResponse_Inputs(4)*time_step + (WaterHeaterDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
            WaterHeater_LoadShedTime = WaterHeater_LoadShedTime + (WaterHeaterDemandResponse_Inputs(6) - 1)*24*60*time_step + randi([0, WaterHeaterDemandResponse_Inputs(7)*time_step]);
            WaterHeater_AdjustmentTime = WaterHeaterDemandResponse_Inputs(10)*60*time_step + WaterHeaterDemandResponse_Inputs(11)*time_step + (WaterHeaterDemandResponse_Inputs(12) - 1)*12*60*time_step + 1;
            WaterHeater_AdjustmentTime = WaterHeater_AdjustmentTime + (WaterHeaterDemandResponse_Inputs(13) - 1)*24*60*time_step + randi([0, WaterHeaterDemandResponse_Inputs(14)*time_step]);
            WaterHeater_AdjustmentTime2 = WaterHeaterDemandResponse_Inputs(15)*60*time_step + WaterHeaterDemandResponse_Inputs(16)*time_step + (WaterHeaterDemandResponse_Inputs(17) - 1)*12*60*time_step + 1;
            WaterHeater_AdjustmentTime2 = WaterHeater_AdjustmentTime2 + (WaterHeaterDemandResponse_Inputs(18) - 1)*24*60*time_step + randi([0, WaterHeaterDemandResponse_Inputs(19)*time_step]);
        else
            WaterHeater_DR_LoadShed = 0;            % Home's Water Heater Does Not Particpate in Demand Repsonse (Load Shed)
            WaterHeater_DR_AdjustThermostat = 0;    % Home's Water Heater Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        end
        
        if (rand(1) <= RefrigeratorDemandResponse_Inputs(1)/100) && (Refrigerator_Type ~= 0)
            
            Refrigerator_DR_LoadShed = RefrigeratorDemandResponse_Inputs(2);            % Determine if Home's Refrigerator Particpates in Demand Repsonse (Load Shed)
            Refrigerator_DR_AdjustThermostat = RefrigeratorDemandResponse_Inputs(8);    % Determine if Home's Refrigerator Particpates in Demand Repsonse (Adjust Thermostat)
            
            if RefrigeratorDemandResponse_Inputs(3) == 12; RefrigeratorDemandResponse_Inputs(3) = 0; end
            if RefrigeratorDemandResponse_Inputs(10) == 12; RefrigeratorDemandResponse_Inputs(10) = 0; end
            if RefrigeratorDemandResponse_Inputs(15) == 12; RefrigeratorDemandResponse_Inputs(15) = 0; end
            
            Refrigerator_LoadShedTime = RefrigeratorDemandResponse_Inputs(3)*60*time_step + RefrigeratorDemandResponse_Inputs(4)*time_step + (RefrigeratorDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
            Refrigerator_LoadShedTime = Refrigerator_LoadShedTime + (RefrigeratorDemandResponse_Inputs(6) - 1)*24*60*time_step + randi([0, RefrigeratorDemandResponse_Inputs(7)*time_step]);
            Refrigerator_AdjustmentTime = RefrigeratorDemandResponse_Inputs(10)*60*time_step + RefrigeratorDemandResponse_Inputs(11)*time_step + (RefrigeratorDemandResponse_Inputs(12) - 1)*12*60*time_step + 1;
            Refrigerator_AdjustmentTime = Refrigerator_AdjustmentTime + (RefrigeratorDemandResponse_Inputs(13) - 1)*24*60*time_step + randi([0, RefrigeratorDemandResponse_Inputs(14)*time_step]);
            Refrigerator_AdjustmentTime2 = RefrigeratorDemandResponse_Inputs(15)*60*time_step + RefrigeratorDemandResponse_Inputs(16)*time_step + (RefrigeratorDemandResponse_Inputs(17) - 1)*12*60*time_step + 1;
            Refrigerator_AdjustmentTime2 = Refrigerator_AdjustmentTime2 + (RefrigeratorDemandResponse_Inputs(18) - 1)*24*60*time_step + randi([0, RefrigeratorDemandResponse_Inputs(19)*time_step]);
        else
            Refrigerator_DR_LoadShed = 0;           % Home's Refrigerator Does Not Particpate in Demand Repsonse (Load Shed)
            Refrigerator_DR_AdjustThermostat = 0;   % Home's Refrigerator Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        end
        
        if (rand(1) <= RefrigeratorDemandResponse_Inputs(1)/100) && (Refrigerator_Type2 ~= 0)
            
            Refrigerator_DR_LoadShed2 = RefrigeratorDemandResponse_Inputs(2);           % Determine if Home's Second Refrigerator Particpates in Demand Repsonse (Load Shed)
            Refrigerator_DR_AdjustThermostat2 = RefrigeratorDemandResponse_Inputs(8);   % Determine if Home's Second Refrigerator Particpates in Demand Repsonse (Adjust Thermostat)
            
            if RefrigeratorDemandResponse_Inputs(3) == 12; RefrigeratorDemandResponse_Inputs(3) = 0; end
            if RefrigeratorDemandResponse_Inputs(10) == 12; RefrigeratorDemandResponse_Inputs(10) = 0; end
            if RefrigeratorDemandResponse_Inputs(15) == 12; RefrigeratorDemandResponse_Inputs(15) = 0; end
            
            Refrigerator_LoadShedTime2 = RefrigeratorDemandResponse_Inputs(3)*60*time_step + RefrigeratorDemandResponse_Inputs(4)*time_step + (RefrigeratorDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
            Refrigerator_LoadShedTime2 = Refrigerator_LoadShedTime2 + (RefrigeratorDemandResponse_Inputs(6) - 1)*24*60*time_step + randi([0, RefrigeratorDemandResponse_Inputs(7)*time_step]);
            Refrigerator_AdjustmentTime3 = RefrigeratorDemandResponse_Inputs(10)*60*time_step + RefrigeratorDemandResponse_Inputs(11)*time_step + (RefrigeratorDemandResponse_Inputs(12) - 1)*12*60*time_step + 1;
            Refrigerator_AdjustmentTime3 = Refrigerator_AdjustmentTime3 + (RefrigeratorDemandResponse_Inputs(13) - 1)*24*60*time_step + randi([0, RefrigeratorDemandResponse_Inputs(14)*time_step]);
            Refrigerator_AdjustmentTime4 = RefrigeratorDemandResponse_Inputs(15)*60*time_step + RefrigeratorDemandResponse_Inputs(16)*time_step + (RefrigeratorDemandResponse_Inputs(17) - 1)*12*60*time_step + 1;
            Refrigerator_AdjustmentTime4 = Refrigerator_AdjustmentTime4 + (RefrigeratorDemandResponse_Inputs(18) - 1)*24*60*time_step + randi([0, RefrigeratorDemandResponse_Inputs(19)*time_step]);
        else
            Refrigerator_DR_LoadShed2 = 0;          % Home's Second Refrigerator Does Not Particpate in Demand Repsonse (Load Shed)
            Refrigerator_DR_AdjustThermostat2 = 0;  % Home's Second Refrigerator Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        end
        
        if (rand(1) <= FreezerDemandResponse_Inputs(1)/100) && (Freezer_Type ~= 0)
            
            Freezer_DR_LoadShed = FreezerDemandResponse_Inputs(2);          % Determine if Home's Freezer Particpates in Demand Repsonse (Load Shed)
            Freezer_DR_AdjustThermostat = FreezerDemandResponse_Inputs(8);  % Determine if Home's Freezer Particpates in Demand Repsonse (Adjust Thermostat)
            
            if FreezerDemandResponse_Inputs(3) == 12; FreezerDemandResponse_Inputs(3) = 0; end
            if FreezerDemandResponse_Inputs(10) == 12; FreezerDemandResponse_Inputs(10) = 0; end
            if FreezerDemandResponse_Inputs(15) == 12; FreezerDemandResponse_Inputs(15) = 0; end
            
            Freezer_LoadShedTime = FreezerDemandResponse_Inputs(3)*60*time_step + FreezerDemandResponse_Inputs(4)*time_step + (FreezerDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
            Freezer_LoadShedTime = Freezer_LoadShedTime + (FreezerDemandResponse_Inputs(6) - 1)*24*60*time_step + randi([0, FreezerDemandResponse_Inputs(7)*time_step]);
            Freezer_AdjustmentTime = FreezerDemandResponse_Inputs(10)*60*time_step + FreezerDemandResponse_Inputs(11)*time_step + (FreezerDemandResponse_Inputs(12) - 1)*12*60*time_step + 1;
            Freezer_AdjustmentTime = Freezer_AdjustmentTime + (FreezerDemandResponse_Inputs(13) - 1)*24*60*time_step + randi([0, FreezerDemandResponse_Inputs(14)*time_step]);
            Freezer_AdjustmentTime2 = FreezerDemandResponse_Inputs(15)*60*time_step + FreezerDemandResponse_Inputs(16)*time_step + (FreezerDemandResponse_Inputs(17) - 1)*12*60*time_step + 1;
            Freezer_AdjustmentTime2 = Freezer_AdjustmentTime2 + (FreezerDemandResponse_Inputs(18) - 1)*24*60*time_step + randi([0, FreezerDemandResponse_Inputs(19)*time_step]);
        else
            Freezer_DR_LoadShed = 0;            % Home's Freezer Does Not Particpate in Demand Repsonse (Load Shed)
            Freezer_DR_AdjustThermostat = 0;    % Home's Freezer Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        end
        
        if (rand(1) <= FreezerDemandResponse_Inputs(1)/100) && (Freezer_Type2 ~= 0)
            
            Freezer_DR_LoadShed2 = FreezerDemandResponse_Inputs(2);         % Determine if Home's Second Freezer Particpates in Demand Repsonse (Load Shed)
            Freezer_DR_AdjustThermostat2 = FreezerDemandResponse_Inputs(8); % Determine if Home's Second Freezer Particpates in Demand Repsonse (Adjust Thermostat)
            
            if FreezerDemandResponse_Inputs(3) == 12; FreezerDemandResponse_Inputs(3) = 0; end
            if FreezerDemandResponse_Inputs(10) == 12; FreezerDemandResponse_Inputs(10) = 0; end
            if FreezerDemandResponse_Inputs(15) == 12; FreezerDemandResponse_Inputs(15) = 0; end
            
            Freezer_LoadShedTime2 = FreezerDemandResponse_Inputs(3)*60*time_step + FreezerDemandResponse_Inputs(4)*time_step + (FreezerDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
            Freezer_LoadShedTime2 = Freezer_LoadShedTime2 + (FreezerDemandResponse_Inputs(6) - 1)*24*60*time_step + randi([0, FreezerDemandResponse_Inputs(7)*time_step]);
            Freezer_AdjustmentTime3 = FreezerDemandResponse_Inputs(10)*60*time_step + FreezerDemandResponse_Inputs(11)*time_step + (FreezerDemandResponse_Inputs(12) - 1)*12*60*time_step + 1;
            Freezer_AdjustmentTime3 = Freezer_AdjustmentTime3 + (FreezerDemandResponse_Inputs(13) - 1)*24*60*time_step + randi([0, FreezerDemandResponse_Inputs(14)*time_step]);
            Freezer_AdjustmentTime4 = FreezerDemandResponse_Inputs(15)*60*time_step + FreezerDemandResponse_Inputs(16)*time_step + (FreezerDemandResponse_Inputs(17) - 1)*12*60*time_step + 1;
            Freezer_AdjustmentTime4 = Freezer_AdjustmentTime4 + (FreezerDemandResponse_Inputs(18) - 1)*24*60*time_step + randi([0, FreezerDemandResponse_Inputs(19)*time_step]);
        else
            Freezer_DR_LoadShed2 = 0;           % Home's Second Freezer Does Not Particpate in Demand Repsonse (Load Shed)
            Freezer_DR_AdjustThermostat2 = 0;   % Home's Second Freezer Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        end
        
        if (rand(1) <= WasherDryerDemandResponse_Inputs(1)/100) && (Washer_Type ~= 0 || Dryer_Type ~= 0)
            
            WasherDryer_DR_DeferLoad = WasherDryerDemandResponse_Inputs(2); % Home's Washer and Dryer Particpate in Demand Repsonse (Defer Load)
        else
            WasherDryer_DR_DeferLoad = 0;   % Home's Washer and Dryer Do Not Particpate in Demand Repsonse (Defer Load)
        end
        
        if (rand(1) <= DishwasherDemandResponse_Inputs(1)/100) && (Dishwasher_Type ~= 0)
            
            Dishwasher_DR_DeferLoad = DishwasherDemandResponse_Inputs(2);   % Home's Dishwasher Particpates in Demand Repsonse (Defer Load)
        else
            Dishwasher_DR_DeferLoad = 0;    % Home's Dishwasher Does Not Particpate in Demand Repsonse (Defer Load)
        end
    else
        HVAC_DR_LoadShed = 0;                   % Home's HVAC Does Not Particpate in Demand Repsonse (Load Shed)
        HVAC_DR_AdjustThermostat = 0;           % Home's HVAC Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        WaterHeater_DR_LoadShed = 0;            % Home's Water Heater Does Not Particpate in Demand Repsonse (Load Shed)
        WaterHeater_DR_AdjustThermostat = 0;    % Home's Water Heater Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        Refrigerator_DR_LoadShed = 0;           % Home's Refrigerator Does Not Particpate in Demand Repsonse (Load Shed)
        Refrigerator_DR_AdjustThermostat = 0;   % Home's Refrigerator Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        Refrigerator_DR_LoadShed2 = 0;          % Home's Second Refrigerator Does Not Particpate in Demand Repsonse (Load Shed)
        Refrigerator_DR_AdjustThermostat2 = 0;  % Home's Second Refrigerator Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        Freezer_DR_LoadShed = 0;                % Home's Freezer Does Not Particpate in Demand Repsonse (Load Shed)
        Freezer_DR_AdjustThermostat = 0;        % Home's Freezer Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        Freezer_DR_LoadShed2 = 0;               % Home's Second Freezer Does Not Particpate in Demand Repsonse (Load Shed)
        Freezer_DR_AdjustThermostat2 = 0;       % Home's Second Freezer Does Not Particpate in Demand Repsonse (Adjust Thermostat)
        WasherDryer_DR_DeferLoad = 0;           % Home's Washer and Dryer Do Not Particpate in Demand Repsonse (Defer Load)
        Dishwasher_DR_DeferLoad = 0;            % Home's Dishwasher Does Not Particpate in Demand Repsonse (Defer Load)
    end
    
    
    % Randomly Generate Occupants in a Home based upon Statistics for Number of Occupants per Home and Occupant Types per Home
    
    if exist(fullfile(inputdata,'User Settings','Occupant_Override.csv'),'file') == 2   % Use Defined Occupant Makeup If Given
        
        Occupants_Matrix = importdata(fullfile(inputdata,'User Settings','Occupant_Override.csv')); % Occupant Matrix (All Homes)
        
        Occupants = Occupants_Matrix.data(:,i); % Occupant Matrix (Individual Home)
        Occupants(isnan(Occupants)) = [];       % Remove NaN Values
        
        OccNum = length(Occupants);     % Number of Occupants in Home
    else
        CumSum_OccNum = cumsum(OccupantsPerHome_Inputs(:,1), 1);    % Cumulative Sum of Occupants per Household Statistics
        OccNum = find(CumSum_OccNum(end,1)*rand(1) <= CumSum_OccNum, 1, 'first');   % Randomly Select Number of Occupants in Home based on Statistics
        
        Occupants = zeros(OccNum,1);    % Initialize Occupant Matrix
        
        for j = 1:length(Occupants)     % Populate Occupant Matrix with Generated Occupant Types
            
            CumSum_OccType = cumsum(Occupant_Inputs(:,1), 1);   % Cumulative Sum of Occupant Types per Household Statistics
            Occupants(j,1) = find(CumSum_OccType(end,1)*rand(1) <= CumSum_OccType, 1, 'first'); % Randomly Select Occupant Types in Home based on Statistics
        end
    end
    
    
    % Define Lighting Model Parameters (Widen Model)
    
    L_lim = 1000;               % (lux) Limiting Daylight Level
    Q_adj = 1/(10*time_step);   % (%) Lighting Adjustment Probability (Assumes Lighting Level is Checked and Adjusted Every 10 Minutes)
    Delta_P = 40;               % (W) Incremental Lighting Power
    
    Prev_SimPower = zeros(OccNum,1);    % Initialize Previous Simulated Lighting Power
    Prev_SimPower2 = zeros(OccNum,1);   % Initialize Previous Simulated Lighting Power
    
    P_absent = zeros(OccNum,1);         % Initialize Absent Lighting Power Matrix
    P_inactive = zeros(OccNum,1);       % Initialize Inactive Lighting Power Matrix
    P_min = zeros(OccNum,1);            % Initialize Minimum Lighting Power Matrix
    P_max = zeros(OccNum,1);            % Initialize Maximum Lighting Power Matrix
    
    for j = 1:OccNum    % Assign Lighting Parameters for each Occupant
        
        if rand(1) <= 0.6               % (W) Absent State Lighting Power Parameters
            P_absent(j,1) = 0*Delta_P;
        else
            P_absent(j,1) = 1*Delta_P;
        end
        
        if rand(1) <= 0.6               % (W) Inactive State Lighting Power Parameters
            P_inactive(j,1) = 0*Delta_P;
        else
            P_inactive(j,1) = 1*Delta_P;
        end
        
        if rand(1) <= 0.8               % (W) Minimum Lighting Power Parameters
            P_min(j,1) = 1*Delta_P;
        else
            P_min(j,1) = 2*Delta_P;
        end
        
        if rand(1) <= 0.6               % (W) Maximum Lighting Power Parameters
            P_max(j,1) = 4*Delta_P;
        else
            P_max(j,1) = 5*Delta_P;
        end
    end
    
    
    % Randomly Generate a Lighting Profile for each Occupant in the Home based on Statistics
    
    CumSum_LightingType = cumsum([Uninterruptible_Inputs(14) Uninterruptible_Inputs(15) Uninterruptible_Inputs(16) Uninterruptible_Inputs(17) Uninterruptible_Inputs(18)]); % Cumulative Sum of Lighting Types
    LightsPerOccupant =  max(P_max)/Delta_P;    % Number of Lights per Occupant
    
    Lighting_Profile = zeros(OccNum,LightsPerOccupant); % Initialize Lighting Profile Matrix
    
    for j = 1:OccNum    % Assign a Lighting Profile for each Occupant
        
        for k = 1:LightsPerOccupant
            
            Lighting_Profile(j,k) = find(CumSum_LightingType(1,end)*rand(1) <= CumSum_LightingType, 1, 'first');    % Randomly Select Lighting Profile per Occupant based on Statistics
        end
    end
    
    
    % Vary Environmental Input Data
    
    Outdoor_Temp_Adjust = -2.5 + (2.5 + 2.5)*rand(1);   % (F) Adjust Outdoor Air Temperature by + or - 2.5 F
    Solar_Adjust = 0.90 + (1.10 - 0.90)*rand(1);        % (%) Adjust Solar Irradiance/Illuminance by + or - 10 %
    
    
    % Set Initial HVAC Mode
    
    Heating = get(handles.Heating_RadioButton);
    Cooling = get(handles.Cooling_RadioButton);
    Auto = get(handles.Auto_RadioButton);
    
    if Heating.Value == 1
        
        HVAC_Mode = 1;          % (Heating) HVAC Mode
        HVAC_AutoMode = 0;      % HVAC Mode is Not Adjusted Automatically
        
    elseif Cooling.Value == 1
        
        HVAC_Mode = -1;         % (Cooling) HVAC Mode
        HVAC_AutoMode = 0;      % HVAC Mode is Not Adjusted Automatically
        
    elseif Auto.Value == 1
        
        if mean(Outdoor_Temp2(1:24*60*time_step) + Outdoor_Temp_Adjust) < mean([median([HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3), 60, 85]), median([HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3), 60, 85])])
            
            if HVAC_HeatingType == 0;
                
                HVAC_Mode = 0;  % (Off) HVAC Mode
            else
                HVAC_Mode = 1;  % (Heating) HVAC Mode
            end
        else
            if HVAC_CoolingType == 0;
                
                HVAC_Mode = 0;  % (Off) HVAC Mode
            else
                HVAC_Mode = -1; % (Cooling) HVAC Mode
            end
        end
        
        HVAC_AutoMode = 1;      % HVAC Mode is Adjusted Automatically
    end
    
    
    % Set Initial Temperatures
    
    WaterInlet_Temp = 54 + (60 - 54)*rand(1);   % (F) Temperature of the Water Entering the Home (Average Estimated From Campbell Creek Home Data)
    
    % Water Heater Water Temperature
    
    if (WaterHeater_Inputs(9) + WaterHeater_Inputs(10)*Scaling_Factor(3)) < 100     % (F) Minimum Water Heater Thermostat Setting (100 F)
        WaterHeater_Thermostat = 100;
    elseif (WaterHeater_Inputs(9) + WaterHeater_Inputs(10)*Scaling_Factor(3)) > 160 % (F) Maximum Water Heater Thermostat Setting (160 F)
        WaterHeater_Thermostat = 160;
    else
        WaterHeater_Thermostat = WaterHeater_Inputs(9) + WaterHeater_Inputs(10)*Scaling_Factor(3);   % (F) Water Heater Thermostat Setting
    end
    
    Water_Temp = (WaterHeater_Thermostat - WaterHeater_Inputs(11)/2) +...   % (F) Initial Water Heater Water Temperature
        ((WaterHeater_Thermostat + WaterHeater_Inputs(11)/2) -...
        (WaterHeater_Thermostat - WaterHeater_Inputs(11)/2))*rand(1);
    
    Water_TempU = Water_Temp;   % (F) Initial Water Heater Water Temperature (Upper Layer)
    Water_TempL = Water_Temp;   % (F) Initial Water Heater Water Temperature (Lower Layer)
    
    Water_Temp_DR = Water_Temp;     % (F) Initial Water Heater Water Temperature (Demand Response)
    Water_TempU_DR = Water_TempU;   % (F) Initial Water Heater Water Temperature (Upper Layer) (Demand Response)
    Water_TempL_DR = Water_TempL;   % (F) Initial Water Heater Water Temperature (Upper Layer) (Demand Response)
    
    % Temperature of Refrigerator Interior
    
    if (RefrigeratorFreezer_Inputs(5) + RefrigeratorFreezer_Inputs(6)*Scaling_Factor(3)) < 34       % (F) Minimum Refrigerator Thermostat Setting (34 F)
        Refrigerator_Thermostat = 34;
    elseif (RefrigeratorFreezer_Inputs(5) + RefrigeratorFreezer_Inputs(6)*Scaling_Factor(3)) > 40   % (F) Maximum Refrigerator Thermostat Setting (40 F)
        Refrigerator_Thermostat = 40;
    else
        Refrigerator_Thermostat = RefrigeratorFreezer_Inputs(5) + RefrigeratorFreezer_Inputs(6)*Scaling_Factor(3);  % (F) Refrigerator Thermostat Setting
    end
    
    Refrigerator_Temp = (Refrigerator_Thermostat - RefrigeratorFreezer_Inputs(7)/2) +...    % (F) Initial Temperature of Refrigerator Interior
        ((Refrigerator_Thermostat + RefrigeratorFreezer_Inputs(7)/2) -...
        (Refrigerator_Thermostat - RefrigeratorFreezer_Inputs(7)/2))*rand(1);
    
    Refrigerator_Temp_DR = Refrigerator_Temp;   % (F) Initial Temperature of Refrigerator Interior (Demand Response)
    
    % Temperature of Second Refrigerator Interior
    
    if (RefrigeratorFreezer_Inputs2(5) + RefrigeratorFreezer_Inputs2(6)*Scaling_Factor(3)) < 34     % (F) Minimum Second Refrigerator Thermostat Setting (34 F)
        Refrigerator_Thermostat2 = 34;
    elseif (RefrigeratorFreezer_Inputs2(5) + RefrigeratorFreezer_Inputs2(6)*Scaling_Factor(3)) > 40 % (F) Maximum Second Refrigerator Thermostat Setting (40 F)
        Refrigerator_Thermostat2 = 40;
    else
        Refrigerator_Thermostat2 = RefrigeratorFreezer_Inputs2(5) + RefrigeratorFreezer_Inputs2(6)*Scaling_Factor(3);   % (F) Second Refrigerator Thermostat Setting
    end
    
    Refrigerator_Temp2 = (Refrigerator_Thermostat2 - RefrigeratorFreezer_Inputs2(7)/2) +... % (F) Initial Temperature of Second Refrigerator Interior
        ((Refrigerator_Thermostat2 + RefrigeratorFreezer_Inputs2(7)/2) -...
        (Refrigerator_Thermostat2 - RefrigeratorFreezer_Inputs2(7)/2))*rand(1);
    
    Refrigerator_Temp2_DR = Refrigerator_Temp2; % (F) Initial Temperature of Second Refrigerator Interior (Demand Response)
    
    % Temperature of Freezer Interior
    
    if (RefrigeratorFreezer_Inputs(12) + RefrigeratorFreezer_Inputs(13)*Scaling_Factor(3)) < -10    % (F) Minimum Freezer Thermostat Setting (-10 F)
        Freezer_Thermostat = -10;
    elseif (RefrigeratorFreezer_Inputs(12) + RefrigeratorFreezer_Inputs(13)*Scaling_Factor(3)) > 0  % (F) Maximum Freezer Thermostat Setting (0 F)
        Freezer_Thermostat = 0;
    else
        Freezer_Thermostat = RefrigeratorFreezer_Inputs(12) + RefrigeratorFreezer_Inputs(13)*Scaling_Factor(3); % (F) Freezer Thermostat Setting
    end
    
    Freezer_Temp = (Freezer_Thermostat - RefrigeratorFreezer_Inputs(14)/2) +... % (F) Initial Temperature of Freezer Interior
        ((Freezer_Thermostat + RefrigeratorFreezer_Inputs(14)/2) -...
        (Freezer_Thermostat - RefrigeratorFreezer_Inputs(14)/2))*rand(1);
    
    Freezer_Temp_DR = Freezer_Temp; % (F) Initial Temperature of Freezer Interior (Demand Response)
    
    % Temperature of Second Freezer Interior
    
    if (RefrigeratorFreezer_Inputs2(12) + RefrigeratorFreezer_Inputs2(13)*Scaling_Factor(3)) < -10      % (F) Minimum Second Freezer Thermostat Setting (-10 F)
        Freezer_Thermostat2 = -10;
    elseif (RefrigeratorFreezer_Inputs2(12) + RefrigeratorFreezer_Inputs2(13)*Scaling_Factor(3)) > 0    % (F) Maximum Second Freezer Thermostat Setting (0 F)
        Freezer_Thermostat2 = 0;
    else
        Freezer_Thermostat2 = RefrigeratorFreezer_Inputs2(12) + RefrigeratorFreezer_Inputs2(13)*Scaling_Factor(3);  % (F) Second Freezer Thermostat Setting
    end
    
    Freezer_Temp2 = (Freezer_Thermostat2 - RefrigeratorFreezer_Inputs2(14)/2) +...  % (F) Initial Temperature of Second Freezer Interior
        ((Freezer_Thermostat2 + RefrigeratorFreezer_Inputs2(14)/2) -...
        (Freezer_Thermostat2 - RefrigeratorFreezer_Inputs2(14)/2))*rand(1);
    
    Freezer_Temp2_DR = Freezer_Temp2;   % (F) Initial Temperature of Second Freezer Interior (Demand Response)
    
    % Temperature of Air in Home, Mass of Home, and Envelope of Home
    
    if HVAC_Mode == 1   % If HVAC Mode is Heating
        
        if (HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3)) < 60       % (F) Minimum HVAC Thermostat Setting (60 F)
            HVAC_Thermostat = 60;
        elseif (HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3)) > 85   % (F) Maximum HVAC Thermostat Setting (85 F)
            HVAC_Thermostat = 85;
        else
            HVAC_Thermostat = HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3);  % (F) HVAC Thermostat Setting
        end
        
    elseif HVAC_Mode == -1  % If HVAC Mode is Cooling
        
        if (HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3)) < 60       % (F) Minimum HVAC Thermostat Setting (60 F)
            HVAC_Thermostat = 60;
        elseif (HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3)) > 85   % (F) Maximum HVAC Thermostat Setting (85 F)
            HVAC_Thermostat = 85;
        else
            HVAC_Thermostat = HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3);  % (F) HVAC Thermostat Setting
        end
        
    else    % If HVAC Mode is Off
        
        HVAC_Thermostat = (HomeHVAC_Inputs(21) + HomeHVAC_Inputs(22))/2;    % (F) HVAC Thermostat Setting
    end
    
    Indoor_Temp = (HVAC_Thermostat - HomeHVAC_Inputs(24)/2) +...    % (F) Temperature of Air in Home
        ((HVAC_Thermostat + HomeHVAC_Inputs(24)/2) -...
        (HVAC_Thermostat - HomeHVAC_Inputs(24)/2))*rand(1);
    
    Mass_Temp = HVAC_Thermostat;                                                        % (F) Temperature of Mass of Home
    Envelope_Temp = 0.0057*Outdoor_Temp2(1,1)^2 + 0.0657*Outdoor_Temp2(1,1) + 46.398;   % (F) Temperature of Envelope of Home
    
    Indoor_Temp_DR = Indoor_Temp;       % (F) Temperature of Air in Home (Demand Response)
    Mass_Temp_DR = Mass_Temp;           % (F) Temperature of Mass of Home (Demand Response)
    Envelope_Temp_DR = Envelope_Temp;   % (F) Temperature of Envelope of Home (Demand Response)
    
    
    % Initialize/Set Appliance Timers
    
    RefrigeratorDoor_Timer = 0;                                             % (s or min) Refrigerator Door Timer (Counts When Door is Opened)
    RefrigeratorDefrost_Timer = randi(8*60*time_step + 10*time_step, 1);    % (s or min) Refrigerator Defrost Timer (Counts Until Preset Time is Reached)
    RefrigeratorDoor_Timer2 = 0;                                            % (s or min) Second Refrigerator Door Timer (Counts When Door is Opened)
    RefrigeratorDefrost_Timer2 = randi(8*60*time_step + 10*time_step, 1);   % (s or min) Second Refrigerator Defrost Timer (Counts Until Preset Time is Reached)
    
    FreezerDoor_Timer = 0;                                              % (s or min) Freezer Door Timer (Counts When Door is Opened)
    FreezerDefrost_Timer = randi(8*60*time_step + 10*time_step, 1);     % (s or min) Freezer Defrost Timer (Counts Until Preset Time is Reached)
    FreezerDoor_Timer2 = 0;                                             % (s or min) Second Freezer Door Timer (Counts When Door is Opened)
    FreezerDefrost_Timer2 = randi(8*60*time_step + 10*time_step, 1);    % (s or min) Second Freezer Defrost Timer (Counts Until Preset Time is Reached)
    
    Washer_CycleTime = 45*time_step;        % (s or min) Washer Cycle Time
    Dryer_CycleTime = 70*time_step;         % (s or min) Dryer Cycle Time
    Dishwasher_CycleTime = 90*time_step;    % (s or min) Dishwasher Cycle Time
    
    Washer_Timer = 0;       % (s or min) Washer Timer (Counts When Washer is On)
    Dryer_Timer = 0;        % (s or min) Dryer Timer (Counts When Dryer is On)
    Dishwasher_Timer = 0;   % (s or min) Dishwasher Timer (Counts When Dishwasher is On)
    Shower_Timer = 0;       % (s or min) Shower Timer (Counts When Shower is in Use)
    Bath_Timer = 0;         % (s or min) Bath Timer (Counts When Bath is in Use)
    Sink_Timer = 0;         % (s or min) Sink Timer (Counts When Sink is in Use)
    
    % Initialize/Set Appliance Timers (Demand Response)
    
    RefrigeratorDoor_Timer_DR = RefrigeratorDoor_Timer;         % (s or min) Refrigerator Door Timer (Counts When Door is Opened) (Demand Response)
    RefrigeratorDefrost_Timer_DR = RefrigeratorDefrost_Timer;   % (s or min) Refrigerator Defrost Timer (Counts Until Preset Time is Reached) (Demand Response)
    RefrigeratorDoor_Timer2_DR = RefrigeratorDoor_Timer2;       % (s or min) Second Refrigerator Door Timer (Counts When Door is Opened) (Demand Response)
    RefrigeratorDefrost_Timer2_DR = RefrigeratorDefrost_Timer2; % (s or min) Second Refrigerator Defrost Timer (Counts Until Preset Time is Reached) (Demand Response)
    
    FreezerDoor_Timer_DR = FreezerDoor_Timer;           % (s or min) Freezer Door Timer (Counts When Door is Opened) (Demand Response)
    FreezerDefrost_Timer_DR = FreezerDefrost_Timer;     % (s or min) Freezer Defrost Timer (Counts Until Preset Time is Reached) (Demand Response)
    FreezerDoor_Timer2_DR = FreezerDoor_Timer2;         % (s or min) Second Freezer Door Timer (Counts When Door is Opened) (Demand Response)
    FreezerDefrost_Timer2_DR = FreezerDefrost_Timer2;   % (s or min) Second Freezer Defrost Timer (Counts Until Preset Time is Reached) (Demand Response)
    
    
    % Initialize Electric Vehicle Settings
    
    EV_User = zeros(length(Occupants),1);   % Electric Vehicle Occupant Possesion Matrix
    EV_SOC = 1;                             % (%) Initial Electric Vehicle State of Charge
    
    
    % Initialize Activity Matrix and Randomly Generate Update Time
    
    Activity = zeros(OccNum,1);     % Initialize Activity Matrix
    
    if time_step == 60              % If Simulation Time Step is 1 Second
        Update_Time = randi(60,1);  % (s) Update Occupant Activities for a Home at a Randomly Selected Second Every Minute
    elseif time_step == 1           % If Simulation Time Step is 1 Minute
        Update_Time = 1;            % (min) Update Occupant Activities for a Home Every Minute
    end
    
    
    % Simulate Residential Model
    
    for t = 1:length(time)
        
        % Display Program Status
        
        if mod(t, 24*60*time_step) == 1
            if t == 1
                set(handles.ProgramStatus, 'String', strcat({'Simulating Day '}, num2str(ceil(t/(24*60*time_step))), {' of '}, num2str(simlength)));
                set(handles.ProgramStatus2, 'String', strcat({'Simulating Home '}, num2str(i), {' of '}, num2str(numberofhomes)));
                pause(0.001);
            else
                set(handles.ProgramStatus, 'String', strcat({'Simulating Day '}, num2str(ceil(t/(24*60*time_step))), {' of '}, num2str(simlength)));
                pause(0.001);
            end
        end
        
        
        % Load Environmental Input Data
        
        Outdoor_Temp = Outdoor_Temp2(t) + Outdoor_Temp_Adjust;  % (F) Outdoor Air Temperature
        Direct_Irrad = Direct_Irrad2(t)*Solar_Adjust;           % (W/m^2) Direct Normal Irradiance
        Diffuse_Irrad = Diffuse_Irrad2(t)*Solar_Adjust;         % (W/m^2) Diffuse Horizontal Irradiance
        Diffuse_Illum = Diffuse_Illum2(t)*Solar_Adjust;         % (lux) Diffuse Horizontal Illuminance
        
        
        % Automatically Set HVAC Mode
        
        if HVAC_AutoMode == 1 && mod(t, 24*60*time_step) == 1
            
            if mean(Outdoor_Temp2(t:t + 24*60*time_step - 1) + Outdoor_Temp_Adjust) < median([HomeHVAC_Inputs(21) + HomeHVAC_Inputs(23)*Scaling_Factor(3), 60, 85])
                
                if HVAC_HeatingType == 0;
                    
                    HVAC_Mode = 0;
                else
                    HVAC_Mode = 1;
                end
                
            elseif mean(Outdoor_Temp2(t:t + 24*60*time_step - 1) + Outdoor_Temp_Adjust) > median([HomeHVAC_Inputs(22) + HomeHVAC_Inputs(23)*Scaling_Factor(3), 60, 85])
                
                if HVAC_CoolingType == 0;
                    
                    HVAC_Mode = 0;
                else
                    HVAC_Mode = -1;
                end
            end
        end
        
        
        % Set Deferrable Demand Response Parameters
        
        if mod(t, 24*60*time_step) == 1 && Simulate_DemandResponse == 1    % If User is Simulating Demand Response
            
            if WasherDryer_DR_DeferLoad ~= 0;   % If Home's Washer and Dryer Particpate in Demand Repsonse (Defer Load)
                
                if WasherDryerDemandResponse_Inputs(3) == 12; WasherDryerDemandResponse_Inputs(3) = 0; end
                if WasherDryerDemandResponse_Inputs(6) == 12; WasherDryerDemandResponse_Inputs(6) = 0; end
                
                WasherDryer_DeferLoadTime = (t - 1) + WasherDryerDemandResponse_Inputs(3)*60*time_step + WasherDryerDemandResponse_Inputs(4)*time_step + (WasherDryerDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
                WasherDryer_DeferLoadTime2 = (t - 1) + WasherDryerDemandResponse_Inputs(6)*60*time_step + WasherDryerDemandResponse_Inputs(7)*time_step + (WasherDryerDemandResponse_Inputs(8) - 1)*12*60*time_step + 1;
            end
            
            if Dishwasher_DR_DeferLoad ~= 0;    % If Home's Dishwasher Particpates in Demand Repsonse (Defer Load)
                
                if DishwasherDemandResponse_Inputs(3) == 12; DishwasherDemandResponse_Inputs(3) = 0; end
                if DishwasherDemandResponse_Inputs(6) == 12; DishwasherDemandResponse_Inputs(6) = 0; end
                
                Dishwasher_DeferLoadTime = (t - 1) + DishwasherDemandResponse_Inputs(3)*60*time_step + DishwasherDemandResponse_Inputs(4)*time_step + (DishwasherDemandResponse_Inputs(5) - 1)*12*60*time_step + 1;
                Dishwasher_DeferLoadTime2 = (t - 1) + DishwasherDemandResponse_Inputs(6)*60*time_step + DishwasherDemandResponse_Inputs(7)*time_step + (DishwasherDemandResponse_Inputs(8) - 1)*12*60*time_step + 1;
            end
        end
        
        
        % Occupant Model
        
        if mod(t, Update_Time) == 0 || t == 1   % Only Update Occupant Activities Once per Minute
            
            min = ceil(t/time_step);    % Determine Current Minute (Round Up: i.e. 95 Seconds = 2nd Minute)
            
            [Activity, WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob,...
                NF_Occ_Act_Prob, C_Occ_Act_Prob, Tot_Occ_Act_Prob] = Occupant_Model...
                (t, min, start_time, Occupants, Activity, WM_Markov_Model, WM_Prob_Model,...
                NM_Markov_Model, NM_Prob_Model, WF_Markov_Model, WF_Prob_Model,...
                NF_Markov_Model, NF_Prob_Model, C_Markov_Model, C_Prob_Model,...
                WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob, NF_Occ_Act_Prob,...
                C_Occ_Act_Prob, Tot_Occ_Act_Prob);
            
            Update_Time = Update_Time + time_step;  % Increment Update Time by One Minute
        end
        
        
        % Deferrable Load Models
        
        [Washer_Power, Washer_Timer, Dryer_Power, Dryer_Timer, Dishwasher_Power, Dishwasher_Timer]...
            = Deferrable_Model (Deferrable_Inputs, Washer_Type, Dryer_Type, Dishwasher_Type, Washer_CycleTime,...
            Dryer_CycleTime, Dishwasher_CycleTime, Washer_Timer, Dryer_Timer, Dishwasher_Timer, Activity, Scaling_Factor);
        
        Washer_Power_hold(t) = Washer_Power;            % (W) Washer Power Demand
        Dryer_Power_hold(t) = Dryer_Power;              % (W) Dryer Power Demand
        Dishwasher_Power_hold(t) = Dishwasher_Power;    % (W) Dishwasher Power Demand
        
        
        % If User is Simulating Demand Response and Home has a Deferrable Load
        
        if (Simulate_DemandResponse == 1) && (Washer_Type ~= 0 || Dryer_Type ~= 0 || Dishwasher_Type ~= 0)
            
            if WasherDryer_DR_DeferLoad ~= 0    % If Home's Washer/Dryer Particpates in Demand Repsonse
                
                % Adjust Times if Washer or Dryer is in Middle of Cycle
                
                if (t == WasherDryer_DeferLoadTime) && (Washer_Timer > 1 || Dryer_Timer > 1)
                    if Washer_Timer > 1
                        WasherDryer_DeferLoadTime = WasherDryer_DeferLoadTime + Washer_CycleTime*time_step - Washer_Timer;
                    end
                    if Dryer_Timer > 1 || Washer_Timer > 1
                        WasherDryer_DeferLoadTime = WasherDryer_DeferLoadTime + Dryer_Type*Dryer_CycleTime*time_step - Dryer_Timer + 1;
                    end
                end
                
                if (t == WasherDryer_DeferLoadTime2) && (Washer_Timer > 1 || Dryer_Timer > 1)
                    if Washer_Timer > 1
                        WasherDryer_DeferLoadTime2 = WasherDryer_DeferLoadTime2 + Washer_CycleTime*time_step - Washer_Timer;
                    end
                    if Dryer_Timer > 1 || Washer_Timer > 1
                        WasherDryer_DeferLoadTime2 = WasherDryer_DeferLoadTime2 + Dryer_Type*Dryer_CycleTime*time_step - Dryer_Timer + 1;
                    end
                end
                
                % Determine Washer and Dryer Power Demand (Demand Response)
                
                if t >= WasherDryer_DeferLoadTime && t < WasherDryer_DeferLoadTime2     % Defer Washer and Dryer Operation
                    
                    Washer_Power_DR_hold(t) = 0;            % (W) Washer Power Demand (Demand Response)
                    Dryer_Power_DR_hold(t) = 0;             % (W) Dryer Power Demand (Demand Response)
                else
                    Washer_Power_DR_hold(t) = Washer_Power; % (W) Washer Power Demand (Demand Response)
                    Dryer_Power_DR_hold(t) = Dryer_Power;   % (W) Dryer Power Demand (Demand Response)
                end
            else
                Washer_Power_DR_hold(t) = Washer_Power;     % (W) Washer Power Demand (Demand Response)
                Dryer_Power_DR_hold(t) = Dryer_Power;       % (W) Dryer Power Demand (Demand Response)
            end
            
            
            if Dishwasher_DR_DeferLoad ~= 0 % If Home's Dishwasher Particpates in Demand Repsonse
                
                % Adjust Times if Dishwasher is in Middle of Cycle
                
                if (t == Dishwasher_DeferLoadTime) && (Dishwasher_Timer > 1)
                    Dishwasher_DeferLoadTime = Dishwasher_DeferLoadTime + Dishwasher_CycleTime*time_step - Dishwasher_Timer + 1;
                end
                
                if (t == Dishwasher_DeferLoadTime2) && (Dishwasher_Timer > 1)
                    Dishwasher_DeferLoadTime2 = Dishwasher_DeferLoadTime2 + Dishwasher_CycleTime*time_step - Dishwasher_Timer + 1;
                end
                
                % Determine Dishwasher Power Demand (Demand Response)
                
                if t >= Dishwasher_DeferLoadTime && t < Dishwasher_DeferLoadTime2   % Defer Dishwasher Operation
                    
                    Dishwasher_Power_DR_hold(t) = 0;                % (W) Dishwasher Power Demand (Demand Response)
                else
                    Dishwasher_Power_DR_hold(t) = Dishwasher_Power; % (W) Dishwasher Power Demand (Demand Response)
                end
            else
                Dishwasher_Power_DR_hold(t) = Dishwasher_Power;     % (W) Dishwasher Power Demand (Demand Response)
            end
        end
        
        
        % Uninterruptible Load Models
        
        [Cooking_Power, Television_Power, Computer_Power] = Uninterruptible_Model...
            (Uninterruptible_Inputs, Cooking_Type, Television_Type, Computer_Type, Activity, Scaling_Factor);
        
        Cooking_Power_hold(t) = Cooking_Power;          % (W) Cooking Power Demand
        Television_Power_hold(t) = Television_Power;    % (W) Television Power Demand
        Computer_Power_hold(t) = Computer_Power;        % (W) Computer Power Demand
        
        
        % Lighting Model
        
        if Lighting_Type == 1   % If Home has Lighting
            
            % Daylight Adjusted Lighting Model
            
            if t ~= 1
                L = 0.67*0.60*Diffuse_Illum/2;  % (lux) Daylight Level (Assumes SHGCglazing = 0.67 and WETC = 0.60)
            else
                L = 0;  % (lux) Daylight Level (Assumes Complete Darkness at 12:00 am, Important Since Initial Lighting Level is Set to P_ideal)
            end
            
            [Prev_SimPower, Lighting_Power, Incandescent_Power, Halogen_Power, Fluorescent_Power, CFL_Power, LED_Power]...
                = Lighting_Model(t, Activity, Lighting_Profile, Prev_SimPower, L, L_lim, Q_adj, Delta_P, P_absent,...
                P_inactive, P_min, P_max);
            
            Lighting_Power_hold(t) = Lighting_Power;            % (W) Lighting Power Demand
            Incandescent_Power_hold(t) = Incandescent_Power;    % (W) Incandescent Lighting Power Demand
            Halogen_Power_hold(t) = Halogen_Power;              % (W) Halogen Lighting Power Demand
            Fluorescent_Power_hold(t) = Fluorescent_Power;      % (W) Linear Fluorescent Lighting Power Demand
            CFL_Power_hold(t) = CFL_Power;                      % (W) Compact Fluorescent Lighting Power Demand
            LED_Power_hold(t) = LED_Power;                      % (W) LED Lighting Power Demand
            
            
            % Unadjusted Lighting Model
            
            L = 0*Diffuse_Illum/2;  % (lux) Daylight Level (Assumes No Light Permeates Windows)
            
            [Prev_SimPower2, Lighting_Power2, Incandescent_Power2, Halogen_Power2, Fluorescent_Power2, CFL_Power2, LED_Power2]...
                = Lighting_Model(t, Activity, Lighting_Profile, Prev_SimPower2, L, L_lim, Q_adj, Delta_P, P_absent,...
                P_inactive, P_min, P_max);
            
            Lighting_Power2_hold(t) = Lighting_Power2;          % (W) Lighting Power Demand
            Incandescent_Power2_hold(t) = Incandescent_Power2;  % (W) Incandescent Lighting Power Demand
            Halogen_Power2_hold(t) = Halogen_Power2;            % (W) Halogen Lighting Power Demand
            Fluorescent_Power2_hold(t) = Fluorescent_Power2;    % (W) Linear Fluorescent Lighting Power Demand
            CFL_Power2_hold(t) = CFL_Power2;                    % (W) Compact Fluorescent Lighting Power Demand
            LED_Power2_hold(t) = LED_Power2;                    % (W) LED Lighting Power Demand
        end
        
        
        % Electric Vehicle Model
        
        if EV_Type ~= 0 % If Home has an Electric Vehicle
            
            [EV_Power, EV_SOC, EV1_Power, EV1_SOC, EV2_Power, EV2_SOC, EV3_Power, EV3_SOC, EV_User] = ElectricVehicle_Model...
                (time_step, ElectricVehicle_Inputs, Outdoor_Temp, EV_Type, EV_Position, EV_SOC, EV_User, Occupants, Activity, Scaling_Factor);
            
            EV_Power_hold(t) = EV_Power;    % (W) Electric Vehicle Power Demand
            EV_SOC_hold(t) = EV_SOC;        % (%) Electric Vehicle State of Charge
            EV1_Power_hold(t) = EV1_Power;  % (W) Electric Vehicle Power Demand (Level 1 Charger)
            EV1_SOC_hold(t) = EV1_SOC;      % (%) Electric Vehicle State of Charge (Level 1 Charger)
            EV2_Power_hold(t) = EV2_Power;  % (W) Electric Vehicle Power Demand (Level 2 Charger)
            EV2_SOC_hold(t) = EV2_SOC;      % (%) Electric Vehicle State of Charge (Level 2 Charger)
            EV3_Power_hold(t) = EV3_Power;  % (W) Electric Vehicle Power Demand (Level 3 Charger)
            EV3_SOC_hold(t) = EV3_SOC;      % (%) Electric Vehicle State of Charge (Level 3 Charger)
        end
        
        
        % Refrigerator Model (Primary)
        
        if Refrigerator_Type == 1   % If Home has a Refrigerator
            
            RefrigeratorOpenDoor_rand = rand(1);    % Refrigerator Open Door Random Variable
            
            Refrigerator_ThermostatAdjust = 0;      % (F) Initialize Refrigerator Thermostat Adjustment Parameter
            
            if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                
                [Refrigerator_State, Refrigerator_State_DR] = InitialState_Refrigerator_Model(time_step,...
                    RefrigeratorFreezer_Inputs, RefrigeratorDefrost, Indoor_Temp, Refrigerator_Temp,...
                    Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer, Refrigerator_ThermostatAdjust,...
                    RefrigeratorOpenDoor_rand, Activity, Scaling_Factor);
            end
            
            [Refrigerator_Power, Refrigerator_Temp, Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer]...
                = Refrigerator_Model(time_step, RefrigeratorFreezer_Inputs, RefrigeratorDefrost, Indoor_Temp,...
                Refrigerator_Temp, Refrigerator_State, RefrigeratorDoor_Timer, RefrigeratorDefrost_Timer,...
                Refrigerator_ThermostatAdjust, RefrigeratorOpenDoor_rand, Activity, Scaling_Factor);
            
            Refrigerator_Power_hold(t) = Refrigerator_Power;    % (W) Refrigerator Power Demand
            Refrigerator_Temp_hold(t) = Refrigerator_Temp;      % (F) Temperature of Refrigerator Interior
            
            
            % If User is Simulating Demand Response
            
            if Simulate_DemandResponse == 1
                
                if (Refrigerator_DR_LoadShed + Refrigerator_DR_AdjustThermostat) ~= 0   % If Home's Refrigerator Particpates in Demand Repsonse
                    
                    if Refrigerator_DR_LoadShed == 1 && t == Refrigerator_LoadShedTime  % Shed Refrigerator Load
                        
                        Refrigerator_State_DR = 0;  % Adjust Refrigerator State
                    end
                    if Refrigerator_DR_AdjustThermostat == 1 && t >= Refrigerator_AdjustmentTime && t < Refrigerator_AdjustmentTime2    % Adjust Refrigerator Thermostat
                        
                        Refrigerator_ThermostatAdjust = RefrigeratorDemandResponse_Inputs(9);   % (F) Refrigerator Thermostat Adjustment
                    end
                    
                    [Refrigerator_Power_DR, Refrigerator_Temp_DR, Refrigerator_State_DR, RefrigeratorDoor_Timer_DR, RefrigeratorDefrost_Timer_DR]...
                        = Refrigerator_Model(time_step, RefrigeratorFreezer_Inputs, RefrigeratorDefrost, Indoor_Temp_DR,...
                        Refrigerator_Temp_DR, Refrigerator_State_DR, RefrigeratorDoor_Timer_DR, RefrigeratorDefrost_Timer_DR,...
                        Refrigerator_ThermostatAdjust, RefrigeratorOpenDoor_rand, Activity, Scaling_Factor);
                    
                    Refrigerator_Power_DR_hold(t) = Refrigerator_Power_DR;  % (W) Refrigerator Power Demand (Demand Response)
                    Refrigerator_Temp_DR_hold(t) = Refrigerator_Temp_DR;    % (F) Temperature of Refrigerator Interior (Demand Response)
                else
                    Refrigerator_Power_DR_hold(t) = Refrigerator_Power;     % (W) Refrigerator Power Demand (Demand Response)
                    Refrigerator_Temp_DR_hold(t) = Refrigerator_Temp;       % (F) Temperature of Refrigerator Interior (Demand Response)
                end
            end
        end
        
        
        % Refrigerator Model (Secondary)
        
        if Refrigerator_Type2 == 1  % If Home has a Second Refrigerator
            
            RefrigeratorOpenDoor2_rand = rand(1);   % Second Refrigerator Open Door Random Variable
            
            Refrigerator_ThermostatAdjust2 = 0;     % (F) Initialize Second Refrigerator Thermostat Adjustment Parameter
            
            if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                
                [Refrigerator_State2, Refrigerator_State2_DR] = InitialState_Refrigerator_Model(time_step,...
                    RefrigeratorFreezer_Inputs2, RefrigeratorDefrost2, Indoor_Temp, Refrigerator_Temp2,...
                    Refrigerator_State2, RefrigeratorDoor_Timer2, RefrigeratorDefrost_Timer2, Refrigerator_ThermostatAdjust2,...
                    RefrigeratorOpenDoor2_rand, Activity, Scaling_Factor);
            end
            
            [Refrigerator_Power2, Refrigerator_Temp2, Refrigerator_State2, RefrigeratorDoor_Timer2, RefrigeratorDefrost_Timer2]...
                = Refrigerator_Model(time_step, RefrigeratorFreezer_Inputs2, RefrigeratorDefrost2, Indoor_Temp,...
                Refrigerator_Temp2, Refrigerator_State2, RefrigeratorDoor_Timer2, RefrigeratorDefrost_Timer2,...
                Refrigerator_ThermostatAdjust2, RefrigeratorOpenDoor2_rand, Activity, Scaling_Factor);
            
            Refrigerator_Power2_hold(t) = Refrigerator_Power2;  % (W) Second Refrigerator Power Demand
            Refrigerator_Temp2_hold(t) = Refrigerator_Temp2;    % (F) Temperature of Second Refrigerator Interior
            
            
            % If User is Simulating Demand Response
            
            if Simulate_DemandResponse == 1
                
                if (Refrigerator_DR_LoadShed2 + Refrigerator_DR_AdjustThermostat2) ~= 0     % If Home's Second Refrigerator Particpates in Demand Repsonse
                    
                    if Refrigerator_DR_LoadShed2 == 1 && t == Refrigerator_LoadShedTime2    % Shed Second Refrigerator Load
                        
                        Refrigerator_State2_DR = 0; % Adjust Second Refrigerator State
                    end
                    if Refrigerator_DR_AdjustThermostat2 == 1 && t >= Refrigerator_AdjustmentTime3 && t < Refrigerator_AdjustmentTime4  % Adjust Second Refrigerator Thermostat
                        
                        Refrigerator_ThermostatAdjust2 = RefrigeratorDemandResponse_Inputs(9);  % (F) Second Refrigerator Thermostat Adjustment
                    end
                    
                    [Refrigerator_Power2_DR, Refrigerator_Temp2_DR, Refrigerator_State2_DR, RefrigeratorDoor_Timer2_DR, RefrigeratorDefrost_Timer2_DR]...
                        = Refrigerator_Model(time_step, RefrigeratorFreezer_Inputs2, RefrigeratorDefrost2, Indoor_Temp_DR,...
                        Refrigerator_Temp2_DR, Refrigerator_State2_DR, RefrigeratorDoor_Timer2_DR, RefrigeratorDefrost_Timer2_DR,...
                        Refrigerator_ThermostatAdjust2, RefrigeratorOpenDoor2_rand, Activity, Scaling_Factor);
                    
                    Refrigerator_Power_DR2_hold(t) = Refrigerator_Power2_DR;    % (W) Second Refrigerator Power Demand (Demand Response)
                    Refrigerator_Temp_DR2_hold(t) = Refrigerator_Temp2_DR;      % (F) Temperature of Second Refrigerator Interior (Demand Response)
                else
                    Refrigerator_Power_DR2_hold(t) = Refrigerator_Power2;       % (W) Second Refrigerator Power Demand (Demand Response)
                    Refrigerator_Temp_DR2_hold(t) = Refrigerator_Temp2;         % (F) Temperature of Second Refrigerator Interior (Demand Response)
                end
            end
        end
        
        
        % Freezer Model (Primary)
        
        if Freezer_Type == 1    % If Home has a Freezer
            
            FreezerOpenDoor_rand = rand(1); % Freezer Open Door Random Variable
            
            Freezer_ThermostatAdjust = 0;   % (F) Initialize Freezer Thermostat Adjustment Parameter
            
            if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                
                [Freezer_State, Freezer_State_DR] = InitialState_Freezer_Model(time_step,...
                    RefrigeratorFreezer_Inputs, FreezerDefrost, Indoor_Temp, Freezer_Temp,...
                    Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer, Freezer_ThermostatAdjust,...
                    FreezerOpenDoor_rand, Activity, Scaling_Factor);
            end
            
            [Freezer_Power, Freezer_Temp, Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer]...
                = Freezer_Model(time_step, RefrigeratorFreezer_Inputs, FreezerDefrost, Indoor_Temp,...
                Freezer_Temp, Freezer_State, FreezerDoor_Timer, FreezerDefrost_Timer,...
                Freezer_ThermostatAdjust, FreezerOpenDoor_rand, Activity, Scaling_Factor);
            
            Freezer_Power_hold(t) = Freezer_Power;  % (W) Freezer Power Demand
            Freezer_Temp_hold(t) = Freezer_Temp;    % (F) Temperature of Freezer Interior
            
            
            % If User is Simulating Demand Response
            
            if Simulate_DemandResponse == 1
                
                if (Freezer_DR_LoadShed + Freezer_DR_AdjustThermostat) ~= 0     % If Home's Freezer Particpates in Demand Repsonse
                    
                    if Freezer_DR_LoadShed == 1 && t == Freezer_LoadShedTime    % Shed Freezer Load
                        
                        Freezer_State_DR = 0;   % Adjust Freezer State
                    end
                    if Freezer_DR_AdjustThermostat == 1 && t >= Freezer_AdjustmentTime && t < Freezer_AdjustmentTime2   % Adjust Freezer Thermostat
                        
                        Freezer_ThermostatAdjust = FreezerDemandResponse_Inputs(9); % (F) Freezer Thermostat Adjustment
                    end
                    
                    [Freezer_Power_DR, Freezer_Temp_DR, Freezer_State_DR, FreezerDoor_Timer_DR, FreezerDefrost_Timer_DR]...
                        = Freezer_Model(time_step, RefrigeratorFreezer_Inputs, FreezerDefrost, Indoor_Temp_DR,...
                        Freezer_Temp_DR, Freezer_State_DR, FreezerDoor_Timer_DR, FreezerDefrost_Timer_DR,...
                        Freezer_ThermostatAdjust, FreezerOpenDoor_rand, Activity, Scaling_Factor);
                    
                    Freezer_Power_DR_hold(t) = Freezer_Power_DR;  % (W) Freezer Power Demand (Demand Response)
                    Freezer_Temp_DR_hold(t) = Freezer_Temp_DR;    % (F) Temperature of Freezer Interior (Demand Response)
                else
                    Freezer_Power_DR_hold(t) = Freezer_Power;     % (W) Freezer Power Demand (Demand Response)
                    Freezer_Temp_DR_hold(t) = Freezer_Temp;       % (F) Temperature of Freezer Interior (Demand Response)
                end
            end
        end
        
        
        % Freezer Model (Secondary)
        
        if Freezer_Type2 == 1   % If Home has a Second Freezer
            
            FreezerOpenDoor2_rand = rand(1);    % Second Freezer Open Door Random Variable
            
            Freezer_ThermostatAdjust2 = 0;      % (F) Initialize Second Freezer Thermostat Adjustment Parameter
            
            if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                
                [Freezer_State2, Freezer_State2_DR] = InitialState_Freezer_Model(time_step,...
                    RefrigeratorFreezer_Inputs2, FreezerDefrost2, Indoor_Temp, Freezer_Temp2,...
                    Freezer_State2, FreezerDoor_Timer2, FreezerDefrost_Timer2, Freezer_ThermostatAdjust2,...
                    FreezerOpenDoor2_rand, Activity, Scaling_Factor);
            end
            
            [Freezer_Power2, Freezer_Temp2, Freezer_State2, FreezerDoor_Timer2, FreezerDefrost_Timer2]...
                = Freezer_Model(time_step, RefrigeratorFreezer_Inputs2, FreezerDefrost2, Indoor_Temp,...
                Freezer_Temp2, Freezer_State2, FreezerDoor_Timer2, FreezerDefrost_Timer2,...
                Freezer_ThermostatAdjust2, FreezerOpenDoor2_rand, Activity, Scaling_Factor);
            
            Freezer_Power2_hold(t) = Freezer_Power2;    % (W) Second Freezer Power Demand
            Freezer_Temp2_hold(t) = Freezer_Temp2;      % (F) Temperature of Second Freezer Interior
            
            
            % If User is Simulating Demand Response
            
            if Simulate_DemandResponse == 1
                
                if (Freezer_DR_LoadShed2 + Freezer_DR_AdjustThermostat2) ~= 0   % If Home's Second Freezer Particpates in Demand Repsonse
                    
                    if Freezer_DR_LoadShed2 == 1 && t == Freezer_LoadShedTime2  % Shed Second Freezer Load
                        
                        Freezer_State2_DR = 0;  % Adjust Second Freezer State
                    end
                    if Freezer_DR_AdjustThermostat2 == 1 && t >= Freezer_AdjustmentTime3 && t < Freezer_AdjustmentTime4     % Adjust Second Freezer Thermostat
                        
                        Freezer_ThermostatAdjust2 = FreezerDemandResponse_Inputs(9);    % (F) Second Freezer Thermostat Adjustment
                    end
                    
                    [Freezer_Power2_DR, Freezer_Temp2_DR, Freezer_State2_DR, FreezerDoor_Timer2_DR, FreezerDefrost_Timer2_DR]...
                        = Freezer_Model(time_step, RefrigeratorFreezer_Inputs2, FreezerDefrost2, Indoor_Temp_DR,...
                        Freezer_Temp2_DR, Freezer_State2_DR, FreezerDoor_Timer2_DR, FreezerDefrost_Timer2_DR,...
                        Freezer_ThermostatAdjust2, FreezerOpenDoor2_rand, Activity, Scaling_Factor);
                    
                    Freezer_Power_DR2_hold(t) = Freezer_Power2_DR;  % (W) Second Freezer Power Demand (Demand Response)
                    Freezer_Temp_DR2_hold(t) = Freezer_Temp2_DR;    % (F) Temperature of Second Freezer Interior (Demand Response)
                else
                    Freezer_Power_DR2_hold(t) = Freezer_Power2;     % (W) Second Freezer Power Demand (Demand Response)
                    Freezer_Temp_DR2_hold(t) = Freezer_Temp2;       % (F) Temperature of Second Freezer Interior (Demand Response)
                end
            end
        end
        
        
        % Water Heater Model
        
        if WaterHeater_Type == 1    % If Home has an Electric Water Heater
            
            % Hot Water Model
            
            [WaterHeater_WaterFlow, Washer_WaterFlow, Dishwasher_WaterFlow, Washer_State, Dishwasher_State,...
                Shower_Timer, Bath_Timer, Sink_Timer] = HotWater_Model(time_step, WaterHeater_Inputs, Dishwasher_Type,...
                WaterInlet_Temp, Water_Temp, Water_TempU, Washer_Timer, Dishwasher_Timer, Washer_State, Dishwasher_State,...
                Shower_Timer, Bath_Timer, Sink_Timer, Activity);
            
            WaterHeater_WaterFlow_hold(t) = WaterHeater_WaterFlow;  % (gal/s or gal/min) Water Heater Hot Water Demand
            Washer_WaterFlow_hold(t) = Washer_WaterFlow;            % (gal/s or gal/min) Washer Hot Water Demand
            Dishwasher_WaterFlow_hold(t) = Dishwasher_WaterFlow;    % (gal/s or gal/min) Dishwasher Hot Water Demand
            
            % If User is Simulating Demand Response
            
            if Simulate_DemandResponse == 1
                
                if WasherDryer_DR_DeferLoad ~= 0    % If Home's Washer or Dryer Particpates in Demand Repsonse
                    
                    if t >= WasherDryer_DeferLoadTime && t < WasherDryer_DeferLoadTime2     % Defer Washer and Dryer Operation
                        
                        Washer_WaterFlow_DR_hold(t) = 0;                                    % (gal/s or gal/min) Washer Hot Water Demand (Demand Response)
                        WaterHeater_WaterFlow = WaterHeater_WaterFlow - Washer_WaterFlow;   % (gal/s or gal/min) Water Heater Hot Water Demand (Demand Response)
                    else
                        Washer_WaterFlow_DR_hold(t) = Washer_WaterFlow; % (gal/s or gal/min) Washer Hot Water Demand (Demand Response)
                    end
                end
                
                if Dishwasher_DR_DeferLoad ~= 0     % If Home's Dishwasher Particpates in Demand Repsonse
                    
                    if t >= Dishwasher_DeferLoadTime && t < Dishwasher_DeferLoadTime2   % Defer Dishwasher Operation
                        
                        Dishwasher_WaterFlow_DR_hold(t) = 0;                                    % (gal/s or gal/min) Dishwasher Hot Water Demand (Demand Response)
                        WaterHeater_WaterFlow = WaterHeater_WaterFlow - Dishwasher_WaterFlow;   % (gal/s or gal/min) Water Heater Hot Water Demand (Demand Response)
                    else
                        Dishwasher_WaterFlow_DR_hold(t) = Dishwasher_WaterFlow; % (gal/s or gal/min) Dishwasher Hot Water Demand (Demand Response)
                    end
                end
                
                WaterHeater_WaterFlow_DR = WaterHeater_WaterFlow;               % (gal/s or gal/min) Water Heater Hot Water Demand (Demand Response)
                WaterHeater_WaterFlow_DR_hold(t) = WaterHeater_WaterFlow_DR;    % (gal/s or gal/min) Water Heater Hot Water Demand (Demand Response)
            end
            
            
            % One-Node Water Heater Model
            
            if WaterHeater_Inputs(1) == 1
                
                WaterHeater_ThermostatAdjust = 0;   % (F) Initialize Water Heater Thermostat Adjustment Parameter
                
                if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                    
                    [WaterHeater_State, WaterHeater_State_DR] = InitialState_WaterHeater_OneNodeModel...
                        (time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp, WaterInlet_Temp, Water_Temp,...
                        WaterHeater_WaterFlow, WaterHeater_State, WaterHeater_ThermostatAdjust, Scaling_Factor);
                end
                
                [WaterHeater_Power, Water_Temp, WaterHeater_State] = WaterHeater_OneNodeModel...
                    (time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp, WaterInlet_Temp, Water_Temp,...
                    WaterHeater_WaterFlow, WaterHeater_State, WaterHeater_ThermostatAdjust, Scaling_Factor);
                
                WaterHeater_Power_hold(t) = WaterHeater_Power;  % (W) Water Heater Power Demand
                WaterHeater_Temp_hold(t) = Water_Temp;          % (F) Hot Water Temperature
                
                
                % If User is Simulating Demand Response
                
                if Simulate_DemandResponse == 1
                    
                    if (WaterHeater_DR_LoadShed + WaterHeater_DR_AdjustThermostat) ~= 0     % If Home's Water Heater Particpates in Demand Repsonse
                        
                        if WaterHeater_DR_LoadShed == 1 && t == WaterHeater_LoadShedTime    % Shed Water Heater Load
                            
                            WaterHeater_State_DR = 0;   % Adjust Water Heater State
                        end
                        if WaterHeater_DR_AdjustThermostat == 1 && t >= WaterHeater_AdjustmentTime && t < WaterHeater_AdjustmentTime2   % Adjust Water Heater Thermostat
                            
                            WaterHeater_ThermostatAdjust = WaterHeaterDemandResponse_Inputs(9); % (F) Freezer Thermostat Adjustment
                        end
                        
                        [WaterHeater_Power_DR, Water_Temp_DR, WaterHeater_State_DR] = WaterHeater_OneNodeModel...
                            (time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp_DR, WaterInlet_Temp, Water_Temp_DR,...
                            WaterHeater_WaterFlow_DR, WaterHeater_State_DR, WaterHeater_ThermostatAdjust, Scaling_Factor);
                        
                        WaterHeater_Power_DR_hold(t) = WaterHeater_Power_DR;    % (W) Water Heater Power Demand (Demand Response)
                        WaterHeater_Temp_DR_hold(t) = Water_Temp_DR;            % (F) Hot Water Temperature (Demand Response)
                    else
                        WaterHeater_Power_DR_hold(t) = WaterHeater_Power;       % (W) Water Heater Power Demand (Demand Response)
                        WaterHeater_Temp_DR_hold(t) = Water_Temp;               % (F) Hot Water Temperature (Demand Response)
                    end
                end
                
                
            % Two-Node Water Heater Model
                
            elseif WaterHeater_Inputs(1) == 2
                
                WaterHeater_ThermostatAdjust = 0;   % (F) Initialize Water Heater Thermostat Adjustment Parameter
                
                if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                    
                    [WaterHeater_StateU, WaterHeater_StateL, WaterHeater_StateU_DR, WaterHeater_StateL_DR]...
                        = InitialState_WaterHeater_TwoNodeModel(time_step, WaterHeater_Inputs, Outdoor_Temp,...
                        Indoor_Temp, WaterInlet_Temp, Water_TempU, Water_TempL, WaterHeater_WaterFlow,...
                        WaterHeater_StateU, WaterHeater_StateL, WaterHeater_ThermostatAdjust, Scaling_Factor);
                end
                
                [WaterHeater_Power, Water_TempU, Water_TempL, WaterHeater_StateU, WaterHeater_StateL]...
                    = WaterHeater_TwoNodeModel(time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp,...
                    WaterInlet_Temp, Water_TempU, Water_TempL, WaterHeater_WaterFlow, WaterHeater_StateU,...
                    WaterHeater_StateL, WaterHeater_ThermostatAdjust, Scaling_Factor);
                
                WaterHeater_Power_hold(t) = WaterHeater_Power;  % (W) Water Heater Power Demand
                WaterHeater_TempU_hold(t) = Water_TempU;        % (F) Hot Water Temperature (Upper Layer)
                WaterHeater_TempL_hold(t) = Water_TempL;        % (F) Hot Water Temperature (Lower Layer)
                
                
                % If User is Simulating Demand Response
                
                if Simulate_DemandResponse == 1
                    
                    if (WaterHeater_DR_LoadShed + WaterHeater_DR_AdjustThermostat) ~= 0     % If Home's Water Heater Particpates in Demand Repsonse
                        
                        if WaterHeater_DR_LoadShed == 1 && t == WaterHeater_LoadShedTime    % Shed Water Heater Load
                            
                            WaterHeater_StateU_DR = 0;  % Adjust Water Heater State (Upper)
                            WaterHeater_StateL_DR = 0;  % Adjust Water Heater State (Lower)
                        end
                        if WaterHeater_DR_AdjustThermostat == 1 && t >= WaterHeater_AdjustmentTime && t < WaterHeater_AdjustmentTime2   % Adjust Water Heater Thermostat
                            
                            WaterHeater_ThermostatAdjust = WaterHeaterDemandResponse_Inputs(9); % (F) Freezer Thermostat Adjustment
                        end
                        
                        [WaterHeater_Power_DR, Water_TempU_DR, Water_TempL_DR, WaterHeater_StateU_DR, WaterHeater_StateL_DR]...
                            = WaterHeater_TwoNodeModel(time_step, WaterHeater_Inputs, Outdoor_Temp, Indoor_Temp_DR,...
                            WaterInlet_Temp, Water_TempU_DR, Water_TempL_DR, WaterHeater_WaterFlow_DR, WaterHeater_StateU_DR,...
                            WaterHeater_StateL_DR, WaterHeater_ThermostatAdjust, Scaling_Factor);
                        
                        
                        WaterHeater_Power_DR_hold(t) = WaterHeater_Power_DR;    % (W) Water Heater Power Demand (Demand Response)
                        WaterHeater_TempU_DR_hold(t) = Water_TempU_DR;          % (F) Hot Water Temperature (Upper Layer) (Demand Response)
                        WaterHeater_TempL_DR_hold(t) = Water_TempL_DR;          % (F) Hot Water Temperature (Lower Layer) (Demand Response)
                    else
                        WaterHeater_Power_DR_hold(t) = WaterHeater_Power;       % (W) Water Heater Power Demand (Demand Response)
                        WaterHeater_TempU_DR_hold(t) = Water_TempU;             % (F) Hot Water Temperature (Upper Layer) (Demand Response)
                        WaterHeater_TempL_DR_hold(t) = Water_TempL;             % (F) Hot Water Temperature (Lower Layer) (Demand Response)
                    end
                end
            end
        end
        
        
        % Additional Power Demand and Occupant Heat Gain
        
        Additional_HeatGain = 0;                        % (W) Initialize Additional Heat Gain per Occupant
        Additional_Power = Uninterruptible_Inputs(12);  % (W) Additional Power Demand per Occupant
        
        for j = 1:length(Activity)  % For each Occupant
            
            if Additional_Type == 1 % If Home has Additional Power Demand
                
                Additional_Power_hold(t) = Additional_Power_hold(t) + Additional_Power; % (W) Additional Power Demand per Occupant
            end
            
            if Activity(j,1) < 9    % If Occupant is in the Home
                
                Additional_HeatGain = Additional_HeatGain + 400*0.29307107; % (W) Additional Heat Gain per Occupant (Assumes 400 Btu/hr per Occupant)
            end
        end
        
        
        % HVAC Model
        
        if (HVAC_Mode == -1 && HVAC_CoolingType ~= 0) || (HVAC_Mode == 1 && HVAC_HeatingType ~= 0)  % If Home has the Required HVAC Type (Cooling or Heating)
            
            Internal_Q = 1.0*Washer_Power_hold(t) + 0.15*Dryer_Power_hold(t) + 1.0*Dishwasher_Power_hold(t) +...    % (W) Internal Heating Gains
                0.8*Cooking_Power_hold(t) + 0.9*Television_Power_hold(t) + 0.9*Computer_Power_hold(t) +...
                0.9*Lighting_Power_hold(t) + 1.0*Refrigerator_Power_hold(t) + 1.0*Freezer_Power_hold(t) +...
                1.0*Refrigerator_Power2_hold(t) + 1.0*Freezer_Power2_hold(t) + 0.5*WaterHeater_Power_hold(t) +...
                0.9*Additional_Power_hold(t) + Additional_HeatGain;
            
            
            HVAC_ThermostatAdjust = 0;  % (F) Initialize HVAC Thermostat Adjustment Parameter
            
            if t == 1   % Set Initial State (Very Important to Avoid Power Demand Oscillations)
                
                [HVAC_State, HVAC_State_DR] = InitialState_HomeHVAC_Model(time_step, HomeHVAC_Inputs, HVAC_Mode,...
                    HVAC_CoolingType, HVAC_HeatingType, Outdoor_Temp, Indoor_Temp, Mass_Temp, Envelope_Temp,...
                    Direct_Irrad, Diffuse_Irrad, Internal_Q, HVAC_State, HVAC_ThermostatAdjust, Scaling_Factor);
            end
            
            [HVAC_Power, HVAC_Q, HVAC_COP, Indoor_Temp, Mass_Temp, Envelope_Temp, HVAC_State] = HomeHVAC_Model(time_step,...
                HomeHVAC_Inputs, HVAC_Mode, HVAC_CoolingType, HVAC_HeatingType, Outdoor_Temp, Indoor_Temp, Mass_Temp,...
                Envelope_Temp, Direct_Irrad, Diffuse_Irrad, Internal_Q, HVAC_State, HVAC_ThermostatAdjust, Scaling_Factor);
            
            HVAC_Power_hold(t) = HVAC_Power;        % (W) HVAC Power Demand
            HVAC_Q_hold(t) = HVAC_Q;                % (W) HVAC Heat Transfer to Home
            HVAC_COP_hold(t) = HVAC_COP;            % HVAC Coefficient of Performance
            Indoor_Temp_hold(t) = Indoor_Temp;      % (F) Temperature of Air in Home
            Mass_Temp_hold(t) = Mass_Temp;          % (F) Temperature of Mass of Home
            Envelope_Temp_hold(t) = Envelope_Temp;  % (F) Temperature of Envelope of Home
            
            HVAC_Num(t) = HVAC_Num(t) + 1;  % Increment HVAC Counter
            
            
            % If User is Simulating Demand Response
            
            if Simulate_DemandResponse == 1
                
                if (HVAC_DR_LoadShed + HVAC_DR_AdjustThermostat + WaterHeater_DR_LoadShed + WaterHeater_DR_AdjustThermostat +...    % If Home Particpates in Demand Repsonse
                        Refrigerator_DR_LoadShed + Refrigerator_DR_AdjustThermostat + Refrigerator_DR_LoadShed2 +...
                        Refrigerator_DR_AdjustThermostat2 + Freezer_DR_LoadShed + Freezer_DR_AdjustThermostat +...
                        Freezer_DR_LoadShed2 + Freezer_DR_AdjustThermostat2 + WasherDryer_DR_DeferLoad + Dishwasher_DR_DeferLoad) ~= 0
                    
                    Internal_Q_DR = 1.0*Washer_Power_DR_hold(t) + 0.15*Dryer_Power_DR_hold(t) + 1.0*Dishwasher_Power_DR_hold(t) +...    % (W) Internal Heating Gains (Demand Response)
                        0.8*Cooking_Power_hold(t) + 0.9*Television_Power_hold(t) + 0.9*Computer_Power_hold(t) +...
                        0.9*Lighting_Power_hold(t) + 1.0*Refrigerator_Power_DR_hold(t) + 1.0*Freezer_Power_DR_hold(t) +...
                        1.0*Refrigerator_Power_DR2_hold(t) + 1.0*Freezer_Power_DR2_hold(t) + 0.5*WaterHeater_Power_DR_hold(t) +...
                        0.9*Additional_Power_hold(t) + Additional_HeatGain;
                    
                    
                    if HVAC_DR_LoadShed == 1 && t == HVAC_LoadShedTime  % Shed HVAC Load
                        
                        HVAC_State_DR = 0;  % Adjust HVAC State
                    end
                    if HVAC_DR_AdjustThermostat == 1 && t >= HVAC_AdjustmentTime && t < HVAC_AdjustmentTime2    % Adjust HVAC Thermostat
                        
                        HVAC_ThermostatAdjust = HVACDemandResponse_Inputs(9);   % (F) HVAC Thermostat Adjustment
                    end
                    
                    [HVAC_Power_DR, HVAC_Q_DR, HVAC_COP_DR, Indoor_Temp_DR, Mass_Temp_DR, Envelope_Temp_DR, HVAC_State_DR] = HomeHVAC_Model...
                        (time_step, HomeHVAC_Inputs, HVAC_Mode, HVAC_CoolingType, HVAC_HeatingType, Outdoor_Temp, Indoor_Temp_DR, Mass_Temp_DR,...
                        Envelope_Temp_DR, Direct_Irrad, Diffuse_Irrad, Internal_Q_DR, HVAC_State_DR, HVAC_ThermostatAdjust, Scaling_Factor);
                    
                    HVAC_Power_DR_hold(t) = HVAC_Power_DR;          % (W) HVAC Power Demand (Demand Response)
                    HVAC_Q_DR_hold(t) = HVAC_Q_DR;                  % (W) HVAC Heat Transfer to Home (Demand Response)
                    HVAC_COP_DR_hold(t) = HVAC_COP_DR;              % HVAC Coefficient of Performance (Demand Response)
                    Indoor_Temp_DR_hold(t) = Indoor_Temp_DR;        % (F) Temperature of Air in Home (Demand Response)
                    Mass_Temp_DR_hold(t) = Mass_Temp_DR;            % (F) Temperature of Mass of Home (Demand Response)
                    Envelope_Temp_DR_hold(t) = Envelope_Temp_DR;    % (F) Temperature of Envelope of Home (Demand Response)
                else
                    HVAC_Power_DR_hold(t) = HVAC_Power;         % (W) HVAC Power Demand (Demand Response)
                    HVAC_Q_DR_hold(t) = HVAC_Q;                 % (W) HVAC Heat Transfer to Home (Demand Response)
                    HVAC_COP_DR_hold(t) = HVAC_COP;             % HVAC Coefficient of Performance (Demand Response)
                    Indoor_Temp_DR_hold(t) = Indoor_Temp;       % (F) Temperature of Air in Home (Demand Response)
                    Mass_Temp_DR_hold(t) = Mass_Temp;           % (F) Temperature of Mass of Home (Demand Response)
                    Envelope_Temp_DR_hold(t) = Envelope_Temp;   % (F) Temperature of Envelope of Home (Demand Response)
                end
            end
        end
        
        
        % Calculate Reactive Power Demand (Q = sqrt((P/pf)^2 - P^2))
        
        HVAC_Reactive_hold(t) = sqrt((HVAC_Power_hold(t)/HVAC_PowerFactor)^2 - HVAC_Power_hold(t)^2);                                       % (Var) HVAC Reactive Power Demand
        WaterHeater_Reactive_hold(t) = sqrt((WaterHeater_Power_hold(t)/WaterHeater_PowerFactor)^2 - WaterHeater_Power_hold(t)^2);           % (Var) Water Heater Reactive Power Demand
        Refrigerator_Reactive_hold(t) = sqrt((Refrigerator_Power_hold(t)/Refrigerator_PowerFactor)^2 - Refrigerator_Power_hold(t)^2);       % (Var) Refrigerator Reactive Power Demand
        Refrigerator_Reactive2_hold(t) = sqrt((Refrigerator_Power2_hold(t)/Refrigerator_PowerFactor)^2 - Refrigerator_Power2_hold(t)^2);    % (Var) Second Refrigerator Reactive Power Demand
        Freezer_Reactive_hold(t) = sqrt((Freezer_Power_hold(t)/Freezer_PowerFactor)^2 - Freezer_Power_hold(t)^2);                           % (Var) Freezer Reactive Power Demand
        Freezer_Reactive2_hold(t) = sqrt((Freezer_Power2_hold(t)/Freezer_PowerFactor)^2 - Freezer_Power2_hold(t)^2);                        % (Var) Second Freezer Reactive Power Demand
        Washer_Reactive_hold(t) = sqrt((Washer_Power_hold(t)/Washer_PowerFactor)^2 - Washer_Power_hold(t)^2);                               % (Var) Washer Reactive Power Demand
        Dryer_Reactive_hold(t) = sqrt((Dryer_Power_hold(t)/Dryer_PowerFactor)^2 - Dryer_Power_hold(t)^2);                                   % (Var) Dryer Reactive Power Demand
        Dishwasher_Reactive_hold(t) = sqrt((Dishwasher_Power_hold(t)/Dishwasher_PowerFactor)^2 - Dishwasher_Power_hold(t)^2);               % (Var) Dishwasher Reactive Power Demand
        Cooking_Reactive_hold(t) = sqrt((Cooking_Power_hold(t)/Cooking_PowerFactor)^2 - Cooking_Power_hold(t)^2);                           % (Var) Cooking Reactive Power Demand
        Incandescent_Reactive_hold(t) = sqrt((Incandescent_Power_hold(t)/Incandescent_PowerFactor)^2 - Incandescent_Power_hold(t)^2);       % (Var) Incandescent Lighting Reactive Power Demand
        Halogen_Reactive_hold(t) = sqrt((Halogen_Power_hold(t)/Halogen_PowerFactor)^2 - Halogen_Power_hold(t)^2);                           % (Var) Halogen Lighting Reactive Power Demand
        Fluorescent_Reactive_hold(t) = sqrt((Fluorescent_Power_hold(t)/Fluorescent_PowerFactor)^2 - Fluorescent_Power_hold(t)^2);           % (Var) Linear Fluorescent Lighting Reactive Power Demand
        CFL_Reactive_hold(t) = sqrt((CFL_Power_hold(t)/CFL_PowerFactor)^2 - CFL_Power_hold(t)^2);                                           % (Var) Compact Fluorescent Lighting Reactive Power Demand
        LED_Reactive_hold(t) = sqrt((LED_Power_hold(t)/LED_PowerFactor)^2 - LED_Power_hold(t)^2);                                           % (Var) LED Lighting Reactive Power Demand
        Lighting_Reactive_hold(t) = Incandescent_Reactive_hold(t) + Halogen_Reactive_hold(t) + Fluorescent_Reactive_hold(t) +...            % (Var) Lighting Reactive Power Demand
            CFL_Reactive_hold(t) + LED_Reactive_hold(t);                                                                                    % (Var) Lighting Reactive Power Demand
        Incandescent_Reactive2_hold(t) = sqrt((Incandescent_Power2_hold(t)/Incandescent_PowerFactor)^2 - Incandescent_Power2_hold(t)^2);    % (Var) Incandescent Lighting Reactive Power Demand
        Halogen_Reactive2_hold(t) = sqrt((Halogen_Power2_hold(t)/Halogen_PowerFactor)^2 - Halogen_Power2_hold(t)^2);                        % (Var) Halogen Lighting Reactive Power Demand
        Fluorescent_Reactive2_hold(t) = sqrt((Fluorescent_Power2_hold(t)/Fluorescent_PowerFactor)^2 - Fluorescent_Power2_hold(t)^2);        % (Var) Linear Fluorescent Lighting Reactive Power Demand
        CFL_Reactive2_hold(t) = sqrt((CFL_Power2_hold(t)/CFL_PowerFactor)^2 - CFL_Power2_hold(t)^2);                                        % (Var) Compact Fluorescent Lighting Reactive Power Demand
        LED_Reactive2_hold(t) = sqrt((LED_Power2_hold(t)/LED_PowerFactor)^2 - LED_Power2_hold(t)^2);                                        % (Var) LED Lighting Reactive Power Demand
        Lighting_Reactive2_hold(t) = Incandescent_Reactive2_hold(t) + Halogen_Reactive2_hold(t) + Fluorescent_Reactive2_hold(t) +...        % (Var) Lighting Reactive Power Demand
            CFL_Reactive2_hold(t) + LED_Reactive2_hold(t);                                                                                  % (Var) Lighting Reactive Power Demand
        Television_Reactive_hold(t) = sqrt((Television_Power_hold(t)/Television_PowerFactor)^2 - Television_Power_hold(t)^2);               % (Var) Television Reactive Power Demand
        Computer_Reactive_hold(t) = sqrt((Computer_Power_hold(t)/Computer_PowerFactor)^2 - Computer_Power_hold(t)^2);                       % (Var) Computer Reactive Power Demand
        Additional_Reactive_hold(t) = sqrt((Additional_Power_hold(t)/Additional_PowerFactor)^2 - Additional_Power_hold(t)^2);               % (Var) Additional Reactive Power Demand
        EV_Reactive_hold(t) = sqrt((EV_Power_hold(t)/EV_PowerFactor)^2 - EV_Power_hold(t)^2);                                               % (Var) Electric Vehicle Reactive Power Demand
        
        
        % Calculate Reactive Power Demand (Demand Response)
        
        HVAC_Reactive_DR_hold(t) = sqrt((HVAC_Power_DR_hold(t)/HVAC_PowerFactor)^2 - HVAC_Power_DR_hold(t)^2);                                      % (Var) HVAC Reactive Power Demand (Demand Response)
        WaterHeater_Reactive_DR_hold(t) = sqrt((WaterHeater_Power_DR_hold(t)/WaterHeater_PowerFactor)^2 - WaterHeater_Power_DR_hold(t)^2);          % (Var) Water Heater Reactive Power Demand (Demand Response)
        Refrigerator_Reactive_DR_hold(t) = sqrt((Refrigerator_Power_DR_hold(t)/Refrigerator_PowerFactor)^2 - Refrigerator_Power_DR_hold(t)^2);      % (Var) Refrigerator Reactive Power Demand (Demand Response)
        Refrigerator_Reactive_DR2_hold(t) = sqrt((Refrigerator_Power_DR2_hold(t)/Refrigerator_PowerFactor)^2 - Refrigerator_Power_DR2_hold(t)^2);   % (Var) Second Refrigerator Reactive Power Demand (Demand Response)
        Freezer_Reactive_DR_hold(t) = sqrt((Freezer_Power_DR_hold(t)/Freezer_PowerFactor)^2 - Freezer_Power_DR_hold(t)^2);                          % (Var) Freezer Reactive Power Demand (Demand Response)
        Freezer_Reactive_DR2_hold(t) = sqrt((Freezer_Power_DR2_hold(t)/Freezer_PowerFactor)^2 - Freezer_Power_DR2_hold(t)^2);                       % (Var) Second Freezer Reactive Power Demand (Demand Response)
        Washer_Reactive_DR_hold(t) = sqrt((Washer_Power_DR_hold(t)/Washer_PowerFactor)^2 - Washer_Power_DR_hold(t)^2);                              % (Var) Washer Reactive Power Demand (Demand Response)
        Dryer_Reactive_DR_hold(t) = sqrt((Dryer_Power_DR_hold(t)/Dryer_PowerFactor)^2 - Dryer_Power_DR_hold(t)^2);                                  % (Var) Dryer Reactive Power Demand (Demand Response)
        Dishwasher_Reactive_DR_hold(t) = sqrt((Dishwasher_Power_DR_hold(t)/Dishwasher_PowerFactor)^2 - Dishwasher_Power_DR_hold(t)^2);              % (Var) Dishwasher Reactive Power Demand (Demand Response)
    end
    
    
    % Calculate Occupant Distribution Error
    
    [WM_Num, NM_Num, WF_Num, NF_Num, C_Num,...
        WM_Occ_Act_Prob_Norm, NM_Occ_Act_Prob_Norm, WF_Occ_Act_Prob_Norm,...
        NF_Occ_Act_Prob_Norm, C_Occ_Act_Prob_Norm, Tot_Occ_Act_Prob_Norm,...
        WM_Error, NM_Error, WF_Error, NF_Error, C_Error, Tot_Error,...
        WM_Avg_Error, NM_Avg_Error, WF_Avg_Error, NF_Avg_Error, C_Avg_Error, Tot_Avg_Error,...
        WM_Max_Error, NM_Max_Error, WF_Max_Error, NF_Max_Error, C_Max_Error, Tot_Max_Error]...
        = occupanterror(Occupants, WM_Num, NM_Num, WF_Num, NF_Num, C_Num,...
        WM_Prob_Model, NM_Prob_Model, WF_Prob_Model, NF_Prob_Model, C_Prob_Model, Tot_Prob_Model,...
        WM_Occ_Act_Prob, NM_Occ_Act_Prob, WF_Occ_Act_Prob, NF_Occ_Act_Prob, C_Occ_Act_Prob, Tot_Occ_Act_Prob,...
        WM_Avg_Error, NM_Avg_Error, WF_Avg_Error, NF_Avg_Error, C_Avg_Error, Tot_Avg_Error,...
        WM_Max_Error, NM_Max_Error, WF_Max_Error, NF_Max_Error, C_Max_Error, Tot_Max_Error);
    
    
    % Increment Total Power, Temperature, etc. Matrices
    
    HVAC_Power_total = HVAC_Power_total + HVAC_Power_hold;          % (W) Total HVAC Power Demand
    HVAC_Reactive_total = HVAC_Reactive_total + HVAC_Reactive_hold; % (Var) Total HVAC Reactive Power Demand
    HVAC_Q_total = HVAC_Q_total + HVAC_Q_hold;                      % (W) Total HVAC Heat Transfer to Home
    HVAC_COP_total = HVAC_COP_total + HVAC_COP_hold;                % Total HVAC Coefficient of Performance
    Indoor_Temp_total = Indoor_Temp_total + Indoor_Temp_hold;       % (F) Total Temperature of Air in Home
    Mass_Temp_total = Mass_Temp_total + Mass_Temp_hold;             % (F) Total Temperature of Mass of Home
    Envelope_Temp_total = Envelope_Temp_total + Envelope_Temp_hold; % (F) Total Temperature of Envelope of Home
    
    WaterHeater_Power_total = WaterHeater_Power_total + WaterHeater_Power_hold;             % (W) Total Water Heater Power Demand
    WaterHeater_Reactive_total = WaterHeater_Reactive_total + WaterHeater_Reactive_hold;    % (Var) Total Water Heater Reactive Power Demand
    WaterHeater_WaterFlow_total = WaterHeater_WaterFlow_total + WaterHeater_WaterFlow_hold; % (gal/s or gal/min) Total Water Heater Hot Water Demand
    WaterHeater_Temp_total = WaterHeater_Temp_total + WaterHeater_Temp_hold;                % (F) Total Water Heater Water Temperature
    WaterHeater_TempU_total = WaterHeater_TempU_total + WaterHeater_TempU_hold;             % (F) Total Water Heater Water Temperature (Upper Layer)
    WaterHeater_TempL_total = WaterHeater_TempL_total + WaterHeater_TempL_hold;             % (F) Total Water Heater Water Temperature (Lower Layer)
    
    Refrigerator_Power_total = Refrigerator_Power_total + Refrigerator_Power_hold + Refrigerator_Power2_hold;               % (W) Total Refrigerator Power Demand
    Refrigerator_Reactive_total = Refrigerator_Reactive_total + Refrigerator_Reactive_hold + Refrigerator_Reactive2_hold;   % (Var) Total Refrigerator Reactive Power Demand
    Refrigerator_Temp_total = Refrigerator_Temp_total + Refrigerator_Temp_hold + Refrigerator_Temp2_hold;                   % (F) Total Temperature of Refrigerator Interior
    Freezer_Power_total = Freezer_Power_total + Freezer_Power_hold + Freezer_Power2_hold;                                   % (W) Total Freezer Power Demand
    Freezer_Reactive_total = Freezer_Reactive_total + Freezer_Reactive_hold + Freezer_Reactive2_hold;                       % (Var) Total Freezer Reactive Power Demand
    Freezer_Temp_total = Freezer_Temp_total + Freezer_Temp_hold + Freezer_Temp2_hold;                                       % (F) Total Temperature of Freezer Interior
    
    Washer_Power_total = Washer_Power_total + Washer_Power_hold;                            % (W) Total Washer Power Demand
    Washer_Reactive_total = Washer_Reactive_total + Washer_Reactive_hold;                   % (Var) Total Washer Reactive Power Demand
    Washer_WaterFlow_total = Washer_WaterFlow_total + Washer_WaterFlow_hold;                % (gal/s or gal/min) Total Washer Hot Water Demand
    Dryer_Power_total = Dryer_Power_total + Dryer_Power_hold;                               % (W) Total Dryer Power Demand
    Dryer_Reactive_total = Dryer_Reactive_total + Dryer_Reactive_hold;                      % (Var) Total Dryer Reactive Power Demand
    Dishwasher_Power_total = Dishwasher_Power_total + Dishwasher_Power_hold;                % (W) Total Dishwasher Power Demand
    Dishwasher_Reactive_total = Dishwasher_Reactive_total + Dishwasher_Reactive_hold;       % (Var) Total Dishwasher Reactive Power Demand
    Dishwasher_WaterFlow_total = Dishwasher_WaterFlow_total + Dishwasher_WaterFlow_hold;    % (gal/s or gal/min) Total Dishwasher Hot Water Demand
    
    Cooking_Power_total = Cooking_Power_total + Cooking_Power_hold;                         % (W) Total Cooking Power Demand
    Cooking_Reactive_total = Cooking_Reactive_total + Cooking_Reactive_hold;                % (Var) Total Cooking Reactive Power Demand
    Lighting_Power_total = Lighting_Power_total + Lighting_Power_hold;                      % (W) Total Lighting Power Demand
    Lighting_Reactive_total = Lighting_Reactive_total + Lighting_Reactive_hold;             % (Var) Total Lighting Reactive Power Demand
    Incandescent_Power_total = Incandescent_Power_total + Incandescent_Power_hold;          % (W) Total Incandescent Lighting Power Demand
    Incandescent_Reactive_total = Incandescent_Reactive_total + Incandescent_Reactive_hold; % (Var) Total Incandescent Lighting Reactive Power Demand
    Halogen_Power_total = Halogen_Power_total + Halogen_Power_hold;                         % (W) Total Halogen Lighting Power Demand
    Halogen_Reactive_total = Halogen_Reactive_total + Halogen_Reactive_hold;                % (Var) Total Halogen Lighting Reactive Power Demand
    Fluorescent_Power_total = Fluorescent_Power_total + Fluorescent_Power_hold;             % (W) Total Linear Fluorescent Lighting Power Demand
    Fluorescent_Reactive_total = Fluorescent_Reactive_total + Fluorescent_Reactive_hold;    % (Var) Total Linear Fluorescent Lighting Reactive Power Demand
    CFL_Power_total = CFL_Power_total + CFL_Power_hold;                                     % (W) Total Compact Fluorescent Lighting Power Demand
    CFL_Reactive_total = CFL_Reactive_total + CFL_Reactive_hold;                            % (Var) Total Compact Fluorescent Lighting Reactive Power Demand
    LED_Power_total = LED_Power_total + LED_Power_hold;                                     % (W) Total LED Lighting Power Demand
    LED_Reactive_total = LED_Reactive_total + LED_Reactive_hold;                            % (Var) Total LED Lighting Reactive Power Demand
    
    Lighting_Power2_total = Lighting_Power2_total + Lighting_Power2_hold;                       % (W) Total Lighting Power Demand
    Lighting_Reactive2_total = Lighting_Reactive2_total + Lighting_Reactive2_hold;              % (Var) Total Lighting Reactive Power Demand
    Incandescent_Power2_total = Incandescent_Power2_total + Incandescent_Power2_hold;           % (W) Total Incandescent Lighting Power Demand
    Incandescent_Reactive2_total = Incandescent_Reactive2_total + Incandescent_Reactive2_hold;  % (Var) Total Incandescent Lighting Reactive Power Demand
    Halogen_Power2_total = Halogen_Power2_total + Halogen_Power2_hold;                          % (W) Total Halogen Lighting Power Demand
    Halogen_Reactive2_total = Halogen_Reactive2_total + Halogen_Reactive2_hold;                 % (Var) Total Halogen Lighting Reactive Power Demand
    Fluorescent_Power2_total = Fluorescent_Power2_total + Fluorescent_Power2_hold;              % (W) Total Linear Fluorescent Lighting Power Demand
    Fluorescent_Reactive2_total = Fluorescent_Reactive2_total + Fluorescent_Reactive2_hold;     % (Var) Total Linear Fluorescent Lighting Reactive Power Demand
    CFL_Power2_total = CFL_Power2_total + CFL_Power2_hold;                                      % (W) Total Compact Fluorescent Lighting Power Demand
    CFL_Reactive2_total = CFL_Reactive2_total + CFL_Reactive2_hold;                             % (Var) Total Compact Fluorescent Lighting Reactive Power Demand
    LED_Power2_total = LED_Power2_total + LED_Power2_hold;                                      % (W) Total LED Lighting Power Demand
    LED_Reactive2_total = LED_Reactive2_total + LED_Reactive2_hold;                             % (Var) Total LED Lighting Reactive Power Demand
    
    Television_Power_total = Television_Power_total + Television_Power_hold;            % (W) Total Television Power Demand
    Television_Reactive_total = Television_Reactive_total + Television_Reactive_hold;   % (Var) Total Television Reactive Power Demand
    Computer_Power_total = Computer_Power_total + Computer_Power_hold;                  % (W) Total Computer Power Demand
    Computer_Reactive_total = Computer_Reactive_total + Computer_Reactive_hold;         % (Var) Total Computer Reactive Power Demand
    Additional_Power_total = Additional_Power_total + Additional_Power_hold;            % (W) Total Additional Power Demand
    Additional_Reactive_total = Additional_Reactive_total + Additional_Reactive_hold;   % (Var) Total Additional Reactive Power Demand
    
    EV_Power_total = EV_Power_total + EV_Power_hold;                % (W) Total Electric Vehicle Power Demand
    EV_Reactive_total = EV_Reactive_total + EV_Reactive_hold;       % (Var) Total Electric Vehicle Reactive Power Demand
    EV_SOC_total = EV_SOC_total + EV_SOC_hold;                      % (%) Total Electric Vehicle State of Charge
    EV1_Power_total = EV1_Power_total + EV1_Power_hold;             % (W) Total Electric Vehicle Power Demand (Level 1 Charger)
    EV1_Reactive_total = EV1_Reactive_total + EV1_Reactive_hold;    % (Var) Total Electric Vehicle Reactive Power Demand (Level 1 Charger)
    EV1_SOC_total = EV1_SOC_total + EV1_SOC_hold;                   % (%) Total Electric Vehicle State of Charge (Level 1 Charger)
    EV2_Power_total = EV2_Power_total + EV2_Power_hold;             % (W) Total Electric Vehicle Power Demand (Level 2 Charger)
    EV2_Reactive_total = EV2_Reactive_total + EV2_Reactive_hold;    % (Var) Total Electric Vehicle Reactive Power Demand (Level 2 Charger)
    EV2_SOC_total = EV2_SOC_total + EV2_SOC_hold;                   % (%) Total Electric Vehicle State of Charge (Level 2 Charger)
    EV3_Power_total = EV3_Power_total + EV3_Power_hold;             % (W) Total Electric Vehicle Power Demand (Level 3 Charger)
    EV3_Reactive_total = EV3_Reactive_total + EV3_Reactive_hold;    % (Var) Total Electric Vehicle Reactive Power Demand (Level 3 Charger)
    EV3_SOC_total = EV3_SOC_total + EV3_SOC_hold;                   % (%) Total Electric Vehicle State of Charge (Level 3 Charger)
    
    
    % Increment Total Power, Temperature, etc. Matrices (Demand Response)
    
    HVAC_Power_DR_total = HVAC_Power_DR_total + HVAC_Power_DR_hold;             % (W) Total HVAC Power Demand (Demand Response)
    HVAC_Reactive_DR_total = HVAC_Reactive_DR_total + HVAC_Reactive_DR_hold;    % (Var) Total HVAC Reactive Power Demand (Demand Response)
    HVAC_Q_DR_total = HVAC_Q_DR_total + HVAC_Q_DR_hold;                         % (W) Total HVAC Heat Transfer to Home (Demand Response)
    HVAC_COP_DR_total = HVAC_COP_DR_total + HVAC_COP_DR_hold;                   % Total HVAC Coefficient of Performance (Demand Response)
    Indoor_Temp_DR_total = Indoor_Temp_DR_total + Indoor_Temp_DR_hold;          % (F) Total Temperature of Air in Home (Demand Response)
    Mass_Temp_DR_total = Mass_Temp_DR_total + Mass_Temp_DR_hold;                % (F) Total Temperature of Mass of Home (Demand Response)
    Envelope_Temp_DR_total = Envelope_Temp_DR_total + Envelope_Temp_DR_hold;    % (F) Total Temperature of Envelope of Home (Demand Response)
    
    WaterHeater_Power_DR_total = WaterHeater_Power_DR_total + WaterHeater_Power_DR_hold;                % (W) Total Water Heater Power Demand (Demand Response)
    WaterHeater_Reactive_DR_total = WaterHeater_Reactive_DR_total + WaterHeater_Reactive_DR_hold;       % (Var) Total Water Heater Reactive Power Demand (Demand Response)
    WaterHeater_WaterFlow_DR_total = WaterHeater_WaterFlow_DR_total + WaterHeater_WaterFlow_DR_hold;    % (gal/s or gal/min) Total Water Heater Hot Water Demand (Demand Response)
    WaterHeater_Temp_DR_total = WaterHeater_Temp_DR_total + WaterHeater_Temp_DR_hold;                   % (F) Total Water Heater Water Temperature (Demand Response)
    WaterHeater_TempU_DR_total = WaterHeater_TempU_DR_total + WaterHeater_TempU_DR_hold;                % (F) Total Water Heater Water Temperature (Upper Layer) (Demand Response)
    WaterHeater_TempL_DR_total = WaterHeater_TempL_DR_total + WaterHeater_TempL_DR_hold;                % (F) Total Water Heater Water Temperature (Lower Layer) (Demand Response)
    
    Refrigerator_Power_DR_total = Refrigerator_Power_DR_total + Refrigerator_Power_DR_hold + Refrigerator_Power_DR2_hold;               % (W) Total Refrigerator Power Demand (Demand Response)
    Refrigerator_Reactive_DR_total = Refrigerator_Reactive_DR_total + Refrigerator_Reactive_DR_hold + Refrigerator_Reactive_DR2_hold;   % (Var) Total Refrigerator Reactive Power Demand (Demand Response)
    Refrigerator_Temp_DR_total = Refrigerator_Temp_DR_total + Refrigerator_Temp_DR_hold + Refrigerator_Temp_DR2_hold;                   % (F) Total Temperature of Refrigerator Interior (Demand Response)
    Freezer_Power_DR_total = Freezer_Power_DR_total + Freezer_Power_DR_hold + Freezer_Power_DR2_hold;                                   % (W) Total Freezer Power Demand (Demand Response)
    Freezer_Reactive_DR_total = Freezer_Reactive_DR_total + Freezer_Reactive_DR_hold + Freezer_Reactive_DR2_hold;                       % (Var) Total Freezer Reactive Power Demand (Demand Response)
    Freezer_Temp_DR_total = Freezer_Temp_DR_total + Freezer_Temp_DR_hold + Freezer_Temp_DR2_hold;                                       % (F) Total Temperature of Freezer Interior (Demand Response)
    
    Washer_Power_DR_total = Washer_Power_DR_total + Washer_Power_DR_hold;                           % (W) Total Washer Power Demand (Demand Response)
    Washer_Reactive_DR_total = Washer_Reactive_DR_total + Washer_Reactive_DR_hold;                  % (Var) Total Washer Reactive Power Demand (Demand Response)
    Washer_WaterFlow_DR_total = Washer_WaterFlow_DR_total + Washer_WaterFlow_DR_hold;               % (gal/s or gal/min) Total Washer Hot Water Demand (Demand Response)
    Dryer_Power_DR_total = Dryer_Power_DR_total + Dryer_Power_DR_hold;                              % (W) Total Dryer Power Demand (Demand Response)
    Dryer_Reactive_DR_total = Dryer_Reactive_DR_total + Dryer_Reactive_DR_hold;                     % (Var) Total Dryer Reactive Power Demand (Demand Response)
    Dishwasher_Power_DR_total = Dishwasher_Power_DR_total + Dishwasher_Power_DR_hold;               % (W) Total Dishwasher Power Demand (Demand Response)
    Dishwasher_Reactive_DR_total = Dishwasher_Reactive_DR_total + Dishwasher_Reactive_DR_hold;      % (Var) Total Dishwasher Reactive Power Demand (Demand Response)
    Dishwasher_WaterFlow_DR_total = Dishwasher_WaterFlow_DR_total + Dishwasher_WaterFlow_DR_hold;   % (gal/s or gal/min) Total Dishwasher Hot Water Demand (Demand Response)
end


% Average Temperature and COP Matrices

Indoor_Temp_avg = Indoor_Temp_total./HVAC_Num;      % (F) Average Temperature of Air in Home
Mass_Temp_avg = Mass_Temp_total./HVAC_Num;          % (F) Average Temperature of Mass of Home
Envelope_Temp_avg = Envelope_Temp_total./HVAC_Num;  % (F) Average Temperature of Envelope of Home
HVAC_COP_avg = HVAC_COP_total./HVAC_Num;            % Average HVAC Coefficient of Performance

WaterHeater_Temp_avg = WaterHeater_Temp_total./WaterHeater_Num;     % (F) Average Water Heater Water Temperature
WaterHeater_TempU_avg = WaterHeater_TempU_total./WaterHeater_Num;   % (F) Average Water Heater Water Temperature (Upper Layer)
WaterHeater_TempL_avg = WaterHeater_TempL_total./WaterHeater_Num;   % (F) Average Water Heater Water Temperature (Lower Layer)

Refrigerator_Temp_avg = Refrigerator_Temp_total./Refrigerator_Num;  % (F) Average Temperature of Refrigerator Interior
Freezer_Temp_avg = Freezer_Temp_total./Freezer_Num;                 % (F) Average Temperature of Freezer Interior

EV_SOC_avg = EV_SOC_total./EV_Num;      % (%) Average State of Charge of Electric Vehicle
EV1_SOC_avg = EV1_SOC_total./EV1_Num;   % (%) Average State of Charge of Electric Vehicle (Level 1 Charger)
EV2_SOC_avg = EV2_SOC_total./EV2_Num;   % (%) Average State of Charge of Electric Vehicle (Level 2 Charger)
EV3_SOC_avg = EV3_SOC_total./EV3_Num;   % (%) Average State of Charge of Electric Vehicle (Level 3 Charger)


% Average Temperature and COP Matrices (Demand Response)

Indoor_Temp_DR_avg = Indoor_Temp_DR_total./HVAC_Num;        % (F) Average Temperature of Air in Home (Demand Response)
Mass_Temp_DR_avg = Mass_Temp_DR_total./HVAC_Num;            % (F) Average Temperature of Mass of Home (Demand Response)
Envelope_Temp_DR_avg = Envelope_Temp_DR_total./HVAC_Num;    % (F) Average Temperature of Envelope of Home (Demand Response)
HVAC_COP_DR_avg = HVAC_COP_DR_total./HVAC_Num;              % Average HVAC Coefficient of Performance (Demand Response)

WaterHeater_Temp_DR_avg = WaterHeater_Temp_DR_total./WaterHeater_Num;       % (F) Average Water Heater Water Temperature (Demand Response)
WaterHeater_TempU_DR_avg = WaterHeater_TempU_DR_total./WaterHeater_Num;     % (F) Average Water Heater Water Temperature (Upper Layer) (Demand Response)
WaterHeater_TempL_DR_avg = WaterHeater_TempL_DR_total./WaterHeater_Num;     % (F) Average Water Heater Water Temperature (Lower Layer) (Demand Response)

Refrigerator_Temp_DR_avg = Refrigerator_Temp_DR_total./Refrigerator_Num;    % (F) Average Temperature of Refrigerator Interior (Demand Response)
Freezer_Temp_DR_avg = Freezer_Temp_DR_total./Freezer_Num;                   % (F) Average Temperature of Freezer Interior (Demand Response)


% Display Program Status

set(handles.ProgramStatus, 'String', 'Writing Output Files...');

if numberofhomes == 1
    set(handles.ProgramStatus2, 'String', strcat(num2str(numberofhomes),{' Home Simulated'}));
    pause(0.001);
else
    set(handles.ProgramStatus2, 'String', strcat(num2str(numberofhomes),{' Homes Simulated'}));
    pause(0.001);
end


% Write Results to Text Files

[~] = writeoutputfiles(outputdata, time, Simulate_DemandResponse,...                                                    % Output Data Directory and Time Scale
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
    WM_Occ_Act_Prob_Norm, NM_Occ_Act_Prob_Norm, WF_Occ_Act_Prob_Norm, NF_Occ_Act_Prob_Norm,...                          % Simulated Occupant Behavior Plotting Data
    C_Occ_Act_Prob_Norm, Tot_Occ_Act_Prob_Norm, Tot_Prob_Model,...                                                      % Simulated Occupant Behavior Plotting Data
    WM_Error, NM_Error, WF_Error, NF_Error, C_Error, Tot_Error,...                                                      % Simulated Occupant Behavior Plotting Data
    WM_Avg_Error, NM_Avg_Error, WF_Avg_Error, NF_Avg_Error, C_Avg_Error, Tot_Avg_Error,...                              % Simulated Occupant Behavior Plotting Data
    WM_Max_Error, NM_Max_Error, WF_Max_Error, NF_Max_Error, C_Max_Error, Tot_Max_Error);                                % Simulated Occupant Behavior Plotting Data


% Plot and Save Results

[~] = saveoutputfigures(outputdata, time, time_step, Simulate_DemandResponse,...                                        % Output Data Directory and Time Scale
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
    EV2_Power_total, EV2_Reactive_total, EV2_SOC_avg, EV3_Power_total, EV3_Reactive_total, EV3_SOC_avg);                % Electric Vehicle Plotting Data

cd(home)


% Display Program Status

set(handles.ProgramStatus, 'String', 'Simulation Complete');
pause(0.001);


toc(ticTOTAL);  % Stop Timer

[~] = beepsound(home);  % Beep at Program Completion


% --- Executes on button press in UpdateResults_Button.
function UpdateResults_Button_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateResults_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in ElectricVehicle_CheckBox.
function ElectricVehicle_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to ElectricVehicle_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ElectricVehicle_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in HVAC_CheckBox.
function HVAC_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to HVAC_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HVAC_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in WaterHeater_CheckBox.
function WaterHeater_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeater_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of WaterHeater_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Refrigerator_CheckBox.
function Refrigerator_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Refrigerator_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Refrigerator_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Freezer_CheckBox.
function Freezer_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Freezer_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Freezer_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Washer_CheckBox.
function Washer_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Washer_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Washer_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Dryer_CheckBox.
function Dryer_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Dryer_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Dryer_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Dishwasher_CheckBox.
function Dishwasher_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Dishwasher_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Dishwasher_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Cooking_CheckBox.
function Cooking_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Cooking_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Cooking_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Lighting_CheckBox.
function Lighting_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Lighting_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Lighting_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Television_CheckBox.
function Television_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Television_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Television_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Computer_CheckBox.
function Computer_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Computer_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Computer_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on button press in Additional_CheckBox.
function Additional_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to Additional_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Additional_CheckBox

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Go to Select Results Function

if isdir(fullfile(outputdata,'Text Files'))
    
    Select_Results_Callback(hObject, eventdata, handles)
end


% --- Executes on selection change in Select_Results.
function Select_Results_Callback(hObject, eventdata, handles)
% hObject    handle to Select_Results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Select_Results contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Select_Results

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
outputdata = struct.outputdata;


% Change Current Directory

cd(fullfile(outputdata,'Text Files'));


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Get Radio Button and Check Box Handles

a = get(handles.Select_Results, 'Value');

b(1) = get(handles.OneSecond_RadioButton, 'Value');
b(2) = get(handles.OneMinute_RadioButton, 'Value');
b(3) = get(handles.FiveMinute_RadioButton, 'Value');
b(4) = get(handles.TenMinute_RadioButton, 'Value');
b(5) = get(handles.ThirtyMinute_RadioButton, 'Value');
b(6) = get(handles.OneHour_RadioButton, 'Value');

c(1) = get(handles.ElectricVehicle_CheckBox, 'Value');
c(2) = get(handles.HVAC_CheckBox, 'Value');
c(3) = get(handles.WaterHeater_CheckBox, 'Value');
c(4) = get(handles.Refrigerator_CheckBox, 'Value');
c(5) = get(handles.Freezer_CheckBox, 'Value');
c(6) = get(handles.Washer_CheckBox, 'Value');
c(7) = get(handles.Dryer_CheckBox, 'Value');
c(8) = get(handles.Dishwasher_CheckBox, 'Value');
c(9) = get(handles.Cooking_CheckBox, 'Value');
c(10) = get(handles.Lighting_CheckBox, 'Value');
c(11) = get(handles.Television_CheckBox, 'Value');
c(12) = get(handles.Computer_CheckBox, 'Value');
c(13) = get(handles.Additional_CheckBox, 'Value');


if b(1) == 1
    results_time_step = 1;      % 1 Second Resolution
    dt = 1*(time_step/60);      % Step Change in Seconds or Minutes
elseif b(2) == 1
    results_time_step = 2;      % 1 Minute Resolution
    dt = 60*(time_step/60);     % Step Change in Seconds or Minutes
elseif b(3) == 1
    results_time_step = 3;      % 5 Minute Resolution
    dt = 300*(time_step/60);    % Step Change in Seconds or Minutes
elseif b(4) == 1
    results_time_step = 4;      % 10 Minute Resolution
    dt = 600*(time_step/60);    % Step Change in Seconds or Minutes
elseif b(5) == 1
    results_time_step = 5;      % 30 Minute Resolution
    dt = 1800*(time_step/60);   % Step Change in Seconds or Minutes
elseif b(6) == 1
    results_time_step = 6;      % 1 Hour Resolution
    dt = 3600*(time_step/60);   % Step Change in Seconds or Minutes
end


% Simulation/Results Time Step Mismatch Errors

if time_step == 1 && results_time_step == 1 % If Simulation Time Step is 1 Minute and Results Time Step is 1 Second
    
    set(handles.OneMinute_RadioButton, 'Value', 1);
    
    results_time_step = 2;      % 1 Minute Resolution
    dt = 60*(time_step/60);     % Step Change in Seconds or Minutes
    
elseif time_step == 60 && mod(length(load('TotalPowerDemand.txt')), 24*60*time_step) ~= 0   % If Simulation Time Step is 1 Second and Results are Not 1 Second
    cla reset
    
    errordlg('Incorrect Simulation Time Step Selected for these Results', 'Error')
    cd(home)
    return
end


% Plot Outputs

if a == 1
    cla reset
elseif a == 2
    cla reset
elseif a == 3
    Total_Power = load('TotalPowerDemand.txt');
    Total_Reactive = load('TotalReactivePowerDemand.txt');
    Total_Power_DR = load('TotalPowerDemand_DR.txt');
    Total_Reactive_DR = load('TotalReactivePowerDemand_DR.txt');
    
    if c(1) == 0
        EV_Power = load('ElectricVehiclePowerDemand.txt');
        EV_Reactive = load('ElectricVehicleReactivePowerDemand.txt');
        
        Total_Power = Total_Power - EV_Power;
        Total_Reactive = Total_Reactive - EV_Reactive;
        
        if max(Total_Power_DR) > 0
            Total_Power_DR = Total_Power_DR - EV_Power;
            Total_Reactive_DR = Total_Reactive_DR - EV_Reactive;
        end
    end
    
    if c(2) == 0
        HVAC_Power = load('HVACPowerDemand.txt');
        HVAC_Reactive = load('HVACReactivePowerDemand.txt');
        HVAC_Power_DR = load('HVACPowerDemand_DR.txt');
        HVAC_Reactive_DR = load('HVACReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - HVAC_Power;
        Total_Reactive = Total_Reactive - HVAC_Reactive;
        Total_Power_DR = Total_Power_DR - HVAC_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - HVAC_Reactive_DR;
    end
    
    if c(3) == 0
        WaterHeater_Power = load('WaterHeaterPowerDemand.txt');
        WaterHeater_Reactive = load('WaterHeaterReactivePowerDemand.txt');
        WaterHeater_Power_DR = load('WaterHeaterPowerDemand_DR.txt');
        WaterHeater_Reactive_DR = load('WaterHeaterReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - WaterHeater_Power;
        Total_Reactive = Total_Reactive - WaterHeater_Reactive;
        Total_Power_DR = Total_Power_DR - WaterHeater_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - WaterHeater_Reactive_DR;
    end
    
    if c(4) == 0
        Refrigerator_Power = load('RefrigeratorPowerDemand.txt');
        Refrigerator_Reactive = load('RefrigeratorReactivePowerDemand.txt');
        Refrigerator_Power_DR = load('RefrigeratorPowerDemand_DR.txt');
        Refrigerator_Reactive_DR = load('RefrigeratorReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - Refrigerator_Power;
        Total_Reactive = Total_Reactive - Refrigerator_Reactive;
        Total_Power_DR = Total_Power_DR - Refrigerator_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - Refrigerator_Reactive_DR;
    end
    
    if c(5) == 0
        Freezer_Power = load('FreezerPowerDemand.txt');
        Freezer_Reactive = load('FreezerReactivePowerDemand.txt');
        Freezer_Power_DR = load('FreezerPowerDemand_DR.txt');
        Freezer_Reactive_DR = load('FreezerReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - Freezer_Power;
        Total_Reactive = Total_Reactive - Freezer_Reactive;
        Total_Power_DR = Total_Power_DR - Freezer_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - Freezer_Reactive_DR;
    end
    
    if c(6) == 0
        Washer_Power = load('WasherPowerDemand.txt');
        Washer_Reactive = load('WasherReactivePowerDemand.txt');
        Washer_Power_DR = load('WasherPowerDemand_DR.txt');
        Washer_Reactive_DR = load('WasherReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - Washer_Power;
        Total_Reactive = Total_Reactive - Washer_Reactive;
        Total_Power_DR = Total_Power_DR - Washer_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - Washer_Reactive_DR;
    end
    
    if c(7) == 0
        Dryer_Power = load('DryerPowerDemand.txt');
        Dryer_Reactive = load('DryerReactivePowerDemand.txt');
        Dryer_Power_DR = load('DryerPowerDemand_DR.txt');
        Dryer_Reactive_DR = load('DryerReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - Dryer_Power;
        Total_Reactive = Total_Reactive - Dryer_Reactive;
        Total_Power_DR = Total_Power_DR - Dryer_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - Dryer_Reactive_DR;
    end
    
    if c(8) == 0
        Dishwasher_Power = load('DishwasherPowerDemand.txt');
        Dishwasher_Reactive = load('DishwasherReactivePowerDemand.txt');
        Dishwasher_Power_DR = load('DishwasherPowerDemand_DR.txt');
        Dishwasher_Reactive_DR = load('DishwasherReactivePowerDemand_DR.txt');
        
        Total_Power = Total_Power - Dishwasher_Power;
        Total_Reactive = Total_Reactive - Dishwasher_Reactive;
        Total_Power_DR = Total_Power_DR - Dishwasher_Power_DR;
        Total_Reactive_DR = Total_Reactive_DR - Dishwasher_Reactive_DR;
    end
    
    if c(9) == 0
        Cooking_Power = load('CookingPowerDemand.txt');
        Cooking_Reactive = load('CookingReactivePowerDemand.txt');
        
        Total_Power = Total_Power - Cooking_Power;
        Total_Reactive = Total_Reactive - Cooking_Reactive;
        
        if max(Total_Power_DR) > 0
            Total_Power_DR = Total_Power_DR - Cooking_Power;
            Total_Reactive_DR = Total_Reactive_DR - Cooking_Reactive;
        end
    end
    
    if c(10) == 0
        Lighting_Power = load('LightingPowerDemand.txt');
        Lighting_Reactive = load('LightingReactivePowerDemand.txt');
        
        Total_Power = Total_Power - Lighting_Power;
        Total_Reactive = Total_Reactive - Lighting_Reactive;
        
        if max(Total_Power_DR) > 0
            Total_Power_DR = Total_Power_DR - Lighting_Power;
            Total_Reactive_DR = Total_Reactive_DR - Lighting_Reactive;
        end
    end
    
    if c(11) == 0
        Television_Power = load('TelevisionPowerDemand.txt');
        Television_Reactive = load('TelevisionReactivePowerDemand.txt');
        
        Total_Power = Total_Power - Television_Power;
        Total_Reactive = Total_Reactive - Television_Reactive;
        
        if max(Total_Power_DR) > 0
            Total_Power_DR = Total_Power_DR - Television_Power;
            Total_Reactive_DR = Total_Reactive_DR - Television_Reactive;
        end
    end
    
    if c(12) == 0
        Computer_Power = load('ComputerPowerDemand.txt');
        Computer_Reactive = load('ComputerReactivePowerDemand.txt');
        
        Total_Power = Total_Power - Computer_Power;
        Total_Reactive = Total_Reactive - Computer_Reactive;
        
        if max(Total_Power_DR) > 0
            Total_Power_DR = Total_Power_DR - Computer_Power;
            Total_Reactive_DR = Total_Reactive_DR - Computer_Reactive;
        end
    end
    
    if c(13) == 0
        Additional_Power = load('AdditionalPowerDemand.txt');
        Additional_Reactive = load('AdditionalReactivePowerDemand.txt');
        
        Total_Power = Total_Power - Additional_Power;
        Total_Reactive = Total_Reactive - Additional_Reactive;
        
        if max(Total_Power_DR) > 0
            Total_Power_DR = Total_Power_DR - Additional_Power;
            Total_Reactive_DR = Total_Reactive_DR - Additional_Reactive;
        end
    end
    
    time = 1:length(Total_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Total_Power/1000, 'b-', time, Total_Reactive/1000, 'g-', time, Total_Power_DR/1000, 'r--', time, Total_Reactive_DR/1000, 'c--')
            grid on
            title('Total Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Total_Power)/dt;
            Total_Power2 = zeros(length(time2), 1);
            Total_Reactive2 = zeros(length(time2), 1);
            Total_Power_DR2 = zeros(length(time2), 1);
            Total_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Total_Power2(j) = mean(Total_Power(i:(i+dt)-1, 1));
                Total_Reactive2(j) = mean(Total_Reactive(i:(i+dt)-1, 1));
                Total_Power_DR2(j) = mean(Total_Power_DR(i:(i+dt)-1, 1));
                Total_Reactive_DR2(j) = mean(Total_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Total_Power2/1000, 'b-', time2, Total_Reactive2/1000, 'g-', time2, Total_Power_DR2/1000, 'r--', time2, Total_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 4
    Total_Power = load('TotalPowerDemand.txt');
    
    time = 1:length(Total_Power);
    
    if c(1) == 1
        EV_Power = load('ElectricVehiclePowerDemand.txt');
    else
        EV_Power = zeros(length(time), 1);
    end
    
    if c(2) == 1
        HVAC_Power = load('HVACPowerDemand.txt');
    else
        HVAC_Power = zeros(length(time), 1);
    end
    
    if c(3) == 1
        WaterHeater_Power = load('WaterHeaterPowerDemand.txt');
    else
        WaterHeater_Power = zeros(length(time), 1);
    end
    
    if c(4) == 1
        Refrigerator_Power = load('RefrigeratorPowerDemand.txt');
    else
        Refrigerator_Power = zeros(length(time), 1);
    end
    
    if c(5) == 1
        Freezer_Power = load('FreezerPowerDemand.txt');
    else
        Freezer_Power = zeros(length(time), 1);
    end
    
    if c(6) == 1
        Washer_Power = load('WasherPowerDemand.txt');
    else
        Washer_Power = zeros(length(time), 1);
    end
    
    if c(7) == 1
        Dryer_Power = load('DryerPowerDemand.txt');
    else
        Dryer_Power = zeros(length(time), 1);
    end
    
    if c(8) == 1
        Dishwasher_Power = load('DishwasherPowerDemand.txt');
    else
        Dishwasher_Power = zeros(length(time), 1);
    end
    
    if c(9) == 1
        Cooking_Power = load('CookingPowerDemand.txt');
    else
        Cooking_Power = zeros(length(time), 1);
    end
    
    if c(10) == 1
        Lighting_Power = load('LightingPowerDemand.txt');
    else
        Lighting_Power = zeros(length(time), 1);
    end
    
    if c(11) == 1
        Television_Power = load('TelevisionPowerDemand.txt');
    else
        Television_Power = zeros(length(time), 1);
    end
    
    if c(12) == 1
        Computer_Power = load('ComputerPowerDemand.txt');
    else
        Computer_Power = zeros(length(time), 1);
    end
    
    if c(13) == 1
        Additional_Power = load('AdditionalPowerDemand.txt');
    else
        Additional_Power = zeros(length(time), 1);
    end
    
    Total_Power = [Additional_Power, Computer_Power, Television_Power, Lighting_Power, Cooking_Power, Dishwasher_Power,...
        Dryer_Power, Washer_Power, Freezer_Power, Refrigerator_Power, WaterHeater_Power, HVAC_Power, EV_Power];
    
    switch results_time_step
        case 1
            area(handles.Results_Plot, Total_Power/1000)
            grid on
            colormap([jet(size(Total_Power,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Real Power Demand')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kW)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Total_Power)/dt;
            Total_Power2 = zeros(length(time2), size(Total_Power,2));
            
            for k = 1:size(Total_Power,2)
                j = 0;
                for i = 1:dt:length(time)
                    j = j + 1;
                    Total_Power2(j, k) = mean(Total_Power(i:(i+dt)-1, k));
                end
            end
            area(handles.Results_Plot, Total_Power2/1000)
            grid on
            colormap([jet(size(Total_Power2,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Real Power Demand')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kW)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 5
    Total_Reactive = load('TotalReactivePowerDemand.txt');
    
    time = 1:length(Total_Reactive);
    
    if c(1) == 1
        EV_Reactive = load('ElectricVehicleReactivePowerDemand.txt');
    else
        EV_Reactive = zeros(length(time), 1);
    end
    
    if c(2) == 1
        HVAC_Reactive = load('HVACReactivePowerDemand.txt');
    else
        HVAC_Reactive = zeros(length(time), 1);
    end
    
    if c(3) == 1
        WaterHeater_Reactive = load('WaterHeaterReactivePowerDemand.txt');
    else
        WaterHeater_Reactive = zeros(length(time), 1);
    end
    
    if c(4) == 1
        Refrigerator_Reactive = load('RefrigeratorReactivePowerDemand.txt');
    else
        Refrigerator_Reactive = zeros(length(time), 1);
    end
    
    if c(5) == 1
        Freezer_Reactive = load('FreezerReactivePowerDemand.txt');
    else
        Freezer_Reactive = zeros(length(time), 1);
    end
    
    if c(6) == 1
        Washer_Reactive = load('WasherReactivePowerDemand.txt');
    else
        Washer_Reactive = zeros(length(time), 1);
    end
    
    if c(7) == 1
        Dryer_Reactive = load('DryerReactivePowerDemand.txt');
    else
        Dryer_Reactive = zeros(length(time), 1);
    end
    
    if c(8) == 1
        Dishwasher_Reactive = load('DishwasherReactivePowerDemand.txt');
    else
        Dishwasher_Reactive = zeros(length(time), 1);
    end
    
    if c(9) == 1
        Cooking_Reactive = load('CookingReactivePowerDemand.txt');
    else
        Cooking_Reactive = zeros(length(time), 1);
    end
    
    if c(10) == 1
        Lighting_Reactive = load('LightingReactivePowerDemand.txt');
    else
        Lighting_Reactive = zeros(length(time), 1);
    end
    
    if c(11) == 1
        Television_Reactive = load('TelevisionReactivePowerDemand.txt');
    else
        Television_Reactive = zeros(length(time), 1);
    end
    
    if c(12) == 1
        Computer_Reactive = load('ComputerReactivePowerDemand.txt');
    else
        Computer_Reactive = zeros(length(time), 1);
    end
    
    if c(13) == 1
        Additional_Reactive = load('AdditionalReactivePowerDemand.txt');
    else
        Additional_Reactive = zeros(length(time), 1);
    end
    
    Total_Reactive = [Additional_Reactive, Computer_Reactive, Television_Reactive, Lighting_Reactive, Cooking_Reactive, Dishwasher_Reactive,...
        Dryer_Reactive, Washer_Reactive, Freezer_Reactive, Refrigerator_Reactive, WaterHeater_Reactive, HVAC_Reactive, EV_Reactive];
    
    switch results_time_step
        case 1
            area(handles.Results_Plot, Total_Reactive/1000)
            grid on
            colormap([jet(size(Total_Reactive,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Reactive Power Demand')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            cla reset
            time2 = 1:length(Total_Reactive)/dt;
            Total_Reactive2 = zeros(length(time2), size(Total_Reactive,2));
            
            for k = 1:size(Total_Reactive,2)
                j = 0;
                for i = 1:dt:length(time)
                    j = j + 1;
                    Total_Reactive2(j, k) = mean(Total_Reactive(i:(i+dt)-1, k));
                end
            end
            area(handles.Results_Plot, Total_Reactive2/1000)
            grid on
            colormap([jet(size(Total_Reactive2,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Reactive Power Demand')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 6
    Total_Power_DR = load('TotalPowerDemand_DR.txt');
    
    time = 1:length(Total_Power_DR);
    
    if c(1) == 1
        if max(Total_Power_DR) ~= 0
            EV_Power = load('ElectricVehiclePowerDemand.txt');
        else
            EV_Power = zeros(length(time), 1);
        end
    else
        EV_Power = zeros(length(time), 1);
    end
    
    if c(2) == 1
        HVAC_Power_DR = load('HVACPowerDemand_DR.txt');
    else
        HVAC_Power_DR = zeros(length(time), 1);
    end
    
    if c(3) == 1
        WaterHeater_Power_DR = load('WaterHeaterPowerDemand_DR.txt');
    else
        WaterHeater_Power_DR = zeros(length(time), 1);
    end
    
    if c(4) == 1
        Refrigerator_Power_DR = load('RefrigeratorPowerDemand_DR.txt');
    else
        Refrigerator_Power_DR = zeros(length(time), 1);
    end
    
    if c(5) == 1
        Freezer_Power_DR = load('FreezerPowerDemand_DR.txt');
    else
        Freezer_Power_DR = zeros(length(time), 1);
    end
    
    if c(6) == 1
        Washer_Power_DR = load('WasherPowerDemand_DR.txt');
    else
        Washer_Power_DR = zeros(length(time), 1);
    end
    
    if c(7) == 1
        Dryer_Power_DR = load('DryerPowerDemand_DR.txt');
    else
        Dryer_Power_DR = zeros(length(time), 1);
    end
    
    if c(8) == 1
        Dishwasher_Power_DR = load('DishwasherPowerDemand_DR.txt');
    else
        Dishwasher_Power_DR = zeros(length(time), 1);
    end
    
    if c(9) == 1
        if max(Total_Power_DR) ~= 0
            Cooking_Power = load('CookingPowerDemand.txt');
        else
            Cooking_Power = zeros(length(time), 1);
        end
    else
        Cooking_Power = zeros(length(time), 1);
    end
    
    if c(10) == 1
        if max(Total_Power_DR) ~= 0
            Lighting_Power = load('LightingPowerDemand.txt');
        else
            Lighting_Power = zeros(length(time), 1);
        end
    else
        Lighting_Power = zeros(length(time), 1);
    end
    
    if c(11) == 1
        if max(Total_Power_DR) ~= 0
            Television_Power = load('TelevisionPowerDemand.txt');
        else
            Television_Power = zeros(length(time), 1);
        end
    else
        Television_Power = zeros(length(time), 1);
    end
    
    if c(12) == 1
        if max(Total_Power_DR) ~= 0
            Computer_Power = load('ComputerPowerDemand.txt');
        else
            Computer_Power = zeros(length(time), 1);
        end
    else
        Computer_Power = zeros(length(time), 1);
    end
    
    if c(13) == 1
        if max(Total_Power_DR) ~= 0
            Additional_Power = load('AdditionalPowerDemand.txt');
        else
            Additional_Power = zeros(length(time), 1);
        end
    else
        Additional_Power = zeros(length(time), 1);
    end
    
    Total_Power_DR = [Additional_Power, Computer_Power, Television_Power, Lighting_Power, Cooking_Power, Dishwasher_Power_DR,...
        Dryer_Power_DR, Washer_Power_DR, Freezer_Power_DR, Refrigerator_Power_DR, WaterHeater_Power_DR, HVAC_Power_DR, EV_Power];
    
    switch results_time_step
        case 1
            area(handles.Results_Plot, Total_Power_DR/1000)
            grid on
            colormap([jet(size(Total_Power_DR,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Real Power Demand (Demand Response)')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kW)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Total_Power_DR)/dt;
            Total_Power_DR2 = zeros(length(time2), size(Total_Power_DR,2));
            
            for k = 1:size(Total_Power_DR,2)
                j = 0;
                for i = 1:dt:length(time)
                    j = j + 1;
                    Total_Power_DR2(j, k) = mean(Total_Power_DR(i:(i+dt)-1, k));
                end
            end
            area(handles.Results_Plot, Total_Power_DR2/1000)
            grid on
            colormap([jet(size(Total_Power_DR2,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Real Power Demand (Demand Response)')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kW)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 7
    Total_Reactive_DR = load('TotalReactivePowerDemand_DR.txt');
    
    time = 1:length(Total_Reactive_DR);
    
    if c(1) == 1
        if max(Total_Reactive_DR) ~= 0
            EV_Reactive = load('ElectricVehicleReactivePowerDemand.txt');
        else
            EV_Reactive = zeros(length(time), 1);
        end
    else
        EV_Reactive = zeros(length(time), 1);
    end
    
    if c(2) == 1
        HVAC_Reactive_DR = load('HVACReactivePowerDemand_DR.txt');
    else
        HVAC_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(3) == 1
        WaterHeater_Reactive_DR = load('WaterHeaterReactivePowerDemand_DR.txt');
    else
        WaterHeater_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(4) == 1
        Refrigerator_Reactive_DR = load('RefrigeratorReactivePowerDemand_DR.txt');
    else
        Refrigerator_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(5) == 1
        Freezer_Reactive_DR = load('FreezerReactivePowerDemand_DR.txt');
    else
        Freezer_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(6) == 1
        Washer_Reactive_DR = load('WasherReactivePowerDemand_DR.txt');
    else
        Washer_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(7) == 1
        Dryer_Reactive_DR = load('DryerReactivePowerDemand_DR.txt');
    else
        Dryer_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(8) == 1
        Dishwasher_Reactive_DR = load('DishwasherReactivePowerDemand_DR.txt');
    else
        Dishwasher_Reactive_DR = zeros(length(time), 1);
    end
    
    if c(9) == 1
        if max(Total_Reactive_DR) ~= 0
            Cooking_Reactive = load('CookingReactivePowerDemand.txt');
        else
            Cooking_Reactive = zeros(length(time), 1);
        end
    else
        Cooking_Reactive = zeros(length(time), 1);
    end
    
    if c(10) == 1
        if max(Total_Reactive_DR) ~= 0
            Lighting_Reactive = load('LightingReactivePowerDemand.txt');
        else
            Lighting_Reactive = zeros(length(time), 1);
        end
    else
        Lighting_Reactive = zeros(length(time), 1);
    end
    
    if c(11) == 1
        if max(Total_Reactive_DR) ~= 0
            Television_Reactive = load('TelevisionReactivePowerDemand.txt');
        else
            Television_Reactive = zeros(length(time), 1);
        end
    else
        Television_Reactive = zeros(length(time), 1);
    end
    
    if c(12) == 1
        if max(Total_Reactive_DR) ~= 0
            Computer_Reactive = load('ComputerReactivePowerDemand.txt');
        else
            Computer_Reactive = zeros(length(time), 1);
        end
    else
        Computer_Reactive = zeros(length(time), 1);
    end
    
    if c(13) == 1
        if max(Total_Reactive_DR) ~= 0
            Additional_Reactive = load('AdditionalReactivePowerDemand.txt');
        else
            Additional_Reactive = zeros(length(time), 1);
        end
    else
        Additional_Reactive = zeros(length(time), 1);
    end
    
    Total_Reactive_DR = [Additional_Reactive, Computer_Reactive, Television_Reactive, Lighting_Reactive, Cooking_Reactive, Dishwasher_Reactive_DR,...
        Dryer_Reactive_DR, Washer_Reactive_DR, Freezer_Reactive_DR, Refrigerator_Reactive_DR, WaterHeater_Reactive_DR, HVAC_Reactive_DR, EV_Reactive];
    
    switch results_time_step
        case 1
            area(handles.Results_Plot, Total_Reactive_DR/1000)
            grid on
            colormap([jet(size(Total_Reactive_DR,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Reactive Power Demand (Demand Response)')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Total_Reactive_DR)/dt;
            Total_Reactive_DR2 = zeros(length(time2), size(Total_Reactive_DR,2));
            
            for k = 1:size(Total_Reactive_DR,2)
                j = 0;
                for i = 1:dt:length(time)
                    j = j + 1;
                    Total_Reactive_DR2(j, k) = mean(Total_Reactive_DR(i:(i+dt)-1, k));
                end
            end
            area(handles.Results_Plot, Total_Reactive_DR2/1000)
            grid on
            colormap([jet(size(Total_Reactive_DR2,2) - 1); 0.5,0.5,0.5])
            set(gca,'Layer','top')
            title('Total Reactive Power Demand (Demand Response)')
            legend('Additional', 'Computer', 'Television', 'Lighting', 'Cooking', 'Dishwasher', 'Dryer', 'Washer', 'Freezer', 'Refrigerator', 'Water Heater', 'HVAC', 'Electric Vehicle', 'Location', 'Best')
            ylabel('Power Demand (kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 8
    cla reset
elseif a == 9
    cla reset
elseif a == 10
    Outdoor_Temp = load('OutdoorAirTemperature.txt');
    time = 1:length(Outdoor_Temp);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Outdoor_Temp, 'b-', time, Outdoor_Temp + 2.5, 'm--', time, Outdoor_Temp - 2.5, 'm--')
            grid on
            title('Outdoor Air Temperature')
            ylabel('Temperature (F)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Outdoor_Temp)/dt;
            Outdoor_Temp2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Outdoor_Temp2(j) = mean(Outdoor_Temp(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Outdoor_Temp2, 'b-', time2, Outdoor_Temp2 + 2.5, 'm--', time2, Outdoor_Temp2 - 2.5, 'm--')
            grid on
            title('Outdoor Air Temperature')
            ylabel('Temperature (F)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 11
    Global_Irrad = load('GlobalHorizontalIrradiance.txt');
    time = 1:length(Global_Irrad);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Global_Irrad)
            grid on
            title('Global Horizontal Irradiance')
            ylabel('Global Horizontal Irradiance (W/m^2)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Global_Irrad)/dt;
            Global_Irrad2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Global_Irrad2(j) = mean(Global_Irrad(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Global_Irrad2)
            grid on
            title('Global Horizontal Irradiance')
            ylabel('Global Horizontal Irradiance (W/m^2)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 12
    Direct_Irrad = load('DirectNormalIrradiance.txt');
    time = 1:length(Direct_Irrad);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Direct_Irrad, 'b-', time, 0.9*Direct_Irrad, 'm--', time, 1.1*Direct_Irrad, 'm--')
            grid on
            title('Direct Normal Irradiance')
            ylabel('Direct Normal Irradiance (W/m^2)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Direct_Irrad)/dt;
            Direct_Irrad2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Direct_Irrad2(j) = mean(Direct_Irrad(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Direct_Irrad2, 'b-', time2, 0.9*Direct_Irrad2, 'm--', time2, 1.1*Direct_Irrad2, 'm--')
            grid on
            title('Direct Normal Irradiance')
            ylabel('Direct Normal Irradiance (W/m^2)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 13
    Diffuse_Irrad = load('DiffuseHorizontalIrradiance.txt');
    time = 1:length(Diffuse_Irrad);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Diffuse_Irrad, 'b-', time, 0.9*Diffuse_Irrad, 'm--', time, 1.1*Diffuse_Irrad, 'm--')
            grid on
            title('Diffuse Horizontal Irradiance')
            ylabel('Diffuse Horizontal Irradiance (W/m^2)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Diffuse_Irrad)/dt;
            Diffuse_Irrad2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Diffuse_Irrad2(j) = mean(Diffuse_Irrad(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Diffuse_Irrad2, 'b-', time2, 0.9*Diffuse_Irrad2, 'm--', time2, 1.1*Diffuse_Irrad2, 'm--')
            grid on
            title('Diffuse Horizontal Irradiance')
            ylabel('Diffuse Horizontal Irradiance (W/m^2)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 14
    Global_Illum = load('GlobalHorizontalIlluminance.txt');
    time = 1:length(Global_Illum);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Global_Illum)
            grid on
            title('Global Horizontal Illuminance')
            ylabel('Global Horizontal Illuminance (lux)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Global_Illum)/dt;
            Global_Illum2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Global_Illum2(j) = mean(Global_Illum(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Global_Illum2)
            grid on
            title('Global Horizontal Illuminance')
            ylabel('Global Horizontal Illuminance (lux)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 15
    Direct_Illum = load('DirectNormalIlluminance.txt');
    time = 1:length(Direct_Illum);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Direct_Illum)
            grid on
            title('Direct Normal Illuminance')
            ylabel('Direct Normal Illuminance (lux)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Direct_Illum)/dt;
            Direct_Illum2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Direct_Illum2(j) = mean(Direct_Illum(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Direct_Illum2)
            grid on
            title('Direct Normal Illuminance')
            ylabel('Direct Normal Illuminance (lux)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 16
    Diffuse_Illum = load('DiffuseHorizontalIlluminance.txt');
    time = 1:length(Diffuse_Illum);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Diffuse_Illum, 'b-', time, 0.9*Diffuse_Illum, 'm--', time, 1.1*Diffuse_Illum, 'm--')
            grid on
            title('Diffuse Horizontal Illuminance')
            ylabel('Diffuse Horizontal Illuminance (lux)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Diffuse_Illum)/dt;
            Diffuse_Illum2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Diffuse_Illum2(j) = mean(Diffuse_Illum(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Diffuse_Illum2, 'b-', time2, 0.9*Diffuse_Illum2, 'm--', time2, 1.1*Diffuse_Illum2, 'm--')
            grid on
            title('Diffuse Horizontal Illuminance')
            ylabel('Diffuse Horizontal Illuminance (lux)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 17
    Wind_Speed = load('WindSpeed.txt');
    time = 1:length(Wind_Speed);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Wind_Speed)
            grid on
            title('Average Wind Speed at 42 ft')
            ylabel('Average Wind Speed (m/s)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Wind_Speed)/dt;
            Wind_Speed2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Wind_Speed2(j) = mean(Wind_Speed(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Wind_Speed2)
            grid on
            title('Average Wind Speed at 42 ft')
            ylabel('Average Wind Speed (m/s)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 18
    Peak_Wind_Speed = load('PeakWindSpeed.txt');
    time = 1:length(Peak_Wind_Speed);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Peak_Wind_Speed)
            grid on
            title('Peak Wind Speed at 42 ft')
            ylabel('Peak Wind Speed (m/s)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Peak_Wind_Speed)/dt;
            Peak_Wind_Speed2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Peak_Wind_Speed2(j) = mean(Peak_Wind_Speed(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Peak_Wind_Speed2)
            grid on
            title('Peak Wind Speed at 42 ft')
            ylabel('Peak Wind Speed (m/s)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 19
    Wind_Direction = load('WindDirection.txt');
    time = 1:length(Wind_Direction);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Wind_Direction)
            grid on
            title('Average Wind Direction at 42 ft')
            ylabel('Average Wind Direction (Degrees from North)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Wind_Direction)/dt;
            Wind_Direction2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Wind_Direction2(j) = mean(Wind_Direction(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Wind_Direction2)
            grid on
            title('Average Wind Direction at 42 ft')
            ylabel('Average Wind Direction (Degrees from North)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 20
    Relative_Humidity = load('RelativeHumidity.txt');
    time = 1:length(Relative_Humidity);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Relative_Humidity)
            grid on
            title('Relative Humidity')
            ylabel('Relative Humidity (%)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Relative_Humidity)/dt;
            Relative_Humidity2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Relative_Humidity2(j) = mean(Relative_Humidity(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Relative_Humidity2)
            grid on
            title('Relative Humidity')
            ylabel('Relative Humidity (%)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 21
    Precipitation = load('Precipitation.txt');
    time = 1:length(Precipitation);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Precipitation)
            grid on
            title('Precipitation')
            ylabel('Precipitation (mm)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Precipitation)/dt;
            Precipitation2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Precipitation2(j) = mean(Precipitation(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Precipitation2)
            grid on
            title('Precipitation')
            ylabel('Precipitation (mm)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 22
    Accumulated_Precipitation = load('AccumulatedPrecipitation.txt');
    time = 1:length(Accumulated_Precipitation);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Accumulated_Precipitation)
            grid on
            title('Accumulated Precipitation')
            ylabel('Accumulated Precipitation (mm)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Accumulated_Precipitation)/dt;
            Accumulated_Precipitation2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Accumulated_Precipitation2(j) = mean(Accumulated_Precipitation(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Accumulated_Precipitation2)
            grid on
            title('Accumulated Precipitation')
            ylabel('Accumulated Precipitation (mm)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 23
    Estimated_Pressure = load('EstimatedPressure.txt');
    time = 1:length(Estimated_Pressure);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Estimated_Pressure)
            grid on
            title('Estimated Pressure')
            ylabel('Estimated Pressure (mBar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Estimated_Pressure)/dt;
            Estimated_Pressure2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Estimated_Pressure2(j) = mean(Estimated_Pressure(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Estimated_Pressure2)
            grid on
            title('Estimated Pressure')
            ylabel('Estimated Pressure (mBar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 24
    cla reset
elseif a == 25
    cla reset
elseif a == 26
    HVAC_Power = load('HVACPowerDemand.txt');
    HVAC_Reactive = load('HVACReactivePowerDemand.txt');
    HVAC_Q = load('HVACHeatTransfer.txt');
    HVAC_Power_DR = load('HVACPowerDemand_DR.txt');
    HVAC_Reactive_DR = load('HVACReactivePowerDemand_DR.txt');
    HVAC_Q_DR = load('HVACHeatTransfer_DR.txt');
    time = 1:length(HVAC_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, abs(HVAC_Q)/1000, 'r-', time, HVAC_Power/1000, 'b-', time, HVAC_Reactive/1000, 'g-', time, abs(HVAC_Q_DR)/1000, 'y--', time, HVAC_Power_DR/1000, 'r--', time, HVAC_Reactive_DR/1000, 'c--')
            grid on
            title('Total HVAC Power Demand and Heat Transfer')
            legend('Heat Transfer', 'Real Power', 'Reactive Power', 'Heat Transfer (Demand Response)', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(HVAC_Power)/dt;
            HVAC_Power2 = zeros(length(time2), 1);
            HVAC_Reactive2 = zeros(length(time2), 1);
            HVAC_Q2 = zeros(length(time2), 1);
            HVAC_Power_DR2 = zeros(length(time2), 1);
            HVAC_Reactive_DR2 = zeros(length(time2), 1);
            HVAC_Q_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                HVAC_Power2(j) = mean(HVAC_Power(i:(i+dt)-1, 1));
                HVAC_Reactive2(j) = mean(HVAC_Reactive(i:(i+dt)-1, 1));
                HVAC_Q2(j) = mean(HVAC_Q(i:(i+dt)-1, 1));
                HVAC_Power_DR2(j) = mean(HVAC_Power_DR(i:(i+dt)-1, 1));
                HVAC_Reactive_DR2(j) = mean(HVAC_Reactive_DR(i:(i+dt)-1, 1));
                HVAC_Q_DR2(j) = mean(HVAC_Q_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, abs(HVAC_Q2)/1000, 'r-', time2, HVAC_Power2/1000, 'b-', time2, HVAC_Reactive2/1000, 'g-', time2, abs(HVAC_Q_DR2)/1000, 'y--', time2, HVAC_Power_DR2/1000, 'r--', time2, HVAC_Reactive_DR2/1000, 'c--')
            grid on
            title('Total HVAC Power Demand and Heat Transfer')
            legend('Heat Transfer', 'Real Power', 'Reactive Power', 'Heat Transfer (Demand Response)', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 27
    HVAC_COP = load('HVACCoefficientOfPerformance.txt');
    HVAC_COP_DR = load('HVACCoefficientOfPerformance_DR.txt');
    time = 1:length(HVAC_COP);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, HVAC_COP, 'b-', time, HVAC_COP_DR, 'r--')
            grid on
            title('Average HVAC Coefficient of Performance')
            legend('COP', 'COP (Demand Response)', 'Location', 'Best')
            ylabel('Coefficient of Performance')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(HVAC_COP)/dt;
            HVAC_COP2 = zeros(length(time2), 1);
            HVAC_COP_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                HVAC_COP2(j) = mean(HVAC_COP(i:(i+dt)-1, 1));
                HVAC_COP_DR2(j) = mean(HVAC_COP_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, HVAC_COP2, 'b-', time2, HVAC_COP_DR2, 'r--')
            grid on
            title('Average HVAC Coefficient of Performance')
            legend('COP', 'COP (Demand Response)', 'Location', 'Best')
            ylabel('Coefficient of Performance')
            xlim([1 length(time2)+1])
    end
    
elseif a == 28
    Indoor_Temp = load('IndoorAirTemperature.txt');
    Indoor_Temp_DR = load('IndoorAirTemperature_DR.txt');
    time = 1:length(Indoor_Temp);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Indoor_Temp, 'b-', time, Indoor_Temp_DR, 'r--')
            grid on
            title('Average Indoor Air Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Indoor_Temp)/dt;
            Indoor_Temp2 = zeros(length(time2), 1);
            Indoor_Temp_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Indoor_Temp2(j) = mean(Indoor_Temp(i:(i+dt)-1, 1));
                Indoor_Temp_DR2(j) = mean(Indoor_Temp_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Indoor_Temp2, 'b-', time2, Indoor_Temp_DR2, 'r--')
            grid on
            title('Average Indoor Air Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 29
    Mass_Temp = load('MassTemperature.txt');
    Mass_Temp_DR = load('MassTemperature_DR.txt');
    time = 1:length(Mass_Temp);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Mass_Temp, 'b-', time, Mass_Temp_DR, 'r--')
            grid on
            title('Average Mass Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Mass_Temp)/dt;
            Mass_Temp2 = zeros(length(time2), 1);
            Mass_Temp_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Mass_Temp2(j) = mean(Mass_Temp(i:(i+dt)-1, 1));
                Mass_Temp_DR2(j) = mean(Mass_Temp_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Mass_Temp2, 'b-', time2, Mass_Temp_DR2, 'r--')
            grid on
            title('Average Mass Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 30
    Envelope_Temp = load('EnvelopeTemperature.txt');
    Envelope_Temp_DR = load('EnvelopeTemperature_DR.txt');
    time = 1:length(Envelope_Temp);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Envelope_Temp, 'b-', time, Envelope_Temp_DR, 'r--')
            grid on
            title('Average Envelope Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Envelope_Temp)/dt;
            Envelope_Temp2 = zeros(length(time2), 1);
            Envelope_Temp_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Envelope_Temp2(j) = mean(Envelope_Temp(i:(i+dt)-1, 1));
                Envelope_Temp_DR2(j) = mean(Envelope_Temp_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Envelope_Temp2, 'b-', time2, Envelope_Temp_DR2, 'r--')
            grid on
            title('Average Envelope Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 31
    cla reset
elseif a == 32
    cla reset
elseif a == 33
    WaterHeater_Power = load('WaterHeaterPowerDemand.txt');
    WaterHeater_Reactive = load('WaterHeaterReactivePowerDemand.txt');
    WaterHeater_Power_DR = load('WaterHeaterPowerDemand_DR.txt');
    WaterHeater_Reactive_DR = load('WaterHeaterReactivePowerDemand_DR.txt');
    time = 1:length(WaterHeater_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, WaterHeater_Power/1000, 'b-', time, WaterHeater_Reactive/1000, 'g-', time, WaterHeater_Power_DR/1000, 'r--', time, WaterHeater_Reactive_DR/1000, 'c--')
            grid on
            title('Total Water Heater Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(WaterHeater_Power)/dt;
            WaterHeater_Power2 = zeros(length(time2), 1);
            WaterHeater_Reactive2 = zeros(length(time2), 1);
            WaterHeater_Power_DR2 = zeros(length(time2), 1);
            WaterHeater_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                WaterHeater_Power2(j) = mean(WaterHeater_Power(i:(i+dt)-1, 1));
                WaterHeater_Reactive2(j) = mean(WaterHeater_Reactive(i:(i+dt)-1, 1));
                WaterHeater_Power_DR2(j) = mean(WaterHeater_Power_DR(i:(i+dt)-1, 1));
                WaterHeater_Reactive_DR2(j) = mean(WaterHeater_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, WaterHeater_Power2/1000, 'b-', time2, WaterHeater_Reactive2/1000, 'g-', time2, WaterHeater_Power_DR2/1000, 'r--', time2, WaterHeater_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Water Heater Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 34
    WaterHeater_FlowRate = load('WaterHeaterHotWaterDemand.txt');
    WaterHeater_FlowRate_DR = load('WaterHeaterHotWaterDemand_DR.txt');
    time = 1:length(WaterHeater_FlowRate);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, WaterHeater_FlowRate, 'b-', time, WaterHeater_FlowRate_DR, 'r--')
            grid on
            title('Total Water Heater Hot Water Demand')
            legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
            ylabel('Hot Water Demand (gal)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(WaterHeater_FlowRate)/dt;
            WaterHeater_FlowRate2 = zeros(length(time2), 1);
            WaterHeater_FlowRate_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                WaterHeater_FlowRate2(j) = mean(dt*WaterHeater_FlowRate(i:(i+dt)-1, 1));
                WaterHeater_FlowRate_DR2(j) = mean(dt*WaterHeater_FlowRate_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, WaterHeater_FlowRate2, 'b-', time2, WaterHeater_FlowRate_DR2, 'r--')
            grid on
            title('Total Water Heater Hot Water Demand')
            legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
            ylabel('Hot Water Demand (gal)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 35
    if max(load('WaterHeaterWaterTemperature.txt')) > 0
        
        WaterHeater_Temp = load('WaterHeaterWaterTemperature.txt');
        WaterHeater_Temp_DR = load('WaterHeaterWaterTemperature_DR.txt');
        time = 1:length(WaterHeater_Temp);
        
        switch results_time_step
            case 1
                plot(handles.Results_Plot, time, WaterHeater_Temp, 'b-', time, WaterHeater_Temp_DR, 'r--')
                grid on
                title('Average Water Heater Water Temperature')
                legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
                ylabel('Temperature (F)')
                xlim([1 length(time)+1])

            otherwise
                time2 = 1:length(WaterHeater_Temp)/dt;
                WaterHeater_Temp2 = zeros(length(time2), 1);
                WaterHeater_Temp_DR2 = zeros(length(time2), 1);

                j = 0;
                for i = 1:dt:length(time)
                    j = j + 1;
                    WaterHeater_Temp2(j) = mean(WaterHeater_Temp(i:(i+dt)-1, 1));
                    WaterHeater_Temp_DR2(j) = mean(WaterHeater_Temp_DR(i:(i+dt)-1, 1));
                end
                plot(handles.Results_Plot, time2, WaterHeater_Temp2, 'b-', time2, WaterHeater_Temp_DR2, 'r--')
                grid on
                title('Average Water Heater Water Temperature')
                legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
                ylabel('Temperature (F)')
                xlim([1 length(time2)+1])
        end
    else
        WaterHeater_TempU = load('WaterHeaterWaterTemperatureUpper.txt');
        WaterHeater_TempL = load('WaterHeaterWaterTemperatureLower.txt');
        WaterHeater_TempU_DR = load('WaterHeaterWaterTemperatureUpper_DR.txt');
        WaterHeater_TempL_DR = load('WaterHeaterWaterTemperatureLower_DR.txt');
        time = 1:length(WaterHeater_TempL);
        
        switch results_time_step
            case 1
                plot(handles.Results_Plot, time, WaterHeater_TempU, 'r-', time, WaterHeater_TempL, 'b-', time, WaterHeater_TempU_DR, 'g--', time, WaterHeater_TempL_DR, 'c--')
                grid on
                title('Average Water Heater Water Temperature')
                legend('Upper Water Layer', 'Lower Water Layer', 'Upper Water Layer (Demand Response)', 'Lower Water Layer (Demand Response)', 'Location', 'Best')
                ylabel('Temperature (F)')
                xlim([1 length(time)+1])
                
            otherwise
                time2 = 1:length(WaterHeater_TempL)/dt;
                WaterHeater_TempU2 = zeros(length(time2), 1);
                WaterHeater_TempL2 = zeros(length(time2), 1);
                WaterHeater_TempU_DR2 = zeros(length(time2), 1);
                WaterHeater_TempL_DR2 = zeros(length(time2), 1);
                
                j = 0;
                for i = 1:dt:length(time)
                    j = j + 1;
                    WaterHeater_TempU2(j) = mean(WaterHeater_TempU(i:(i+dt)-1, 1));
                    WaterHeater_TempL2(j) = mean(WaterHeater_TempL(i:(i+dt)-1, 1));
                    WaterHeater_TempU_DR2(j) = mean(WaterHeater_TempU_DR(i:(i+dt)-1, 1));
                    WaterHeater_TempL_DR2(j) = mean(WaterHeater_TempL_DR(i:(i+dt)-1, 1));
                end
                plot(handles.Results_Plot, time2, WaterHeater_TempU2, 'r-', time2, WaterHeater_TempL2, 'b-', time2, WaterHeater_TempU_DR2, 'g--', time2, WaterHeater_TempL_DR2, 'c--')
                grid on
                title('Average Water Heater Water Temperature')
                legend('Upper Water Layer', 'Lower Water Layer', 'Upper Water Layer (Demand Response)', 'Lower Water Layer (Demand Response)', 'Location', 'Best')
                ylabel('Temperature (F)')
                xlim([1 length(time2)+1])
        end
    end
    
elseif a == 36
    cla reset
elseif a == 37
    cla reset
elseif a == 38
    Refrigerator_Power = load('RefrigeratorPowerDemand.txt');
    Refrigerator_Reactive = load('RefrigeratorReactivePowerDemand.txt');
    Refrigerator_Power_DR = load('RefrigeratorPowerDemand_DR.txt');
    Refrigerator_Reactive_DR = load('RefrigeratorReactivePowerDemand_DR.txt');
    time = 1:length(Refrigerator_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Refrigerator_Power/1000, 'b-', time, Refrigerator_Reactive/1000, 'g-', time, Refrigerator_Power_DR/1000, 'r--', time, Refrigerator_Reactive_DR/1000, 'c--')
            grid on
            title('Total Refrigerator Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Refrigerator_Power)/dt;
            Refrigerator_Power2 = zeros(length(time2), 1);
            Refrigerator_Reactive2 = zeros(length(time2), 1);
            Refrigerator_Power_DR2 = zeros(length(time2), 1);
            Refrigerator_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Refrigerator_Power2(j) = mean(Refrigerator_Power(i:(i+dt)-1, 1));
                Refrigerator_Reactive2(j) = mean(Refrigerator_Reactive(i:(i+dt)-1, 1));
                Refrigerator_Power_DR2(j) = mean(Refrigerator_Power_DR(i:(i+dt)-1, 1));
                Refrigerator_Reactive_DR2(j) = mean(Refrigerator_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Refrigerator_Power2/1000, 'b-', time2, Refrigerator_Reactive2/1000, 'g-', time2, Refrigerator_Power_DR2/1000, 'r--', time2, Refrigerator_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Refrigerator Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 39
    Refrigerator_Temp = load('RefrigeratorAirTemperature.txt');
    Refrigerator_Temp_DR = load('RefrigeratorAirTemperature_DR.txt');
    time = 1:length(Refrigerator_Temp);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Refrigerator_Temp, 'b-', time, Refrigerator_Temp_DR, 'r--')
            grid on
            title('Average Refrigerator Interior Air Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Refrigerator_Temp)/dt;
            Refrigerator_Temp2 = zeros(length(time2), 1);
            Refrigerator_Temp_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Refrigerator_Temp2(j) = mean(Refrigerator_Temp(i:(i+dt)-1, 1));
                Refrigerator_Temp_DR2(j) = mean(Refrigerator_Temp_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Refrigerator_Temp2, 'b-', time2, Refrigerator_Temp_DR2, 'r--')
            grid on
            title('Average Refrigerator Interior Air Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 40
    Freezer_Power = load('FreezerPowerDemand.txt');
    Freezer_Reactive = load('FreezerReactivePowerDemand.txt');
    Freezer_Power_DR = load('FreezerPowerDemand_DR.txt');
    Freezer_Reactive_DR = load('FreezerReactivePowerDemand_DR.txt');
    time = 1:length(Freezer_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Freezer_Power/1000, 'b-', time, Freezer_Reactive/1000, 'g-', time, Freezer_Power_DR/1000, 'r--', time, Freezer_Reactive_DR/1000, 'c--')
            grid on
            title('Total Freezer Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Freezer_Power)/dt;
            Freezer_Power2 = zeros(length(time2), 1);
            Freezer_Reactive2 = zeros(length(time2), 1);
            Freezer_Power_DR2 = zeros(length(time2), 1);
            Freezer_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Freezer_Power2(j) = mean(Freezer_Power(i:(i+dt)-1, 1));
                Freezer_Reactive2(j) = mean(Freezer_Reactive(i:(i+dt)-1, 1));
                Freezer_Power_DR2(j) = mean(Freezer_Power_DR(i:(i+dt)-1, 1));
                Freezer_Reactive_DR2(j) = mean(Freezer_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Freezer_Power2/1000, 'b-', time2, Freezer_Reactive2/1000, 'g-', time2, Freezer_Power_DR2/1000, 'r--', time2, Freezer_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Freezer Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 41
    Freezer_Temp = load('FreezerAirTemperature.txt');
    Freezer_Temp_DR = load('FreezerAirTemperature_DR.txt');
    time = 1:length(Freezer_Temp);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Freezer_Temp, 'b-', time, Freezer_Temp_DR, 'r--')
            grid on
            title('Average Freezer Interior Air Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Freezer_Temp)/dt;
            Freezer_Temp2 = zeros(length(time2), 1);
            Freezer_Temp_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Freezer_Temp2(j) = mean(Freezer_Temp(i:(i+dt)-1, 1));
                Freezer_Temp_DR2(j) = mean(Freezer_Temp_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Freezer_Temp2, 'b-', time2, Freezer_Temp_DR2, 'r--')
            grid on
            title('Average Freezer Interior Air Temperature')
            legend('Temperature', 'Temperature (Demand Response)', 'Location', 'Best')
            ylabel('Temperature (F)')
            xlim([1 length(time2)+1])
    end
elseif a == 42
    cla reset
elseif a == 43
    cla reset
elseif a == 44
    Washer_Power = load('WasherPowerDemand.txt');
    Washer_Reactive = load('WasherReactivePowerDemand.txt');
    Washer_Power_DR = load('WasherPowerDemand_DR.txt');
    Washer_Reactive_DR = load('WasherReactivePowerDemand_DR.txt');
    time = 1:length(Washer_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Washer_Power/1000, 'b-', time, Washer_Reactive/1000, 'g-', time, Washer_Power_DR/1000, 'r--', time, Washer_Reactive_DR/1000, 'c--')
            grid on
            title('Total Washer Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Washer_Power)/dt;
            Washer_Power2 = zeros(length(time2), 1);
            Washer_Reactive2 = zeros(length(time2), 1);
            Washer_Power_DR2 = zeros(length(time2), 1);
            Washer_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Washer_Power2(j) = mean(Washer_Power(i:(i+dt)-1, 1));
                Washer_Reactive2(j) = mean(Washer_Reactive(i:(i+dt)-1, 1));
                Washer_Power_DR2(j) = mean(Washer_Power_DR(i:(i+dt)-1, 1));
                Washer_Reactive_DR2(j) = mean(Washer_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Washer_Power2/1000, 'b-', time2, Washer_Reactive2/1000, 'g-', time2, Washer_Power_DR2/1000, 'r--', time2, Washer_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Washer Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 45
    Washer_FlowRate = load('WasherHotWaterDemand.txt');
    Washer_FlowRate_DR = load('WasherHotWaterDemand_DR.txt');
    time = 1:length(Washer_FlowRate);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Washer_FlowRate, 'b-', time, Washer_FlowRate_DR, 'r--')
            grid on
            title('Total Washer Hot Water Demand')
            legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
            ylabel('Hot Water Demand (gal)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Washer_FlowRate)/dt;
            Washer_FlowRate2 = zeros(length(time2), 1);
            Washer_FlowRate_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Washer_FlowRate2(j) = mean(dt*Washer_FlowRate(i:(i+dt)-1, 1));
                Washer_FlowRate_DR2(j) = mean(dt*Washer_FlowRate_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Washer_FlowRate2, 'b-', time2, Washer_FlowRate_DR2, 'r--')
            grid on
            title('Total Washer Hot Water Demand')
            legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
            ylabel('Hot Water Demand (gal)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 46
    Dryer_Power = load('DryerPowerDemand.txt');
    Dryer_Reactive = load('DryerReactivePowerDemand.txt');
    Dryer_Power_DR = load('DryerPowerDemand_DR.txt');
    Dryer_Reactive_DR = load('DryerReactivePowerDemand_DR.txt');
    time = 1:length(Dryer_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Dryer_Power/1000, 'b-', time, Dryer_Reactive/1000, 'g-', time, Dryer_Power_DR/1000, 'r--', time, Dryer_Reactive_DR/1000, 'c--')
            grid on
            title('Total Dryer Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Dryer_Power)/dt;
            Dryer_Power2 = zeros(length(time2), 1);
            Dryer_Reactive2 = zeros(length(time2), 1);
            Dryer_Power_DR2 = zeros(length(time2), 1);
            Dryer_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Dryer_Power2(j) = mean(Dryer_Power(i:(i+dt)-1, 1));
                Dryer_Reactive2(j) = mean(Dryer_Reactive(i:(i+dt)-1, 1));
                Dryer_Power_DR2(j) = mean(Dryer_Power_DR(i:(i+dt)-1, 1));
                Dryer_Reactive_DR2(j) = mean(Dryer_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Dryer_Power2/1000, 'b-', time2, Dryer_Reactive2/1000, 'g-', time2, Dryer_Power_DR2/1000, 'r--', time2, Dryer_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Dryer Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 47
    Dishwasher_Power = load('DishwasherPowerDemand.txt');
    Dishwasher_Reactive = load('DishwasherReactivePowerDemand.txt');
    Dishwasher_Power_DR = load('DishwasherPowerDemand_DR.txt');
    Dishwasher_Reactive_DR = load('DishwasherReactivePowerDemand_DR.txt');
    time = 1:length(Dishwasher_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Dishwasher_Power/1000, 'b-', time, Dishwasher_Reactive/1000, 'g-', time, Dishwasher_Power_DR/1000, 'r--', time, Dishwasher_Reactive_DR/1000, 'c--')
            grid on
            title('Total Dishwasher Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Dishwasher_Power)/dt;
            Dishwasher_Power2 = zeros(length(time2), 1);
            Dishwasher_Reactive2 = zeros(length(time2), 1);
            Dishwasher_Power_DR2 = zeros(length(time2), 1);
            Dishwasher_Reactive_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Dishwasher_Power2(j) = mean(Dishwasher_Power(i:(i+dt)-1, 1));
                Dishwasher_Reactive2(j) = mean(Dishwasher_Reactive(i:(i+dt)-1, 1));
                Dishwasher_Power_DR2(j) = mean(Dishwasher_Power_DR(i:(i+dt)-1, 1));
                Dishwasher_Reactive_DR2(j) = mean(Dishwasher_Reactive_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Dishwasher_Power2/1000, 'b-', time2, Dishwasher_Reactive2/1000, 'g-', time2, Dishwasher_Power_DR2/1000, 'r--', time2, Dishwasher_Reactive_DR2/1000, 'c--')
            grid on
            title('Total Dishwasher Power Demand')
            legend('Real Power', 'Reactive Power', 'Real Power (Demand Response)', 'Reactive Power (Demand Response)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 48
    Dishwasher_FlowRate = load('DishwasherHotWaterDemand.txt');
    Dishwasher_FlowRate_DR = load('DishwasherHotWaterDemand_DR.txt');
    time = 1:length(Dishwasher_FlowRate);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Dishwasher_FlowRate, 'b-', time, Dishwasher_FlowRate_DR, 'r--')
            grid on
            title('Total Dishwasher Hot Water Demand')
            legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
            ylabel('Hot Water Demand (gal)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Dishwasher_FlowRate)/dt;
            Dishwasher_FlowRate2 = zeros(length(time2), 1);
            Dishwasher_FlowRate_DR2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Dishwasher_FlowRate2(j) = mean(dt*Dishwasher_FlowRate(i:(i+dt)-1, 1));
                Dishwasher_FlowRate_DR2(j) = mean(dt*Dishwasher_FlowRate_DR(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Dishwasher_FlowRate2, 'b-', time2, Dishwasher_FlowRate_DR2, 'r--')
            grid on
            title('Total Dishwasher Hot Water Demand')
            legend('Hot Water', 'Hot Water (Demand Response)', 'Location', 'Best')
            ylabel('Hot Water Demand (gal)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 49
    cla reset
elseif a == 50
    cla reset
elseif a == 51
    Cooking_Power = load('CookingPowerDemand.txt');
    Cooking_Reactive = load('CookingReactivePowerDemand.txt');
    time = 1:length(Cooking_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Cooking_Power/1000, 'b-', time, Cooking_Reactive/1000, 'g-')
            grid on
            title('Total Cooking Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Cooking_Power)/dt;
            Cooking_Power2 = zeros(length(time2), 1);
            Cooking_Reactive2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Cooking_Power2(j) = mean(Cooking_Power(i:(i+dt)-1, 1));
                Cooking_Reactive2(j) = mean(Cooking_Reactive(i:(i+dt)-1, 1));
                
            end
            plot(handles.Results_Plot, time2, Cooking_Power2/1000, 'b-', time2, Cooking_Reactive2/1000, 'g-')
            grid on
            title('Total Cooking Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 52
    Lighting_Power = load('LightingPowerDemand.txt');
    Lighting_Reactive = load('LightingReactivePowerDemand.txt');
    Lighting_Power2 = load('LightingPowerDemand2.txt');
    Lighting_Reactive2 = load('LightingReactivePowerDemand2.txt');
    time = 1:length(Lighting_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Lighting_Power/1000, 'b-', time, Lighting_Reactive/1000, 'g-', time, Lighting_Power2/1000, 'r--', time, Lighting_Reactive2/1000, 'c--')
            grid on
            title('Total Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Lighting_Power)/dt;
            Lighting_Power3 = zeros(length(time2), 1);
            Lighting_Reactive3 = zeros(length(time2), 1);
            Lighting_Power4 = zeros(length(time2), 1);
            Lighting_Reactive4 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Lighting_Power3(j) = mean(Lighting_Power(i:(i+dt)-1, 1));
                Lighting_Reactive3(j) = mean(Lighting_Reactive(i:(i+dt)-1, 1));
                Lighting_Power4(j) = mean(Lighting_Power2(i:(i+dt)-1, 1));
                Lighting_Reactive4(j) = mean(Lighting_Reactive2(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Lighting_Power3/1000, 'b-', time2, Lighting_Reactive3/1000, 'g-', time2, Lighting_Power4/1000, 'r--', time2, Lighting_Reactive4/1000, 'c--')
            grid on
            title('Total Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 53
    Incandescent_Power = load('IncandescentPowerDemand.txt');
    Incandescent_Reactive = load('IncandescentReactivePowerDemand.txt');
    Incandescent_Power2 = load('IncandescentPowerDemand2.txt');
    Incandescent_Reactive2 = load('IncandescentReactivePowerDemand2.txt');
    time = 1:length(Incandescent_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Incandescent_Power/1000, 'b-', time, Incandescent_Reactive/1000, 'g-', time, Incandescent_Power2/1000, 'r--', time, Incandescent_Reactive2/1000, 'c--')
            grid on
            title('Total Incandescent Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Incandescent_Power)/dt;
            Incandescent_Power3 = zeros(length(time2), 1);
            Incandescent_Reactive3 = zeros(length(time2), 1);
            Incandescent_Power4 = zeros(length(time2), 1);
            Incandescent_Reactive4 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Incandescent_Power3(j) = mean(Incandescent_Power(i:(i+dt)-1, 1));
                Incandescent_Reactive3(j) = mean(Incandescent_Reactive(i:(i+dt)-1, 1));
                Incandescent_Power4(j) = mean(Incandescent_Power2(i:(i+dt)-1, 1));
                Incandescent_Reactive4(j) = mean(Incandescent_Reactive2(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Incandescent_Power3/1000, 'b-', time2, Incandescent_Reactive3/1000, 'g-', time2, Incandescent_Power4/1000, 'r--', time2, Incandescent_Reactive4/1000, 'c--')
            grid on
            title('Total Incandescent Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 54
    Halogen_Power = load('HalogenPowerDemand.txt');
    Halogen_Reactive = load('HalogenReactivePowerDemand.txt');
    Halogen_Power2 = load('HalogenPowerDemand2.txt');
    Halogen_Reactive2 = load('HalogenReactivePowerDemand2.txt');
    time = 1:length(Halogen_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Halogen_Power/1000, 'b-', time, Halogen_Reactive/1000, 'g-', time, Halogen_Power2/1000, 'r--', time, Halogen_Reactive2/1000, 'c--')
            grid on
            title('Total Halogen Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Halogen_Power)/dt;
            Halogen_Power3 = zeros(length(time2), 1);
            Halogen_Reactive3 = zeros(length(time2), 1);
            Halogen_Power4 = zeros(length(time2), 1);
            Halogen_Reactive4 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Halogen_Power3(j) = mean(Halogen_Power(i:(i+dt)-1, 1));
                Halogen_Reactive3(j) = mean(Halogen_Reactive(i:(i+dt)-1, 1));
                Halogen_Power4(j) = mean(Halogen_Power2(i:(i+dt)-1, 1));
                Halogen_Reactive4(j) = mean(Halogen_Reactive2(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Halogen_Power3/1000, 'b-', time2, Halogen_Reactive3/1000, 'g-', time2, Halogen_Power4/1000, 'r--', time2, Halogen_Reactive4/1000, 'c--')
            grid on
            title('Total Halogen Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 55
    Fluorescent_Power = load('LinearFluorescentPowerDemand.txt');
    Fluorescent_Reactive = load('LinearFluorescentReactivePowerDemand.txt');
    Fluorescent_Power2 = load('LinearFluorescentPowerDemand2.txt');
    Fluorescent_Reactive2 = load('LinearFluorescentReactivePowerDemand2.txt');
    time = 1:length(Fluorescent_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Fluorescent_Power/1000, 'b-', time, Fluorescent_Reactive/1000, 'g-', time, Fluorescent_Power2/1000, 'r--', time, Fluorescent_Reactive2/1000, 'c--')
            grid on
            title('Total Linear Fluorescent Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Fluorescent_Power)/dt;
            Fluorescent_Power3 = zeros(length(time2), 1);
            Fluorescent_Reactive3 = zeros(length(time2), 1);
            Fluorescent_Power4 = zeros(length(time2), 1);
            Fluorescent_Reactive4 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Fluorescent_Power3(j) = mean(Fluorescent_Power(i:(i+dt)-1, 1));
                Fluorescent_Reactive3(j) = mean(Fluorescent_Reactive(i:(i+dt)-1, 1));
                Fluorescent_Power4(j) = mean(Fluorescent_Power2(i:(i+dt)-1, 1));
                Fluorescent_Reactive4(j) = mean(Fluorescent_Reactive2(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Fluorescent_Power3/1000, 'b-', time2, Fluorescent_Reactive3/1000, 'g-', time2, Fluorescent_Power4/1000, 'r--', time2, Fluorescent_Reactive4/1000, 'c--')
            grid on
            title('Total Linear Fluorescent Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 56
    CFL_Power = load('CFLPowerDemand.txt');
    CFL_Reactive = load('CFLReactivePowerDemand.txt');
    CFL_Power2 = load('CFLPowerDemand2.txt');
    CFL_Reactive2 = load('CFLReactivePowerDemand2.txt');
    time = 1:length(CFL_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, CFL_Power/1000, 'b-', time, CFL_Reactive/1000, 'g-', time, CFL_Power2/1000, 'r--', time, CFL_Reactive2/1000, 'c--')
            grid on
            title('Total Compact Fluorescent Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(CFL_Power)/dt;
            CFL_Power3 = zeros(length(time2), 1);
            CFL_Reactive3 = zeros(length(time2), 1);
            CFL_Power4 = zeros(length(time2), 1);
            CFL_Reactive4 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                CFL_Power3(j) = mean(CFL_Power(i:(i+dt)-1, 1));
                CFL_Reactive3(j) = mean(CFL_Reactive(i:(i+dt)-1, 1));
                CFL_Power4(j) = mean(CFL_Power2(i:(i+dt)-1, 1));
                CFL_Reactive4(j) = mean(CFL_Reactive2(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, CFL_Power3/1000, 'b-', time2, CFL_Reactive3/1000, 'g-', time2, CFL_Power4/1000, 'r--', time2, CFL_Reactive4/1000, 'c--')
            grid on
            title('Total Compact Fluorescent Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 57
    LED_Power = load('LEDPowerDemand.txt');
    LED_Reactive = load('LEDReactivePowerDemand.txt');
    LED_Power2 = load('LEDPowerDemand2.txt');
    LED_Reactive2 = load('LEDReactivePowerDemand2.txt');
    time = 1:length(LED_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, LED_Power/1000, 'b-', time, LED_Reactive/1000, 'g-', time, LED_Power2/1000, 'r--', time, LED_Reactive2/1000, 'c--')
            grid on
            title('Total LED Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(LED_Power)/dt;
            LED_Power3 = zeros(length(time2), 1);
            LED_Reactive3 = zeros(length(time2), 1);
            LED_Power4 = zeros(length(time2), 1);
            LED_Reactive4 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                LED_Power3(j) = mean(LED_Power(i:(i+dt)-1, 1));
                LED_Reactive3(j) = mean(LED_Reactive(i:(i+dt)-1, 1));
                LED_Power4(j) = mean(LED_Power2(i:(i+dt)-1, 1));
                LED_Reactive4(j) = mean(LED_Reactive2(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, LED_Power3/1000, 'b-', time2, LED_Reactive3/1000, 'g-', time2, LED_Power4/1000, 'r--', time2, LED_Reactive4/1000, 'c--')
            grid on
            title('Total LED Lighting Power Demand')
            legend('Real Power (Daylight Adjusted)', 'Reactive Power (Daylight Adjusted)', 'Real Power (Unadjusted)', 'Reactive Power (Unadjusted)', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end

elseif a == 58
    Television_Power = load('TelevisionPowerDemand.txt');
    Television_Reactive = load('TelevisionReactivePowerDemand.txt');
    time = 1:length(Television_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Television_Power/1000, 'b-', time, Television_Reactive/1000, 'g-')
            grid on
            title('Total Television Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Television_Power)/dt;
            Television_Power2 = zeros(length(time2), 1);
            Television_Reactive2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Television_Power2(j) = mean(Television_Power(i:(i+dt)-1, 1));
                Television_Reactive2(j) = mean(Television_Reactive(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Television_Power2/1000, 'b-', time2, Television_Reactive2/1000, 'g-')
            grid on
            title('Total Television Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 59
    Computer_Power = load('ComputerPowerDemand.txt');
    Computer_Reactive = load('ComputerReactivePowerDemand.txt');
    time = 1:length(Computer_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Computer_Power/1000, 'b-', time, Computer_Reactive/1000, 'g-')
            grid on
            title('Total Computer Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Computer_Power)/dt;
            Computer_Power2 = zeros(length(time2), 1);
            Computer_Reactive2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Computer_Power2(j) = mean(Computer_Power(i:(i+dt)-1, 1));
                Computer_Reactive2(j) = mean(Computer_Reactive(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Computer_Power2/1000, 'b-', time2, Computer_Reactive2/1000, 'g-')
            grid on
            title('Total Computer Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
    
elseif a == 60
    Additional_Power = load('AdditionalPowerDemand.txt');
    Additional_Reactive = load('AdditionalReactivePowerDemand.txt');
    time = 1:length(Additional_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, Additional_Power/1000, 'b-', time, Additional_Reactive/1000, 'g-')
            grid on
            title('Total Additional Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(Additional_Power)/dt;
            Additional_Power2 = zeros(length(time2), 1);
            Additional_Reactive2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                Additional_Power2(j) = mean(Additional_Power(i:(i+dt)-1, 1));
                Additional_Reactive2(j) = mean(Additional_Reactive(i:(i+dt)-1, 1));
            end
            plot(handles.Results_Plot, time2, Additional_Power2/1000, 'b-', time2, Additional_Reactive2/1000, 'g-')
            grid on
            title('Total Additional Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
elseif a == 61
    cla reset
elseif a == 62
    cla reset
elseif a == 63
    EV_Power = load('ElectricVehiclePowerDemand.txt');
    EV_Reactive = load('ElectricVehicleReactivePowerDemand.txt');
    time = 1:length(EV_Power);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, EV_Power/1000, 'b-', time, EV_Reactive/1000, 'g-')
            grid on
            title('Total Electric Vehicle Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(EV_Power)/dt;
            EV_Power2 = zeros(length(time2), 1);
            EV_Reactive2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                EV_Power2(j) = mean(EV_Power(i:(i+dt)-1, 1));
                EV_Reactive2(j) = mean(EV_Reactive(i:(i+dt)-1, 1));
                
            end
            plot(handles.Results_Plot, time2, EV_Power2/1000, 'b-', time2, EV_Reactive2/1000, 'g-')
            grid on
            title('Total Electric Vehicle Power Demand')
            legend('Real Power', 'Reactive Power', 'Location', 'Best')
            ylabel('Power Demand (kW/kVar)')
            xlim([1 length(time2)+1])
    end
elseif a == 64
    EV_SOC = load('ElectricVehicleStateOfCharge.txt');
    time = 1:length(EV_SOC);
    
    switch results_time_step
        case 1
            plot(handles.Results_Plot, time, 100*EV_SOC)
            grid on
            title('Average Electric Vehicle State of Charge')
            ylabel('State of Charge (%)')
            xlim([1 length(time)+1])
            
        otherwise
            time2 = 1:length(EV_SOC)/dt;
            EV_SOC2 = zeros(length(time2), 1);
            
            j = 0;
            for i = 1:dt:length(time)
                j = j + 1;
                EV_SOC2(j) = mean(EV_SOC(i:(i+dt)-1, 1));
                EV_SOC2(j) = mean(EV_SOC(i:(i+dt)-1, 1));
                
            end
            plot(handles.Results_Plot, time2, 100*EV_SOC2)
            grid on
            title('Average Electric Vehicle State of Charge')
            ylabel('State of Charge (%)')
            xlim([1 length(time2)+1])
    end
end


% Add X-Axis Label

if exist('time','var') == 1
    
    switch results_time_step
        
        case 1
            if length(time) <= 24*60*time_step
                set(gca,'XTick',1:60*60:length(time)+1)
                set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
                    '7am','8am','9am','10am','11am','12pm'...
                    '1pm','2pm','3pm','4pm','5pm','6pm'...
                    '7pm','8pm','9pm','10pm','11pm','12am'})
            elseif length(time) <= 7*24*60*time_step
                set(gca,'XTick',1:6*60*60:length(time)+1)
                set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am'})
            else
                xlabel('Time (second)')
            end
            
        case 2
            if length(time) <= 24*60*time_step
                set(gca,'XTick',1:60:length(time)+1)
                set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
                    '7am','8am','9am','10am','11am','12pm'...
                    '1pm','2pm','3pm','4pm','5pm','6pm'...
                    '7pm','8pm','9pm','10pm','11pm','12am'})
            elseif length(time) <= 7*24*60*time_step
                set(gca,'XTick',1:6*60:length(time)+1)
                set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am'})
            else
                xlabel('Time (minute)')
            end
            
        case 3
            if length(time) <= 24*60*time_step
                set(gca,'XTick',1:12:length(time)+1)
                set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
                    '7am','8am','9am','10am','11am','12pm'...
                    '1pm','2pm','3pm','4pm','5pm','6pm'...
                    '7pm','8pm','9pm','10pm','11pm','12am'})
            elseif length(time) <= 7*24*60*time_step
                set(gca,'XTick',1:6*12:length(time)+1)
                set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am'})
            else
                xlabel('Time (5 minutes)')
            end
            
        case 4
            if length(time) <= 24*60*time_step
                set(gca,'XTick',1:6:length(time)+1)
                set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
                    '7am','8am','9am','10am','11am','12pm'...
                    '1pm','2pm','3pm','4pm','5pm','6pm'...
                    '7pm','8pm','9pm','10pm','11pm','12am'})
            elseif length(time) <= 7*24*60*time_step
                set(gca,'XTick',1:6*6:length(time)+1)
                set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am'})
            else
                xlabel('Time (10 minutes)')
            end
            
        case 5
            if length(time) <= 24*60*time_step
                set(gca,'XTick',1:2:length(time)+1)
                set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
                    '7am','8am','9am','10am','11am','12pm'...
                    '1pm','2pm','3pm','4pm','5pm','6pm'...
                    '7pm','8pm','9pm','10pm','11pm','12am'})
            elseif length(time) <= 7*24*60*time_step
                set(gca,'XTick',1:6*2:length(time)+1)
                set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am'})
            else
                xlabel('Time (30 minutes)')
            end
            
        case 6
            if length(time) <= 24*60*time_step
                set(gca,'XTick',1:1:length(time)+1)
                set(gca,'XTickLabel',{'12am','1am','2am','3am','4am','5am','6am'...
                    '7am','8am','9am','10am','11am','12pm'...
                    '1pm','2pm','3pm','4pm','5pm','6pm'...
                    '7pm','8pm','9pm','10pm','11pm','12am'})
            elseif length(time) <= 7*24*60*time_step
                set(gca,'XTick',1:6:length(time)+1)
                set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                    '6am','12pm','6pm','12am'})
            else
                xlabel('Time (hour)')
            end
    end
end

cd(home)


% --- Executes during object creation, after setting all properties.
function Select_Results_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Select_Results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
