function [list]=Litrack_deviceKey(code)

len = length(code);

list = cell(len,1);

for i = 1:len
    
    var = abs(code(i));
    
    switch var
        case  1
            txt = 'Do Nothing';
            
        case 10
            txt = 'Linac';
            
        case 7
            txt = 'Chicane';
            
        case 17
            txt = 'CSR';
            
        case 15
            txt = 'Resistive-wall wakefield';
            
        case 6
            txt = 'Compressor';
            
        case 99
            txt = 'End of Beamline';
            
        case 11
            txt = 'Linac';
            
        case 22
            txt = 'Energy Spread';
            
        case 27
            txt = 'Constant-dN/N dE/E cuts';
            
    end
    
    list{i} = txt;
end