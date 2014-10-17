% The system uses the DAQ; include DAQ parameters as well
daq_params_osu

% Spring constants
k_sea = 4118;%[4255.0 4525.3 4372.1 4322.4]; % [Nm/rad] (RB RF LB LF) (old value; 4118.3)

% Maximum velocity
safety_max_vel       = 8.0; % Maximum motor velocity, rad/s
safety_start_max_vel = 3.0; % Maximum motor velocity during startup, rad/s

% "Nominal" sample time -- the time the loop is actually running at.
% Differs from sample_time in that sample_time gets adjusted at runtime
% to make Simulink Realtime's EtherCAT Master happy
nom_sample_time = 0.001;