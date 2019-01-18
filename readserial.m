% Socket pressor sensing project
% Albert Wu (wualbert@mit.edu)
% 2019 January

clear all;
s = serial('/dev/cu.usbmodem14501'); % select port based on PC config.
fopen(s); % connect to the device

% Prompt for recording datapoints
data_points = 100;
prompt = 'Enter number of data points to record \n';
data_points = input(prompt);
values = zeros(data_points,0);

% Open CSV
time_stamp = datestr(datetime('now')) % store data in csv with timestamp as name

for i=1:data_points
    txt = fgetl(s);
    values(i) = str2double(txt);
    
end

csvwrite(time_stamp, values); % write to csv

% Cleanup
fclose(s);
delete(s);
clear s;