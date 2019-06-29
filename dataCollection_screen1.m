function varargout = dataCollection_screen1(varargin)
% DATACOLLECTION_SCREEN1 MATLAB code for dataCollection_screen1.fig
%      DATACOLLECTION_SCREEN1, by itself, creates a new DATACOLLECTION_SCREEN1 or raises the existing
%      singleton*.
%
%      H = DATACOLLECTION_SCREEN1 returns the handle to a new DATACOLLECTION_SCREEN1 or the handle to
%      the existing singleton*.
%
%      DATACOLLECTION_SCREEN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATACOLLECTION_SCREEN1.M with the given input arguments.
%
%      DATACOLLECTION_SCREEN1('Property','Value',...) creates a new DATACOLLECTION_SCREEN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dataCollection_screen1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dataCollection_screen1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dataCollection_screen1

% Last Modified by GUIDE v2.5 13-Feb-2019 12:42:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dataCollection_screen1_OpeningFcn, ...
                   'gui_OutputFcn',  @dataCollection_screen1_OutputFcn, ...
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


% --- Executes just before dataCollection_screen1 is made visible.
function dataCollection_screen1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dataCollection_screen1 (see VARARGIN)

% Choose default command line output for dataCollection_screen1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dataCollection_screen1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dataCollection_screen1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global username;  %need to access username for all 9 screens 
global round_num;

 round_num = get(handles.edit2,'String'); %edit2 being Tag of ur edit box
 if isempty(round_num)
   %fprintf('Error: Enter user name to proceed \n');
   f = errordlg('Enter round number to proceed', 'Input Error');
 else
   % Write code for computation you want to do 
   %disp('you entered');
   disp(round_num);
 end

username = get(handles.edit1,'String'); %edit1 being Tag of ur edit box
 if isempty(username)
   %fprintf('Error: Enter user name to proceed \n');
   f = errordlg('Enter user name to proceed', 'Input Error');
 else
   % Write code for computation you want to do 
   %disp('you entered');
   disp(username);
 end

 
 %disp(user_name);

if ~isempty(username) && ~isempty(round_num)
path_pos1 = 'E:/DataCollection/images_collected/1/';

%cam=webcam(2);  % '2' is to select the additional logitech webcam on my laptop
cam = webcam;  % 1, 2 can change with also...need to check it..before using..
pause(0.20);  % need to set this delay appropriately ...i have to move aside
img1 = snapshot(cam);

%imwrite(img1, 'H:/DataCollection/images_written/image1.png');
result1 = get_right_eye(img1);

prefix = [username, '_r_', round_num];

filename = strcat(prefix,'_1_1.png');

HImage=histeq(result1);
resized_right_eye1 = imresize(HImage, [40 65]);
imwrite(resized_right_eye1,fullfile(path_pos1,filename));

pause(0.20);
img2 = snapshot(cam);
result2 = get_right_eye(img2);

filename = strcat(prefix,'_1_2.png');

HImage=histeq(result2);
resized_right_eye2 = imresize(HImage, [40 65]);
imwrite(resized_right_eye2,fullfile(path_pos1,filename));

pause(0.20);
img3 = snapshot(cam);
result3 = get_right_eye(img3);

filename = strcat(prefix,'_1_3.png');

HImage=histeq(result3);
resized_right_eye2 = imresize(HImage, [40 65]);
imwrite(resized_right_eye2,fullfile(path_pos1,filename));


clear cam

end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hf=findobj('Name','CollectData');
close(hf);  %closes the first, collect data window

DataCollection_screen2;  %opens screen 2
img = imread('E:\DataCollection\dot_images_original\2.png');
imshow(img);
%display_images_1;
hf=findobj('Name','DataCollection_screen2');
movegui(hf,'center');  %moves the DataCollection_screen2 to the center of the screen



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


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
