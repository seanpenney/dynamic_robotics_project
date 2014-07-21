% function Model_Initialization_Check(model_name)
% 
% Description:
%  
% This function checks whether the Simulink Model model_name is opened. 
% If not, the function warns the user and let the user open the model_name
%  
% Fields: model_name
% 
% Initial: model_name must be a string
% 
% Final: none 
%
function Model_Initialization_Check(model_name)

    % Get all the currently opened models 
    opened_models = find_system('SearchDepth',0);
    
    model_index = find(ismember(opened_models,'torquecontrol'));
    
    if isempty(model_index)
        
        model_error_message = sprintf('Your %s is not opened, please open it!', model_name);
        message_box_handle = msgbox(model_error_message);
        
        if message_box_handle == 1 % wait until user click ok on box handle
        
            OpenModel;
        
        end
   
    end
  
end