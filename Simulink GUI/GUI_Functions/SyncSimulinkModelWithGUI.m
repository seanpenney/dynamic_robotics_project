% function Model_Block_Values = SyncSimulinkModelWithGUI(model_name)
%
% Description: 
%
%  This function syncs the MATLAB GUI with the Simulink Model
%
% Fields: model_name
%
% Pre-Condition: model_name must be of type string
%
% Post-Condition: Returns List of values of the blocks inside the
% the user specified model_name
%

function Model_Block_Values = SyncSimulinkModelWithGUI(model_name)
   
     % create struct to store block names and values
     block_value_struct = struct();
          
     list_blocks_in_model = find_system(model_name);
     
     sz_list_blocks = size(list_blocks_in_model);
            
     for idx = 1:sz_list_blocks(1)
     
        block_value_struct(idx).name_of_block = list_blocks_in_model(idx);
        block_value_struct(idx).value_of_block = get_param(list_blocks_in_model(idx), );
         
         
         
         
         
         
         
     end



end