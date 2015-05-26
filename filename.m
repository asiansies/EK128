function filename
%Will prompt user separately for filename and extension and return the
%name.

name = input('Enter the file name: ','s');
ext = input('Enter the extension: ','s');

filename = strcat(name,'.',ext)


end

