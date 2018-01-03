function varargout = EnvironmentalInputData(varargin)
% ENVIRONMENTALINPUTDATA MATLAB code for EnvironmentalInputData.fig
%      ENVIRONMENTALINPUTDATA, by itself, creates a new ENVIRONMENTALINPUTDATA or raises the existing
%      singleton*.
%
%      H = ENVIRONMENTALINPUTDATA returns the handle to a new ENVIRONMENTALINPUTDATA or the handle to
%      the existing singleton*.
%
%      ENVIRONMENTALINPUTDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENVIRONMENTALINPUTDATA.M with the given input arguments.
%
%      ENVIRONMENTALINPUTDATA('Property','Value',...) creates a new ENVIRONMENTALINPUTDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EnvironmentalInputData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EnvironmentalInputData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EnvironmentalInputData

% Last Modified by GUIDE v2.5 17-Mar-2014 16:25:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EnvironmentalInputData_OpeningFcn, ...
                   'gui_OutputFcn',  @EnvironmentalInputData_OutputFcn, ...
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


% --- Executes just before EnvironmentalInputData is made visible.
function EnvironmentalInputData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EnvironmentalInputData (see VARARGIN)

% Choose default command line output for EnvironmentalInputData
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EnvironmentalInputData wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EnvironmentalInputData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in OutdoorTemperature_Button.
function OutdoorTemperature_Button_Callback(hObject, eventdata, handles)
% hObject    handle to OutdoorTemperature_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Outdoor Air Temperature

if exist(fullfile(outputdata,'Text Files','OutdoorAirTemperature.txt'),'file') == 2
    
    Outdoor_Temp = load(fullfile(outputdata,'Text Files','OutdoorAirTemperature.txt'));
    time = 1:length(Outdoor_Temp);
    
    plot(handles.Results_Plot, time, Outdoor_Temp)
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
end


% --- Executes on button press in GlobalIrradiance_Button.
function GlobalIrradiance_Button_Callback(hObject, eventdata, handles)
% hObject    handle to GlobalIrradiance_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Global Horizontal Irradiance

if exist(fullfile(outputdata,'Text Files','GlobalHorizontalIrradiance.txt'),'file') == 2
    
    Global_Irrad = load(fullfile(outputdata,'Text Files','GlobalHorizontalIrradiance.txt'));
    time = 1:length(Global_Irrad);
    
    plot(handles.Results_Plot, time, Global_Irrad)
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
end


% --- Executes on button press in DirectIrradiance_Button.
function DirectIrradiance_Button_Callback(hObject, eventdata, handles)
% hObject    handle to DirectIrradiance_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Direct Normal Irradiance

if exist(fullfile(outputdata,'Text Files','DirectNormalIrradiance.txt'),'file') == 2
    
    Direct_Irrad = load(fullfile(outputdata,'Text Files','DirectNormalIrradiance.txt'));
    time = 1:length(Direct_Irrad);
    
    plot(handles.Results_Plot, time, Direct_Irrad)
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
end


% --- Executes on button press in DiffuseIrradiance_Button.
function DiffuseIrradiance_Button_Callback(hObject, eventdata, handles)
% hObject    handle to DiffuseIrradiance_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Diffuse Horizontal Irradiance

if exist(fullfile(outputdata,'Text Files','DiffuseHorizontalIrradiance.txt'),'file') == 2
    
    Diffuse_Irrad = load(fullfile(outputdata,'Text Files','DiffuseHorizontalIrradiance.txt'));
    time = 1:length(Diffuse_Irrad);
    
    plot(handles.Results_Plot, time, Diffuse_Irrad)
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
end


% --- Executes on button press in PeakWindSpeed_Button.
function PeakWindSpeed_Button_Callback(hObject, eventdata, handles)
% hObject    handle to PeakWindSpeed_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Peak Wind Speed

if exist(fullfile(outputdata,'Text Files','PeakWindSpeed.txt'),'file') == 2
    
    Peak_Wind_Speed = load(fullfile(outputdata,'Text Files','PeakWindSpeed.txt'));
    time = 1:length(Peak_Wind_Speed);
    
    plot(handles.Results_Plot, time, Peak_Wind_Speed)
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
end


% --- Executes on button press in RelativeHumidity_Button.
function RelativeHumidity_Button_Callback(hObject, eventdata, handles)
% hObject    handle to RelativeHumidity_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Relative Humidity

if exist(fullfile(outputdata,'Text Files','RelativeHumidity.txt'),'file') == 2
    
    Relative_Humidity = load(fullfile(outputdata,'Text Files','RelativeHumidity.txt'));
    time = 1:length(Relative_Humidity);
    
    plot(handles.Results_Plot, time, Relative_Humidity)
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
end


% --- Executes on button press in AccumulatedPrecipitation_Button.
function AccumulatedPrecipitation_Button_Callback(hObject, eventdata, handles)
% hObject    handle to AccumulatedPrecipitation_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Accumulated Precipitation

if exist(fullfile(outputdata,'Text Files','AccumulatedPrecipitation.txt'),'file') == 2
    
    Accumulated_Precipitation = load(fullfile(outputdata,'Text Files','AccumulatedPrecipitation.txt'));
    time = 1:length(Accumulated_Precipitation);
    
    plot(handles.Results_Plot, time, Accumulated_Precipitation)
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
end


% --- Executes on button press in EstimatedPressure_Button.
function EstimatedPressure_Button_Callback(hObject, eventdata, handles)
% hObject    handle to EstimatedPressure_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

outputdata = struct.outputdata;


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Plot Estimated Pressure

if exist(fullfile(outputdata,'Text Files','EstimatedPressure.txt'),'file') == 2
    
    Estimated_Pressure = load(fullfile(outputdata,'Text Files','EstimatedPressure.txt'));
    time = 1:length(Estimated_Pressure);
    
    plot(handles.Results_Plot, time, Estimated_Pressure)
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
end


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

cd(home);


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
if month < 0 || mod(month,1) > 0
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
if day < 0 || mod(day,1) > 0
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
if simlength < 0 || mod(simlength,1) > 0
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


% --- Executes on button press in BuildDataSets_Button.
function BuildDataSets_Button_Callback(hObject, eventdata, handles)
% hObject    handle to BuildDataSets_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
inputdata = struct.inputdata;
outputdata = struct.outputdata;


% If All Fields are not Complete Display an Error Message

if isfield(handles, 'File_Names') && isfield(handles, 'month') &&...
        isfield(handles, 'day') && isfield(handles, 'simlength')
else
    errordlg('Please Complete All Fields', 'Error')
    return
end


% Display Program Status

set(handles.ProgramStatus, 'String', 'Building Data Sets...');
pause(0.001);


% Define Simulation Start Time and Length

month = handles.month;     % (Month) Month to Start Analysis
day = handles.day;         % (Day) Day to Start Analysis

environmentaldata = get(handles.Environment_ListBox);   % Environmental Data to Use
File_Names = handles.File_Names;                        % Environmental Data File Names

Environmental_Data = File_Names{environmentaldata.Value};   % Selected Environmental Data

year = str2double(Environmental_Data(end-3:end));   % Determine the Year (Last Four Characters of the File Name Needs to be the Year)

[start_min, start_hour] = determinestart(month, day, year); % Starting Minute and Hour

simlength = handles.simlength;  % (Days) Number of days to analyze


% Determine Simulation Time Step

OneSecondSim = get(handles.OneSecondSim_RadioButton);
OneMinuteSim = get(handles.OneMinuteSim_RadioButton);

if OneSecondSim.Value == 1
    time_step = 60;             % Run Simulation with a 1 Second Time Step
elseif OneMinuteSim.Value == 1
    time_step = 1;              % Run Simulation with a 1 Minute Time Step
end


% Environmental Data (From ORNL's Rotating Shadowband Radiometer)

Environment = importdata(fullfile(inputdata,'Environmental Input Data',strcat(Environmental_Data,'.csv')));  % Selected Environmental Input Data

Outdoor_Temp = Environment.data(:,6);               % (C) Outdoor Air Temperature Data (Hour)
Global_Irrad = Environment.data(:,2);               % (W/m^2) Global Horizontal Irradiance (Hour)
Direct_Irrad = Environment.data(:,3);               % (W/m^2) Direct Normal Irradiance (Hour)
Diffuse_Irrad = Environment.data(:,4);              % (W/m^2) Diffuse Horizontal Irradiance (Hour)
Wind_Speed = Environment.data(:,8);                 % (m/s) Wind Speed at 42 ft (Hour)
Peak_Wind_Speed = Environment.data(:,9);            % (m/s) Peak Wind Speed at 42 ft (Hour)
Wind_Direction = Environment.data(:,10);            % (Degrees from North) Wind Direction at 42 ft (Hour)
Relative_Humidity = Environment.data(:,7);          % (%) Relative Humidity (Hour)
Precipitation = Environment.data(:,12);             % (mm) Precipitation (Hour)
Accumulated_Precipitation = Environment.data(:,13); % (mm) Accumulated Precipitation (Hour)
Estimated_Pressure = Environment.data(:,11);        % (mBar) Estimated Pressure (Hour)

% Outdoor_Temp = Environment.data(:,5);               % (C) Outdoor Air Temperature Data (Minute)
% Global_Irrad = Environment.data(:,1);               % (W/m^2) Global Horizontal Irradiance (Minute)
% Direct_Irrad = Environment.data(:,2);               % (W/m^2) Direct Normal Irradiance (Minute)
% Diffuse_Irrad = Environment.data(:,3);              % (W/m^2) Diffuse Horizontal Irradiance (Minute)
% Wind_Speed = Environment.data(:,7);                 % (m/s) Wind Speed at 42 ft (Minute)
% Peak_Wind_Speed = Environment.data(:,8);            % (m/s) Peak Wind Speed at 42 ft (Minute)
% Wind_Direction = Environment.data(:,9);             % (Degrees from North) Wind Direction at 42 ft (Minute)
% Relative_Humidity = Environment.data(:,6);          % (%) Relative Humidity (Minute)
% Precipitation = Environment.data(:,11);             % (mm) Precipitation (Minute)
% Accumulated_Precipitation = Environment.data(:,12); % (mm) Accumulated Precipitation (Minute)
% Estimated_Pressure = Environment.data(:,10);        % (mBar) Estimated Pressure (Minute)


% Set Time Scales

time_actual_hour = 1:60*time_step:24*60*time_step*simlength;    % Time Scale in Hours

time_actual_min = 1:time_step:24*60*time_step*simlength;        % Time Scale in Minutes

time = 1:1:24*60*time_step*simlength;                           % Simulation Time Scale


% Outdoor Air Temperature (1 Second or 1 Minute Resolution)

Outdoor_Temp2 = interp1(time_actual_hour, Outdoor_Temp(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (C) Outdoor Air Temperature
I = isnan(Outdoor_Temp2);
Outdoor_Temp2(I) = Outdoor_Temp2(find(I == 0, 1, 'last'));

Outdoor_Temp2 = Outdoor_Temp2*(9/5) + 32;   % (F) Convert from Celsius to Fahrenheit


% Solar Irradiance (1 Second or 1 Minute Resolution)

Global_Irrad2 = interp1(time_actual_hour, Global_Irrad(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (W/m^2) Global Horizontal Irradiance
I = isnan(Global_Irrad2);
Global_Irrad2(I) = Global_Irrad2(find(I == 0, 1, 'last'));

Direct_Irrad2 = interp1(time_actual_hour, Direct_Irrad(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (W/m^2) Direct Normal Irradiance
I = isnan(Direct_Irrad2);
Direct_Irrad2(I) = Direct_Irrad2(find(I == 0, 1, 'last'));

Diffuse_Irrad2 = interp1(time_actual_hour, Diffuse_Irrad(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (W/m^2) Diffuse Horizontal Irradiance
I = isnan(Diffuse_Irrad2);
Diffuse_Irrad2(I) = Diffuse_Irrad2(find(I == 0, 1, 'last'));


% Wind Speed and Direction (1 Second or 1 Minute Resolution)

Wind_Speed2 = interp1(time_actual_hour, Wind_Speed(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (m/s) Wind Speed at 42 ft
I = isnan(Wind_Speed2);
Wind_Speed2(I) = Wind_Speed2(find(I == 0, 1, 'last'));

Peak_Wind_Speed2 = interp1(time_actual_hour, Peak_Wind_Speed(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (m/s) Peak Wind Speed at 42 ft
I = isnan(Peak_Wind_Speed2);
Peak_Wind_Speed2(I) = Peak_Wind_Speed2(find(I == 0, 1, 'last'));

Wind_Direction2 = interp1(time_actual_hour, Wind_Direction(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (Degrees from North) Wind Direction at 42 ft
I = isnan(Wind_Direction2);
Wind_Direction2(I) = Wind_Direction2(find(I == 0, 1, 'last'));


% Relative Humidity, Precipitation, and Estimated Pressure (1 Second or 1 Minute Resolution)

Relative_Humidity2 = interp1(time_actual_hour, Relative_Humidity(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (%) Relative Humidity
I = isnan(Relative_Humidity2);
Relative_Humidity2(I) = Relative_Humidity2(find(I == 0, 1, 'last'));

Precipitation2 = interp1(time_actual_hour, Precipitation(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (mm) Precipitation
I = isnan(Precipitation2);
Precipitation2(I) = Precipitation2(find(I == 0, 1, 'last'));

Accumulated_Precipitation2 = interp1(time_actual_hour, Accumulated_Precipitation(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear'); % (mm) Accumulated Precipitation
I = isnan(Accumulated_Precipitation2);
Accumulated_Precipitation2(I) = Accumulated_Precipitation2(find(I == 0, 1, 'last'));

Estimated_Pressure2 = interp1(time_actual_hour, Estimated_Pressure(start_hour:(start_hour+(24*simlength))-1, 1), time, 'linear');   % (mBar) Estimated Pressure
I = isnan(Estimated_Pressure2);
Estimated_Pressure2(I) = Estimated_Pressure2(find(I == 0, 1, 'last'));


% % Outdoor Air Temperature (1 Second or 1 Minute Resolution)
%
% Outdoor_Temp2 = interp1(time_actual_min, Outdoor_Temp(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (C) Outdoor Air Temperature
% I = isnan(Outdoor_Temp2);
% Outdoor_Temp2(I) = Outdoor_Temp2(find(I == 0, 1, 'last'));
%
% Outdoor_Temp2 = Outdoor_Temp2*(9/5) + 32;   % (F) Convert from Celsius to Fahrenheit
%
%
% % Solar Irradiance (1 Second or 1 Minute Resolution)
%
% Global_Irrad2 = interp1(time_actual_min, Global_Irrad(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (W/m^2) Global Horizontal Irradiance
% I = isnan(Global_Irrad2);
% Global_Irrad2(I) = Global_Irrad2(find(I == 0, 1, 'last'));
%
% Direct_Irrad2 = interp1(time_actual_min, Direct_Irrad(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (W/m^2) Direct Normal Irradiance
% I = isnan(Direct_Irrad2);
% Direct_Irrad2(I) = Direct_Irrad2(find(I == 0, 1, 'last'));
%
% Diffuse_Irrad2 = interp1(time_actual_min, Diffuse_Irrad(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (W/m^2) Diffuse Horizontal Irradiance
% I = isnan(Diffuse_Irrad2);
% Diffuse_Irrad2(I) = Diffuse_Irrad2(find(I == 0, 1, 'last'));
%
%
% % Wind Speed and Direction (1 Second or 1 Minute Resolution)
%
% Wind_Speed2 = interp1(time_actual_min, Wind_Speed(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (m/s) Wind Speed at 42 ft
% I = isnan(Wind_Speed2);
% Wind_Speed2(I) = Wind_Speed2(find(I == 0, 1, 'last'));
%
% Peak_Wind_Speed2 = interp1(time_actual_min, Peak_Wind_Speed(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (m/s) Peak Wind Speed at 42 ft
% I = isnan(Peak_Wind_Speed2);
% Peak_Wind_Speed2(I) = Peak_Wind_Speed2(find(I == 0, 1, 'last'));
%
% Wind_Direction2 = interp1(time_actual_min, Wind_Direction(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (Degrees from North) Wind Direction at 42 ft
% I = isnan(Wind_Direction2);
% Wind_Direction2(I) = Wind_Direction2(find(I == 0, 1, 'last'));
%
%
% % Relative Humidity, Precipitation, and Estimated Pressure (1 Second or 1 Minute Resolution)
%
% Relative_Humidity2 = interp1(time_actual_min, Relative_Humidity(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (%) Relative Humidity
% I = isnan(Relative_Humidity2);
% Relative_Humidity2(I) = Relative_Humidity2(find(I == 0, 1, 'last'));
%
% Precipitation2 = interp1(time_actual_min, Precipitation(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (mm) Precipitation
% I = isnan(Precipitation2);
% Precipitation2(I) = Precipitation2(find(I == 0, 1, 'last'));
%
% Accumulated_Precipitation2 = interp1(time_actual_min, Accumulated_Precipitation(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear'); % (mm) Accumulated Precipitation
% I = isnan(Accumulated_Precipitation2);
% Accumulated_Precipitation2(I) = Accumulated_Precipitation2(find(I == 0, 1, 'last'));
%
% Estimated_Pressure2 = interp1(time_actual_min, Estimated_Pressure(start_min:(start_min+(24*60*simlength))-1, 1), time, 'linear');   % (mBar) Estimated Pressure
% I = isnan(Estimated_Pressure2);
% Estimated_Pressure2(I) = Estimated_Pressure2(find(I == 0, 1, 'last'));


% Save Results

if isdir(fullfile(outputdata,'Text Files'))
else
    mkdir(fullfile(outputdata,'Text Files'));
end

cd(fullfile(outputdata,'Text Files'));


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

cd(home);


% Display Program Status

set(handles.ProgramStatus, 'String', 'Data Sets Complete');
pause(0.001);

[~] = beepsound(home);  % Beep at Program Completion
