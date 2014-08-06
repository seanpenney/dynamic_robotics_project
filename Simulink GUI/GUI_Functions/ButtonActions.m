% function ButtonActions( input_args )
% 
% Description:
%   
% 
% Fields: model
% 
% Initial: button_type has to be a string type 
% 
% Final: none 
%
%

function ButtonActions(button_type)

    % 
    switch button_type
        
        case 'Stop'

            load_system(); % load stop model
    
        case 'EStop'

            load_system(); % load EStop model
            
        
        case  'Go '



        case  'Restart '


        otherwise 
            
            disp('Something went wrong');
    
    
    end

end

