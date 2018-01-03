function varargout = UninterruptibleParameters(varargin)
% UNINTERRUPTIBLEPARAMETERS MATLAB code for UninterruptibleParameters.fig
%      UNINTERRUPTIBLEPARAMETERS, by itself, creates a new UNINTERRUPTIBLEPARAMETERS or raises the existing
%      singleton*.
%
%      H = UNINTERRUPTIBLEPARAMETERS returns the handle to a new UNINTERRUPTIBLEPARAMETERS or the handle to
%      the existing singleton*.
%
%      UNINTERRUPTIBLEPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNINTERRUPTIBLEPARAMETERS.M with the given input arguments.
%
%      UNINTERRUPTIBLEPARAMETERS('Property','Value',...) creates a new UNINTERRUPTIBLEPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UninterruptibleParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UninterruptibleParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UninterruptibleParameters

% Last Modified by GUIDE v2.5 02-Oct-2013 14:38:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UninterruptibleParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @UninterruptibleParameters_OutputFcn, ...
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


% --- Executes just before UninterruptibleParameters is made visible.
function UninterruptibleParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UninterruptibleParameters (see VARARGIN)

% Choose default command line output for UninterruptibleParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UninterruptibleParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'),'file') == 2
    Uninterruptible_Inputs = load(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'));
else
    Uninterruptible_Inputs = load(fullfile(inputdata,'Default Settings','Uninterruptible_Default.txt'));
end


% Set Inputs

set(handles.CookingPercentage_Input, 'Value', Uninterruptible_Inputs(1));
set(handles.CookingPercentage_Input, 'String', num2str(Uninterruptible_Inputs(1)));

set(handles.CookingMeanPower_Slider, 'Value', Uninterruptible_Inputs(2));
set(handles.CookingMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(2), 0.01)),' W'));

set(handles.CookingSTDPower_Slider, 'Value', Uninterruptible_Inputs(3));
set(handles.CookingSTDPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(3), 0.01)),' W'));

set(handles.TelevisionsPerHome_Input, 'Value', Uninterruptible_Inputs(4));
set(handles.TelevisionsPerHome_Input, 'String', num2str(Uninterruptible_Inputs(4)));

set(handles.TelevisionMeanPower_Slider, 'Value', Uninterruptible_Inputs(5));
set(handles.TelevisionMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(5), 0.01)),' W'));

set(handles.TelevisionSTDPower_Slider, 'Value', Uninterruptible_Inputs(6));
set(handles.TelevisionSTDPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(6), 0.01)),' W'));

set(handles.TelevisionStandbyPower_Slider, 'Value', Uninterruptible_Inputs(7));
set(handles.TelevisionStandbyPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(7), 0.01)),' W'));

set(handles.ComputersPerHome_Input, 'Value', Uninterruptible_Inputs(8));
set(handles.ComputersPerHome_Input, 'String', num2str(Uninterruptible_Inputs(8)));

set(handles.ComputerMeanPower_Slider, 'Value', Uninterruptible_Inputs(9));
set(handles.ComputerMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(9), 0.01)),' W'));

set(handles.ComputerSTDPower_Slider, 'Value', Uninterruptible_Inputs(10));
set(handles.ComputerSTDPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(10), 0.01)),' W'));

set(handles.ComputerStandbyPower_Slider, 'Value', Uninterruptible_Inputs(11));
set(handles.ComputerStandbyPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(11), 0.01)),' W'));

set(handles.AdditionalMeanPower_Slider, 'Value', Uninterruptible_Inputs(12));
set(handles.AdditionalMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(12), 0.01)),' W'));

set(handles.LightingPercentage_Input, 'Value', Uninterruptible_Inputs(13));
set(handles.LightingPercentage_Input, 'String', num2str(Uninterruptible_Inputs(13)));

set(handles.IncandescentPercentage_Input, 'Value', Uninterruptible_Inputs(14));
set(handles.IncandescentPercentage_Input, 'String', num2str(Uninterruptible_Inputs(14)));

set(handles.HalogenPercentage_Input, 'Value', Uninterruptible_Inputs(15));
set(handles.HalogenPercentage_Input, 'String', num2str(Uninterruptible_Inputs(15)));

set(handles.LinearFluorescentPercentage_Input, 'Value', Uninterruptible_Inputs(16));
set(handles.LinearFluorescentPercentage_Input, 'String', num2str(Uninterruptible_Inputs(16)));

set(handles.CFLPercentage_Input, 'Value', Uninterruptible_Inputs(17));
set(handles.CFLPercentage_Input, 'String', num2str(Uninterruptible_Inputs(17)));

set(handles.LEDPercentage_Input, 'Value', Uninterruptible_Inputs(18));
set(handles.LEDPercentage_Input, 'String', num2str(Uninterruptible_Inputs(18)));


% --- Outputs from this function are returned to the command line.
function varargout = UninterruptibleParameters_OutputFcn(hObject, eventdata, handles)
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

p1 = get(handles.CookingPercentage_Input);
p2 = get(handles.CookingMeanPower_Slider);
p3 = get(handles.CookingSTDPower_Slider);
p4 = get(handles.TelevisionsPerHome_Input);
p5 = get(handles.TelevisionMeanPower_Slider);
p6 = get(handles.TelevisionSTDPower_Slider);
p7 = get(handles.TelevisionStandbyPower_Slider);
p8 = get(handles.ComputersPerHome_Input);
p9 = get(handles.ComputerMeanPower_Slider);
p10 = get(handles.ComputerSTDPower_Slider);
p11 = get(handles.ComputerStandbyPower_Slider);
p12 = get(handles.AdditionalMeanPower_Slider);
p13 = get(handles.LightingPercentage_Input);
p14 = get(handles.IncandescentPercentage_Input);
p15 = get(handles.HalogenPercentage_Input);
p16 = get(handles.LinearFluorescentPercentage_Input);
p17 = get(handles.CFLPercentage_Input);
p18 = get(handles.LEDPercentage_Input);

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

if round(10^4*(p14.Value + p15.Value + p16.Value + p17.Value + p18.Value))/10^4 ~= 100
    errordlg('Sum of Incandescent, Halogen, Linear Fluorescent, Compact Fluorescent, and LED Lighting Must Equal 100%', 'Error')
    return
end


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('Uninterruptible_Data.txt','w');
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

if exist(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','Uninterruptible_Data.txt'));
end


% Load Default Inputs

Uninterruptible_Inputs = load(fullfile(inputdata,'Default Settings','Uninterruptible_Default.txt'));


% Reset Inputs to Default

set(handles.CookingPercentage_Input, 'Value', Uninterruptible_Inputs(1));
set(handles.CookingPercentage_Input, 'String', num2str(Uninterruptible_Inputs(1)));

set(handles.CookingMeanPower_Slider, 'Value', Uninterruptible_Inputs(2));
set(handles.CookingMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(2), 0.01)),' W'));

set(handles.CookingSTDPower_Slider, 'Value', Uninterruptible_Inputs(3));
set(handles.CookingSTDPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(3), 0.01)),' W'));

set(handles.TelevisionsPerHome_Input, 'Value', Uninterruptible_Inputs(4));
set(handles.TelevisionsPerHome_Input, 'String', num2str(Uninterruptible_Inputs(4)));

set(handles.TelevisionMeanPower_Slider, 'Value', Uninterruptible_Inputs(5));
set(handles.TelevisionMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(5), 0.01)),' W'));

set(handles.TelevisionSTDPower_Slider, 'Value', Uninterruptible_Inputs(6));
set(handles.TelevisionSTDPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(6), 0.01)),' W'));

set(handles.TelevisionStandbyPower_Slider, 'Value', Uninterruptible_Inputs(7));
set(handles.TelevisionStandbyPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(7), 0.01)),' W'));

set(handles.ComputersPerHome_Input, 'Value', Uninterruptible_Inputs(8));
set(handles.ComputersPerHome_Input, 'String', num2str(Uninterruptible_Inputs(8)));

set(handles.ComputerMeanPower_Slider, 'Value', Uninterruptible_Inputs(9));
set(handles.ComputerMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(9), 0.01)),' W'));

set(handles.ComputerSTDPower_Slider, 'Value', Uninterruptible_Inputs(10));
set(handles.ComputerSTDPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(10), 0.01)),' W'));

set(handles.ComputerStandbyPower_Slider, 'Value', Uninterruptible_Inputs(11));
set(handles.ComputerStandbyPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(11), 0.01)),' W'));

set(handles.AdditionalMeanPower_Slider, 'Value', Uninterruptible_Inputs(12));
set(handles.AdditionalMeanPower_VarText, 'String', strcat(num2str(round2(Uninterruptible_Inputs(12), 0.01)),' W'));

set(handles.LightingPercentage_Input, 'Value', Uninterruptible_Inputs(13));
set(handles.LightingPercentage_Input, 'String', num2str(Uninterruptible_Inputs(13)));

set(handles.IncandescentPercentage_Input, 'Value', Uninterruptible_Inputs(14));
set(handles.IncandescentPercentage_Input, 'String', num2str(Uninterruptible_Inputs(14)));

set(handles.HalogenPercentage_Input, 'Value', Uninterruptible_Inputs(15));
set(handles.HalogenPercentage_Input, 'String', num2str(Uninterruptible_Inputs(15)));

set(handles.LinearFluorescentPercentage_Input, 'Value', Uninterruptible_Inputs(16));
set(handles.LinearFluorescentPercentage_Input, 'String', num2str(Uninterruptible_Inputs(16)));

set(handles.CFLPercentage_Input, 'Value', Uninterruptible_Inputs(17));
set(handles.CFLPercentage_Input, 'String', num2str(Uninterruptible_Inputs(17)));

set(handles.LEDPercentage_Input, 'Value', Uninterruptible_Inputs(18));
set(handles.LEDPercentage_Input, 'String', num2str(Uninterruptible_Inputs(18)));


function CookingPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to CookingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CookingPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of CookingPercentage_Input as a double

% Read in and Store Cooking Percentage Input

CookingPercentage = str2double(get(hObject,'String'));
if isnan(CookingPercentage)
    CookingPercentage = [];
    set(hObject,'String',CookingPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if CookingPercentage < 0
    CookingPercentage = [];
    set(hObject,'String',CookingPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if CookingPercentage > 100
    CookingPercentage = [];
    set(hObject,'String',CookingPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.CookingPercentage_Input, 'Value', CookingPercentage);


% --- Executes during object creation, after setting all properties.
function CookingPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CookingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function CookingMeanPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to CookingMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.CookingMeanPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.CookingMeanPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function CookingMeanPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CookingMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function CookingSTDPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to CookingSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.CookingSTDPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.CookingSTDPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function CookingSTDPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CookingSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function TelevisionsPerHome_Input_Callback(hObject, eventdata, handles)
% hObject    handle to TelevisionsPerHome_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TelevisionsPerHome_Input as text
%        str2double(get(hObject,'String')) returns contents of TelevisionsPerHome_Input as a double

% Read in and Store Televisions Per Home Input

TelevisionsPerHome = str2double(get(hObject,'String'));
if isnan(TelevisionsPerHome)
    TelevisionsPerHome = [];
    set(hObject,'String',TelevisionsPerHome);
    errordlg('Input Must be a Number', 'Error')
    return
end
if TelevisionsPerHome < 0
    TelevisionsPerHome = [];
    set(hObject,'String',TelevisionsPerHome);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if TelevisionsPerHome > 4
    TelevisionsPerHome = [];
    set(hObject,'String',TelevisionsPerHome);
    errordlg('Input Must be Less than or Equal to 4', 'Error')
    return
end

set(handles.TelevisionsPerHome_Input, 'Value', TelevisionsPerHome);


% --- Executes during object creation, after setting all properties.
function TelevisionsPerHome_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TelevisionsPerHome_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function TelevisionMeanPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to TelevisionMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.TelevisionMeanPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.TelevisionMeanPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function TelevisionMeanPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TelevisionMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function TelevisionSTDPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to TelevisionSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.TelevisionSTDPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.TelevisionSTDPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function TelevisionSTDPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TelevisionSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function TelevisionStandbyPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to TelevisionStandbyPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.TelevisionStandbyPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.TelevisionStandbyPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function TelevisionStandbyPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TelevisionStandbyPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function ComputersPerHome_Input_Callback(hObject, eventdata, handles)
% hObject    handle to ComputersPerHome_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ComputersPerHome_Input as text
%        str2double(get(hObject,'String')) returns contents of ComputersPerHome_Input as a double

% Read in and Store Computers Per Home Input

ComputersPerHome = str2double(get(hObject,'String'));
if isnan(ComputersPerHome)
    ComputersPerHome = [];
    set(hObject,'String',ComputersPerHome);
    errordlg('Input Must be a Number', 'Error')
    return
end
if ComputersPerHome < 0
    ComputersPerHome = [];
    set(hObject,'String',ComputersPerHome);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if ComputersPerHome > 3
    ComputersPerHome = [];
    set(hObject,'String',ComputersPerHome);
    errordlg('Input Must be Less than or Equal to 3', 'Error')
    return
end

set(handles.ComputersPerHome_Input, 'Value', ComputersPerHome);


% --- Executes during object creation, after setting all properties.
function ComputersPerHome_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ComputersPerHome_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function ComputerMeanPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ComputerMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ComputerMeanPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ComputerMeanPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function ComputerMeanPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ComputerMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ComputerSTDPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ComputerSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ComputerSTDPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ComputerSTDPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function ComputerSTDPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ComputerSTDPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ComputerStandbyPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to ComputerStandbyPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.ComputerStandbyPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.ComputerStandbyPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function ComputerStandbyPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ComputerStandbyPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function AdditionalMeanPower_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to AdditionalMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.AdditionalMeanPower_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.AdditionalMeanPower_VarText, 'String', strcat(string_disp,' W'));


% --- Executes during object creation, after setting all properties.
function AdditionalMeanPower_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AdditionalMeanPower_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function LightingPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to LightingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LightingPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of LightingPercentage_Input as a double

% Read in and Store Lighting Percentage Input

LightingPercentage = str2double(get(hObject,'String'));
if isnan(LightingPercentage)
    LightingPercentage = [];
    set(hObject,'String',LightingPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if LightingPercentage < 0
    LightingPercentage = [];
    set(hObject,'String',LightingPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if LightingPercentage > 100
    LightingPercentage = [];
    set(hObject,'String',LightingPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.LightingPercentage_Input, 'Value', LightingPercentage);


% --- Executes during object creation, after setting all properties.
function LightingPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LightingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function IncandescentPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to IncandescentPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IncandescentPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of IncandescentPercentage_Input as a double

% Read in and Store Incandescent Input

IncandescentPercentage = str2double(get(hObject,'String'));
if isnan(IncandescentPercentage)
    IncandescentPercentage = [];
    set(hObject,'String',IncandescentPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if IncandescentPercentage < 0
    IncandescentPercentage = [];
    set(hObject,'String',IncandescentPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if IncandescentPercentage > 100
    IncandescentPercentage = [];
    set(hObject,'String',IncandescentPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.IncandescentPercentage_Input, 'Value', IncandescentPercentage);


% --- Executes during object creation, after setting all properties.
function IncandescentPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IncandescentPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function HalogenPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to HalogenPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HalogenPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of HalogenPercentage_Input as a double

% Read in and Store Halogen Input

HalogenPercentage = str2double(get(hObject,'String'));
if isnan(HalogenPercentage)
    HalogenPercentage = [];
    set(hObject,'String',HalogenPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HalogenPercentage < 0
    HalogenPercentage = [];
    set(hObject,'String',HalogenPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if HalogenPercentage > 100
    HalogenPercentage = [];
    set(hObject,'String',HalogenPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.HalogenPercentage_Input, 'Value', HalogenPercentage);


% --- Executes during object creation, after setting all properties.
function HalogenPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HalogenPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function LinearFluorescentPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to LinearFluorescentPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LinearFluorescentPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of LinearFluorescentPercentage_Input as a double

% Read in and Store Linear Fluorescent Input

LinearFluorescentPercentage = str2double(get(hObject,'String'));
if isnan(LinearFluorescentPercentage)
    LinearFluorescentPercentage = [];
    set(hObject,'String',LinearFluorescentPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if LinearFluorescentPercentage < 0
    LinearFluorescentPercentage = [];
    set(hObject,'String',LinearFluorescentPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if LinearFluorescentPercentage > 100
    LinearFluorescentPercentage = [];
    set(hObject,'String',LinearFluorescentPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.LinearFluorescentPercentage_Input, 'Value', LinearFluorescentPercentage);


% --- Executes during object creation, after setting all properties.
function LinearFluorescentPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LinearFluorescentPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function CFLPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to CFLPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CFLPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of CFLPercentage_Input as a double

% Read in and Store Compact Fluorescent Input

CFLPercentage = str2double(get(hObject,'String'));
if isnan(CFLPercentage)
    CFLPercentage = [];
    set(hObject,'String',CFLPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if CFLPercentage < 0
    CFLPercentage = [];
    set(hObject,'String',CFLPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if CFLPercentage > 100
    CFLPercentage = [];
    set(hObject,'String',CFLPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.CFLPercentage_Input, 'Value', CFLPercentage);


% --- Executes during object creation, after setting all properties.
function CFLPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CFLPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function LEDPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to LEDPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LEDPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of LEDPercentage_Input as a double

% Read in and Store LED Input

LEDPercentage = str2double(get(hObject,'String'));
if isnan(LEDPercentage)
    LEDPercentage = [];
    set(hObject,'String',LEDPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if LEDPercentage < 0
    LEDPercentage = [];
    set(hObject,'String',LEDPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if LEDPercentage > 100
    LEDPercentage = [];
    set(hObject,'String',LEDPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.LEDPercentage_Input, 'Value', LEDPercentage);


% --- Executes during object creation, after setting all properties.
function LEDPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LEDPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
