function varargout = HomeHVACParameters(varargin)
% HOMEHVACPARAMETERS MATLAB code for HomeHVACParameters.fig
%      HOMEHVACPARAMETERS, by itself, creates a new HOMEHVACPARAMETERS or raises the existing
%      singleton*.
%
%      H = HOMEHVACPARAMETERS returns the handle to a new HOMEHVACPARAMETERS or the handle to
%      the existing singleton*.
%
%      HOMEHVACPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEHVACPARAMETERS.M with the given input arguments.
%
%      HOMEHVACPARAMETERS('Property','Value',...) creates a new HOMEHVACPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HomeHVACParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HomeHVACParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HomeHVACParameters

% Last Modified by GUIDE v2.5 27-Jan-2014 10:08:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HomeHVACParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @HomeHVACParameters_OutputFcn, ...
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


% --- Executes just before HomeHVACParameters is made visible.
function HomeHVACParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HomeHVACParameters (see VARARGIN)

% Choose default command line output for HomeHVACParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HomeHVACParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Load Directories

struct = getappdata(0,'MyStruct');

inputdata = struct.inputdata;


% Load Inputs

if exist(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'),'file') == 2
    HomeHVAC_Inputs = load(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'));
else
    HomeHVAC_Inputs = load(fullfile(inputdata,'Default Settings','HomeHVAC_Default.txt'));
end


% Set Inputs

set(handles.MeanSquareFootage_Slider, 'Value', HomeHVAC_Inputs(1));
set(handles.MeanSquareFootage_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(1), 0.01)),' sqft'));

set(handles.STDSquareFootage_Slider, 'Value', HomeHVAC_Inputs(2));
set(handles.STDSquareFootage_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(2), 0.01)),' sqft'));

set(handles.CeilingHeight_Slider, 'Value', HomeHVAC_Inputs(3));
set(handles.CeilingHeight_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(3), 0.01)),' ft'));

set(handles.NumberOfFloors_Slider, 'Value', HomeHVAC_Inputs(4));
set(handles.NumberOfFloors_VarText, 'String', num2str(round2(HomeHVAC_Inputs(4), 1)));

set(handles.NumberOfDoors_Slider, 'Value', HomeHVAC_Inputs(5));
set(handles.NumberOfDoors_VarText, 'String', num2str(round2(HomeHVAC_Inputs(5), 1)));

set(handles.AspectRatio_Slider, 'Value', HomeHVAC_Inputs(6));
set(handles.AspectRatio_VarText, 'String', num2str(round2(HomeHVAC_Inputs(6), 0.01)));

set(handles.WallInsulationValue_Slider, 'Value', HomeHVAC_Inputs(7));
set(handles.WallInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(7), 0.01))));

set(handles.RoofInsulationValue_Slider, 'Value', HomeHVAC_Inputs(8));
set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(8), 0.01))));

set(handles.FloorInsulationValue_Slider, 'Value', HomeHVAC_Inputs(9));
set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(9), 0.01))));

set(handles.WindowInsulationValue_Slider, 'Value', HomeHVAC_Inputs(10));
set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(10), 0.01))));

set(handles.DoorInsulationValue_Slider, 'Value', HomeHVAC_Inputs(11));
set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(11), 0.01))));

if HomeHVAC_Inputs(12) == 1
    set(handles.Loose_RadioButton, 'Value', 1);
elseif HomeHVAC_Inputs(12) == 2
    set(handles.Medium_RadioButton, 'Value', 1);
elseif HomeHVAC_Inputs(12) == 3
    set(handles.Tight_RadioButton, 'Value', 1);
end

set(handles.VaryHomeInsulationValues_CheckBox, 'Value', HomeHVAC_Inputs(13));

set(handles.HeatPumpPercentage_Input, 'Value', HomeHVAC_Inputs(14));
set(handles.HeatPumpPercentage_Input, 'String', num2str(HomeHVAC_Inputs(14)));

set(handles.ResistiveHeatingPercentage_Input, 'Value', HomeHVAC_Inputs(15));
set(handles.ResistiveHeatingPercentage_Input, 'String', num2str(HomeHVAC_Inputs(15)));

set(handles.NonelectricHeatingPercentage_Input, 'Value', HomeHVAC_Inputs(16));
set(handles.NonelectricHeatingPercentage_Input, 'String', num2str(HomeHVAC_Inputs(16)));

set(handles.AirConditioningPercentage_Input, 'Value', HomeHVAC_Inputs(17));
set(handles.AirConditioningPercentage_Input, 'String', num2str(HomeHVAC_Inputs(17)));

set(handles.OverSizingFactor_Slider, 'Value', HomeHVAC_Inputs(18));
set(handles.OverSizingFactor_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(18)*100, 0.01)),' %'));

set(handles.HeatPumpCOP_Slider, 'Value', HomeHVAC_Inputs(19));
set(handles.HeatPumpCOP_VarText, 'String', num2str(round2(HomeHVAC_Inputs(19), 0.01)));

set(handles.AirConditioningCOP_Slider, 'Value', HomeHVAC_Inputs(20));
set(handles.AirConditioningCOP_VarText, 'String', num2str(round2(HomeHVAC_Inputs(20), 0.01)));

set(handles.MeanHeatingThermostatSetting_Slider, 'Value', HomeHVAC_Inputs(21));
set(handles.MeanHeatingThermostatSetting_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(21), 0.01)),' F'));

set(handles.MeanCoolingThermostatSetting_Slider, 'Value', HomeHVAC_Inputs(22));
set(handles.MeanCoolingThermostatSetting_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(22), 0.01)),' F'));

set(handles.STDThermostatSetting_Slider, 'Value', HomeHVAC_Inputs(23));
set(handles.STDThermostatSetting_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(23), 0.01)),' F'));

set(handles.ThermostatDeadband_Slider, 'Value', HomeHVAC_Inputs(24));
set(handles.ThermostatDeadband_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(24), 0.01)),' F'));

set(handles.AuxilaryDeadband_Slider, 'Value', HomeHVAC_Inputs(25));
set(handles.AuxilaryDeadband_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(25), 0.01)),' F'));

if get(handles.WallInsulationValue_Slider, 'Value') == 4 && get(handles.RoofInsulationValue_Slider, 'Value') == 11 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 4 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/1.27), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Loose_RadioButton, 'Value') == 1
    
    set(handles.ExtremelyPoorlyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 11 && get(handles.RoofInsulationValue_Slider, 'Value') == 19 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 4 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.81), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Loose_RadioButton, 'Value') == 1
    
    set(handles.VeryPoorlyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 19 && get(handles.RoofInsulationValue_Slider, 'Value') == 11 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 11 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.81), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Medium_RadioButton, 'Value') == 1
    
    set(handles.PoorlyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 11 && get(handles.RoofInsulationValue_Slider, 'Value') == 30 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 19 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.6), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Medium_RadioButton, 'Value') == 1
    
    set(handles.ModeratelyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 19 && get(handles.RoofInsulationValue_Slider, 'Value') == 30 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 11 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.6), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Medium_RadioButton, 'Value') == 1
    
    set(handles.WellInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 19 && get(handles.RoofInsulationValue_Slider, 'Value') == 30 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 22 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.47), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 5 && get(handles.Tight_RadioButton, 'Value') == 1
    
    set(handles.VeryWellInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 22 && get(handles.RoofInsulationValue_Slider, 'Value') == 48 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 30 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.31), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 11 && get(handles.Tight_RadioButton, 'Value') == 1
    
    set(handles.ExtremelyWellInsulated_RadioButton, 'Value', 1);
end


% --- Outputs from this function are returned to the command line.
function varargout = HomeHVACParameters_OutputFcn(hObject, eventdata, handles)
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

p1 = get(handles.MeanSquareFootage_Slider);
p2 = get(handles.STDSquareFootage_Slider);
p3 = get(handles.CeilingHeight_Slider);
p4 = get(handles.NumberOfFloors_Slider);
p5 = get(handles.NumberOfDoors_Slider);
p6 = get(handles.AspectRatio_Slider);
p7 = get(handles.WallInsulationValue_Slider);
p8 = get(handles.RoofInsulationValue_Slider);
p9 = get(handles.FloorInsulationValue_Slider);
p10 = get(handles.WindowInsulationValue_Slider);
p11 = get(handles.DoorInsulationValue_Slider);
p12 = get(handles.Loose_RadioButton,'Value')*1 + get(handles.Medium_RadioButton,'Value')*2 + get(handles.Tight_RadioButton,'Value')*3;
p13 = get(handles.VaryHomeInsulationValues_CheckBox);
p14 = get(handles.HeatPumpPercentage_Input);
p15 = get(handles.ResistiveHeatingPercentage_Input);
p16 = get(handles.NonelectricHeatingPercentage_Input);
p17 = get(handles.AirConditioningPercentage_Input);
p18 = get(handles.OverSizingFactor_Slider);
p19 = get(handles.HeatPumpCOP_Slider);
p20 = get(handles.AirConditioningCOP_Slider);
p21 = get(handles.MeanHeatingThermostatSetting_Slider);
p22 = get(handles.MeanCoolingThermostatSetting_Slider);
p23 = get(handles.STDThermostatSetting_Slider);
p24 = get(handles.ThermostatDeadband_Slider);
p25 = get(handles.AuxilaryDeadband_Slider);

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
a(12) = p12;
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
a(23) = p23.Value;
a(24) = p24.Value;
a(25) = p25.Value;

if round(10^4*(p14.Value + p15.Value + p16.Value))/10^4 > 100
    errordlg('Sum of Heat Pump, Resistive Heating, and Nonelectric Heating Inputs Must be Less than or Equal to 100%', 'Error')
    return
end


% Write Settings to File

if isdir(fullfile(inputdata,'User Settings'))
else
    mkdir(fullfile(inputdata,'User Settings'));
end

if isdir(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'))
    rmdir(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'),'s');
end

cd(fullfile(inputdata,'User Settings'));

fid = fopen('HomeHVAC_Data.txt','w');
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

if exist(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'),'file')
    delete(fullfile(inputdata,'User Settings','HomeHVAC_Data.txt'));
end


% Load Default Inputs

HomeHVAC_Inputs = load(fullfile(inputdata,'Default Settings','HomeHVAC_Default.txt'));


% Reset Inputs to Default

set(handles.MeanSquareFootage_Slider, 'Value', HomeHVAC_Inputs(1));
set(handles.MeanSquareFootage_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(1), 0.01)),' sqft'));

set(handles.STDSquareFootage_Slider, 'Value', HomeHVAC_Inputs(2));
set(handles.STDSquareFootage_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(2), 0.01)),' sqft'));

set(handles.CeilingHeight_Slider, 'Value', HomeHVAC_Inputs(3));
set(handles.CeilingHeight_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(3), 0.01)),' ft'));

set(handles.NumberOfFloors_Slider, 'Value', HomeHVAC_Inputs(4));
set(handles.NumberOfFloors_VarText, 'String', num2str(round2(HomeHVAC_Inputs(4), 1)));

set(handles.NumberOfDoors_Slider, 'Value', HomeHVAC_Inputs(5));
set(handles.NumberOfDoors_VarText, 'String', num2str(round2(HomeHVAC_Inputs(5), 1)));

set(handles.AspectRatio_Slider, 'Value', HomeHVAC_Inputs(6));
set(handles.AspectRatio_VarText, 'String', num2str(round2(HomeHVAC_Inputs(6), 0.01)));

set(handles.WallInsulationValue_Slider, 'Value', HomeHVAC_Inputs(7));
set(handles.WallInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(7), 0.01))));

set(handles.RoofInsulationValue_Slider, 'Value', HomeHVAC_Inputs(8));
set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(8), 0.01))));

set(handles.FloorInsulationValue_Slider, 'Value', HomeHVAC_Inputs(9));
set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(9), 0.01))));

set(handles.WindowInsulationValue_Slider, 'Value', HomeHVAC_Inputs(10));
set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(10), 0.01))));

set(handles.DoorInsulationValue_Slider, 'Value', HomeHVAC_Inputs(11));
set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',num2str(round2(HomeHVAC_Inputs(11), 0.01))));

if HomeHVAC_Inputs(12) == 1
    set(handles.Loose_RadioButton, 'Value', 1);
elseif HomeHVAC_Inputs(12) == 2
    set(handles.Medium_RadioButton, 'Value', 1);
elseif HomeHVAC_Inputs(12) == 3
    set(handles.Tight_RadioButton, 'Value', 1);
end

set(handles.VaryHomeInsulationValues_CheckBox, 'Value', HomeHVAC_Inputs(13));

set(handles.HeatPumpPercentage_Input, 'Value', HomeHVAC_Inputs(14));
set(handles.HeatPumpPercentage_Input, 'String', num2str(HomeHVAC_Inputs(14)));

set(handles.ResistiveHeatingPercentage_Input, 'Value', HomeHVAC_Inputs(15));
set(handles.ResistiveHeatingPercentage_Input, 'String', num2str(HomeHVAC_Inputs(15)));

set(handles.NonelectricHeatingPercentage_Input, 'Value', HomeHVAC_Inputs(16));
set(handles.NonelectricHeatingPercentage_Input, 'String', num2str(HomeHVAC_Inputs(16)));

set(handles.AirConditioningPercentage_Input, 'Value', HomeHVAC_Inputs(17));
set(handles.AirConditioningPercentage_Input, 'String', num2str(HomeHVAC_Inputs(17)));

set(handles.OverSizingFactor_Slider, 'Value', HomeHVAC_Inputs(18));
set(handles.OverSizingFactor_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(18)*100, 0.01)),' %'));

set(handles.HeatPumpCOP_Slider, 'Value', HomeHVAC_Inputs(19));
set(handles.HeatPumpCOP_VarText, 'String', num2str(round2(HomeHVAC_Inputs(19), 0.01)));

set(handles.AirConditioningCOP_Slider, 'Value', HomeHVAC_Inputs(20));
set(handles.AirConditioningCOP_VarText, 'String', num2str(round2(HomeHVAC_Inputs(20), 0.01)));

set(handles.MeanHeatingThermostatSetting_Slider, 'Value', HomeHVAC_Inputs(21));
set(handles.MeanHeatingThermostatSetting_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(21), 0.01)),' F'));

set(handles.MeanCoolingThermostatSetting_Slider, 'Value', HomeHVAC_Inputs(22));
set(handles.MeanCoolingThermostatSetting_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(22), 0.01)),' F'));

set(handles.STDThermostatSetting_Slider, 'Value', HomeHVAC_Inputs(23));
set(handles.STDThermostatSetting_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(23), 0.01)),' F'));

set(handles.ThermostatDeadband_Slider, 'Value', HomeHVAC_Inputs(24));
set(handles.ThermostatDeadband_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(24), 0.01)),' F'));

set(handles.AuxilaryDeadband_Slider, 'Value', HomeHVAC_Inputs(25));
set(handles.AuxilaryDeadband_VarText, 'String', strcat(num2str(round2(HomeHVAC_Inputs(25), 0.01)),' F'));

if get(handles.WallInsulationValue_Slider, 'Value') == 4 && get(handles.RoofInsulationValue_Slider, 'Value') == 11 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 4 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/1.27), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Loose_RadioButton, 'Value') == 1
    
    set(handles.ExtremelyPoorlyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 11 && get(handles.RoofInsulationValue_Slider, 'Value') == 19 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 4 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.81), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Loose_RadioButton, 'Value') == 1
    
    set(handles.VeryPoorlyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 19 && get(handles.RoofInsulationValue_Slider, 'Value') == 11 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 11 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.81), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Medium_RadioButton, 'Value') == 1
    
    set(handles.PoorlyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 11 && get(handles.RoofInsulationValue_Slider, 'Value') == 30 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 19 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.6), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Medium_RadioButton, 'Value') == 1
    
    set(handles.ModeratelyInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 19 && get(handles.RoofInsulationValue_Slider, 'Value') == 30 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 11 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.6), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 3 && get(handles.Medium_RadioButton, 'Value') == 1
    
    set(handles.WellInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 19 && get(handles.RoofInsulationValue_Slider, 'Value') == 30 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 22 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.47), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 5 && get(handles.Tight_RadioButton, 'Value') == 1
    
    set(handles.VeryWellInsulated_RadioButton, 'Value', 1);
    
elseif get(handles.WallInsulationValue_Slider, 'Value') == 22 && get(handles.RoofInsulationValue_Slider, 'Value') == 48 &&...
        get(handles.FloorInsulationValue_Slider, 'Value') == 30 && get(handles.WindowInsulationValue_Slider, 'Value') == round2((1/0.31), 0.01) &&...
        get(handles.DoorInsulationValue_Slider, 'Value') == 11 && get(handles.Tight_RadioButton, 'Value') == 1
    
    set(handles.ExtremelyWellInsulated_RadioButton, 'Value', 1);
end


% --- Executes on button press in UpdateValues_Button.
function UpdateValues_Button_Callback(hObject, eventdata, handles)
% hObject    handle to UpdateValues_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get Radio Button Handles

b(1) = get(handles.ExtremelyPoorlyInsulated_RadioButton, 'Value');
b(2) = get(handles.VeryPoorlyInsulated_RadioButton, 'Value');
b(3) = get(handles.PoorlyInsulated_RadioButton, 'Value');
b(4) = get(handles.ModeratelyInsulated_RadioButton, 'Value');
b(5) = get(handles.WellInsulated_RadioButton, 'Value');
b(6) = get(handles.VeryWellInsulated_RadioButton, 'Value');
b(7) = get(handles.ExtremelyWellInsulated_RadioButton, 'Value');


% Set Home Insulation Values

if b(1) == 1    % Extremely Poorly Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 4);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 4);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/1.27), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 3);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Loose_RadioButton, 'Value', 1);
    
elseif b(2) == 1    % Very Poorly Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 19);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 4);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/0.81), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 3);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Loose_RadioButton, 'Value', 1);
    
elseif b(3) == 1    % Poorly Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 19);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/0.81), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 3);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Medium_RadioButton, 'Value', 1);
    
elseif b(4) == 1    % Moderately Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 30);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 19);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/0.6), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 3);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Medium_RadioButton, 'Value', 1);
    
elseif b(5) == 1    % Well Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 19);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 30);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/0.6), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 3);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Medium_RadioButton, 'Value', 1);
    
elseif b(6) == 1    % Very Well Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 19);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 30);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 22);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/0.47), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 5);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Tight_RadioButton, 'Value', 1);
    
elseif b(7) == 1    % Extremely Well Insulated Setting
    
    % Wall Insulation Value
    
    set(handles.WallInsulationValue_Slider, 'Value', 22);
    
    a = get(handles.WallInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Roof Insulation Value
    
    set(handles.RoofInsulationValue_Slider, 'Value', 48);
    
    a = get(handles.RoofInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Floor Insulation Value
    
    set(handles.FloorInsulationValue_Slider, 'Value', 30);
    
    a = get(handles.FloorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
     
    % Window Insulation Value
    
    set(handles.WindowInsulationValue_Slider, 'Value', round2((1/0.31), 0.01));
    
    a = get(handles.WindowInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Door Insulation Value
    
    set(handles.DoorInsulationValue_Slider, 'Value', 11);
    
    a = get(handles.DoorInsulationValue_Slider);
    
    string_disp = num2str(a.Value);
    
    set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));
    
    
    % Construction Type
    
    set(handles.Tight_RadioButton, 'Value', 1);
end


% --- Executes on slider movement.
function MeanSquareFootage_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MeanSquareFootage_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.MeanSquareFootage_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.MeanSquareFootage_VarText, 'String', strcat(string_disp,' sqft'));


% --- Executes during object creation, after setting all properties.
function MeanSquareFootage_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanSquareFootage_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function STDSquareFootage_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to STDSquareFootage_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.STDSquareFootage_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.STDSquareFootage_VarText, 'String', strcat(string_disp,' sqft'));


% --- Executes during object creation, after setting all properties.
function STDSquareFootage_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to STDSquareFootage_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function CeilingHeight_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to CeilingHeight_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.CeilingHeight_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.CeilingHeight_VarText, 'String', strcat(string_disp,' ft'));


% --- Executes during object creation, after setting all properties.
function CeilingHeight_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CeilingHeight_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function NumberOfFloors_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to NumberOfFloors_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.NumberOfFloors_Slider);

string_disp = num2str(round2(a.Value, 1));

set(handles.NumberOfFloors_VarText, 'String', string_disp);


% --- Executes during object creation, after setting all properties.
function NumberOfFloors_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberOfFloors_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function NumberOfDoors_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to NumberOfDoors_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.NumberOfDoors_Slider);

string_disp = num2str(round2(a.Value, 1));

set(handles.NumberOfDoors_VarText, 'String', string_disp);


% --- Executes during object creation, after setting all properties.
function NumberOfDoors_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberOfDoors_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function AspectRatio_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to AspectRatio_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.AspectRatio_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.AspectRatio_VarText, 'String', string_disp);


% --- Executes during object creation, after setting all properties.
function AspectRatio_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AspectRatio_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WallInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WallInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WallInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WallInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function WallInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WallInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function RoofInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to RoofInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.RoofInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.RoofInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function RoofInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RoofInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function FloorInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to FloorInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.FloorInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.FloorInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function FloorInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FloorInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function WindowInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to WindowInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.WindowInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.WindowInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function WindowInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WindowInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function DoorInsulationValue_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to DoorInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.DoorInsulationValue_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.DoorInsulationValue_VarText, 'String', strcat('R-',string_disp));


% --- Executes during object creation, after setting all properties.
function DoorInsulationValue_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DoorInsulationValue_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in VaryHomeInsulationValues_CheckBox.
function VaryHomeInsulationValues_CheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to VaryHomeInsulationValues_CheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of VaryHomeInsulationValues_CheckBox


function HeatPumpPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to HeatPumpPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HeatPumpPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of HeatPumpPercentage_Input as a double

% Read in and Store Heat Pump Percentage Input

HeatPumpPercentage = str2double(get(hObject,'String'));
if isnan(HeatPumpPercentage)
    HeatPumpPercentage = [];
    set(hObject,'String',HeatPumpPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if HeatPumpPercentage < 0
    HeatPumpPercentage = [];
    set(hObject,'String',HeatPumpPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if HeatPumpPercentage > 100
    HeatPumpPercentage = [];
    set(hObject,'String',HeatPumpPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.HeatPumpPercentage_Input, 'Value', HeatPumpPercentage);


% --- Executes during object creation, after setting all properties.
function HeatPumpPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HeatPumpPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ResistiveHeatingPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to ResistiveHeatingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ResistiveHeatingPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of ResistiveHeatingPercentage_Input as a double

% Read in and Store Resistive Heating Percentage Input

ResistiveHeatingPercentage = str2double(get(hObject,'String'));
if isnan(ResistiveHeatingPercentage)
    ResistiveHeatingPercentage = [];
    set(hObject,'String',ResistiveHeatingPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if ResistiveHeatingPercentage < 0
    ResistiveHeatingPercentage = [];
    set(hObject,'String',ResistiveHeatingPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if ResistiveHeatingPercentage > 100
    ResistiveHeatingPercentage = [];
    set(hObject,'String',ResistiveHeatingPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.ResistiveHeatingPercentage_Input, 'Value', ResistiveHeatingPercentage);


% --- Executes during object creation, after setting all properties.
function ResistiveHeatingPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ResistiveHeatingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function NonelectricHeatingPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to NonelectricHeatingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NonelectricHeatingPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of NonelectricHeatingPercentage_Input as a double

% Read in and Store Electric Heating Percentage Input

NonelectricHeatingPercentage = str2double(get(hObject,'String'));
if isnan(NonelectricHeatingPercentage)
    NonelectricHeatingPercentage = [];
    set(hObject,'String',NonelectricHeatingPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if NonelectricHeatingPercentage < 0
    NonelectricHeatingPercentage = [];
    set(hObject,'String',NonelectricHeatingPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if NonelectricHeatingPercentage > 100
    NonelectricHeatingPercentage = [];
    set(hObject,'String',NonelectricHeatingPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.NonelectricHeatingPercentage_Input, 'Value', NonelectricHeatingPercentage);


% --- Executes during object creation, after setting all properties.
function NonelectricHeatingPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NonelectricHeatingPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function AirConditioningPercentage_Input_Callback(hObject, eventdata, handles)
% hObject    handle to AirConditioningPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AirConditioningPercentage_Input as text
%        str2double(get(hObject,'String')) returns contents of AirConditioningPercentage_Input as a double

% Read in and Store Air Conditioning Percentage Input

AirConditioningPercentage = str2double(get(hObject,'String'));
if isnan(AirConditioningPercentage)
    AirConditioningPercentage = [];
    set(hObject,'String',AirConditioningPercentage);
    errordlg('Input Must be a Number', 'Error')
    return
end
if AirConditioningPercentage < 0
    AirConditioningPercentage = [];
    set(hObject,'String',AirConditioningPercentage);
    errordlg('Input Must be a Positive Number', 'Error')
    return
end
if AirConditioningPercentage > 100
    AirConditioningPercentage = [];
    set(hObject,'String',AirConditioningPercentage);
    errordlg('Input Must be Less than or Equal to 100 %', 'Error')
    return
end

set(handles.AirConditioningPercentage_Input, 'Value', AirConditioningPercentage);


% --- Executes during object creation, after setting all properties.
function AirConditioningPercentage_Input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AirConditioningPercentage_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function OverSizingFactor_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to OverSizingFactor_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.OverSizingFactor_Slider);

string_disp = num2str(round2(a.Value*100, 0.01));

set(handles.OverSizingFactor_VarText, 'String', strcat(string_disp,' %'));


% --- Executes during object creation, after setting all properties.
function OverSizingFactor_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OverSizingFactor_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function HeatPumpCOP_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to HeatPumpCOP_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.HeatPumpCOP_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.HeatPumpCOP_VarText, 'String', string_disp);


% --- Executes during object creation, after setting all properties.
function HeatPumpCOP_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HeatPumpCOP_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function AirConditioningCOP_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to AirConditioningCOP_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.AirConditioningCOP_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.AirConditioningCOP_VarText, 'String', string_disp);


% --- Executes during object creation, after setting all properties.
function AirConditioningCOP_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AirConditioningCOP_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MeanHeatingThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MeanHeatingThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.MeanHeatingThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.MeanHeatingThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function MeanHeatingThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanHeatingThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function MeanCoolingThermostatSetting_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to MeanCoolingThermostatSetting_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.MeanCoolingThermostatSetting_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.MeanCoolingThermostatSetting_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function MeanCoolingThermostatSetting_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeanCoolingThermostatSetting_Slider (see GCBO)
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
function AuxilaryDeadband_Slider_Callback(hObject, eventdata, handles)
% hObject    handle to AuxilaryDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

a = get(handles.AuxilaryDeadband_Slider);

string_disp = num2str(round2(a.Value, 0.01));

set(handles.AuxilaryDeadband_VarText, 'String', strcat(string_disp,' F'));


% --- Executes during object creation, after setting all properties.
function AuxilaryDeadband_Slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AuxilaryDeadband_Slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
