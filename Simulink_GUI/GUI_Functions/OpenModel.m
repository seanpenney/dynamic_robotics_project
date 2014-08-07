% function OpenModel()
% 
% Description:
%   
% This function opens user-selected Simulink Model
%  
% Fields: None
% 
% Initial: None 
% 
% Final: None 
%

function OpenModel()

    file_name = uigetfile({'*.*','All Simulink Model Files, *.slx';});
        
    [pathstr, name, ext] = fileparts(file_name);
    
    if ~isempty(file_name) && strcmp(ext, '.slx') == 1

        % open the model 
        open_system(file_name);
        
        
    else

        errordlg('You selected the wrong file. This GUI only supports Simulink model files with extension .slx. Please try again.');
        
    end

end