function varargout = DeferrableParameters(varargin)
% DEFERRABLEPARAMETERS MATLAB code for DeferrableParameters.fig
%      DEFERRABLEPARAMETERS, by itself, creates a new DEFERRABLEPARAMETERS or raises the existing
%      singleton*.
%
%      H = DEFERRABLEPARAMETERS returns the handle to a new DEFERRABLEPARAMETERS or the handle to
%      the existing singleton*.
%
%      DEFERRABLEPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEFERRABLEPARAMETERS.M with the given input arguments.
%
%      DEFERRABLEPARAMETERS('Property','Value',...) creates a new DEFERRABLEPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DeferrableParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DeferrableParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DeferrableParameters

% Last Modified by GUIDE v2.5 25-Oct-2013 14:32:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DeferrableParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @DeferrableParameters_OutputFcn, ...
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


% --- Executes just before DeferrableParameters is made visible.
function DeferrableParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DeferrableParameters (see VARARGIN)

% Choose default command line output for DeferrableParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DeferrableParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','Deferrable_Data.txt'),'file') == 2
    Deferrable_Inputs = load(fullfile(inputdata,'User Settings','Deferrable_Data.txt'));
else
    Deferrable_Inputs = load(fullfile(inputdata,'Default Settings','Deferrable_Default.txt'));
end


% Set Inputs

set(handles.WasherPercentage_Input, 'Value', Deferrable_Inputs(1));
set(handles.WasherPercentage_Input, 'String', num2str(Deferrable_Inputs(1)));

set(handles.WasherMean_Slider, 'Value', Deferrable_Inputs(2));
set(handles.WasherMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(2), 0.01)),' W'));

set(handles.WasherSTD_Slider, 'Value', Deferrable_Inputs(3));
set(handles.WasherSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(3), 0.01)),' W'));

set(handles.ElectricDryerPercentage_Input, 'Value', Deferrable_Inputs(4));
set(handles.ElectricDryerPercentage_Input, 'String', num2str(Deferrable_Inputs(4)));

set(handles.ElectricDryerMean_Slider, 'Value', Deferrable_Inputs(5));
set(handles.ElectricDryerMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(5), 0.01)),' W'));

set(handles.ElectricDryerSTD_Slider, 'Value', Deferrable_Inputs(6));
set(handles.ElectricDryerSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(6), 0.01)),' W'));

set(handles.NonelectricDryerPercentage_Input, 'Value', Deferrable_Inputs(7));
set(handles.NonelectricDryerPercentage_Input, 'String', num2str(Deferrable_Inputs(7)));

set(handles.NonelectricDryerMean_Slider, 'Value', Deferrable_Inputs(8));
set(handles.NonelectricDryerMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(8), 0.01)),' W'));

set(handles.NonelectricDryerSTD_Slider, 'Value', Deferrable_Inputs(9));
set(handles.NonelectricDryerSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(9), 0.01)),' W'));

set(handles.DishwasherPercentage_Input, 'Value', Deferrable_Inputs(10));
set(handles.DishwasherPercentage_Input, 'String', num2str(Deferrable_Inputs(10)));

set(handles.DishwasherMean_Slider, 'Value', Deferrable_Inputs(11));
set(handles.DishwasherMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(11), 0.01)),' W'));

set(handles.DishwasherSTD_Slider, 'Value', Deferrable_Inputs(12));
set(handles.DishwasherSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(12), 0.01)),' W'));


% --- Outputs from this function are returned to the command line.
function varargout = DeferrableParameters_OutputFcn(hObject, eventdata, handles) 
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

p1 = get(handles.WasherPercentage_Input);
p2 = get(handles.WasherMean_Slider);
p3 = get(handles.WasherSTD_Slider);
p4 = get(handles.ElectricDryerPercentage_Input);
p5 = get(handles.ElectricDryerMean_Slider);
p6 = get(handles.ElectricDryerSTD_Slider);
p7 = get(handles.NonelectricDryerPercentage_Input);
p8 = get(handles.NonelectricDryerMean_Slider);
p9 = get(handles.NonelectricDryerSTD_Slider);
p10 = get(handles.DishwasherPercentage_Input);
p11 = get(handles.DishwasherMean_Slider);
p12 = get(handles.DishwasherSTD_Slider);

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


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','Deferrable_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','Deferrable_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('Deferrable_Data.txt','w');
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

if exist(fullfile(inputdata,'User Settings','Deferrable_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','Deferrable_Data.txt'));
end


% Load Default Inputs

Deferrable_Inputs = load(fullfile(inputdata,'Default Settings','Deferrable_Default.txt'));


% Reset Inputs to Default

set(handles.WasherPercentage_Input, 'Value', Deferrable_Inputs(1));
set(handles.WasherPercentage_Input, 'String', num2str(Deferrable_Inputs(1)));

set(handles.WasherMean_Slider, 'Value', Deferrable_Inputs(2));
set(handles.WasherMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(2), 0.01)),' W'));

set(handles.WasherSTD_Slider, 'Value', Deferrable_Inputs(3));
set(handles.WasherSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(3), 0.01)),' W'));

set(handles.ElectricDryerPercentage_Input, 'Value', Deferrable_Inputs(4));
set(handles.ElectricDryerPercentage_Input, 'String', num2str(Deferrable_Inputs(4)));

set(handles.ElectricDryerMean_Slider, 'Value', Deferrable_Inputs(5));
set(handles.ElectricDryerMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(5), 0.01)),' W'));

set(handles.ElectricDryerSTD_Slider, 'Value', Deferrable_Inputs(6));
set(handles.ElectricDryerSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(6), 0.01)),' W'));

set(handles.NonelectricDryerPercentage_Input, 'Value', Deferrable_Inputs(7));
set(handles.NonelectricDryerPercentage_Input, 'String', num2str(Deferrable_Inputs(7)));

set(handles.NonelectricDryerMean_Slider, 'Value', Deferrable_Inputs(8));
set(handles.NonelectricDryerMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(8), 0.01)),' W'));

set(handles.NonelectricDryerSTD_Slider, 'Value', Deferrable_Inputs(9));
set(handles.NonelectricDryerSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(9), 0.01)),' W'));

set(handles.DishwasherPercentage_Input, 'Value', Deferrable_Inputs(10));
set(handles.DishwasherPercentage_Input, 'String', num2str(Deferrable_Inputs(10)));

set(handles.DishwasherMean_Slider, 'Value', Deferrable_Inputs(11));
set(handles.DishwasherMean_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(11), 0.01)),' W'));

set(handles.DishwasherSTD_Slider, 'Value', Deferrable_Inputs(12));
set(handles.DishwasherSTD_VarText, 'String', strcat(num2str(round2(Deferrable_Inputs(12), 0.01)),' W'));


function WasherPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to WasherPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WasherPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of WasherPercentage_Input as a double

% Read in and Store Washer Percentage Input

WasherPercentage = str2double(get(hObject,'String'));
if isnan(WasherPercentage)
    WasherPercentage = [];
    set(hObject,'String',WasherPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if WasherPercentage < 0
    WasherPercentage = [];
    set(hObject,'String',WasherPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if WasherPercentage > 100
    WasherPercentage = [];
    set(hObject,'String',WasherPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.WasherPercentage_Input, 'Value', WasherPercentage);


% --- Executes during object creation, after setting all properties.
function WasherPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function WasherMean_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WasherMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WasherMean_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WasherMean_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function WasherMean_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WasherSTD_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WasherSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WasherSTD_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WasherSTD_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function WasherSTD_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WasherSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function ElectricDryerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to ElectricDryerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ElectricDryerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of ElectricDryerPercentage_Input as a double

% Read in and Store Dryer Percentage Input

ElectricDryerPercentage = str2double(get(hObject,'String'));
if isnan(ElectricDryerPercentage)
    ElectricDryerPercentage = [];
    set(hObject,'String',ElectricDryerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if ElectricDryerPercentage < 0
    ElectricDryerPercentage = [];
    set(hObject,'String',ElectricDryerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if ElectricDryerPercentage > 100
    ElectricDryerPercentage = [];
    set(hObject,'String',ElectricDryerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.ElectricDryerPercentage_Input, 'Value', ElectricDryerPercentage);


% --- Executes during object creation, after setting all properties.
function ElectricDryerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ElectricDryerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ElectricDryerMean_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ElectricDryerMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ElectricDryerMean_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ElectricDryerMean_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function ElectricDryerMean_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ElectricDryerMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ElectricDryerSTD_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ElectricDryerSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ElectricDryerSTD_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ElectricDryerSTD_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function ElectricDryerSTD_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ElectricDryerSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function NonelectricDryerPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to NonelectricDryerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NonelectricDryerPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of NonelectricDryerPercentage_Input as a double

% Read in and Store Nonelectric Dryer Percentage Input

NonelectricDryerPercentage = str2double(get(hObject,'String'));
if isnan(NonelectricDryerPercentage)
    NonelectricDryerPercentage = [];
    set(hObject,'String',NonelectricDryerPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if NonelectricDryerPercentage < 0
    NonelectricDryerPercentage = [];
    set(hObject,'String',NonelectricDryerPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if NonelectricDryerPercentage > 100
    NonelectricDryerPercentage = [];
    set(hObject,'String',NonelectricDryerPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.NonelectricDryerPercentage_Input, 'Value', NonelectricDryerPercentage);


% --- Executes during object creation, after setting all properties.
function NonelectricDryerPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NonelectricDryerPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function NonelectricDryerMean_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to NonelectricDryerMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.NonelectricDryerMean_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.NonelectricDryerMean_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function NonelectricDryerMean_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NonelectricDryerMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function NonelectricDryerSTD_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to NonelectricDryerSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.NonelectricDryerSTD_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.NonelectricDryerSTD_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function NonelectricDryerSTD_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NonelectricDryerSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function DishwasherPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DishwasherPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of DishwasherPercentage_Input as a double

% Read in and Store Dishwasher Percentage Input

DishwasherPercentage = str2double(get(hObject,'String'));
if isnan(DishwasherPercentage)
    DishwasherPercentage = [];
    set(hObject,'String',DishwasherPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if DishwasherPercentage < 0
    DishwasherPercentage = [];
    set(hObject,'String',DishwasherPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if DishwasherPercentage > 100
    DishwasherPercentage = [];
    set(hObject,'String',DishwasherPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.DishwasherPercentage_Input, 'Value', DishwasherPercentage);


% --- Executes during object creation, after setting all properties.
function DishwasherPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function DishwasherMean_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.DishwasherMean_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.DishwasherMean_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function DishwasherMean_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherMean_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function DishwasherSTD_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to DishwasherSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.DishwasherSTD_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.DishwasherSTD_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function DishwasherSTD_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DishwasherSTD_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
