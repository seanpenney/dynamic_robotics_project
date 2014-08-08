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

    load_system('leg.slx'); % load model for performing button actions
    
  
    switch button_type

        case 'Stop'

            SetBlock('leg/Safety/GUI Stop/Stop');

        case 'EStop'
            
            
            
            
            
            

        case  'Go'

            SetBlock('leg/Safety/Reset');

        case  'Restart'

            SetBlock('');


        otherwise

            disp('Something went wrong');


    end

end

function SetBlock(block_name)

    % Set Block Parameters
    set_param(block_name, 'Value', num2str(1))
    pause(0.1);
    set_param(block_name, 'Value', num2str(0))


end

