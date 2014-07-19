function OpenModel()

    filename = uigetfile({'*.*','All Simulink Model Files, *.slx';});
        
    [pathstr, name, ext] = fileparts(filename);
    
    if ~isempty(filename) && strcmp(ext, '.slx') == 1

        open_system(filename);
        
    else

        errordlg('You selected the wrong file. This GUI only supports Simulink model files with extension .slx. Please try again.');
        
    end

end