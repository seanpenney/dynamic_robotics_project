function varargout = DataOutputGraphs(varargin)
% DATAOUTPUTGRAPHS MATLAB code for DataOutputGraphs.fig
%      DATAOUTPUTGRAPHS, by itself, creates a new DATAOUTPUTGRAPHS or raises the existing
%      singleton*.
%
%      H = DATAOUTPUTGRAPHS returns the handle to a new DATAOUTPUTGRAPHS or the handle to
%      the existing singleton*.
%
%      DATAOUTPUTGRAPHS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATAOUTPUTGRAPHS.M with the given input arguments.
%
%      DATAOUTPUTGRAPHS('Property','Value',...) creates a new DATAOUTPUTGRAPHS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataOutputGraphs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataOutputGraphs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataOutputGraphs

% Last Modified by GUIDE v2.5 18-Jul-2014 15:34:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataOutputGraphs_OpeningFcn, ...
                   'gui_OutputFcn',  @DataOutputGraphs_OutputFcn, ...
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


% function ModelInitialization(handle)
% 
% Description: 
%   This function opens the simulink model, which is required for the GUI
%   to work. 

% --- Executes just before DataOutputGraphs is made visible.
function DataOutputGraphs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataOutputGraphs (see VARARGIN)







% Choose default command line output for DataOutputGraphs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DataOutputGraphs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataOutputGraphs_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

 
