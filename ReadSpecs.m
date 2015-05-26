function [outstruct] = ReadSpecs(file)
%This function receives a filename as input and returns the engine
%component values
fid = fopen(file);
data = [];
if fid == -1
    disp('File open not successful')
else
    header = fgetl(fid);
    header2 = fgetl(fid);
    while strcmp(header,header2) == 0       %Compares strings and gets value.
        [first rest1] = strtok(header2);
        [num rest2] = strtok(rest1);
        num = str2num(num);
        data = [data num];
        header2 = fgetl(fid);
    end
   
    outstruct = struct('BurnT',data(1),'Mdot',data(2));
    if numel(data) == 3
        outstruct = struct('BurnT',data(1),'Mdot',data(2),'Bypass',data(3));
    end

    rstdata = textscan(fid, '%s %s %s %s');
    for i = 2:length(rstdata{1})            %Stores data in structures.
        if strcmp(rstdata{2}{i},'##') == 0
            eval(sprintf('outstruct.%s.%s = %s',rstdata{1}{i},rstdata{2}{1},rstdata{2}{i}));
        end
        if strcmp(rstdata{3}{i},'##') == 0
            eval(sprintf('outstruct.%s.%s = %s',rstdata{1}{i},rstdata{3}{1},rstdata{3}{i}));
        end
        if strcmp(rstdata{4}{i},'##') == 0
            eval(sprintf('outstruct.%s.%s = %s',rstdata{1}{i},rstdata{4}{1},rstdata{4}{i}));
        end
       
end
    end
 

closeresult = fclose(fid);
if closeresult ~= 0;
    disp('file close not successful')
end
end