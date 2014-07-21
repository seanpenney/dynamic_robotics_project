% function OpenAndCloseBlockInSimuModel(block_name, simu_model_name)
%
% Description: 
%   This function is responsible for calling blocks within a specific
%   Simulink Model. 
%
% Fields: block_name, simu_model
%
% Pre-Condition: block_name and simu_model_name must be of type string
%
% Post-Condition: none 
%

function InteractWithBlocks(block_name, simu_model_name)

    % check if model is initialized 
    Model_Initialization_Check(simu_model_name);
    
    % check if block exists within the model
    
    Exist_block = CheckBlockExistence(simu_model_name, block_name);
    
    if Exist_block == 0 % block exists 
        
        open_system(block_name);
        
    else 
        
        errordlg('Your specified block does not exist in your model');
     
    end    
    
    
    









end