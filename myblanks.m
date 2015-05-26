function blank = myblanks(num)
%Will imitate the blanks function.

if num > 0
    for i = 1:num
        blank(i) = ' ';
    end
else
    blank = [];
end

end

