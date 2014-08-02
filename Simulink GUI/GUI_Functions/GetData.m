% function data_gotten = GetData
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

%% Function Not Complete
function block_data = GetData(model)

    Model_Initialization_Check(model);
    
    % Get all blocks in model 
    BlockPaths = find_system('torquecontrol','Type','Block');
     
    % if the model is not running, get the initial value and return
    
    z = get_param('model_name','SimulationStatus');
    
    if strcmp(z, 'stopped') == 1
        
        % get block value parameter
        for idx = 1:numel(BlockPaths)
        
            
            
            
                                   
        
        end
    
    end
    
    
    
    % get all values in the block during run time
     
    for idx = 1:numel(BlockPaths)
        
        % get values from each of the blocks
        
         
         
         
    end
  
    % return the data as a struct 





end