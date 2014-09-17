%%% Script for initializing basic file logging and target machine scopes.
%   Logs at 250 Hz by default, change logging_freq to modify this.
%   Tracks positions, velocities, torque commands, and some diagnostics.
%   Also tweaks model sample time to ensure EtherCAT synchronization.

%% Augment target machine sample time to synchronize DC clocks
tg.SampleTime = 0.0009982;

%% Remove old scopes
scopes = tg.getscope();
if ~isempty(scopes) 
    scopes.stop;
    tg.remscope(1:size(scopes,1));
end

%% Path to data acquisition block
daq_path = 'atrias_system/DAQ/';

%% Setup core file scopes
logging_freq = 250;
decimation = update_freq / logging_freq;
num_samples = 1000;
number_of_fscopes = 3;
fscopes = [];
for i=1:number_of_fscopes
    fscopes = [fscopes tg.addscope('file')];
end
set(fscopes(1:number_of_fscopes), ...
    {'NumSamples', 'Decimation', 'WriteMode', 'AutoRestart', 'DynamicFileName'}, ...
    {num_samples,  decimation,  'Lazy',      'on',          'on'});

% Position data
set(fscopes(1),'FileName','E:\POS_<%%%>.dat');
% Positions
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s3'])); % right front leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s4'])); % right front gear
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s1'])); % right back leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s2'])); % right back gear
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s7'])); % left front leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s8'])); % left front gear
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s5'])); % left back leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s6'])); % left back gear
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s9'])); % right lateral
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s10'])); % left lateral
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s11'])); % boom roll 
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s12'])); % boom yaw 
fscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals/s13'])); % boom pitch 
% Velocities
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s3'])); % front right leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s4'])); % front right motor
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s1'])); % back right leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s2'])); % back right motor
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s7'])); % front left  leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s8'])); % front left motor
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s5'])); % back left leg
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s6'])); % back left motor
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s9'])); % right lateral
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s10'])); % left lateral
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s11'])); % boom roll 
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s12'])); % boom yaw 
fscopes(1).addsignal(getsignalid(tg,[daq_path 'dq_signals/s13'])); % boom pitch 

% Torque data
set(fscopes(2),'FileName','E:\TORQ_<%%%>.dat');
% Commanded torques
fscopes(2).addsignal(getsignalid(tg,[daq_path 'tau_cmd_signals/s1'])); 
fscopes(2).addsignal(getsignalid(tg,[daq_path 'tau_cmd_signals/s2'])); 
fscopes(2).addsignal(getsignalid(tg,[daq_path 'tau_cmd_signals/s3'])); 
fscopes(2).addsignal(getsignalid(tg,[daq_path 'tau_cmd_signals/s4'])); 
fscopes(2).addsignal(getsignalid(tg,[daq_path 'tau_cmd_signals/s5'])); 
fscopes(2).addsignal(getsignalid(tg,[daq_path 'tau_cmd_signals/s6'])); 
% Desired torques (requires actuator control model)
fscopes(2).addsignal(getsignalid(tg,'Control/Actuator Control/tau_desired_signals/s1')); % backR
fscopes(2).addsignal(getsignalid(tg,'Control/Actuator Control/tau_desired_signals/s2')); % frontR
fscopes(2).addsignal(getsignalid(tg,'Control/Actuator Control/tau_desired_signals/s3')); % latR
fscopes(2).addsignal(getsignalid(tg,'Control/Actuator Control/tau_desired_signals/s4')); % backL
fscopes(2).addsignal(getsignalid(tg,'Control/Actuator Control/tau_desired_signals/s5')); % frontL
fscopes(2).addsignal(getsignalid(tg,'Control/Actuator Control/tau_desired_signals/s6')); % latL

% Supervisory data
set(fscopes(3),'FileName','E:\SUPR_<%%%>.dat');
% Limit switches
fscopes(3).addsignal(getsignalid(tg,[daq_path 'sw/s2']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'sw/s4']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'sw/s6']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'sw/s8']));
% Error flags
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s1']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s2']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s3']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s4']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s5']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s6']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s7']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'error_flags/s8']));
% Ethercat info
fscopes(3).addsignal(getsignalid(tg,[daq_path 'EtherCAT Init/s1']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'EtherCAT Init/s2']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'EtherCAT Init/s3']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'EtherCAT Init/s4']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'EtherCAT Init/s5']));
fscopes(3).addsignal(getsignalid(tg,[daq_path 'EtherCAT Init/s6']));

fscopes.start();

%% Setup target scopes
decimation = update_freq / 250;
num_samples = 250;
number_of_tscopes = 2;
tscopes = [];
for i=1:number_of_tscopes
    tscopes = [tscopes tg.addscope('target')];
end
set(tscopes(1:number_of_tscopes), ...
    {'NumSamples', 'Decimation', 'TriggerMode', 'DisplayMode'}, ...
    {num_samples,  decimation,  'FreeRun',     'Numerical'});

% ATRIAS segment positions
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s1'])); % right back leg
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s2'])); % right back motor
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s3'])); % right front leg
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s4'])); % right front motor
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s5'])); % left back leg
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s6'])); % left back motor
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s7'])); % left front leg
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s8'])); % left front motor
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s9'])); % right lateral
tscopes(1).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s10'])); % left lateral

% Boom positions
tscopes(2).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s11'])); % boom roll
tscopes(2).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s13'])); % boom pitch
tscopes(2).addsignal(getsignalid(tg,[daq_path 'q_signals_degrees/s12'])); % boom yaw

tscopes.start();
