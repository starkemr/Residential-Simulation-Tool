function varargout = ElectricVehicleParameters(varargin)
% ELECTRICVEHICLEPARAMETERS MATLAB code for ElectricVehicleParameters.fig
%      ELECTRICVEHICLEPARAMETERS, by itself, creates a new ELECTRICVEHICLEPARAMETERS or raises the existing
%      singleton*.
%
%      H = ELECTRICVEHICLEPARAMETERS returns the handle to a new ELECTRICVEHICLEPARAMETERS or the handle to
%      the existing singleton*.
%
%      ELECTRICVEHICLEPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELECTRICVEHICLEPARAMETERS.M with the given input arguments.
%
%      ELECTRICVEHICLEPARAMETERS('Property','Value',...) creates a new ELECTRICVEHICLEPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ElectricVehicleParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ElectricVehicleParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ElectricVehicleParameters

% Last Modified by GUIDE v2.5 24-Jun-2014 16:03:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ElectricVehicleParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @ElectricVehicleParameters_OutputFcn, ...
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


% --- Executes just before ElectricVehicleParameters is made visible.
function ElectricVehicleParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ElectricVehicleParameters (see VARARGIN)

% Choose default command line output for ElectricVehicleParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ElectricVehicleParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'),'file') == 2
    ElectricVehicle_Inputs = load(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'));
else
    ElectricVehicle_Inputs = load(fullfile(inputdata,'Default Settings','ElectricVehicle_Default.txt'));
end


% Set Inputs

set(handles.ElectricVehiclePercentage_Input, 'Value', ElectricVehicle_Inputs(1));
set(handles.ElectricVehiclePercentage_Input, 'String', num2str(ElectricVehicle_Inputs(1)));

set(handles.NissanLeafPercentage_Input, 'Value', ElectricVehicle_Inputs(2));
set(handles.NissanLeafPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(2)));

set(handles.ChevroletVoltPercentage_Input, 'Value', ElectricVehicle_Inputs(3));
set(handles.ChevroletVoltPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(3)));

set(handles.ToyotaPriusPercentage_Input, 'Value', ElectricVehicle_Inputs(4));
set(handles.ToyotaPriusPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(4)));

if get(handles.NissanLeaf_RadioButton, 'Value') == 1
    Position = 0;
elseif get(handles.ChevroletVolt_RadioButton, 'Value') == 1
    Position = 14;
elseif get(handles.ToyotaPrius_RadioButton, 'Value') == 1
    Position = 28;
end

set(handles.MeanBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(5 + Position));
set(handles.MeanBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(5 + Position), 0.01)),' Wh'));

set(handles.STDBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(6 + Position));
set(handles.STDBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(6 + Position), 0.01)),' Wh'));

set(handles.UsableBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(7 + Position));
set(handles.UsableBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(7 + Position), 0.01)),' %'));

set(handles.DrivingConsumption_Slider, 'Value', ElectricVehicle_Inputs(8 + Position));
set(handles.DrivingConsumption_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(8 + Position), 0.01)),' Wh/km'));

set(handles.DrivingVelocity_Slider, 'Value', ElectricVehicle_Inputs(9 + Position));
set(handles.DrivingVelocity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(9 + Position), 0.01)),' km/h'));

set(handles.Level1ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(10 + Position));
set(handles.Level1ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(10 + Position)));

set(handles.Level1ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(11 + Position));
set(handles.Level1ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(11 + Position), 0.01)),' W'));

set(handles.Level1ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(12 + Position));
set(handles.Level1ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(12 + Position), 0.01)),' W'));

set(handles.Level2ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(13 + Position));
set(handles.Level2ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(13 + Position)));

set(handles.Level2ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(14 + Position));
set(handles.Level2ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(14 + Position), 0.01)),' W'));

set(handles.Level2ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(15 + Position));
set(handles.Level2ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(15 + Position), 0.01)),' W'));

set(handles.Level3ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(16 + Position));
set(handles.Level3ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(16 + Position)));

set(handles.Level3ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(17 + Position));
set(handles.Level3ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(17 + Position), 0.01)),' W'));

set(handles.Level3ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(18 + Position));
set(handles.Level3ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(18 + Position), 0.01)),' W'));


% --- Outputs from this function are returned to the command line.
function varargout = ElectricVehicleParameters_OutputFcn(hObject, eventdata, handles)
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


% Load Inputs

if exist(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'),'file') == 2
    a = load(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'));
else
    a = load(fullfile(inputdata,'Default Settings','ElectricVehicle_Default.txt'));
end


% Determine Position

if get(handles.NissanLeaf_RadioButton, 'Value') == 1
    Position = 0;
elseif get(handles.ChevroletVolt_RadioButton, 'Value') == 1
    Position = 14;
elseif get(handles.ToyotaPrius_RadioButton, 'Value') == 1
    Position = 28;
end


% Get User Settings

p1 = get(handles.ElectricVehiclePercentage_Input);
p2 = get(handles.NissanLeafPercentage_Input);
p3 = get(handles.ChevroletVoltPercentage_Input);
p4 = get(handles.ToyotaPriusPercentage_Input);
p5 = get(handles.MeanBatteryCapacity_Slider);
p6 = get(handles.STDBatteryCapacity_Slider);
p7 = get(handles.UsableBatteryCapacity_Slider);
p8 = get(handles.DrivingConsumption_Slider);
p9 = get(handles.DrivingVelocity_Slider);
p10 = get(handles.Level1ChargerPercentage_Input);
p11 = get(handles.Level1ChargerMeanPowerDemand_Slider);
p12 = get(handles.Level1ChargerSTDPowerDemand_Slider);
p13 = get(handles.Level2ChargerPercentage_Input);
p14 = get(handles.Level2ChargerMeanPowerDemand_Slider);
p15 = get(handles.Level2ChargerSTDPowerDemand_Slider);
p16 = get(handles.Level3ChargerPercentage_Input);
p17 = get(handles.Level3ChargerMeanPowerDemand_Slider);
p18 = get(handles.Level3ChargerSTDPowerDemand_Slider);

a(1) = p1.Value;
a(2) = p2.Value;
a(3) = p3.Value;
a(4) = p4.Value;
a(5 + Position) = p5.Value;
a(6 + Position) = p6.Value;
a(7 + Position) = p7.Value;
a(8 + Position) = p8.Value;
a(9 + Position) = p9.Value;
a(10 + Position) = p10.Value;
a(11 + Position) = p11.Value;
a(12 + Position) = p12.Value;
a(13 + Position) = p13.Value;
a(14 + Position) = p14.Value;
a(15 + Position) = p15.Value;
a(16 + Position) = p16.Value;
a(17 + Position) = p17.Value;
a(18 + Position) = p18.Value;

if round(10^4*(p2.Value + p3.Value + p4.Value))/10^4 ~= 100
    errordlg('Sum of Nissan Leaf, Chevrolet Volt, and Toyota Prius Percentages Must Equal 100%', 'Error')
    
    if round(10^4*(p10.Value + p13.Value + p16.Value))/10^4 ~= 100
        errordlg('Sum of Level 1, Level 2, and Level 3 Charger Percentages Must Equal 100%', 'Error')
        return
    end
end

if round(10^4*(p10.Value + p13.Value + p16.Value))/10^4 ~= 100
    errordlg('Sum of Level 1, Level 2, and Level 3 Charger Percentages Must Equal 100%', 'Error')
    return
end


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('ElectricVehicle_Data.txt','w');
for w = 1:length(a)
    fprintf(fid,'%f\n', a(w));
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


% Remove User Settings File

if exist(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'));
end


% Load Default Inputs

ElectricVehicle_Inputs = load(fullfile(inputdata,'Default Settings','ElectricVehicle_Default.txt'));


% Reset Inputs to Default

set(handles.ElectricVehiclePercentage_Input, 'Value', ElectricVehicle_Inputs(1));
set(handles.ElectricVehiclePercentage_Input, 'String', num2str(ElectricVehicle_Inputs(1)));

set(handles.NissanLeafPercentage_Input, 'Value', ElectricVehicle_Inputs(2));
set(handles.NissanLeafPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(2)));

set(handles.ChevroletVoltPercentage_Input, 'Value', ElectricVehicle_Inputs(3));
set(handles.ChevroletVoltPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(3)));

set(handles.ToyotaPriusPercentage_Input, 'Value', ElectricVehicle_Inputs(4));
set(handles.ToyotaPriusPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(4)));

if get(handles.NissanLeaf_RadioButton, 'Value') == 1
    Position = 0;
elseif get(handles.ChevroletVolt_RadioButton, 'Value') == 1
    Position = 14;
elseif get(handles.ToyotaPrius_RadioButton, 'Value') == 1
    Position = 28;
end

set(handles.MeanBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(5 + Position));
set(handles.MeanBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(5 + Position), 0.01)),' Wh'));

set(handles.STDBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(6 + Position));
set(handles.STDBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(6 + Position), 0.01)),' Wh'));

set(handles.UsableBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(7 + Position));
set(handles.UsableBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(7 + Position), 0.01)),' %'));

set(handles.DrivingConsumption_Slider, 'Value', ElectricVehicle_Inputs(8 + Position));
set(handles.DrivingConsumption_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(8 + Position), 0.01)),' Wh/km'));

set(handles.DrivingVelocity_Slider, 'Value', ElectricVehicle_Inputs(9 + Position));
set(handles.DrivingVelocity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(9 + Position), 0.01)),' km/h'));

set(handles.Level1ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(10 + Position));
set(handles.Level1ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(10 + Position)));

set(handles.Level1ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(11 + Position));
set(handles.Level1ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(11 + Position), 0.01)),' W'));

set(handles.Level1ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(12 + Position));
set(handles.Level1ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(12 + Position), 0.01)),' W'));

set(handles.Level2ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(13 + Position));
set(handles.Level2ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(13 + Position)));

set(handles.Level2ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(14 + Position));
set(handles.Level2ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(14 + Position), 0.01)),' W'));

set(handles.Level2ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(15 + Position));
set(handles.Level2ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(15 + Position), 0.01)),' W'));

set(handles.Level3ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(16 + Position));
set(handles.Level3ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(16 + Position)));

set(handles.Level3ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(17 + Position));
set(handles.Level3ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(17 + Position), 0.01)),' W'));

set(handles.Level3ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(18 + Position));
set(handles.Level3ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(18 + Position), 0.01)),' W'));


% --- Executes on button press in UpdateValues_Button.
function UpdateValues_Button_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateValues_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'),'file') == 2
    ElectricVehicle_Inputs = load(fullfile(inputdata,'User Settings','ElectricVehicle_Data.txt'));
else
    ElectricVehicle_Inputs = load(fullfile(inputdata,'Default Settings','ElectricVehicle_Default.txt'));
end


% Set Inputs

set(handles.ElectricVehiclePercentage_Input, 'Value', ElectricVehicle_Inputs(1));
set(handles.ElectricVehiclePercentage_Input, 'String', num2str(ElectricVehicle_Inputs(1)));

set(handles.NissanLeafPercentage_Input, 'Value', ElectricVehicle_Inputs(2));
set(handles.NissanLeafPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(2)));

set(handles.ChevroletVoltPercentage_Input, 'Value', ElectricVehicle_Inputs(3));
set(handles.ChevroletVoltPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(3)));

set(handles.ToyotaPriusPercentage_Input, 'Value', ElectricVehicle_Inputs(4));
set(handles.ToyotaPriusPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(4)));

if get(handles.NissanLeaf_RadioButton, 'Value') == 1
    Position = 0;
elseif get(handles.ChevroletVolt_RadioButton, 'Value') == 1
    Position = 14;
elseif get(handles.ToyotaPrius_RadioButton, 'Value') == 1
    Position = 28;
end

set(handles.MeanBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(5 + Position));
set(handles.MeanBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(5 + Position), 0.01)),' Wh'));

set(handles.STDBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(6 + Position));
set(handles.STDBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(6 + Position), 0.01)),' Wh'));

set(handles.UsableBatteryCapacity_Slider, 'Value', ElectricVehicle_Inputs(7 + Position));
set(handles.UsableBatteryCapacity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(7 + Position), 0.01)),' %'));

set(handles.DrivingConsumption_Slider, 'Value', ElectricVehicle_Inputs(8 + Position));
set(handles.DrivingConsumption_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(8 + Position), 0.01)),' Wh/km'));

set(handles.DrivingVelocity_Slider, 'Value', ElectricVehicle_Inputs(9 + Position));
set(handles.DrivingVelocity_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(9 + Position), 0.01)),' km/h'));

set(handles.Level1ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(10 + Position));
set(handles.Level1ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(10 + Position)));

set(handles.Level1ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(11 + Position));
set(handles.Level1ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(11 + Position), 0.01)),' W'));

set(handles.Level1ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(12 + Position));
set(handles.Level1ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(12 + Position), 0.01)),' W'));

set(handles.Level2ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(13 + Position));
set(handles.Level2ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(13 + Position)));

set(handles.Level2ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(14 + Position));
set(handles.Level2ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(14 + Position), 0.01)),' W'));

set(handles.Level2ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(15 + Position));
set(handles.Level2ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(15 + Position), 0.01)),' W'));

set(handles.Level3ChargerPercentage_Input, 'Value', ElectricVehicle_Inputs(16 + Position));
set(handles.Level3ChargerPercentage_Input, 'String', num2str(ElectricVehicle_Inputs(16 + Position)));

set(handles.Level3ChargerMeanPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(17 + Position));
set(handles.Level3ChargerMeanPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(17 + Position), 0.01)),' W'));

set(handles.Level3ChargerSTDPowerDemand_Slider, 'Value', ElectricVehicle_Inputs(18 + Position));
set(handles.Level3ChargerSTDPowerDemand_VarText, 'String', strcat(num2str(round2(ElectricVehicle_Inputs(18 + Position), 0.01)),' W'));


function ElectricVehiclePercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to ElectricVehiclePercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ElectricVehiclePercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of ElectricVehiclePercentage_Input as a double

% Read in and Store Electric Vehicle Percentage Input

ElectricVehiclePercentage = str2double(get(hObject,'String'));
if isnan(ElectricVehiclePercentage)
    ElectricVehiclePercentage = [];
    set(hObject,'String',ElectricVehiclePercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if ElectricVehiclePercentage < 0
    ElectricVehiclePercentage = [];
    set(hObject,'String',ElectricVehiclePercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if ElectricVehiclePercentage > 100
    ElectricVehiclePercentage = [];
    set(hObject,'String',ElectricVehiclePercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.ElectricVehiclePercentage_Input, 'Value', ElectricVehiclePercentage);


% --- Executes during object creation, after setting all properties.
function ElectricVehiclePercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ElectricVehiclePercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function NissanLeafPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to NissanLeafPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NissanLeafPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of NissanLeafPercentage_Input as a double

% Read in and Store Nissan Leaf Percentage Input

NissanLeafPercentage = str2double(get(hObject,'String'));
if isnan(NissanLeafPercentage)
    NissanLeafPercentage = [];
    set(hObject,'String',NissanLeafPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if NissanLeafPercentage < 0
    NissanLeafPercentage = [];
    set(hObject,'String',NissanLeafPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if NissanLeafPercentage > 100
    NissanLeafPercentage = [];
    set(hObject,'String',NissanLeafPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.NissanLeafPercentage_Input, 'Value', NissanLeafPercentage);

% --- Executes during object creation, after setting all properties.
function NissanLeafPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NissanLeafPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ChevroletVoltPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to ChevroletVoltPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ChevroletVoltPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of ChevroletVoltPercentage_Input as a double

% Read in and Store Chevrolet Volt Percentage Input

ChevroletVoltPercentage = str2double(get(hObject,'String'));
if isnan(ChevroletVoltPercentage)
    ChevroletVoltPercentage = [];
    set(hObject,'String',ChevroletVoltPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if ChevroletVoltPercentage < 0
    ChevroletVoltPercentage = [];
    set(hObject,'String',ChevroletVoltPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if ChevroletVoltPercentage > 100
    ChevroletVoltPercentage = [];
    set(hObject,'String',ChevroletVoltPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.ChevroletVoltPercentage_Input, 'Value', ChevroletVoltPercentage);


% --- Executes during object creation, after setting all properties.
function ChevroletVoltPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChevroletVoltPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ToyotaPriusPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to ToyotaPriusPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ToyotaPriusPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of ToyotaPriusPercentage_Input as a double

% Read in and Store Toyota Prius Percentage Input

ToyotaPriusPercentage = str2double(get(hObject,'String'));
if isnan(ToyotaPriusPercentage)
    ToyotaPriusPercentage = [];
    set(hObject,'String',ToyotaPriusPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if ToyotaPriusPercentage < 0
    ToyotaPriusPercentage = [];
    set(hObject,'String',ToyotaPriusPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if ToyotaPriusPercentage > 100
    ToyotaPriusPercentage = [];
    set(hObject,'String',ToyotaPriusPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.ToyotaPriusPercentage_Input, 'Value', ToyotaPriusPercentage);


% --- Executes during object creation, after setting all properties.
function ToyotaPriusPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ToyotaPriusPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function MeanBatteryCapacity_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MeanBatteryCapacity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.MeanBatteryCapacity_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.MeanBatteryCapacity_VarText, 'String', strcat(string_disp,' Wh'));


% --- Executes during object creation, after setting all properties.
function MeanBatteryCapacity_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanBatteryCapacity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function STDBatteryCapacity_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to STDBatteryCapacity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.STDBatteryCapacity_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.STDBatteryCapacity_VarText, 'String', strcat(string_disp,' Wh'));


% --- Executes during object creation, after setting all properties.
function STDBatteryCapacity_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STDBatteryCapacity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function UsableBatteryCapacity_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to UsableBatteryCapacity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.UsableBatteryCapacity_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.UsableBatteryCapacity_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function UsableBatteryCapacity_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UsableBatteryCapacity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function DrivingConsumption_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to DrivingConsumption_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.DrivingConsumption_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.DrivingConsumption_VarText, 'String', strcat(string_disp,' Wh/km'));


% --- Executes during object creation, after setting all properties.
function DrivingConsumption_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DrivingConsumption_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function DrivingVelocity_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to DrivingVelocity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.DrivingVelocity_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.DrivingVelocity_VarText, 'String', strcat(string_disp,' km/h'));


% --- Executes during object creation, after setting all properties.
function DrivingVelocity_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DrivingVelocity_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Level1ChargerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Level1ChargerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Level1ChargerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of Level1ChargerPercentage_Input as a double

% Read in and Store Level 1 Charger Percentage Input

Level1ChargerPercentage = str2double(get(hObject,'String'));
if isnan(Level1ChargerPercentage)
    Level1ChargerPercentage = [];
    set(hObject,'String',Level1ChargerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if Level1ChargerPercentage < 0
    Level1ChargerPercentage = [];
    set(hObject,'String',Level1ChargerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if Level1ChargerPercentage > 100
    Level1ChargerPercentage = [];
    set(hObject,'String',Level1ChargerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.Level1ChargerPercentage_Input, 'Value', Level1ChargerPercentage);


% --- Executes during object creation, after setting all properties.
function Level1ChargerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level1ChargerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Level1ChargerMeanPowerDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Level1ChargerMeanPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.Level1ChargerMeanPowerDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.Level1ChargerMeanPowerDemand_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function Level1ChargerMeanPowerDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level1ChargerMeanPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Level1ChargerSTDPowerDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Level1ChargerSTDPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.Level1ChargerSTDPowerDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.Level1ChargerSTDPowerDemand_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function Level1ChargerSTDPowerDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level1ChargerSTDPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Level2ChargerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Level2ChargerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Level2ChargerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of Level2ChargerPercentage_Input as a double

% Read in and Store Level 2 Charger Percentage Input

Level2ChargerPercentage = str2double(get(hObject,'String'));
if isnan(Level2ChargerPercentage)
    Level2ChargerPercentage = [];
    set(hObject,'String',Level2ChargerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if Level2ChargerPercentage < 0
    Level2ChargerPercentage = [];
    set(hObject,'String',Level2ChargerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if Level2ChargerPercentage > 100
    Level2ChargerPercentage = [];
    set(hObject,'String',Level2ChargerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.Level2ChargerPercentage_Input, 'Value', Level2ChargerPercentage);


% --- Executes during object creation, after setting all properties.
function Level2ChargerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level2ChargerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Level2ChargerMeanPowerDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Level2ChargerMeanPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.Level2ChargerMeanPowerDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.Level2ChargerMeanPowerDemand_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function Level2ChargerMeanPowerDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level2ChargerMeanPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Level2ChargerSTDPowerDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Level2ChargerSTDPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.Level2ChargerSTDPowerDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.Level2ChargerSTDPowerDemand_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function Level2ChargerSTDPowerDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level2ChargerSTDPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function Level3ChargerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to Level3ChargerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Level3ChargerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of Level3ChargerPercentage_Input as a double

% Read in and Store Level 3 Charger Percentage Input

Level3ChargerPercentage = str2double(get(hObject,'String'));
if isnan(Level3ChargerPercentage)
    Level3ChargerPercentage = [];
    set(hObject,'String',Level3ChargerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if Level3ChargerPercentage < 0
    Level3ChargerPercentage = [];
    set(hObject,'String',Level3ChargerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if Level3ChargerPercentage > 100
    Level3ChargerPercentage = [];
    set(hObject,'String',Level3ChargerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.Level3ChargerPercentage_Input, 'Value', Level3ChargerPercentage);


% --- Executes during object creation, after setting all properties.
function Level3ChargerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level3ChargerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Level3ChargerMeanPowerDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Level3ChargerMeanPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.Level3ChargerMeanPowerDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.Level3ChargerMeanPowerDemand_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function Level3ChargerMeanPowerDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level3ChargerMeanPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Level3ChargerSTDPowerDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to Level3ChargerSTDPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.Level3ChargerSTDPowerDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.Level3ChargerSTDPowerDemand_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function Level3ChargerSTDPowerDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Level3ChargerSTDPowerDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
