function [newTable] = convertUitable(handles)

%This function grabs the Uitable and converts it into a format more similar
%to the beamline parameters matrix.
dat  = handles.table1.Data;

for j = 1:5
    for i =1:25
        if j == 1
            newTable.Vals{i,j}=dat{i,j};
        else
            k=2*j+j-2;
            newTable.Vals{i,j}=dat{i,k};
        end
    end
end

for j = 1:5
    for i =1:25
        if j == 1
            newTable.Logic{i,j}=dat{i,j+1};
        else
            k=2*j+j-1;
            newTable.Logic{i,j}=dat{i,k};
        end
    end
end

for j = 1:5
    for i = 1:25
        if j == 1
            newTable.Delta{i,j} = dat{i,j+2};
        else
            k=2*j+j;
            newTable.Delta{i,j} = dat{i,k};
        end
    end
    
end
