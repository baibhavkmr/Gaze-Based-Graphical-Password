function varargout = auth_screen_1(varargin)
% AUTH_SCREEN_1 MATLAB code for auth_screen_1.fig
%      AUTH_SCREEN_1, by itself, creates a new AUTH_SCREEN_1 or raises the existing
%      singleton*.
%
%      H = AUTH_SCREEN_1 returns the handle to a new AUTH_SCREEN_1 or the handle to
%      the existing singleton*.
%
%      AUTH_SCREEN_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTH_SCREEN_1.M with the given input arguments.
%
%      AUTH_SCREEN_1('Property','Value',...) creates a new AUTH_SCREEN_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before auth_screen_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to auth_screen_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help auth_screen_1

% Last Modified by GUIDE v2.5 06-Feb-2019 14:47:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @auth_screen_1_OpeningFcn, ...
                   'gui_OutputFcn',  @auth_screen_1_OutputFcn, ...
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


% --- Executes just before auth_screen_1 is made visible.
function auth_screen_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to auth_screen_1 (see VARARGIN)

% Choose default command line output for auth_screen_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes auth_screen_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
hf=findobj('Name','auth_screen_1');
movegui(hf,'center');  %moves the auth screen 1 to the center of the screen


% --- Outputs from this function are returned to the command line.
function varargout = auth_screen_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global email_id;  %need to access username for all 9 screens 
email_id = get(handles.edit1,'String'); %edit1 being Tag of ur edit box
 if isempty(email_id)
   %fprintf('Error: Enter user name to proceed \n');
   f = errordlg('Enter email ID to proceed', 'Input Error');
 else
   % Write code for computation you want to do 
   %disp('you entered');
   disp(email_id);
   
   auth_screen_2; %displays auth screen 2
   display_images_1; %displays appropriate images on auth screen 2
   hf=findobj('Name','auth_screen_2');
   movegui(hf,'center');  %moves the auth screen2  to the center of the screen
  
 end
 
 
 
 
