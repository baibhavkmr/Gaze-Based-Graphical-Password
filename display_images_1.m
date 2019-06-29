function display_images_1()
global email_id;
global four_random_numbers;
global passwd_seq;

passwd_seq = get_passwd_seq(email_id); % gets the passwd  seq that matches this email_id in the file

tf = strcmp(passwd_seq,'no_match_found');
if tf==1
    disp('no match was found');
    return;
end


%disp(passwd_seq);
%disp(class(passwd_seq));  %string

passwd_img_id = passwd_seq(1);  % first img id in passwd img  sequence

%disp(passwd_img_id);

bfile_names = get_random_nums_in_range;


%disp('randomly generated base file names:');
%disp(bfile_names);
%disp(class(bfile_names));

%imgCell = cell(3);
%disp('image file names');
for i=1:9
    img_file_name = strcat(num2str(bfile_names(i)),'.png') ;
    %disp(img_file_name);
    imgCell{i} = img_file_name;
end

%disp(imgCell);
    
%imgCell = {im1,im2,im3,im4,im5,im6,im7,im8,im9};

four_random_numbers = get_4_random_numbers;
%disp(four_random_numbers);
%disp(class(four_random_numbers));

vec = strsplit(four_random_numbers);
random_pos1 = vec(1);

%disp(random_pos1);
%disp(class(random_pos1));

imgCell{str2double(random_pos1)} = strcat(passwd_img_id,'.png') ; % replaces the image at random  pos with passwd img

%imgCell{str2double(random_pos1)} = strcat('100','.png') ;

montage(imgCell, 'Size', [3  3]);
%img = imread(im1);
%imshow('00001.png');
end 
