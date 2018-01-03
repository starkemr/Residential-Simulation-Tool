function varargout = RefrigeratorFreezerParameters(varargin)
% REFRIGERATORFREEZERPARAMETERS MATLAB code for RefrigeratorFreezerParameters.fig
%      REFRIGERATORFREEZERPARAMETERS, by itself, creates a new REFRIGERATORFREEZERPARAMETERS or raises the existing
%      singleton*.
%
%      H = REFRIGERATORFREEZERPARAMETERS returns the handle to a new REFRIGERATORFREEZERPARAMETERS or the handle to
%      the existing singleton*.
%
%      REFRIGERATORFREEZERPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REFRIGERATORFREEZERPARAMETERS.M with the given input arguments.
%
%      REFRIGERATORFREEZERPARAMETERS('Property','Value',...) creates a new REFRIGERATORFREEZERPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RefrigeratorFreezerParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RefrigeratorFreezerParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RefrigeratorFreezerParameters

% Last Modified by GUIDE v2.5 14-Aug-2013 19:59:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RefrigeratorFreezerParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @RefrigeratorFreezerParameters_OutputFcn, ...
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


% --- Executes just before RefrigeratorFreezerParameters is made visible.
function RefrigeratorFreezerParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RefrigeratorFreezerParameters (see VARARGIN)

% Choose default command line output for RefrigeratorFreezerParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RefrigeratorFreezerParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'),'file') == 2
    RefrigeratorFreezer_Inputs = load(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'));
else
    RefrigeratorFreezer_Inputs = load(fullfile(inputdata,'Default Settings','RefrigeratorFreezer_Default.txt'));
end


% Set Inputs

set(handles.RefrigeratorPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(1));
set(handles.RefrigeratorPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(1)));

set(handles.RefrigeratorDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(2));
set(handles.RefrigeratorDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(2)));

set(handles.RefrigeratorMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(3));
set(handles.RefrigeratorMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(3), 0.01)),' cuft'));

set(handles.RefrigeratorSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(4));
set(handles.RefrigeratorSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(4), 0.01)),' cuft'));

set(handles.SecondRefrigeratorPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(5));
set(handles.SecondRefrigeratorPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(5)));

set(handles.SecondRefrigeratorDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(6));
set(handles.SecondRefrigeratorDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(6)));

set(handles.SecondRefrigeratorMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(7));
set(handles.SecondRefrigeratorMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(7), 0.01)),' cuft'));

set(handles.SecondRefrigeratorSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(8));
set(handles.SecondRefrigeratorSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(8), 0.01)),' cuft'));

set(handles.RefrigeratorMeanThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(9));
set(handles.RefrigeratorMeanThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(9), 0.01)),' F'));

set(handles.RefrigeratorSTDThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(10));
set(handles.RefrigeratorSTDThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(10), 0.01)),' F'));

set(handles.RefrigeratorThermostatDeadband_Slider, 'Value', RefrigeratorFreezer_Inputs(11));
set(handles.RefrigeratorThermostatDeadband_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(11), 0.01)),' F'));

set(handles.FreezerPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(12));
set(handles.FreezerPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(12)));

set(handles.FreezerDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(13));
set(handles.FreezerDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(13)));

set(handles.FreezerMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(14));
set(handles.FreezerMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(14), 0.01)),' cuft'));

set(handles.FreezerSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(15));
set(handles.FreezerSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(15), 0.01)),' cuft'));

set(handles.SecondFreezerPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(16));
set(handles.SecondFreezerPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(16)));

set(handles.SecondFreezerDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(17));
set(handles.SecondFreezerDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(17)));

set(handles.SecondFreezerMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(18));
set(handles.SecondFreezerMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(18), 0.01)),' cuft'));

set(handles.SecondFreezerSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(19));
set(handles.SecondFreezerSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(19), 0.01)),' cuft'));

set(handles.FreezerMeanThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(20));
set(handles.FreezerMeanThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(20), 0.01)),' F'));

set(handles.FreezerSTDThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(21));
set(handles.FreezerSTDThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(21), 0.01)),' F'));

set(handles.FreezerThermostatDeadband_Slider, 'Value', RefrigeratorFreezer_Inputs(22));
set(handles.FreezerThermostatDeadband_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(22), 0.01)),' F'));


% --- Outputs from this function are returned to the command line.
function varargout = RefrigeratorFreezerParameters_OutputFcn(hObject, eventdata, handles)
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

p1 = get(handles.RefrigeratorPercentage_Input);
p2 = get(handles.RefrigeratorDefrostPercentage_Input);
p3 = get(handles.RefrigeratorMeanVolume_Slider);
p4 = get(handles.RefrigeratorSTDVolume_Slider);
p5 = get(handles.SecondRefrigeratorPercentage_Input);
p6 = get(handles.SecondRefrigeratorDefrostPercentage_Input);
p7 = get(handles.SecondRefrigeratorMeanVolume_Slider);
p8 = get(handles.SecondRefrigeratorSTDVolume_Slider);
p9 = get(handles.RefrigeratorMeanThermostatSetting_Slider);
p10 = get(handles.RefrigeratorSTDThermostatSetting_Slider);
p11 = get(handles.RefrigeratorThermostatDeadband_Slider);
p12 = get(handles.FreezerPercentage_Input);
p13 = get(handles.FreezerDefrostPercentage_Input);
p14 = get(handles.FreezerMeanVolume_Slider);
p15 = get(handles.FreezerSTDVolume_Slider);
p16 = get(handles.SecondFreezerPercentage_Input);
p17 = get(handles.SecondFreezerDefrostPercentage_Input);
p18 = get(handles.SecondFreezerMeanVolume_Slider);
p19 = get(handles.SecondFreezerSTDVolume_Slider);
p20 = get(handles.FreezerMeanThermostatSetting_Slider);
p21 = get(handles.FreezerSTDThermostatSetting_Slider);
p22 = get(handles.FreezerThermostatDeadband_Slider);

a(1) = p1.Value;
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
a(17) = p17.Value;
a(18) = p18.Value;
a(19) = p19.Value;
a(20) = p20.Value;
a(21) = p21.Value;
a(22) = p22.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('RefrigeratorFreezer_Data.txt','w');
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

if exist(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','RefrigeratorFreezer_Data.txt'));
end


% Load Default Inputs

RefrigeratorFreezer_Inputs = load(fullfile(inputdata,'Default Settings','RefrigeratorFreezer_Default.txt'));


% Reset Inputs to Default

set(handles.RefrigeratorPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(1));
set(handles.RefrigeratorPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(1)));

set(handles.RefrigeratorDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(2));
set(handles.RefrigeratorDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(2)));

set(handles.RefrigeratorMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(3));
set(handles.RefrigeratorMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(3), 0.01)),' cuft'));

set(handles.RefrigeratorSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(4));
set(handles.RefrigeratorSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(4), 0.01)),' cuft'));

set(handles.SecondRefrigeratorPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(5));
set(handles.SecondRefrigeratorPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(5)));

set(handles.SecondRefrigeratorDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(6));
set(handles.SecondRefrigeratorDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(6)));

set(handles.SecondRefrigeratorMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(7));
set(handles.SecondRefrigeratorMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(7), 0.01)),' cuft'));

set(handles.SecondRefrigeratorSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(8));
set(handles.SecondRefrigeratorSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(8), 0.01)),' cuft'));

set(handles.RefrigeratorMeanThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(9));
set(handles.RefrigeratorMeanThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(9), 0.01)),' F'));

set(handles.RefrigeratorSTDThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(10));
set(handles.RefrigeratorSTDThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(10), 0.01)),' F'));

set(handles.RefrigeratorThermostatDeadband_Slider, 'Value', RefrigeratorFreezer_Inputs(11));
set(handles.RefrigeratorThermostatDeadband_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(11), 0.01)),' F'));

set(handles.FreezerPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(12));
set(handles.FreezerPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(12)));

set(handles.FreezerDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(13));
set(handles.FreezerDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(13)));

set(handles.FreezerMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(14));
set(handles.FreezerMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(14), 0.01)),' cuft'));

set(handles.FreezerSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(15));
set(handles.FreezerSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(15), 0.01)),' cuft'));

set(handles.SecondFreezerPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(16));
set(handles.SecondFreezerPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(16)));

set(handles.SecondFreezerDefrostPercentage_Input, 'Value', RefrigeratorFreezer_Inputs(17));
set(handles.SecondFreezerDefrostPercentage_Input, 'String', num2str(RefrigeratorFreezer_Inputs(17)));

set(handles.SecondFreezerMeanVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(18));
set(handles.SecondFreezerMeanVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(18), 0.01)),' cuft'));

set(handles.SecondFreezerSTDVolume_Slider, 'Value', RefrigeratorFreezer_Inputs(19));
set(handles.SecondFreezerSTDVolume_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(19), 0.01)),' cuft'));

set(handles.FreezerMeanThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(20));
set(handles.FreezerMeanThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(20), 0.01)),' F'));

set(handles.FreezerSTDThermostatSetting_Slider, 'Value', RefrigeratorFreezer_Inputs(21));
set(handles.FreezerSTDThermostatSetting_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(21), 0.01)),' F'));

set(handles.FreezerThermostatDeadband_Slider, 'Value', RefrigeratorFreezer_Inputs(22));
set(handles.FreezerThermostatDeadband_VarText, 'String', strcat(num2str(round2(RefrigeratorFreezer_Inputs(22), 0.01)),' F'));


function RefrigeratorPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorPercentage_Input as a double

% Read in and Store Refrigerator Percentage Input

RefrigeratorPercentage = str2double(get(hObject,'String'));
if isnan(RefrigeratorPercentage)
    RefrigeratorPercentage = [];
    set(hObject,'String',RefrigeratorPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorPercentage < 0
    RefrigeratorPercentage = [];
    set(hObject,'String',RefrigeratorPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if RefrigeratorPercentage > 100
    RefrigeratorPercentage = [];
    set(hObject,'String',RefrigeratorPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.RefrigeratorPercentage_Input, 'Value', RefrigeratorPercentage);


% --- Executes during object creation, after setting all properties.
function RefrigeratorPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function RefrigeratorDefrostPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RefrigeratorDefrostPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of RefrigeratorDefrostPercentage_Input as a double


% Read in and Store Refrigerator Defrost Percentage Input

RefrigeratorDefrostPercentage = str2double(get(hObject,'String'));
if isnan(RefrigeratorDefrostPercentage)
    RefrigeratorDefrostPercentage = [];
    set(hObject,'String',RefrigeratorDefrostPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if RefrigeratorDefrostPercentage < 0
    RefrigeratorDefrostPercentage = [];
    set(hObject,'String',RefrigeratorDefrostPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if RefrigeratorDefrostPercentage > 100
    RefrigeratorDefrostPercentage = [];
    set(hObject,'String',RefrigeratorDefrostPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.RefrigeratorDefrostPercentage_Input, 'Value', RefrigeratorDefrostPercentage);


% --- Executes during object creation, after setting all properties.
function RefrigeratorDefrostPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function RefrigeratorMeanVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.RefrigeratorMeanVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.RefrigeratorMeanVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function RefrigeratorMeanVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function RefrigeratorSTDVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.RefrigeratorSTDVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.RefrigeratorSTDVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function RefrigeratorSTDVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function SecondRefrigeratorPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecondRefrigeratorPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of SecondRefrigeratorPercentage_Input as a double

% Read in and Store Second Refrigerator Percentage Input

SecondRefrigeratorPercentage = str2double(get(hObject,'String'));
if isnan(SecondRefrigeratorPercentage)
    SecondRefrigeratorPercentage = [];
    set(hObject,'String',SecondRefrigeratorPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if SecondRefrigeratorPercentage < 0
    SecondRefrigeratorPercentage = [];
    set(hObject,'String',SecondRefrigeratorPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if SecondRefrigeratorPercentage > 100
    SecondRefrigeratorPercentage = [];
    set(hObject,'String',SecondRefrigeratorPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.SecondRefrigeratorPercentage_Input, 'Value', SecondRefrigeratorPercentage);


% --- Executes during object creation, after setting all properties.
function SecondRefrigeratorPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function SecondRefrigeratorDefrostPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecondRefrigeratorDefrostPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of SecondRefrigeratorDefrostPercentage_Input as a double

% Read in and Store Second Refrigerator Defrost Percentage Input

SecondRefrigeratorDefrostPercentage = str2double(get(hObject,'String'));
if isnan(SecondRefrigeratorDefrostPercentage)
    SecondRefrigeratorDefrostPercentage = [];
    set(hObject,'String',SecondRefrigeratorDefrostPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if SecondRefrigeratorDefrostPercentage < 0
    SecondRefrigeratorDefrostPercentage = [];
    set(hObject,'String',SecondRefrigeratorDefrostPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if SecondRefrigeratorDefrostPercentage > 100
    SecondRefrigeratorDefrostPercentage = [];
    set(hObject,'String',SecondRefrigeratorDefrostPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.SecondRefrigeratorDefrostPercentage_Input, 'Value', SecondRefrigeratorDefrostPercentage);


% --- Executes during object creation, after setting all properties.
function SecondRefrigeratorDefrostPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SecondRefrigeratorMeanVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.SecondRefrigeratorMeanVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.SecondRefrigeratorMeanVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function SecondRefrigeratorMeanVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SecondRefrigeratorSTDVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.SecondRefrigeratorSTDVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.SecondRefrigeratorSTDVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function SecondRefrigeratorSTDVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondRefrigeratorSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function RefrigeratorMeanThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorMeanThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.RefrigeratorMeanThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.RefrigeratorMeanThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function RefrigeratorMeanThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorMeanThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function RefrigeratorSTDThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorSTDThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.RefrigeratorSTDThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.RefrigeratorSTDThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function RefrigeratorSTDThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorSTDThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function RefrigeratorThermostatDeadband_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorThermostatDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.RefrigeratorThermostatDeadband_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.RefrigeratorThermostatDeadband_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function RefrigeratorThermostatDeadband_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RefrigeratorThermostatDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function FreezerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of FreezerPercentage_Input as a double

% Read in and Store Freezer Percentage Input

FreezerPercentage = str2double(get(hObject,'String'));
if isnan(FreezerPercentage)
    FreezerPercentage = [];
    set(hObject,'String',FreezerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerPercentage < 0
    FreezerPercentage = [];
    set(hObject,'String',FreezerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if FreezerPercentage > 100
    FreezerPercentage = [];
    set(hObject,'String',FreezerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.FreezerPercentage_Input, 'Value', FreezerPercentage);


% --- Executes during object creation, after setting all properties.
function FreezerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function FreezerDefrostPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FreezerDefrostPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of FreezerDefrostPercentage_Input as a double

% Read in and Store Freezer Defrost Percentage Input

FreezerDefrostPercentage = str2double(get(hObject,'String'));
if isnan(FreezerDefrostPercentage)
    FreezerDefrostPercentage = [];
    set(hObject,'String',FreezerDefrostPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if FreezerDefrostPercentage < 0
    FreezerDefrostPercentage = [];
    set(hObject,'String',FreezerDefrostPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if FreezerDefrostPercentage > 100
    FreezerDefrostPercentage = [];
    set(hObject,'String',FreezerDefrostPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.FreezerDefrostPercentage_Input, 'Value', FreezerDefrostPercentage);


% --- Executes during object creation, after setting all properties.
function FreezerDefrostPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function FreezerMeanVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.FreezerMeanVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.FreezerMeanVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function FreezerMeanVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function FreezerSTDVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.FreezerSTDVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.FreezerSTDVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function FreezerSTDVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function SecondFreezerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to SecondFreezerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecondFreezerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of SecondFreezerPercentage_Input as a double

% Read in and Store Second Freezer Percentage Input

SecondFreezerPercentage = str2double(get(hObject,'String'));
if isnan(SecondFreezerPercentage)
    SecondFreezerPercentage = [];
    set(hObject,'String',SecondFreezerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if SecondFreezerPercentage < 0
    SecondFreezerPercentage = [];
    set(hObject,'String',SecondFreezerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if SecondFreezerPercentage > 100
    SecondFreezerPercentage = [];
    set(hObject,'String',SecondFreezerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.SecondFreezerPercentage_Input, 'Value', SecondFreezerPercentage);


% --- Executes during object creation, after setting all properties.
function SecondFreezerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondFreezerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function SecondFreezerDefrostPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to SecondFreezerDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SecondFreezerDefrostPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of SecondFreezerDefrostPercentage_Input as a double

% Read in and Store Second Freezer Defrost Percentage Input

SecondFreezerDefrostPercentage = str2double(get(hObject,'String'));
if isnan(SecondFreezerDefrostPercentage)
    SecondFreezerDefrostPercentage = [];
    set(hObject,'String',SecondFreezerDefrostPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if SecondFreezerDefrostPercentage < 0
    SecondFreezerDefrostPercentage = [];
    set(hObject,'String',SecondFreezerDefrostPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if SecondFreezerDefrostPercentage > 100
    SecondFreezerDefrostPercentage = [];
    set(hObject,'String',SecondFreezerDefrostPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.SecondFreezerDefrostPercentage_Input, 'Value', SecondFreezerDefrostPercentage);


% --- Executes during object creation, after setting all properties.
function SecondFreezerDefrostPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondFreezerDefrostPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function SecondFreezerMeanVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to SecondFreezerMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.SecondFreezerMeanVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.SecondFreezerMeanVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function SecondFreezerMeanVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondFreezerMeanVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SecondFreezerSTDVolume_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to SecondFreezerSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.SecondFreezerSTDVolume_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.SecondFreezerSTDVolume_VarText, 'String', strcat(string_disp,' cuft'));


% --- Executes during object creation, after setting all properties.
function SecondFreezerSTDVolume_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SecondFreezerSTDVolume_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function FreezerMeanThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerMeanThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.FreezerMeanThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.FreezerMeanThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function FreezerMeanThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerMeanThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function FreezerSTDThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerSTDThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.FreezerSTDThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.FreezerSTDThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function FreezerSTDThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerSTDThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function FreezerThermostatDeadband_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to FreezerThermostatDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.FreezerThermostatDeadband_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.FreezerThermostatDeadband_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function FreezerThermostatDeadband_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FreezerThermostatDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
