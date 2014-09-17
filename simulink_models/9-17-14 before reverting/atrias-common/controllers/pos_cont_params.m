% This contains parameters for the position controller

% Hip and leg saturation parameters
hip_sat = 50;
leg_sat = 60;

% Gains
leg_p = 5000;
leg_d = 160;
hip_p = 1500;
hip_d = 10;

% Targets
splay_ang = 40;

% Safety control
sat_estops = false;
