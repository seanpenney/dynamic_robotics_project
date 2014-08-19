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

function OpenModel(handles)

    file_name = uigetfile({'*.*','All Simulink Model Files, *.slx';});
    
    if file_name ~= 0
        
        [pathstr, name, ext] = fileparts(file_name);
    
        if  strcmp(ext, '.slx') == 1

            % open the model
            open_system(file_name);
            load_system(file_name);
            set(handles.edit2, 'String', file_name);
        
        
        else

            errordlg('You selected the wrong file. This GUI only supports Simulink model files with extension .slx. Please try again.');
        
        end
        
    end

end