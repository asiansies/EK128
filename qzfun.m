function qzfun(str)
persistent mystring
if isempty(mystring)
    mystring = 'x';
end
mystring = strcat(mystring,str);
fprintf('The string is %s\n', mystring)
