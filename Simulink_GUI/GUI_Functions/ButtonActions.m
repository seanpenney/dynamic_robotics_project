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

           gui_disable_cmd = 1;

        case 'EStop'
            
            
            %TODO
            
        case  'Go'
            
            gui_enable_cmd = 1;
      
        case  'Restart'
 
            gui_reset_cmd = 1; 

        otherwise

            disp('Something went wrong');


    end

end

