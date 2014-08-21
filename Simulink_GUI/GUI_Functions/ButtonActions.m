% function ButtonActions( input_args )
%
% Description:
%
%  This function handles all button functionalities
%
% Fields: button_type
%
% Initial: button_type is a type string
%
% Final: none
%


function ButtonActions(button_type)

switch button_type
    
    case 'Stop'
        set_cmd('gui_disable_cmd');
        
    case 'EStop'
        set_cmd('gui_estop_cmd');
 
    case  'Go'
        set_cmd('gui_enable_cmd');
        
    case  'Restart'
        set_cmd('gui_reset_cmd');
        
    otherwise
        disp('Something went wrong');
        
        
end
end


function set_cmd(cmd)

assignin('base', cmd, 1);
set_param('atrias_system', 'SimulationCommand', 'Update');
assignin('base', cmd, 0);

end

