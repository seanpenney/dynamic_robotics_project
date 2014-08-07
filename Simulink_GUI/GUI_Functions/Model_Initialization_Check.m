% function Model_Initialization_Check(model_name)
% 
% Description:
%  
% This function checks whether the Simulink Model model_name is opened or loaded. 
% If not, the function warns the user and let the user open the model_name
%  
% Fields: model_name
% 
% Initial: model_name must be a string
% 
% Final: none 
%
function status = Model_Initialization_Check(model_name)

    % get all the currently opened models 
    opened_models = find_system('SearchDepth',0);
    
    % check if model is open
    model_index = find(ismember(opened_models, model_name));
    
    % check if model is loaded
    isLoaded = bdIsLoaded(model_name);
    
    if isempty(model_index)
        
        if isLoaded == 0
        
            model_error_message = sprintf('Your %s is not loaded, please select the model you want to load!', model_name);
            message_box_handle = msgbox(model_error_message);

            if message_box_handle == 1 % wait until user click ok on box handle

                OpenModel;
                status = 0;

            end

        else 
            
            status = 1;
            return
         
        end
            
   
    end
  
end