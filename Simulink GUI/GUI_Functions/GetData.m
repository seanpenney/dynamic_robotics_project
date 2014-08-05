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
%

function block_data = GetData(model)

    Model_Initialization_Check(model);
    
    % Get all blocks in model 
    BlockPaths = find_system('torquecontrol','Type','Block');
     
    % if the model is not running, get and return the initial values of the
    % model 
    
    model_status = get_param('model_name','SimulationStatus');
    
    if strcmp(model_status, 'stopped') == 1   
        
        % find blocks that display data on robot status on GUI, so far the
        % parameter values are dummies and subject to change; TODO
        
        found_block_leg_velocity = find_system(model,'Regexp', 'on', 'BlockDialogParams','leg velocity');
        
        
   
    else 
        
        
    
    end
   
  
    % return the data 





end