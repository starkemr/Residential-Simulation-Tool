function varargout = OccupantBehaviorModels(varargin)
% OCCUPANTBEHAVIORMODELS MATLAB code for OccupantBehaviorModels.fig
%      OCCUPANTBEHAVIORMODELS, by itself, creates a new OCCUPANTBEHAVIORMODELS or raises the existing
%      singleton*.
%
%      H = OCCUPANTBEHAVIORMODELS returns the handle to a new OCCUPANTBEHAVIORMODELS or the handle to
%      the existing singleton*.
%
%      OCCUPANTBEHAVIORMODELS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OCCUPANTBEHAVIORMODELS.M with the given input arguments.
%
%      OCCUPANTBEHAVIORMODELS('Property','Value',...) creates a new OCCUPANTBEHAVIORMODELS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OccupantBehaviorModels_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OccupantBehaviorModels_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OccupantBehaviorModels

% Last Modified by GUIDE v2.5 24-May-2013 20:29:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OccupantBehaviorModels_OpeningFcn, ...
                   'gui_OutputFcn',  @OccupantBehaviorModels_OutputFcn, ...
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


% --- Executes just before OccupantBehaviorModels is made visible.
function OccupantBehaviorModels_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OccupantBehaviorModels (see VARARGIN)

% Choose default command line output for OccupantBehaviorModels
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OccupantBehaviorModels wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

guifiles = struct.guifiles;
inputdata = struct.inputdata;


% Display Key Images on GUI

bg = imread(fullfile(guifiles,'BoxKey.png'));
image(bg,'Parent',handles.BoxKey);
set(handles.BoxKey,'visible','off')

bg = imread(fullfile(guifiles,'LineKey.png'));
image(bg,'Parent',handles.LineKey);
set(handles.LineKey,'visible','off')


% Load Inputs

if exist(fullfile(inputdata,'User Settings','Occupant_Data.txt'),'file') == 2
    Occupant_Inputs = load(fullfile(inputdata,'User Settings','Occupant_Data.txt'));
else
    Occupant_Inputs = load(fullfile(inputdata,'Default Settings','Occupant_Default.txt'));
end


% Set Inputs

set(handles.WM_Slider, 'Value', Occupant_Inputs(1));
set(handles.WM_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(1), 0.01)),' %'));

set(handles.NM_Slider, 'Value', Occupant_Inputs(2));
set(handles.NM_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(2), 0.01)),' %'));

set(handles.WF_Slider, 'Value', Occupant_Inputs(3));
set(handles.WF_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(3), 0.01)),' %'));

set(handles.NF_Slider, 'Value', Occupant_Inputs(4));
set(handles.NF_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(4), 0.01)),' %'));

set(handles.C_Slider, 'Value', Occupant_Inputs(5));
set(handles.C_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(5), 0.01)),' %'));


% --- Outputs from this function are returned to the command line.
function varargout = OccupantBehaviorModels_OutputFcn(hObject, eventdata, handles) 
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

p1 = get(handles.WM_Slider);
p2 = get(handles.NM_Slider);
p3 = get(handles.WF_Slider);
p4 = get(handles.NF_Slider);
p5 = get(handles.C_Slider);

a(1) = p1.Value;
a(2) = p2.Value;
a(3) = p3.Value;
a(4) = p4.Value;
a(5) = p5.Value;


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','Occupant_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','Occupant_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('Occupant_Data.txt','w');
for w = 1:length(a)
    fprintf(fid,'%f\n', a(w));
end;
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

if exist(fullfile(inputdata,'User Settings','Occupant_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','Occupant_Data.txt'));
end


% Load Default Inputs

Occupant_Inputs = load(fullfile(inputdata,'Default Settings','Occupant_Default.txt'));


% Reset Inputs to Default

set(handles.WM_Slider, 'Value', Occupant_Inputs(1));
set(handles.WM_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(1), 0.01)),' %'));

set(handles.NM_Slider, 'Value', Occupant_Inputs(2));
set(handles.NM_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(2), 0.01)),' %'));

set(handles.WF_Slider, 'Value', Occupant_Inputs(3));
set(handles.WF_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(3), 0.01)),' %'));

set(handles.NF_Slider, 'Value', Occupant_Inputs(4));
set(handles.NF_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(4), 0.01)),' %'));

set(handles.C_Slider, 'Value', Occupant_Inputs(5));
set(handles.C_VarText, 'String', strcat(num2str(round2(Occupant_Inputs(5), 0.01)),' %'));


% --- Executes on slider movement.
function WM_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WM_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WM_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WM_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function WM_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WM_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function NM_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to NM_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.NM_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.NM_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function NM_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NM_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WF_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WF_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WF_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WF_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function WF_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WF_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function NF_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to NF_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.NF_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.NF_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function NF_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NF_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function C_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to C_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.C_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.C_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function C_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in Select_StartDay.
function Select_StartDay_Callback(hObject, eventdata, handles)
% hObject    handle to Select_StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Select_StartDay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Select_StartDay


% --- Executes during object creation, after setting all properties.
function Select_StartDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Select_StartDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Select_EndDay.
function Select_EndDay_Callback(hObject, eventdata, handles)
% hObject    handle to Select_EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Select_EndDay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Select_EndDay


% --- Executes during object creation, after setting all properties.
function Select_EndDay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Select_EndDay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Select_Results1.
function Select_Results1_Callback(hObject, eventdata, handles)
% hObject    handle to Select_Results1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Select_Results1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Select_Results1

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
inputdata = struct.inputdata;
outputdata = struct.outputdata;


% Get Start Day

a = get(handles.Select_StartDay, 'Value');

if a == 1
    errordlg('Must Select a Start Day', 'Error')
    return
elseif a == 2
    startday = 1;
elseif a == 3
    startday = 2;
elseif a == 4
    startday = 3;
elseif a == 5
    startday = 4;
elseif a == 6
    startday = 5;
elseif a == 7
    startday = 6;
elseif a == 8
    startday = 7;
end
handles.StartDay = startday;


% Get End Day

a = get(handles.Select_EndDay, 'Value');

if a == 1
    errordlg('Must Select an End Day', 'Error')
    return
elseif a == 2
    endday = 1;
elseif a == 3
    endday = 2;
elseif a == 4
    endday = 3;
elseif a == 5
    endday = 4;
elseif a == 6
    endday = 5;
elseif a == 7
    endday = 6;
elseif a == 8
    endday = 7;
end
handles.EndDay = endday;


% Change Current Directory

cd(fullfile(outputdata,'Text Files'));


% Get Select Results 1 State

a = get(handles.Select_Results1, 'Value');


% Define Start and End Times

start_time = (24*60)*(startday - 1) + 1;                            % (Minute) Start Time
end_time = (24*60)*(startday - 1) + 24*60*(endday - startday + 1);  % (Minute) End Time


% Determine Number of Occupants Simulated for each Type

s = dir('Simulated_Working_Male_Average_Error.csv');
if s.bytes == 0
    WM_Num = 0;
else
    WM_Num = size(csvread('Simulated_Working_Male_Average_Error.csv'),1);
end

s = dir('Simulated_Nonworking_Male_Average_Error.csv');
if s.bytes == 0
    NM_Num = 0;
else
    NM_Num = size(csvread('Simulated_Nonworking_Male_Average_Error.csv'),1);
end

s = dir('Simulated_Working_Female_Average_Error.csv');
if s.bytes == 0
    WF_Num = 0;
else
    WF_Num = size(csvread('Simulated_Working_Female_Average_Error.csv'),1);
end

s = dir('Simulated_Nonworking_Female_Average_Error.csv');
if s.bytes == 0
    NF_Num = 0;
else
    NF_Num = size(csvread('Simulated_Nonworking_Female_Average_Error.csv'),1);
end

s = dir('Simulated_Child_Average_Error.csv');
if s.bytes == 0
    C_Num = 0;
else
    C_Num = size(csvread('Simulated_Child_Average_Error.csv'),1);
end

Tot_Num = WM_Num + NM_Num + WF_Num + NF_Num + C_Num;


% Define Color Map

Map = colormap(jet(100));
Map = Map(1:11:100,:);
set(gcf,'DefaultAxesColorOrder',Map)


% Plot Outputs

axes(handles.Results_Plot1)

if a == 1
    cla reset
elseif a == 2
    cla reset
elseif a == 3
    
    Tot_Occ_Act_Prob = csvread('Total_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*Tot_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(Tot_Occ_Act_Prob(start_time:7*24*60,1:10));
        Tot_Occ_Act_Prob = [Tot_Occ_Act_Prob(start_time:7*24*60,1:10); Tot_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*Tot_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
elseif a == 4
    
    Tot_Occ_Act_Prob = csvread('Simulated_Total_Probability_Matrix.csv');
    
    for i = 1:length(Tot_Occ_Act_Prob)
        Tot_Occ_Act_Prob(i,1:10) = Tot_Occ_Act_Prob(i,1:10)/sum(Tot_Occ_Act_Prob(i,1:10));
    end
    Tot_Occ_Act_Prob(isnan(Tot_Occ_Act_Prob)) = 0;  % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*Tot_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Simulated Activity Distribution (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(Tot_Occ_Act_Prob(start_time:7*24*60,1:10));
        Tot_Occ_Act_Prob = [Tot_Occ_Act_Prob(start_time:7*24*60,1:10); Tot_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*Tot_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Simulated Activity Distribution (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 5
    
    Tot_Error = csvread('Simulated_Total_Error.csv');
    
    if start_time < end_time
        plot(Tot_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Overall Occupant Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(Tot_Error(start_time:7*24*60,1:10));
        Tot_Error = [Tot_Error(start_time:7*24*60,1:10); Tot_Error(1:start_time - 1,1:10)];
        
        plot(Tot_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Overall Occupant Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 6
    
    if Tot_Num == 0 || Tot_Num == 1
        cla reset
    else
        Tot_Avg_Error = csvread('Simulated_Total_Average_Error.csv');
        I = find(sum(Tot_Avg_Error,2));
        
        plot(I, Tot_Avg_Error(I,1:10))
        xlim([1 Tot_Num])
        legend(strcat('Sleeping (',num2str(Tot_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(Tot_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(Tot_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(Tot_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(Tot_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(Tot_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(Tot_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(Tot_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(Tot_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(Tot_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Overall Occupant Average Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 7
    
    if Tot_Num == 0 || Tot_Num == 1
        cla reset
    else
        Tot_Max_Error = csvread('Simulated_Total_Maximum_Error.csv');
        I = find(sum(Tot_Max_Error,2));
        
        plot(I, Tot_Max_Error(I,1:10))
        xlim([1 Tot_Num])
        legend(strcat('Sleeping (',num2str(Tot_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(Tot_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(Tot_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(Tot_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(Tot_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(Tot_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(Tot_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(Tot_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(Tot_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(Tot_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Overall Occupant Maximum Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 8
    cla reset
elseif a == 9
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    WM_Prob_Model = csvread('Working_Male_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*WM_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WM_Prob_Model(start_time:7*24*60,1:10));
        WM_Prob_Model = [WM_Prob_Model(start_time:7*24*60,1:10); WM_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*WM_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 10
    
    WM_Occ_Act_Prob = csvread('Simulated_Working_Male_Probability_Matrix.csv');
    
    for i = 1:length(WM_Occ_Act_Prob)
        WM_Occ_Act_Prob(i,1:10) = WM_Occ_Act_Prob(i,1:10)/sum(WM_Occ_Act_Prob(i,1:10));
    end
    WM_Occ_Act_Prob(isnan(WM_Occ_Act_Prob)) = 0;    % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*WM_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Simulated Activity Distribution (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WM_Occ_Act_Prob(start_time:7*24*60,1:10));
        WM_Occ_Act_Prob = [WM_Occ_Act_Prob(start_time:7*24*60,1:10); WM_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*WM_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Simulated Activity Distribution (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 11
    
    WM_Error = csvread('Simulated_Working_Male_Error.csv');
    
    if start_time < end_time
        plot(WM_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Working Male Occupant Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(WM_Error(start_time:7*24*60,1:10));
        WM_Error = [WM_Error(start_time:7*24*60,1:10); WM_Error(1:start_time - 1,1:10)];
        
        plot(WM_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Working Male Occupant Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 12
    
    if WM_Num == 0 || WM_Num == 1
        cla reset
    else
        WM_Avg_Error = csvread('Simulated_Working_Male_Average_Error.csv');
        I = find(sum(WM_Avg_Error,2));
        
        plot(I, WM_Avg_Error(I,1:10))
        xlim([1 WM_Num])
        legend(strcat('Sleeping (',num2str(WM_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(WM_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WM_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WM_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WM_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WM_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WM_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WM_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WM_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WM_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Male Occupant Average Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 13
    
    if WM_Num == 0 || WM_Num == 1
        cla reset
    else
        WM_Max_Error = csvread('Simulated_Working_Male_Maximum_Error.csv');
        I = find(sum(WM_Max_Error,2));
        
        plot(I, WM_Max_Error(I,1:10))
        xlim([1 WM_Num])
        legend(strcat('Sleeping (',num2str(WM_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(WM_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WM_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WM_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WM_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WM_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WM_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WM_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WM_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WM_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Male Occupant Maximum Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 14
    cla reset
elseif a == 15
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    NM_Prob_Model = csvread('Nonworking_Male_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*NM_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NM_Prob_Model(start_time:7*24*60,1:10));
        NM_Prob_Model = [NM_Prob_Model(start_time:7*24*60,1:10); NM_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*NM_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 16
    
    NM_Occ_Act_Prob = csvread('Simulated_Nonworking_Male_Probability_Matrix.csv');
    
    for i = 1:length(NM_Occ_Act_Prob)
        NM_Occ_Act_Prob(i,1:10) = NM_Occ_Act_Prob(i,1:10)/sum(NM_Occ_Act_Prob(i,1:10));
    end
    NM_Occ_Act_Prob(isnan(NM_Occ_Act_Prob)) = 0;    % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*NM_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Simulated Activity Distribution (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NM_Occ_Act_Prob(start_time:7*24*60,1:10));
        NM_Occ_Act_Prob = [NM_Occ_Act_Prob(start_time:7*24*60,1:10); NM_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*NM_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Simulated Activity Distribution (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 17
    
    NM_Error = csvread('Simulated_Nonworking_Male_Error.csv');
    
    if start_time < end_time
        plot(NM_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Nonworking Male Occupant Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(NM_Error(start_time:7*24*60,1:10));
        NM_Error = [NM_Error(start_time:7*24*60,1:10); NM_Error(1:start_time - 1,1:10)];
        
        plot(NM_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Nonworking Male Occupant Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 18
    
    if NM_Num == 0 || NM_Num == 1
        cla reset
    else
        NM_Avg_Error = csvread('Simulated_Nonworking_Male_Average_Error.csv');
        I = find(sum(NM_Avg_Error,2));
        
        plot(I, NM_Avg_Error(I,1:10))
        xlim([1 NM_Num])
        legend(strcat('Sleeping (',num2str(NM_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(NM_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NM_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NM_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NM_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NM_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NM_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NM_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NM_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NM_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Male Occupant Average Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
        
elseif a == 19
    
    if NM_Num == 0 || NM_Num == 1
        cla reset
    else
        NM_Max_Error = csvread('Simulated_Nonworking_Male_Maximum_Error.csv');
        I = find(sum(NM_Max_Error,2));
        
        plot(I, NM_Max_Error(I,1:10))
        xlim([1 NM_Num])
        legend(strcat('Sleeping (',num2str(NM_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(NM_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NM_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NM_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NM_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NM_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NM_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NM_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NM_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NM_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Male Occupant Maximum Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
        
elseif a == 20
    cla reset
elseif a == 21
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    WF_Prob_Model = csvread('Working_Female_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*WF_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WF_Prob_Model(start_time:7*24*60,1:10));
        WF_Prob_Model = [WF_Prob_Model(start_time:7*24*60,1:10); WF_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*WF_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 22
    
    WF_Occ_Act_Prob = csvread('Simulated_Working_Female_Probability_Matrix.csv');
    
    for i = 1:length(WF_Occ_Act_Prob)
        WF_Occ_Act_Prob(i,1:10) = WF_Occ_Act_Prob(i,1:10)/sum(WF_Occ_Act_Prob(i,1:10));
    end
    WF_Occ_Act_Prob(isnan(WF_Occ_Act_Prob)) = 0;    % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*WF_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Simulated Activity Distribution (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WF_Occ_Act_Prob(start_time:7*24*60,1:10));
        WF_Occ_Act_Prob = [WF_Occ_Act_Prob(start_time:7*24*60,1:10); WF_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*WF_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Simulated Activity Distribution (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 23
    
    WF_Error = csvread('Simulated_Working_Female_Error.csv');
    
    if start_time < end_time
        plot(WF_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Working Female Occupant Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(WF_Error(start_time:7*24*60,1:10));
        WF_Error = [WF_Error(start_time:7*24*60,1:10); WF_Error(1:start_time - 1,1:10)];
        
        plot(WF_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Working Female Occupant Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 24
    
    if WF_Num == 0 || WF_Num == 1
        cla reset
    else
        WF_Avg_Error = csvread('Simulated_Working_Female_Average_Error.csv');
        I = find(sum(WF_Avg_Error,2));
        
        plot(I, WF_Avg_Error(I,1:10))
        xlim([1 WF_Num])
        legend(strcat('Sleeping (',num2str(WF_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(WF_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WF_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WF_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WF_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WF_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WF_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WF_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WF_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WF_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Female Occupant Average Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 25
    
    if WF_Num == 0 || WF_Num == 1
        cla reset
    else
        WF_Max_Error = csvread('Simulated_Working_Female_Maximum_Error.csv');
        I = find(sum(WF_Max_Error,2));
        
        plot(I, WF_Max_Error(I,1:10))
        xlim([1 WF_Num])
        legend(strcat('Sleeping (',num2str(WF_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(WF_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WF_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WF_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WF_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WF_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WF_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WF_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WF_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WF_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Female Occupant Maximum Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 26
    cla reset
elseif a == 27
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    NF_Prob_Model = csvread('Nonworking_Female_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*NF_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NF_Prob_Model(start_time:7*24*60,1:10));
        NF_Prob_Model = [NF_Prob_Model(start_time:7*24*60,1:10); NF_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*NF_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 28
    
    NF_Occ_Act_Prob = csvread('Simulated_Nonworking_Female_Probability_Matrix.csv');
    
    for i = 1:length(NF_Occ_Act_Prob)
        NF_Occ_Act_Prob(i,1:10) = NF_Occ_Act_Prob(i,1:10)/sum(NF_Occ_Act_Prob(i,1:10));
    end
    NF_Occ_Act_Prob(isnan(NF_Occ_Act_Prob)) = 0;   % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*NF_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Simulated Activity Distribution (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NF_Occ_Act_Prob(start_time:7*24*60,1:10));
        NF_Occ_Act_Prob = [NF_Occ_Act_Prob(start_time:7*24*60,1:10); NF_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*NF_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Simulated Activity Distribution (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 29
    
    NF_Error = csvread('Simulated_Nonworking_Female_Error.csv');
    
    if start_time < end_time
        plot(NF_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Nonworking Female Occupant Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(NF_Error(start_time:7*24*60,1:10));
        NF_Error = [NF_Error(start_time:7*24*60,1:10); NF_Error(1:start_time - 1,1:10)];
        
        plot(NF_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Nonworking Female Occupant Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 30
    
    if NF_Num == 0 || NF_Num == 1
        cla reset
    else
        NF_Avg_Error = csvread('Simulated_Nonworking_Female_Average_Error.csv');
        I = find(sum(NF_Avg_Error,2));
        
        plot(I, NF_Avg_Error(I,1:10))
        xlim([1 NF_Num])
        legend(strcat('Sleeping (',num2str(NF_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(NF_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NF_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NF_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NF_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NF_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NF_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NF_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NF_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NF_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Female Occupant Average Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 31
    
    if NF_Num == 0 || NF_Num == 1
        cla reset
    else
        NF_Max_Error = csvread('Simulated_Nonworking_Female_Maximum_Error.csv');
        I = find(sum(NF_Max_Error,2));
        
        plot(I, NF_Max_Error(I,1:10))
        xlim([1 NF_Num])
        legend(strcat('Sleeping (',num2str(NF_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(NF_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NF_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NF_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NF_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NF_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NF_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NF_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NF_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NF_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Female Occupant Maximum Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 32
    cla reset
elseif a == 33
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    C_Prob_Model = csvread('Child_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*C_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(C_Prob_Model(start_time:7*24*60,1:10));
        C_Prob_Model = [C_Prob_Model(start_time:7*24*60,1:10); C_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*C_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 34
    
    C_Occ_Act_Prob = csvread('Simulated_Child_Probability_Matrix.csv');
    
    for i = 1:length(C_Occ_Act_Prob)
        C_Occ_Act_Prob(i,1:10) = C_Occ_Act_Prob(i,1:10)/sum(C_Occ_Act_Prob(i,1:10));
    end
    C_Occ_Act_Prob(isnan(C_Occ_Act_Prob)) = 0;  % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*C_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Simulated Activity Distribution (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(C_Occ_Act_Prob(start_time:7*24*60,1:10));
        C_Occ_Act_Prob = [C_Occ_Act_Prob(start_time:7*24*60,1:10); C_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*C_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Simulated Activity Distribution (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 35
    
    C_Error = csvread('Simulated_Child_Error.csv');
    
    if start_time < end_time
        plot(C_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Child Occupant Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(C_Error(start_time:7*24*60,1:10));
        C_Error = [C_Error(start_time:7*24*60,1:10); C_Error(1:start_time - 1,1:10)];
        
        plot(C_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Child Occupant Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 36
    
    if C_Num == 0 || C_Num == 1
        cla reset
    else
        C_Avg_Error = csvread('Simulated_Child_Average_Error.csv');
        I = find(sum(C_Avg_Error,2));
        
        plot(I, C_Avg_Error(I,1:10))
        xlim([1 C_Num])
        legend(strcat('Sleeping (',num2str(C_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(C_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(C_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(C_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(C_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(C_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(C_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(C_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(C_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(C_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Child Occupant Average Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 37
    
    if C_Num == 0 || C_Num == 1
        cla reset
    else
        C_Max_Error = csvread('Simulated_Child_Maximum_Error.csv');
        I = find(sum(C_Max_Error,2));
        
        plot(I, C_Max_Error(I,1:10))
        xlim([1 C_Num])
        legend(strcat('Sleeping (',num2str(C_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(C_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(C_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(C_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(C_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(C_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(C_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(C_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(C_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(C_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Child Occupant Maximum Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
end

cd(home);


% --- Executes during object creation, after setting all properties.
function Select_Results1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Select_Results1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Select_Results2.
function Select_Results2_Callback(hObject, eventdata, handles)
% hObject    handle to Select_Results2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Select_Results2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Select_Results2

% Load Directories

struct = getappdata(0,'MyStruct');

home = struct.home;
inputdata = struct.inputdata;
outputdata = struct.outputdata;


% Get Start Day

a = get(handles.Select_StartDay, 'Value');

if a == 1
    errordlg('Must Select a Start Day', 'Error')
    return
elseif a == 2
    startday = 1;
elseif a == 3
    startday = 2;
elseif a == 4
    startday = 3;
elseif a == 5
    startday = 4;
elseif a == 6
    startday = 5;
elseif a == 7
    startday = 6;
elseif a == 8
    startday = 7;
end
handles.StartDay = startday;


% Get End Day

a = get(handles.Select_EndDay, 'Value');

if a == 1
    errordlg('Must Select an End Day', 'Error')
    return
elseif a == 2
    endday = 1;
elseif a == 3
    endday = 2;
elseif a == 4
    endday = 3;
elseif a == 5
    endday = 4;
elseif a == 6
    endday = 5;
elseif a == 7
    endday = 6;
elseif a == 8
    endday = 7;
end
handles.EndDay = endday;


% Change Current Directory

cd(fullfile(outputdata,'Text Files'));


% Get Select Results 2 State

a = get(handles.Select_Results2, 'Value');


% Define Start and End Times

start_time = (24*60)*(startday - 1) + 1;                            % (Minute) Start Time
end_time = (24*60)*(startday - 1) + 24*60*(endday - startday + 1);  % (Minute) End Time


% Determine Number of Occupants Simulated for each Type

s = dir('Simulated_Working_Male_Average_Error.csv');
if s.bytes == 0
    WM_Num = 0;
else
    WM_Num = size(csvread('Simulated_Working_Male_Average_Error.csv'),1);
end

s = dir('Simulated_Nonworking_Male_Average_Error.csv');
if s.bytes == 0
    NM_Num = 0;
else
    NM_Num = size(csvread('Simulated_Nonworking_Male_Average_Error.csv'),1);
end

s = dir('Simulated_Working_Female_Average_Error.csv');
if s.bytes == 0
    WF_Num = 0;
else
    WF_Num = size(csvread('Simulated_Working_Female_Average_Error.csv'),1);
end

s = dir('Simulated_Nonworking_Female_Average_Error.csv');
if s.bytes == 0
    NF_Num = 0;
else
    NF_Num = size(csvread('Simulated_Nonworking_Female_Average_Error.csv'),1);
end

s = dir('Simulated_Child_Average_Error.csv');
if s.bytes == 0
    C_Num = 0;
else
    C_Num = size(csvread('Simulated_Child_Average_Error.csv'),1);
end

Tot_Num = WM_Num + NM_Num + WF_Num + NF_Num + C_Num;


% Define Color Map

Map = colormap(jet(100));
Map = Map(1:11:100,:);
set(gcf,'DefaultAxesColorOrder',Map)


% Plot Outputs

axes(handles.Results_Plot2)

if a == 1
    cla reset
elseif a == 2
    cla reset
elseif a == 3
    
    Tot_Occ_Act_Prob = csvread('Total_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*Tot_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(Tot_Occ_Act_Prob(start_time:7*24*60,1:10));
        Tot_Occ_Act_Prob = [Tot_Occ_Act_Prob(start_time:7*24*60,1:10); Tot_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*Tot_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
elseif a == 4
    
    Tot_Occ_Act_Prob = csvread('Simulated_Total_Probability_Matrix.csv');
    
    for i = 1:length(Tot_Occ_Act_Prob)
        Tot_Occ_Act_Prob(i,1:10) = Tot_Occ_Act_Prob(i,1:10)/sum(Tot_Occ_Act_Prob(i,1:10));
    end
    Tot_Occ_Act_Prob(isnan(Tot_Occ_Act_Prob)) = 0;  % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*Tot_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Simulated Activity Distribution (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(Tot_Occ_Act_Prob(start_time:7*24*60,1:10));
        Tot_Occ_Act_Prob = [Tot_Occ_Act_Prob(start_time:7*24*60,1:10); Tot_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*Tot_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Overall Occupant Simulated Activity Distribution (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 5
    
    Tot_Error = csvread('Simulated_Total_Error.csv');
    
    if start_time < end_time
        plot(Tot_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Overall Occupant Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(Tot_Error(start_time:7*24*60,1:10));
        Tot_Error = [Tot_Error(start_time:7*24*60,1:10); Tot_Error(1:start_time - 1,1:10)];
        
        plot(Tot_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Overall Occupant Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 6
    
    if Tot_Num == 0 || Tot_Num == 1
        cla reset
    else
        Tot_Avg_Error = csvread('Simulated_Total_Average_Error.csv');
        I = find(sum(Tot_Avg_Error,2));
        
        plot(I, Tot_Avg_Error(I,1:10))
        xlim([1 Tot_Num])
        legend(strcat('Sleeping (',num2str(Tot_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(Tot_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(Tot_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(Tot_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(Tot_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(Tot_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(Tot_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(Tot_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(Tot_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(Tot_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Overall Occupant Average Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 7
    
    if Tot_Num == 0 || Tot_Num == 1
        cla reset
    else
        Tot_Max_Error = csvread('Simulated_Total_Maximum_Error.csv');
        I = find(sum(Tot_Max_Error,2));
        
        plot(I, Tot_Max_Error(I,1:10))
        xlim([1 Tot_Num])
        legend(strcat('Sleeping (',num2str(Tot_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(Tot_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(Tot_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(Tot_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(Tot_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(Tot_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(Tot_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(Tot_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(Tot_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(Tot_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Overall Occupant Maximum Activity Distribution Error (',num2str(Tot_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*Tot_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 8
    cla reset
elseif a == 9
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    WM_Prob_Model = csvread('Working_Male_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*WM_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WM_Prob_Model(start_time:7*24*60,1:10));
        WM_Prob_Model = [WM_Prob_Model(start_time:7*24*60,1:10); WM_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*WM_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 10
    
    WM_Occ_Act_Prob = csvread('Simulated_Working_Male_Probability_Matrix.csv');
    
    for i = 1:length(WM_Occ_Act_Prob)
        WM_Occ_Act_Prob(i,1:10) = WM_Occ_Act_Prob(i,1:10)/sum(WM_Occ_Act_Prob(i,1:10));
    end
    WM_Occ_Act_Prob(isnan(WM_Occ_Act_Prob)) = 0;    % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*WM_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Simulated Activity Distribution (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WM_Occ_Act_Prob(start_time:7*24*60,1:10));
        WM_Occ_Act_Prob = [WM_Occ_Act_Prob(start_time:7*24*60,1:10); WM_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*WM_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Male Occupant Simulated Activity Distribution (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 11
    
    WM_Error = csvread('Simulated_Working_Male_Error.csv');
    
    if start_time < end_time
        plot(WM_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Working Male Occupant Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(WM_Error(start_time:7*24*60,1:10));
        WM_Error = [WM_Error(start_time:7*24*60,1:10); WM_Error(1:start_time - 1,1:10)];
        
        plot(WM_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Working Male Occupant Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 12
    
    if WM_Num == 0 || WM_Num == 1
        cla reset
    else
        WM_Avg_Error = csvread('Simulated_Working_Male_Average_Error.csv');
        I = find(sum(WM_Avg_Error,2));
        
        plot(I, WM_Avg_Error(I,1:10))
        xlim([1 WM_Num])
        legend(strcat('Sleeping (',num2str(WM_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(WM_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WM_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WM_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WM_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WM_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WM_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WM_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WM_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WM_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Male Occupant Average Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 13
    
    if WM_Num == 0 || WM_Num == 1
        cla reset
    else
        WM_Max_Error = csvread('Simulated_Working_Male_Maximum_Error.csv');
        I = find(sum(WM_Max_Error,2));
        
        plot(I, WM_Max_Error(I,1:10))
        xlim([1 WM_Num])
        legend(strcat('Sleeping (',num2str(WM_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(WM_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WM_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WM_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WM_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WM_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WM_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WM_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WM_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WM_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Male Occupant Maximum Activity Distribution Error (',num2str(WM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 14
    cla reset
elseif a == 15
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    NM_Prob_Model = csvread('Nonworking_Male_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*NM_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NM_Prob_Model(start_time:7*24*60,1:10));
        NM_Prob_Model = [NM_Prob_Model(start_time:7*24*60,1:10); NM_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*NM_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 16
    
    NM_Occ_Act_Prob = csvread('Simulated_Nonworking_Male_Probability_Matrix.csv');
    
    for i = 1:length(NM_Occ_Act_Prob)
        NM_Occ_Act_Prob(i,1:10) = NM_Occ_Act_Prob(i,1:10)/sum(NM_Occ_Act_Prob(i,1:10));
    end
    NM_Occ_Act_Prob(isnan(NM_Occ_Act_Prob)) = 0;    % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*NM_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Simulated Activity Distribution (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NM_Occ_Act_Prob(start_time:7*24*60,1:10));
        NM_Occ_Act_Prob = [NM_Occ_Act_Prob(start_time:7*24*60,1:10); NM_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*NM_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Male Occupant Simulated Activity Distribution (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 17
    
    NM_Error = csvread('Simulated_Nonworking_Male_Error.csv');
    
    if start_time < end_time
        plot(NM_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Nonworking Male Occupant Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(NM_Error(start_time:7*24*60,1:10));
        NM_Error = [NM_Error(start_time:7*24*60,1:10); NM_Error(1:start_time - 1,1:10)];
        
        plot(NM_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Nonworking Male Occupant Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 18
    
    if NM_Num == 0 || NM_Num == 1
        cla reset
    else
        NM_Avg_Error = csvread('Simulated_Nonworking_Male_Average_Error.csv');
        I = find(sum(NM_Avg_Error,2));
        
        plot(I, NM_Avg_Error(I,1:10))
        xlim([1 NM_Num])
        legend(strcat('Sleeping (',num2str(NM_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(NM_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NM_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NM_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NM_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NM_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NM_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NM_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NM_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NM_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Male Occupant Average Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
        
elseif a == 19
    
    if NM_Num == 0 || NM_Num == 1
        cla reset
    else
        NM_Max_Error = csvread('Simulated_Nonworking_Male_Maximum_Error.csv');
        I = find(sum(NM_Max_Error,2));
        
        plot(I, NM_Max_Error(I,1:10))
        xlim([1 NM_Num])
        legend(strcat('Sleeping (',num2str(NM_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(NM_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NM_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NM_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NM_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NM_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NM_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NM_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NM_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NM_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Male Occupant Maximum Activity Distribution Error (',num2str(NM_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NM_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
        
elseif a == 20
    cla reset
elseif a == 21
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    WF_Prob_Model = csvread('Working_Female_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*WF_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WF_Prob_Model(start_time:7*24*60,1:10));
        WF_Prob_Model = [WF_Prob_Model(start_time:7*24*60,1:10); WF_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*WF_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 22
    
    WF_Occ_Act_Prob = csvread('Simulated_Working_Female_Probability_Matrix.csv');
    
    for i = 1:length(WF_Occ_Act_Prob)
        WF_Occ_Act_Prob(i,1:10) = WF_Occ_Act_Prob(i,1:10)/sum(WF_Occ_Act_Prob(i,1:10));
    end
    WF_Occ_Act_Prob(isnan(WF_Occ_Act_Prob)) = 0;    % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*WF_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Simulated Activity Distribution (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(WF_Occ_Act_Prob(start_time:7*24*60,1:10));
        WF_Occ_Act_Prob = [WF_Occ_Act_Prob(start_time:7*24*60,1:10); WF_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*WF_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Working Female Occupant Simulated Activity Distribution (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 23
    
    WF_Error = csvread('Simulated_Working_Female_Error.csv');
    
    if start_time < end_time
        plot(WF_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Working Female Occupant Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(WF_Error(start_time:7*24*60,1:10));
        WF_Error = [WF_Error(start_time:7*24*60,1:10); WF_Error(1:start_time - 1,1:10)];
        
        plot(WF_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Working Female Occupant Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 24
    
    if WF_Num == 0 || WF_Num == 1
        cla reset
    else
        WF_Avg_Error = csvread('Simulated_Working_Female_Average_Error.csv');
        I = find(sum(WF_Avg_Error,2));
        
        plot(I, WF_Avg_Error(I,1:10))
        xlim([1 WF_Num])
        legend(strcat('Sleeping (',num2str(WF_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(WF_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WF_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WF_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WF_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WF_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WF_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WF_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WF_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WF_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Female Occupant Average Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 25
    
    if WF_Num == 0 || WF_Num == 1
        cla reset
    else
        WF_Max_Error = csvread('Simulated_Working_Female_Maximum_Error.csv');
        I = find(sum(WF_Max_Error,2));
        
        plot(I, WF_Max_Error(I,1:10))
        xlim([1 WF_Num])
        legend(strcat('Sleeping (',num2str(WF_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(WF_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(WF_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(WF_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(WF_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(WF_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(WF_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(WF_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(WF_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(WF_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Working Female Occupant Maximum Activity Distribution Error (',num2str(WF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*WF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 26
    cla reset
elseif a == 27
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    NF_Prob_Model = csvread('Nonworking_Female_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*NF_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NF_Prob_Model(start_time:7*24*60,1:10));
        NF_Prob_Model = [NF_Prob_Model(start_time:7*24*60,1:10); NF_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*NF_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 28
    
    NF_Occ_Act_Prob = csvread('Simulated_Nonworking_Female_Probability_Matrix.csv');
    
    for i = 1:length(NF_Occ_Act_Prob)
        NF_Occ_Act_Prob(i,1:10) = NF_Occ_Act_Prob(i,1:10)/sum(NF_Occ_Act_Prob(i,1:10));
    end
    NF_Occ_Act_Prob(isnan(NF_Occ_Act_Prob)) = 0;   % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*NF_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Simulated Activity Distribution (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(NF_Occ_Act_Prob(start_time:7*24*60,1:10));
        NF_Occ_Act_Prob = [NF_Occ_Act_Prob(start_time:7*24*60,1:10); NF_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*NF_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Nonworking Female Occupant Simulated Activity Distribution (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 29
    
    NF_Error = csvread('Simulated_Nonworking_Female_Error.csv');
    
    if start_time < end_time
        plot(NF_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Nonworking Female Occupant Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(NF_Error(start_time:7*24*60,1:10));
        NF_Error = [NF_Error(start_time:7*24*60,1:10); NF_Error(1:start_time - 1,1:10)];
        
        plot(NF_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Nonworking Female Occupant Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 30
    
    if NF_Num == 0 || NF_Num == 1
        cla reset
    else
        NF_Avg_Error = csvread('Simulated_Nonworking_Female_Average_Error.csv');
        I = find(sum(NF_Avg_Error,2));
        
        plot(I, NF_Avg_Error(I,1:10))
        xlim([1 NF_Num])
        legend(strcat('Sleeping (',num2str(NF_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(NF_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NF_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NF_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NF_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NF_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NF_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NF_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NF_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NF_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Female Occupant Average Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 31
    
    if NF_Num == 0 || NF_Num == 1
        cla reset
    else
        NF_Max_Error = csvread('Simulated_Nonworking_Female_Maximum_Error.csv');
        I = find(sum(NF_Max_Error,2));
        
        plot(I, NF_Max_Error(I,1:10))
        xlim([1 NF_Num])
        legend(strcat('Sleeping (',num2str(NF_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(NF_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(NF_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(NF_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(NF_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(NF_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(NF_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(NF_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(NF_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(NF_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Nonworking Female Occupant Maximum Activity Distribution Error (',num2str(NF_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*NF_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
    
elseif a == 32
    cla reset
elseif a == 33
    
    cd(fullfile(inputdata,'Occupant Behavior Models'));
    C_Prob_Model = csvread('Child_Probability_Matrix.csv');
    
    if start_time < end_time
        area(100*C_Prob_Model(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(C_Prob_Model(start_time:7*24*60,1:10));
        C_Prob_Model = [C_Prob_Model(start_time:7*24*60,1:10); C_Prob_Model(1:start_time - 1,1:10)];
        
        area(100*C_Prob_Model(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Expected Activity Distribution'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
    
    cd(fullfile(outputdata,'Text Files'));
    
elseif a == 34
    
    C_Occ_Act_Prob = csvread('Simulated_Child_Probability_Matrix.csv');
    
    for i = 1:length(C_Occ_Act_Prob)
        C_Occ_Act_Prob(i,1:10) = C_Occ_Act_Prob(i,1:10)/sum(C_Occ_Act_Prob(i,1:10));
    end
    C_Occ_Act_Prob(isnan(C_Occ_Act_Prob)) = 0;  % Replace All NaNs with Zeros
    
    if start_time < end_time
        area(100*C_Occ_Act_Prob(start_time:end_time,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Simulated Activity Distribution (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(start_time:end_time) + 1) 0 100])
    else
        x = length(C_Occ_Act_Prob(start_time:7*24*60,1:10));
        C_Occ_Act_Prob = [C_Occ_Act_Prob(start_time:7*24*60,1:10); C_Occ_Act_Prob(1:start_time - 1,1:10)];
        
        area(100*C_Occ_Act_Prob(1:end_time + x,1:10))
        grid on
        colormap jet
        set(gca,'Layer','top')
        title(strcat('Child Occupant Simulated Activity Distribution (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Probability (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        axis([1 (length(1:end_time + x) + 1) 0 100])
    end
                             
elseif a == 35
    
    C_Error = csvread('Simulated_Child_Error.csv');
    
    if start_time < end_time
        plot(C_Error(start_time:end_time,1:10))
        grid on
        title(strcat('Child Occupant Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(start_time:end_time) + 1)])
    else
        x = length(C_Error(start_time:7*24*60,1:10));
        C_Error = [C_Error(start_time:7*24*60,1:10); C_Error(1:start_time - 1,1:10)];
        
        plot(C_Error(1:end_time + x,1:10))
        grid on
        title(strcat('Child Occupant Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
        ylabel('Activity Distribution Error (%)')
        set(gca,'XTick',1:6*60:end_time + x + 1)
        set(gca,'XTickLabel',{'12am','6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am','6am','12pm','6pm','12am'...
                                     '6am','12pm','6pm','12am'})
        xlim([1 (length(1:end_time + x)+ 1)])
    end
    
elseif a == 36
    
    if C_Num == 0 || C_Num == 1
        cla reset
    else
        C_Avg_Error = csvread('Simulated_Child_Average_Error.csv');
        I = find(sum(C_Avg_Error,2));
        
        plot(I, C_Avg_Error(I,1:10))
        xlim([1 C_Num])
        legend(strcat('Sleeping (',num2str(C_Avg_Error(end,1)),' %)'), strcat('Grooming (',num2str(C_Avg_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(C_Avg_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(C_Avg_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(C_Avg_Error(end,5)),' %)'), strcat('Watching Television (',num2str(C_Avg_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(C_Avg_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(C_Avg_Error(end,8)),' %)'),...
            strcat('Away (',num2str(C_Avg_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(C_Avg_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Child Occupant Average Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Average Activity Distribution Error (%)')
    
elseif a == 37
    
    if C_Num == 0 || C_Num == 1
        cla reset
    else
        C_Max_Error = csvread('Simulated_Child_Maximum_Error.csv');
        I = find(sum(C_Max_Error,2));
        
        plot(I, C_Max_Error(I,1:10))
        xlim([1 C_Num])
        legend(strcat('Sleeping (',num2str(C_Max_Error(end,1)),' %)'), strcat('Grooming (',num2str(C_Max_Error(end,2)),' %)'),...
            strcat('Laundry (',num2str(C_Max_Error(end,3)),' %)'), strcat('Food Preparation (',num2str(C_Max_Error(end,4)),' %)'),...
            strcat('Washing Dishes (',num2str(C_Max_Error(end,5)),' %)'), strcat('Watching Television (',num2str(C_Max_Error(end,6)),' %)'),...
            strcat('Using Computer (',num2str(C_Max_Error(end,7)),' %)'), strcat('Non-Power Activity (',num2str(C_Max_Error(end,8)),' %)'),...
            strcat('Away (',num2str(C_Max_Error(end,9)),' %)'), strcat('Away, Traveling (',num2str(C_Max_Error(end,10)),' %)'));
    end
    grid on
    title(strcat('Child Occupant Maximum Activity Distribution Error (',num2str(C_Num),{' Occupants out of '},num2str(Tot_Num),{' ('},num2str(100*C_Num/Tot_Num),' %))'))
    xlabel('Number of Occupants')
    ylabel('Maximum Activity Distribution Error (%)')
end

cd(home);


% --- Executes during object creation, after setting all properties.
function Select_Results2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Select_Results2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in UpdateResults_Button.
function UpdateResults_Button_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateResults_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Go to Select Results Functions

Select_Results1_Callback(hObject, eventdata, handles)

Select_Results2_Callback(hObject, eventdata, handles)
