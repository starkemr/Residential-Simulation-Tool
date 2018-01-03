function varargout = WaterHeaterParameters(varargin)
% WATERHEATERPARAMETERS MATLAB code for WaterHeaterParameters.fig
%      WATERHEATERPARAMETERS, by itself, creates a new WATERHEATERPARAMETERS or raises the existing
%      singleton*.
%
%      H = WATERHEATERPARAMETERS returns the handle to a new WATERHEATERPARAMETERS or the handle to
%      the existing singleton*.
%
%      WATERHEATERPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WATERHEATERPARAMETERS.M with the given input arguments.
%
%      WATERHEATERPARAMETERS('Property','Value',...) creates a new WATERHEATERPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WaterHeaterParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WaterHeaterParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WaterHeaterParameters

% Last Modified by GUIDE v2.5 21-Jul-2014 11:49:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WaterHeaterParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @WaterHeaterParameters_OutputFcn, ...
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


% --- Executes just before WaterHeaterParameters is made visible.
function WaterHeaterParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WaterHeaterParameters (see VARARGIN)

% Choose default command line output for WaterHeaterParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WaterHeaterParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'),'file') == 2
    WaterHeater_Inputs = load(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'));
else
    WaterHeater_Inputs = load(fullfile(inputdata,'Default Settings','WaterHeater_Default.txt'));
end


% Set Inputs

if WaterHeater_Inputs(1) == 1
    set(handles.OneNode_RadioButton, 'Value', 1);
elseif WaterHeater_Inputs(1) == 2
    set(handles.TwoNode_RadioButton, 'Value', 1);
end

set(handles.WaterHeaterPercentage_Input, 'Value', WaterHeater_Inputs(2));
set(handles.WaterHeaterPercentage_Input, 'String', num2str(WaterHeater_Inputs(2)));

set(handles.WaterHeaterMeanVolume_Slider, 'Value', WaterHeater_Inputs(3));
set(handles.WaterHeaterMeanVolume_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(3), 0.01)),' gal'));

set(handles.WaterHeaterSTDVolume_Slider, 'Value', WaterHeater_Inputs(4));
set(handles.WaterHeaterSTDVolume_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(4), 0.01)),' gal'));

set(handles.WaterHeaterMeanPower_Slider, 'Value', WaterHeater_Inputs(5));
set(handles.WaterHeaterMeanPower_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(5), 0.01)),' W'));

set(handles.WaterHeaterSTDPower_Slider, 'Value', WaterHeater_Inputs(6));
set(handles.WaterHeaterSTDPower_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(6), 0.01)),' W'));

set(handles.MeanInsulationValue_Slider, 'Value', WaterHeater_Inputs(7));
set(handles.MeanInsulationValue_VarText, 'String', strcat('R-',num2str(round2(WaterHeater_Inputs(7), 0.01))));

set(handles.STDInsulationValue_Slider, 'Value', WaterHeater_Inputs(8));
set(handles.STDInsulationValue_VarText, 'String', strcat('R-',num2str(round2(WaterHeater_Inputs(8), 0.01))));

set(handles.MeanThermostatSetting_Slider, 'Value', WaterHeater_Inputs(9));
set(handles.MeanThermostatSetting_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(9), 0.01)),' F'));

set(handles.STDThermostatSetting_Slider, 'Value', WaterHeater_Inputs(10));
set(handles.STDThermostatSetting_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(10), 0.01)),' F'));

set(handles.ThermostatDeadband_Slider, 'Value', WaterHeater_Inputs(11));
set(handles.ThermostatDeadband_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(11), 0.01)),' F'));

set(handles.ShowerWaterDemand_Slider, 'Value', WaterHeater_Inputs(12));
set(handles.ShowerWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(12), 0.01)),' gal'));

set(handles.BathWaterDemand_Slider, 'Value', WaterHeater_Inputs(13));
set(handles.BathWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(13), 0.01)),' gal'));

set(handles.WasherWaterDemand_Slider, 'Value', WaterHeater_Inputs(14));
set(handles.WasherWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(14), 0.01)),' gal'));

set(handles.DishwasherWaterDemand_Slider, 'Value', WaterHeater_Inputs(15));
set(handles.DishwasherWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(15), 0.01)),' gal'));

set(handles.SinkWaterDemand_Slider, 'Value', WaterHeater_Inputs(16));
set(handles.SinkWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(16), 0.01)),' gal'));


% --- Outputs from this function are returned to the command line.
function varargout = WaterHeaterParameters_OutputFcn(hObject, eventdata, handles)
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


% Get User Settings

p1 = get(handles.OneNode_RadioButton,'Value')*1 + get(handles.TwoNode_RadioButton,'Value')*2;
p2 = get(handles.WaterHeaterPercentage_Input);
p3 = get(handles.WaterHeaterMeanVolume_Slider);
p4 = get(handles.WaterHeaterSTDVolume_Slider);
p5 = get(handles.WaterHeaterMeanPower_Slider);
p6 = get(handles.WaterHeaterSTDPower_Slider);
p7 = get(handles.MeanInsulationValue_Slider);
p8 = get(handles.STDInsulationValue_Slider);
p9 = get(handles.MeanThermostatSetting_Slider);
p10 = get(handles.STDThermostatSetting_Slider);
p11 = get(handles.ThermostatDeadband_Slider);
p12 = get(handles.ShowerWaterDemand_Slider);
p13 = get(handles.BathWaterDemand_Slider);
p14 = get(handles.WasherWaterDemand_Slider);
p15 = get(handles.DishwasherWaterDemand_Slider);
p16 = get(handles.SinkWaterDemand_Slider);

a(1) = p1;
a(2) = p2.Value;
a(3) = p3.Value;
a(4) = p4.Value;
a(5) = p5.Value;
a(6) = p6.Value;
a(7) = p7.Value;
a(8) = p8.Value;
a(9) = p9.Value;
a(10) = p10.Value;
a(11) = p11.Value;
a(12) = p12.Value;
a(13) = p13.Value;
a(14) = p14.Value;
a(15) = p15.Value;
a(16) = p16.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('WaterHeater_Data.txt','w');
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

if exist(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','WaterHeater_Data.txt'));
end


% Load Default Inputs

WaterHeater_Inputs = load(fullfile(inputdata,'Default Settings','WaterHeater_Default.txt'));


% Reset Inputs to Default

if WaterHeater_Inputs(1) == 1
    set(handles.OneNode_RadioButton, 'Value', 1);
elseif WaterHeater_Inputs(1) == 2
    set(handles.TwoNode_RadioButton, 'Value', 1);
end

set(handles.WaterHeaterPercentage_Input, 'Value', WaterHeater_Inputs(2));
set(handles.WaterHeaterPercentage_Input, 'String', num2str(WaterHeater_Inputs(2)));

set(handles.WaterHeaterMeanVolume_Slider, 'Value', WaterHeater_Inputs(3));
set(handles.WaterHeaterMeanVolume_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(3), 0.01)),' gal'));

set(handles.WaterHeaterSTDVolume_Slider, 'Value', WaterHeater_Inputs(4));
set(handles.WaterHeaterSTDVolume_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(4), 0.01)),' gal'));

set(handles.WaterHeaterMeanPower_Slider, 'Value', WaterHeater_Inputs(5));
set(handles.WaterHeaterMeanPower_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(5), 0.01)),' W'));

set(handles.WaterHeaterSTDPower_Slider, 'Value', WaterHeater_Inputs(6));
set(handles.WaterHeaterSTDPower_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(6), 0.01)),' W'));

set(handles.MeanInsulationValue_Slider, 'Value', WaterHeater_Inputs(7));
set(handles.MeanInsulationValue_VarText, 'String', strcat('R-',num2str(round2(WaterHeater_Inputs(7), 0.01))));

set(handles.STDInsulationValue_Slider, 'Value', WaterHeater_Inputs(8));
set(handles.STDInsulationValue_VarText, 'String', strcat('R-',num2str(round2(WaterHeater_Inputs(8), 0.01))));

set(handles.MeanThermostatSetting_Slider, 'Value', WaterHeater_Inputs(9));
set(handles.MeanThermostatSetting_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(9), 0.01)),' F'));

set(handles.STDThermostatSetting_Slider, 'Value', WaterHeater_Inputs(10));
set(handles.STDThermostatSetting_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(10), 0.01)),' F'));

set(handles.ThermostatDeadband_Slider, 'Value', WaterHeater_Inputs(11));
set(handles.ThermostatDeadband_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(11), 0.01)),' F'));

set(handles.ShowerWaterDemand_Slider, 'Value', WaterHeater_Inputs(12));
set(handles.ShowerWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(12), 0.01)),' gal'));

set(handles.BathWaterDemand_Slider, 'Value', WaterHeater_Inputs(13));
set(handles.BathWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(13), 0.01)),' gal'));

set(handles.WasherWaterDemand_Slider, 'Value', WaterHeater_Inputs(14));
set(handles.WasherWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(14), 0.01)),' gal'));

set(handles.DishwasherWaterDemand_Slider, 'Value', WaterHeater_Inputs(15));
set(handles.DishwasherWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(15), 0.01)),' gal'));

set(handles.SinkWaterDemand_Slider, 'Value', WaterHeater_Inputs(16));
set(handles.SinkWaterDemand_VarText, 'String', strcat(num2str(round2(WaterHeater_Inputs(16), 0.01)),' gal'));


function WaterHeaterPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WaterHeaterPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of WaterHeaterPercentage_Input as a double

% Read in and Store Water Heater Percentage Input

WaterHeaterPercentage = str2double(get(hObject,'String'));
if isnan(WaterHeaterPercentage)
    WaterHeaterPercentage = [];
    set(hObject,'String',WaterHeaterPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WaterHeaterPercentage < 0
    WaterHeaterPercentage = [];
    set(hObject,'String',WaterHeaterPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if WaterHeaterPercentage > 100
    WaterHeaterPercentage = [];
    set(hObject,'String',WaterHeaterPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.WaterHeaterPercentage_Input, 'Value', WaterHeaterPercentage);


% --- Executes during object creation, after setting all properties.
function WaterHeaterPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function WaterHeaterMeanVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WaterHeaterMeanVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WaterHeaterMeanVolume_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function WaterHeaterMeanVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WaterHeaterSTDVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WaterHeaterSTDVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WaterHeaterSTDVolume_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function WaterHeaterSTDVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WaterHeaterMeanPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WaterHeaterMeanPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WaterHeaterMeanPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function WaterHeaterMeanPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WaterHeaterSTDPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeaterSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WaterHeaterSTDPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WaterHeaterSTDPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function WaterHeaterSTDPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WaterHeaterSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MeanInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MeanInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.MeanInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.MeanInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function MeanInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function STDInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to STDInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.STDInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.STDInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function STDInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STDInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MeanThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MeanThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.MeanThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.MeanThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function MeanThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function STDThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to STDThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.STDThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.STDThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function STDThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STDThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ThermostatDeadband_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ThermostatDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ThermostatDeadband_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ThermostatDeadband_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function ThermostatDeadband_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ThermostatDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ShowerWaterDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ShowerWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ShowerWaterDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ShowerWaterDemand_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function ShowerWaterDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ShowerWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function BathWaterDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to BathWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.BathWaterDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.BathWaterDemand_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function BathWaterDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BathWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WasherWaterDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WasherWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WasherWaterDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WasherWaterDemand_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function WasherWaterDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function DishwasherWaterDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.DishwasherWaterDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.DishwasherWaterDemand_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function DishwasherWaterDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SinkWaterDemand_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to SinkWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.SinkWaterDemand_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.SinkWaterDemand_VarText, 'String', strcat(string_disp,' gal'));


% --- Executes during object creation, after setting all properties.
function SinkWaterDemand_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SinkWaterDemand_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
