% Socket pressor sensing project
% Albert Wu (wualbert@mit.edu)
% 2019 January

clear all;
s = serial('/dev/cu.usbmodem14401'); % select port based on PC config.
fopen(s); % connect to the device

% Prompt for recording datapoints
data_points = 100;
prompt = 'Enter number of data points to record \n';
data_points = input(prompt);
values = zeros([data_points,2]);

% Open CSV
time_stamp = datestr(datetime('now')); % store data in csv with timestamp as name

value = strsplit(fgetl(s),',');
time_offset = str2double(value(1));
values(1,1) = 0;
values(1,2) = str2double(value(2));


for i=2:data_points
    value = strsplit(fgetl(s),',');
    values(i,1) = str2double(value(1))-time_offset;
    values(i,2) = str2double(value(2));
end

csvwrite(time_stamp, values); % write to csv
% Format: time(ms), value

% Cleanup
fclose(s);
delete(s);
clear s;