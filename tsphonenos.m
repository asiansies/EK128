fid = fopen('phonenos.dat');
if fid == -1
    disp('File open not successful')
else
    array = textscan(fid, '%s%s%s-%s%s%s-%s%s%s%s\n',[3,inf])
    disp(array(1:end))
end
close = fclose(fid);
if close == 0
    disp('File close unsuccessful')
end
