% Set the proper path for the EtherCAT Master block's ENI file in the DAQ block
set_param('atrias_system/EtherCAT Init', 'config_file', [fileparts(mfilename('fullpath')) '/../models/atrias_with_boom_and_imu.xml'])
