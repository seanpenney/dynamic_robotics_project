%%% Parameters for the mechanical model of ATRIAS

%% Environment
g = 9.803; % m/s

%% Boom
m_boom = 4.49; % kg
l_boom = 1.8161; % m
m_counter_weight = 24.05; % kg
h_boom = 0.99; % m
% boom mount offsets
boom_mount_angle = 7.2824 * pi/180; % rad
d_x_mount_offset = 0.2225; % m
d_y_mount_offset = d_x_mount_offset * tan(boom_mount_angle); % m
d_l_mount_offset = d_x_mount_offset / cos(boom_mount_angle); % m
l_boom_projected = l_boom+d_l_mount_offset; % distance of boom projected to frontal centerline

%% Series Elastic Actuators
k_sea = [4255.0 4525.3 4372.1 4322.4]; % [Nm/rad] (RB RF LB LF) (old value; 4118.3)

%% Saggital Motion
j_rotor = 1.5e-3;
j_motor = j_rotor*LEG_MTR_GEAR_RATIO^2;
j_leg = 2*0.147;
j_segments = [0.145 0.155 0.145 0.155];
% RB: 27.83, RF: 27.83, LB: 26.37-27.34, LF: 26.37-27.34
% k_sea ./ (2*pi*25.72)^2 ; % Effective inertia = k_leg_spring / (2*pi*f_nat)^2 / gear_ratio^2 [f_nat = natural frequency obtained from vibration of SEA springs]
m_leg_motor = 18; % kg

%% Lateral Motion
lateral_offset = 0.2; % m
r_hip_gearhead = 0.009525;
r_hip_shaft = 0.542925;
N_hip = r_hip_shaft / r_hip_gearhead;

%% Legs
l_seg = 0.5; % m

%% Full Robot
m_total_real = 59.65; % kg (measured with boom attached)
m_total = m_total_real - m_counter_weight; % kg
i_robot = 2.2; % kg m^2
d_y_mount_to_hip = 0.318; % m
d_y_com = 0.1; % m (distance above saggital rotation point)
d_y_mount_to_com = d_y_mount_to_hip - d_y_com; % m
d_y_boom_com_offset = d_y_mount_offset + d_y_mount_to_com; % offset from (boom attachment projected onto frontal center) to (center of mass)
d_y_boom_hip_offset = d_y_boom_com_offset + d_y_com; % offset from (boom attachment projected onto frontal center) to (hip rotation point)

g_reduced = (m_total_real-m_counter_weight)/m_total_real*g;