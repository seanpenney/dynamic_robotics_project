% Attach to the target computer file system.
f=SimulinkRealTime.fileSystem;

% Open the file, read the data, close the file.
h=f.fopen('E:\POS_001.DAT');
pos_data=f.fread(h);
f.fclose(h);
h=f.fopen('E:\TORQ_001.DAT');
torq_data=f.fread(h);
f.fclose(h);
h=f.fopen('E:\SUPR_001.DAT');
supr_data=f.fread(h);
f.fclose(h);

% Unpack the data.
pos = SimulinkRealTime.utils.getFileScopeData(pos_data);
torq = SimulinkRealTime.utils.getFileScopeData(torq_data);
supr = SimulinkRealTime.utils.getFileScopeData(supr_data);

%% Plot
clf;
close all;
t = pos.data(:,end);

%% Plot position data
% 1-13: smoothed encoder data
% 14-26: encoder velocities

% Leg Segment Positions (Smoothed)
plot_fscope('Leg Position',{t,t}, {pos.data(:,1:4)*180/pi,pos.data(:,5:8)*180/pi},...
    {{'qFront';'qFrontGear';'qBack';'qBackGear'},{'qFront';'qFrontGear';'qBack';'qBackGear'}},...
    {'Right Leg Position','Left Leg Position'},{'Time (sec)','Time (sec)'},{'Angle (degrees)','Angle (degrees)'},{[0 350],[0 350]},2);
% Leg Segment Velocities
plot_fscope('Leg Velocity',{t,t}, {pos.data(:,14:17)*180/pi, pos.data(:,18:21)*180/pi},...
    {{'dqFront';'dqFrontGear';'dqBack';'dqBackGear'},{'dqFront';'dqFrontGear';'dqBack';'dqBackGear'}},...
    {'Right Leg Velocity','Left Leg Velocity'},{'Time (sec)','Time (sec)'},...
    {'Velocity (degrees / sec)','Velocity (degrees / sec)'},{[-150, 150],[-150, 150]},2);
% Virtual Leg Length
right_leg_length = cos((pos.data(:,3)-pos.data(:,1))/2);
left_leg_length = cos((pos.data(:,7)-pos.data(:,5))/2);
plot_fscope('Virtual Leg Length',{t,t}, {right_leg_length, left_leg_length},...
    {{'Measured'},{'Measured'}},...
    {'Right Leg Length','Left Leg Length'},{'Time (sec)','Time (sec)'},...
    {'Length (m)','Length (m)'},{[0, 1],[0, 1]},2);
% Virtual Leg Angle
right_leg_angle = (pos.data(:,3)+pos.data(:,1))/2*180/pi;
left_leg_angle = (pos.data(:,7)+pos.data(:,5))/2*180/pi;
plot_fscope('Virtual Leg Angle',{t,t}, {right_leg_angle, left_leg_angle},...
    {{'Measured'},{'Measured'}},...
    {'Right Leg Angle','Left Leg Angle'},{'Time (sec)','Time (sec)'},...
    {'Angle (degrees)','Angle (degrees)'},{[90, 270],[90, 270]},2);
% Toros pitch
torso_pitch = pos.data(:,13)*180/pi;
plot_fscope('Torso Pitch',{t}, {[torso_pitch]},{{'Pitch'}},...
    {'Torso Pitch'},{'Time (sec)'},{'Angle (degrees)'},{[-30 30]},1);
% Lateral Positions
boom_roll = pos.data(:,11);
desired_lateral = (boom_roll - boom_mount_angle)*180/pi;
plot_fscope('Lateral Position',{t}, {[pos.data(:,9:10)*180/pi desired_lateral -desired_lateral]},{{'Right Measured';'Left Measured';'Right Desired';'Left Desired'}},...
    {'Lateral Leg Angles'},{'Time (sec)'},{'Angle (degrees)'},{[-30 30]},1);

% save data in 'data' directory
%hfigs = get(0, 'children');        %Get list of figures
%hgsave(hfigs,sprintf('figures/%s.fig',datestr(clock,'mmmm_dd_yyyy HH_MM_SS_AM')));
save(sprintf('data/%s',datestr(clock,'mmmm_dd_yyyy HH_MM_SS_AM')), 'pos', 'torq','supr');

