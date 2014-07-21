% function Existence = CheckBlockExistence(model_name, block_name)
%
% Description:
%  
% This function checks wheter a given block exists within the Simulink
% Model
%  
% Fields: model_name, block_name
% 
% Initial: model_name  and block_ name must be a string
% 
% Final: Returns 0 for true and 1 for false 
%

function Existence = CheckBlockExistence(model_name, block_name)

    block_list_of_system = find_system(model_name);
    
    ind = find(ismember(block_list_of_system, block_name));
    
    if isempty(ind)
        
        errordlg('Your block does not exist in this model!');
        Existence = 1;
        
    else 
        
        Existence = 0;
        
    end
  
end