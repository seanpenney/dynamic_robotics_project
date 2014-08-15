% This contains parameters for the position controller

% Hip and leg saturation parameters
hip_sat = 60;
leg_sat = 120;

% Gains
leg_p = 500;
leg_d = 40;
hip_p = 1500;
hip_d = 10;

% Safety control
sat_estops = false;

w = 1;
aamp = 0.4;
aoffset = pi;
daamp = 0.3;
daoffset = 0.6;