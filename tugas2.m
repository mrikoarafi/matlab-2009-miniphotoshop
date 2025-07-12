function varargout = tugas2(varargin)
% Fungsi utama GUI, inisialisasi dan pemanggilan utama aplikasi tugas2
%      tugas2, by itself, creates a new tugas2 or raises the existing
%      singleton*.
%
%      H = tugas2 returns the handle to a new tugas2 or the handle to
%      the existing singleton*.
%
%      tugas2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in tugas2.M with the given input arguments.
%
%      tugas2('Property','Value',...) creates a new tugas2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugas2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugas2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugas2

% Last Modified by GUIDE v2.5 16-Jun-2025 00:01:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugas2_OpeningFcn, ...
                   'gui_OutputFcn',  @tugas2_OutputFcn, ...
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


% --- Executes just before tugas2 is made visible.
function tugas2_OpeningFcn(hObject, eventdata, handles, varargin)
% Fungsi callback yang dijalankan saat GUI pertama kali dibuka
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugas2 (see VARARGIN)

% Choose default command line output for tugas2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugas2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tugas2_OutputFcn(hObject, eventdata, handles) 
% Fungsi untuk mengembalikan output ke command window
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function brightness_Callback(hObject, eventdata, handles)
% Callback slider brightness, mengatur kecerahan gambar
brightness_value = get(hObject,'Value');
set(handles.contrast,'Value',0); % reset slider contrast saat brightness diubah
% process
I_edit = handles.gui.I;
bright_I(:,:,1) = uint8( bound( double(I_edit(:,:,1)) + brightness_value ) ) ;
bright_I(:,:,2) = uint8( bound( double(I_edit(:,:,2)) + brightness_value ) ) ;
bright_I(:,:,3) = uint8( bound( double(I_edit(:,:,3)) + brightness_value ) ) ;
handles.gui.bright_I = bright_I;
imshow(bright_I);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function brightness_CreateFcn(hObject, eventdata, handles)
% Callback saat slider brightness dibuat, mengatur tampilan awal slider
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function contrast_Callback(hObject, eventdata, handles)
% Callback slider contrast, mengatur kontras gambar
contrast_value = get(hObject,'Value');
set(handles.brightness,'Value',0); % reset slider brightness saat contrast diubah
% process
I_edit = handles.gui.I;
contrast_I(:,:,1) = uint8( bound( double(I_edit(:,:,1)) + contrast_value ) ) ;
contrast_I(:,:,2) = uint8( bound( double(I_edit(:,:,2)) + contrast_value ) ) ;
contrast_I(:,:,3) = uint8( bound( double(I_edit(:,:,3)) + contrast_value ) ) ;
handles.gui.contrast_I = contrast_I;
imshow(contrast_I);
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function contrast_CreateFcn(hObject, eventdata, handles)
% Callback saat slider contrast dibuat, mengatur tampilan awal slider
% hObject    handle to contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in bright_ok.
function bright_ok_Callback(hObject, eventdata, handles)
% Callback tombol OK brightness, menyimpan perubahan brightness ke gambar utama
set(handles.brightness,'Value',0);
set(handles.contrast,'Value',0); % reset slider contrast ke tengah
handles.gui.I = handles.gui.bright_I;
guidata(hObject, handles);



% --- Executes on button press in contrast_ok.
function contrast_ok_Callback(hObject, eventdata, handles)
% Callback tombol OK contrast, menyimpan perubahan contrast ke gambar utama
set(handles.contrast,'Value',0);
set(handles.brightness,'Value',0); % reset slider brightness ke tengah
handles.gui.I = handles.gui.contrast_I;
guidata(hObject, handles);


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% Callback tombol close, menutup aplikasi GUI
close



function namafile_Callback(hObject, eventdata, handles)
% Callback edit text nama file, menangani input nama file dari user
% hObject    handle to namafile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namafile as text
%        str2double(get(hObject,'String')) returns contents of namafile as a double


% --- Executes during object creation, after setting all properties.
function namafile_CreateFcn(hObject, eventdata, handles)
% Callback saat edit text nama file dibuat, mengatur tampilan awal
% hObject    handle to namafile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cari.
function cari_Callback(hObject, eventdata, handles)
% Callback tombol cari, membuka dialog untuk memilih file gambar
%browse file
[filename,pathname] = uigetfile('*.jpg','Pilih File');
%cek file name
if isequal([filename,pathname],[0,0])
return 
else
fullpath = fullfile(pathname,filename);
handles.gui.fullpath = fullpath;
handles.gui.filename = filename;
handles.gui.pathname = pathname;
%tuliskan nama file pada bagian edit text
set(handles.namafile,'String',handles.gui.fullpath);
guidata(hObject, handles);
end



% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% Callback tombol load, menampilkan gambar yang dipilih ke GUI
addpath(handles.gui.pathname);
I = imread(handles.gui.filename);
handles.gui.I = I;
handles.gui.original_I = I; % Simpan gambar asli
handles.gui.alpha = [];     % Reset alpha jika ada
imshow(I);
guidata(hObject, handles);


% --- Executes on button press in simpan.
function simpan_Callback(hObject, eventdata, handles)
% Callback tombol simpan, menyimpan gambar hasil edit ke file baru
[FileName, PathName] = uiputfile({'*.png';'*.jpg'}, 'Save As');
if PathName==0
    return; 
end
Name = fullfile(PathName, FileName);
if isfield(handles.gui, 'alpha') && ~isempty(handles.gui.alpha) && ~isempty(strfind(lower(FileName), '.png'))
    % Simpan dengan alpha channel jika ada dan format PNG
    imwrite(handles.gui.I, Name, 'png', 'Alpha', handles.gui.alpha);
else
    % Simpan tanpa alpha channel
    imwrite(handles.gui.I, Name);
end
guidata(hObject, handles);


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% Callback slider4 (tidak digunakan/placeholder)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% Callback saat slider4 dibuat, mengatur tampilan awal slider4
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in crop_diamond.
function crop_diamond_Callback(hObject, eventdata, handles)
% Crop gambar dengan bentuk diamond, hasilkan alpha channel
if isfield(handles.gui, 'original_I')
    I = handles.gui.original_I;
else
    I = handles.gui.I;
end
mask = diamond_mask(size(I,1), size(I,2));
I_crop = I;
for k = 1:size(I,3)
    channel = I(:,:,k);
    channel(~mask) = 0;
    I_crop(:,:,k) = channel;
end
alpha = uint8(mask)*255;
handles.gui.I = I_crop;
handles.gui.alpha = alpha;
imshow(I_crop);
guidata(hObject, handles);

% --- Executes on button press in crop_triangle.
function crop_triangle_Callback(hObject, eventdata, handles)
% Crop gambar dengan bentuk segitiga, hasilkan alpha channel
if isfield(handles.gui, 'original_I')
    I = handles.gui.original_I;
else
    I = handles.gui.I;
end
mask = triangle_mask(size(I,1), size(I,2));
I_crop = I;
for k = 1:size(I,3)
    channel = I(:,:,k);
    channel(~mask) = 0;
    I_crop(:,:,k) = channel;
end
alpha = uint8(mask)*255;
handles.gui.I = I_crop;
handles.gui.alpha = alpha;
imshow(I_crop);
guidata(hObject, handles);

% --- Executes on button press in crop_star.
function crop_star_Callback(hObject, eventdata, handles)
% Crop gambar dengan bentuk bintang, hasilkan alpha channel
if isfield(handles.gui, 'original_I')
    I = handles.gui.original_I;
else
    I = handles.gui.I;
end
mask = star_mask(size(I,1), size(I,2));
I_crop = I;
for k = 1:size(I,3)
    channel = I(:,:,k);
    channel(~mask) = 0;
    I_crop(:,:,k) = channel;
end
alpha = uint8(mask)*255;
handles.gui.I = I_crop;
handles.gui.alpha = alpha;
imshow(I_crop);
guidata(hObject, handles);

% --- Executes on button press in crop_circle.
function crop_circle_Callback(hObject, eventdata, handles)
% Crop gambar dengan bentuk lingkaran, hasilkan alpha channel
if isfield(handles.gui, 'original_I')
    I = handles.gui.original_I;
else
    I = handles.gui.I;
end
mask = circle_mask(size(I,1), size(I,2));
I_crop = I;
for k = 1:size(I,3)
    channel = I(:,:,k);
    channel(~mask) = 0;
    I_crop(:,:,k) = channel;
end
alpha = uint8(mask)*255;
handles.gui.I = I_crop;
handles.gui.alpha = alpha;
imshow(I_crop);
guidata(hObject, handles);

% --- Executes on button press in crop_polygon.
function crop_polygon_Callback(hObject, eventdata, handles)
% Crop gambar dengan bentuk poligon, hasilkan alpha channel
if isfield(handles.gui, 'original_I')
    I = handles.gui.original_I;
else
    I = handles.gui.I;
end
mask = polygon_mask(size(I,1), size(I,2));
I_crop = I;
for k = 1:size(I,3)
    channel = I(:,:,k);
    channel(~mask) = 0;
    I_crop(:,:,k) = channel;
end
alpha = uint8(mask)*255;
handles.gui.I = I_crop;
handles.gui.alpha = alpha;
imshow(I_crop);
guidata(hObject, handles);

% --- Executes on button press in kamera.
function kamera_Callback(hObject, eventdata, handles)
% Callback tombol kamera, menampilkan preview kamera/webcam
try
    % Cek dan hentikan kamera yang sedang berjalan
    if isfield(handles, 'vid') && ~isempty(handles.vid)
        try
            stoppreview(handles.vid);
            delete(handles.vid);
        catch
            % Abaikan error jika objek sudah tidak ada
        end
    end
    
    info = imaqhwinfo('winvideo');
    formats = info.DeviceInfo(1).SupportedFormats;
    idx320 = find(~cellfun('isempty', strfind(formats, '320x240')), 1);
    if ~isempty(idx320)
        vidFormat = formats{idx320};
    else
        vidFormat = formats{1};
    end
    vid = videoinput('winvideo', 1, vidFormat);
    handles.vid = vid;
    guidata(hObject, handles);
    preview(vid);
catch ME
    errordlg(['Tidak dapat mengakses kamera: ' ME.message],'Kamera Error');
end



% --- Executes on button press in potret.
function potret_Callback(hObject, eventdata, handles)
% Callback tombol potret, mengambil gambar dari kamera
try
    if isfield(handles, 'vid') && ~isempty(handles.vid)
        img = getsnapshot(handles.vid);
        % Coba konversi manual jika warna masih aneh (YUY2 ke RGB)
        if size(img,3)==3
            % Asumsi format YUY2: img(:,:,1)=Y, img(:,:,2)=Cb, img(:,:,3)=Cr
            try
                img_rgb = ycbcr2rgb(img);
            catch
                % Jika ycbcr2rgb gagal, lakukan konversi manual
                Y = double(img(:,:,1));
                Cb = double(img(:,:,2)) - 128;
                Cr = double(img(:,:,3)) - 128;
                R = Y + 1.402 * Cr;
                G = Y - 0.344136 * Cb - 0.714136 * Cr;
                B = Y + 1.772 * Cb;
                img_rgb = uint8(cat(3, ...
                    min(max(R,0),255), ...
                    min(max(G,0),255), ...
                    min(max(B,0),255)));
            end
            img = img_rgb;
        end
        axes(handles.axes1);
        imshow(img, 'Parent', handles.axes1);
        handles.gui.I = img;
        handles.gui.original_I = img; % Simpan juga sebagai gambar asli untuk referensi
        handles.gui.alpha = [];       % Reset alpha jika ada
        guidata(hObject, handles);
    else
        errordlg('Kamera belum aktif. Tekan tombol Kamera dulu.','Potret Error');
    end
catch ME
    errordlg(['Gagal memotret: ' ME.message],'Potret Error');
end


% --- Executes on button press in stop_kamera.
function stop_kamera_Callback(hObject, eventdata, handles)
% Callback tombol stop kamera, menghentikan preview kamera dan membersihkan objek video
try
    if isfield(handles, 'vid') && ~isempty(handles.vid)
        % Hentikan preview jika sedang berjalan
        try
            stoppreview(handles.vid);
        catch
            % Preview mungkin sudah tidak aktif
        end
        
        % Hapus objek video input
        delete(handles.vid);
        handles.vid = [];
        
        % Update handles
        guidata(hObject, handles);
        
        % Tampilkan pesan sukses (opsional)
        % msgbox('Kamera berhasil dihentikan','Stop Kamera');
    else
        % Kamera sudah tidak aktif atau tidak pernah diaktifkan
        msgbox('Kamera tidak sedang aktif','Stop Kamera');
    end
catch ME
    errordlg(['Gagal menghentikan kamera: ' ME.message],'Stop Kamera Error');
end


% --- Executes on button press in apply_hex_color.
function apply_hex_color_Callback(hObject, eventdata, handles)
% Callback tombol apply hex color, menerapkan warna HEX dengan opacity ke gambar
try
    % Ambil nilai HEX dari edit text
    hex_value = get(handles.hex_edit,'String');
    
    % Validasi format HEX (harus dimulai dengan # dan 6 karakter)
    if length(hex_value) ~= 7 || hex_value(1) ~= '#'
        errordlg('Format HEX tidak valid. Gunakan format #RRGGBB','Format Error');
        return;
    end
    
    % Konversi HEX ke RGB
    hex_clean = hex_value(2:end); % hilangkan #
    r = hex2dec(hex_clean(1:2));
    g = hex2dec(hex_clean(3:4));
    b = hex2dec(hex_clean(5:6));
    
    % Pastikan ada gambar yang dimuat
    if ~isfield(handles.gui, 'I') || isempty(handles.gui.I)
        errordlg('Tidak ada gambar yang dimuat','Image Error');
        return;
    end
    
    I = handles.gui.I;
    [h, w, c] = size(I);
    
    % Buat layer warna dengan opacity rendah (30% opacity)
    opacity = 0.3;
    color_layer = zeros(h, w, 3, 'uint8');
    color_layer(:,:,1) = r;
    color_layer(:,:,2) = g;
    color_layer(:,:,3) = b;
    
    % Blend dengan gambar asli menggunakan alpha blending
    I_colored = uint8(double(I) * (1 - opacity) + double(color_layer) * opacity);
    
    % Simpan hasil dan tampilkan
    handles.gui.I = I_colored;
    imshow(I_colored);
    guidata(hObject, handles);
    
catch ME
    errordlg(['Error: ' ME.message],'Color Error');
end


% --- Executes during object creation, after setting all properties.
function hex_edit_CreateFcn(hObject, eventdata, handles)
% Callback saat edit text hex dibuat, mengatur tampilan awal
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function hex_edit_Callback(hObject, eventdata, handles)
% Callback edit text hex color, menangani input HEX dari user
% Hints: get(hObject,'String') returns contents of hex_edit as text

% ================= MASK GENERATOR FUNCTIONS =================

function mask = diamond_mask(h, w)
% Membuat mask diamond
[X, Y] = meshgrid(1:w, 1:h);
cx = w/2; cy = h/2;
mask = abs(X-cx)/cx + abs(Y-cy)/cy <= 1;

function mask = triangle_mask(h, w)
% Membuat mask segitiga sama sisi (menghadap ke atas)
mask = poly2mask([w/2 1 w], [1 h h], h, w);

function mask = star_mask(h, w)
% Membuat mask bintang 5 sudut
theta = linspace(0,2*pi,11);
r1 = min(h,w)/2*0.9;
r2 = r1/2.5;
cx = w/2; cy = h/2;
x = zeros(1,10); y = zeros(1,10);
for i=1:10
    if mod(i,2)==1
        r = r1;
    else
        r = r2;
    end
    x(i) = cx + r*cos(theta(i));
    y(i) = cy + r*sin(theta(i));
end
mask = poly2mask(x, y, h, w);

function mask = circle_mask(h, w)
% Membuat mask lingkaran
[X, Y] = meshgrid(1:w, 1:h);
cx = w/2; cy = h/2;
r = min(h,w)/2*0.9;
mask = (X-cx).^2 + (Y-cy).^2 <= r^2;

function mask = polygon_mask(h, w)
% Membuat mask poligon (hexagon)
n = 6; % jumlah sisi
theta = linspace(0,2*pi,n+1);
r = min(h,w)/2*0.9;
cx = w/2; cy = h/2;
x = cx + r*cos(theta);
y = cy + r*sin(theta);
mask = poly2mask(x, y, h, w);

% Tambahkan fungsi bound di bawah ini sebagai fungsi lokal
function y = bound(x)
% Fungsi lokal untuk membatasi nilai pixel antara 0 dan 255
%+++++++++++++++++++++++++++++++++++++++++++++++++++
%fungsi : membatasi nilai dari pixel rgb
%+++++++++++++++++++++++++++++++++++++++++++++++++++
    if x > 255 
        y = 255;
    elseif x < 0 
        y = 0;
    else
        y = x;
    end

% --- Executes on button press in set_hex.
function set_hex_Callback(hObject, eventdata, handles)
% Callback tombol apply hex color, menerapkan warna HEX dengan opacity dari slider
try
    % Ambil nilai HEX dari edit text
    hex_value = get(handles.hex_edit,'String');
    
    % Validasi format HEX (harus dimulai dengan # dan 6 karakter)
    if length(hex_value) ~= 7 || hex_value(1) ~= '#'
        errordlg('Format HEX tidak valid. Gunakan format #RRGGBB','Format Error');
        return;
    end
    
    % Konversi HEX ke RGB
    hex_clean = hex_value(2:end); % hilangkan #
    r = hex2dec(hex_clean(1:2));
    g = hex2dec(hex_clean(3:4));
    b = hex2dec(hex_clean(5:6));
    
    % Pastikan ada gambar yang dimuat
    if ~isfield(handles.gui, 'I') || isempty(handles.gui.I)
        errordlg('Tidak ada gambar yang dimuat','Image Error');
        return;
    end
    
    I = handles.gui.I;
    [h, w, c] = size(I);
    
    % Ambil opacity dari slider (bukan hardcode 0.3)
    opacity = get(handles.slider_hex,'Value');
    color_layer = zeros(h, w, 3, 'uint8');
    color_layer(:,:,1) = r;
    color_layer(:,:,2) = g;
    color_layer(:,:,3) = b;
    
    % Blend dengan gambar asli menggunakan alpha blending
    I_colored = uint8(double(I) * (1 - opacity) + double(color_layer) * opacity);
    
    % Simpan hasil dan tampilkan
    handles.gui.I = I_colored;
    imshow(I_colored);
    guidata(hObject, handles);
    
catch ME
    errordlg(['Error: ' ME.message],'Color Error');
end


% --- Executes on slider movement.
function slider_hex_Callback(hObject, eventdata, handles)
% Callback slider hex opacity, mengatur opacity warna HEX secara real-time (preview only)
try
    % Ambil nilai HEX dari edit text
    hex_value = get(handles.hex_edit,'String');
    
    % Validasi format HEX
    if length(hex_value) ~= 7 || hex_value(1) ~= '#'
        return; % Tidak ada error dialog, hanya return
    end
    
    % Pastikan ada gambar yang dimuat
    if ~isfield(handles.gui, 'original_I') || isempty(handles.gui.original_I)
        return;
    end
    
    % Konversi HEX ke RGB
    hex_clean = hex_value(2:end);
    r = hex2dec(hex_clean(1:2));
    g = hex2dec(hex_clean(3:4));
    b = hex2dec(hex_clean(5:6));
    
    % Ambil opacity dari slider (0.0 - 1.0)
    opacity = get(hObject,'Value');
    
    I = handles.gui.original_I;
    [h, w, c] = size(I);
    
    % Buat layer warna
    color_layer = zeros(h, w, 3, 'uint8');
    color_layer(:,:,1) = r;
    color_layer(:,:,2) = g;
    color_layer(:,:,3) = b;
    
    % Blend dengan gambar asli (HANYA PREVIEW, tidak disimpan)
    I_preview = uint8(double(I) * (1 - opacity) + double(color_layer) * opacity);
    
    % Tampilkan preview TANPA menyimpan ke handles.gui.I
    imshow(I_preview);
    % TIDAK ada guidata di sini agar perubahan tidak tersimpan
    
catch ME
    % Silent error handling untuk slider
end


% --- Executes during object creation, after setting all properties.
function slider_hex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_hex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
