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

     list_blocks_in_model = find_system(model_name);
     
     


















end