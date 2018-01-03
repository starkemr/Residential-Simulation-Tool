function varargout = HomeApplianceParameters(varargin)
% HOMEAPPLIANCEPARAMETERS MATLAB code for HomeApplianceParameters.fig
%      HOMEAPPLIANCEPARAMETERS, by itself, creates a new HOMEAPPLIANCEPARAMETERS or raises the existing
%      singleton*.
%
%      H = HOMEAPPLIANCEPARAMETERS returns the handle to a new HOMEAPPLIANCEPARAMETERS or the handle to
%      the existing singleton*.
%
%      HOMEAPPLIANCEPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEAPPLIANCEPARAMETERS.M with the given input arguments.
%
%      HOMEAPPLIANCEPARAMETERS('Property','Value',...) creates a new HOMEAPPLIANCEPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HomeApplianceParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HomeApplianceParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HomeApplianceParameters

% Last Modified by GUIDE v2.5 24-Jun-2014 09:59:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HomeApplianceParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @HomeApplianceParameters_OutputFcn, ...
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


% --- Executes just before HomeApplianceParameters is made visible.
function HomeApplianceParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HomeApplianceParameters (see VARARGIN)

% Choose default command line output for HomeApplianceParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HomeApplianceParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HomeApplianceParameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in HomeHVAC_Button.
function HomeHVAC_Button_Callback(hObject, eventdata, handles)
% hObject    handle to HomeHVAC_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

HomeHVACParameters


% --- Executes on button press in WaterHeater_Button.
function WaterHeater_Button_Callback(hObject, eventdata, handles)
% hObject    handle to WaterHeater_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

WaterHeaterParameters


% --- Executes on button press in RefrigeratorFreezer_Button.
function RefrigeratorFreezer_Button_Callback(hObject, eventdata, handles)
% hObject    handle to RefrigeratorFreezer_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RefrigeratorFreezerParameters


% --- Executes on button press in Deferrable_Button.
function Deferrable_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Deferrable_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

DeferrableParameters


% --- Executes on button press in Uninterruptible_Button.
function Uninterruptible_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Uninterruptible_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

UninterruptibleParameters


% --- Executes on button press in ElectricVehicle_Button.
function ElectricVehicle_Button_Callback(hObject, eventdata, handles)
% hObject    handle to ElectricVehicle_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ElectricVehicleParameters
