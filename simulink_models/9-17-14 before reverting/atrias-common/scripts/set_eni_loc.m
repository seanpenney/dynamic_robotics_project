% Set the proper path for the EtherCAT Master block's ENI file in the DAQ block
set_param('DAQ/EtherCAT Init', 'config_file', [fileparts(mfilename('fullpath')) '/../models/atrias_boom.xml'])
