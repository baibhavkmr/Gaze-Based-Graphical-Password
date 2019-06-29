function varargout = select_password(varargin)
% SELECT_PASSWORD MATLAB code for select_password.fig
%      SELECT_PASSWORD, by itself, creates a new SELECT_PASSWORD or raises the existing
%      singleton*.
%
%      H = SELECT_PASSWORD returns the handle to a new SELECT_PASSWORD or the handle to
%      the existing singleton*.
%
%      SELECT_PASSWORD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_PASSWORD.M with the given input arguments.
%
%      SELECT_PASSWORD('Property','Value',...) creates a new SELECT_PASSWORD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_password_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_password_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_password

% Last Modified by GUIDE v2.5 04-Feb-2019 19:28:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @select_password_OpeningFcn, ...
                   'gui_OutputFcn',  @select_password_OutputFcn, ...
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

  %need to acc

% --- Executes just before select_password is made visible.
function select_password_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_password (see VARARGIN)

% Choose default command line output for select_password
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_password wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = select_password_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

hf=findobj('Name','select_password');
movegui(hf,'center');  %moves the select password to the center of the screen

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global email_id;  %need to access 
 
email_id = get(handles.edit1,'String'); %edit1 being Tag of ur edit box
 if isempty(email_id)
   %fprintf('Error: Enter user name to proceed \n');
   f = errordlg('Enter email ID to proceed', 'Input Error');
 else
   % Write code for computation you want to do 
   %disp('you entered');
   disp(email_id);
   display_password_images_new;
 end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
 global email_id;  %need to access username for all 9 screens
 email_id = '';% make email-id empty 
 
 
 
 disp('Password generated Successfully');

 hf=findobj('Name','select_password');
 close(hf);  %closes the select password screen 
 
 
 f = msgbox('Password generated Successfully','Success');
 
 pause(2); % delay for 2 seconds
 
 %open the authentication screen 1
 auth_screen_1;
 
 
 
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


% --- Executes during object deletion, before destroying properties.
function edit1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
