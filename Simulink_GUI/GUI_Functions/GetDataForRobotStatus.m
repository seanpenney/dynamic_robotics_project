% function block_data = GetDataForRobotStatus(model)
% 
% Description:
%   
% Gets all of the data from the Simulink Model for GUI display 
%  
% Fields: model
% 
% Initial: model must be a string
% 
% Final: outputs a struct with parameters model name(s) and its value(s)
%
%

function block_data = GetDataForRobotStatus(model)

    Model_Initialization_Check(model);
    
    % Get all blocks in model 
    BlockPaths = find_system('torquecontrol','Type','Block');
     
    % if the model is not running, get and return the initial values of the
    % model 
    
    model_status = get_param('model_name','SimulationStatus');
    
    if strcmp(model_status, 'stopped') == 1   
        
        for idx = 1:BlockPaths
           
            
            
            
            
        end
        
   
    else 
        
        for idx = 1:BlockPaths
           
            
            
            
            
        end
  
    end
   
  
    % return the data 





end