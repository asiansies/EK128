fid = fopen('xypts.dat');
if fid == -1
    disp('File open not successful')
else
    for i = (1:end)
        pn(i) = fgetl(fid);
        [x rest] = strtok(fid);
        [xcoord rest2] = strtok(rest);
        [y ycoord] = strtok(rest2);
    end
    plot(xcoord,ycoord)
close = fclose(fid);
if close == 0
    disp('File close unsuccessful')
else 
    disp('File closed')
end
end