% function HistoryLogDisplay(history)
% 
% Description:
%   
% Displays a history log of data logged during experiment 
%  
% Fields: history
% 
% Initial: history must be a struct containing fields of data log
% 
% Final: None 
%

function HistoryLogDisplay(history)

    for i=1:length(d)
    
        data_input{i,1} = history(i).timestamp;
        data_input{i,2} = history(i).task;
        data_input{i,3} = history(i).executiontime;
        data_input{i,4} = history(i).whatever;       
    
    end
    
    % create the uimulticollist
    h = uimulticollist ( 'units', 'normalized', 'position', [0 0 1 1], ...
                         'string', data_input, ... 
                         'columnColour', { 'RED' 'RED' 'BLUE' 'BLACK' 'GREEN' } );
    
    % now add a header
    header = { '' 'Time Stamp' 'Task' 'Execution Time' 'Whatever' };
    uimulticollist ( h, 'addRow', header, 1 );   
    
    % add an extra column
    nItems = uimulticollist ( h, 'nRows' );
    uimulticollist ( h, 'addCol', [0:nItems-1], 1, 'GREEN' );
    
    % change a unique item
    uimulticollist ( h, 'changeItem', 'Task Number', 1, 1 );
 

end