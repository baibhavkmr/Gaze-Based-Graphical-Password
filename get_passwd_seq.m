function result = get_passwd_seq(emailid)
fid=fopen('H:\RegistrationAndAuthentication\emailid_passwd_seqs.txt');
num_of_lines =0;    %this function is used to find NO. of lines in the text file.
tline = fgetl(fid); % assuming that there is atleast one line in the file
num_of_lines = num_of_lines +1;
%disp(tline);
tlines = cell(0,1);
while ischar(tline)
    tlines{end+1,1} = tline;
    tline = fgetl(fid);
    num_of_lines = num_of_lines +1;
    %disp(tline);
end
fclose(fid);

num_of_lines = num_of_lines - 1;
disp(num_of_lines);
%tlines has all the lines 
%disp(tlines)
match_flag = 0;
for j=1:num_of_lines
    %disp(class(tlines));
    %disp(tlines(1));
    current_line = tlines(j);    
    current_line_str = string(current_line);
    line_contents = strsplit(current_line_str);
    emailid_field = line_contents(1);
    current_line_passwd_seq = (line_contents(2:4));  %only 3 images in passwd seq
    tf = strcmp(emailid_field,emailid);
    if(tf==1)
        match_flag = 1;
        disp('match found');
        result = current_line_passwd_seq;
        return ;
    end 
end

   result = 'no_match_found';  % if no match is found
   



% for each line we have check whether the first field (email_id) matches
%where ever there is a match retrieve the passwd img seq from that line and
%return that seq