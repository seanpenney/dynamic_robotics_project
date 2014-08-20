% function error_status = OpenModel()
% 
% Description:
%   
% This function opens user-selected Simulink Model
%  
% Fields: None
% 
% Initial: None 
% 
% Final: Returns an integer error status. 0 for success, 1 for failure. 
%

function error_status = OpenModel(handles)

    [file_name, file_name_path] = uigetfile({'*.*','All Simulink Model Files, *.slx';});
      
    if file_name ~= 0
        
        [pathstr, name, ext] = fileparts(file_name);
  
        if  strcmp(ext, '.slx') == 1
            
            file_full_path = strcat(file_name_path, file_name);
            
            % open the model
            open_system(file_full_path);
            load_system(file_full_path);
            set(handles.edit2, 'String', file_name);
            error_status = 0;
        
        else

            errordlg('You selected the wrong file. This GUI only supports Simulink model files with extension .slx. Please try again.');
            error_status = 1;
            return
       
        end
        
    else
        
        error_status = 1;
        return
        
    end

end