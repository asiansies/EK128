function units
choice = menu('Pick the unit you want to convert to','minutes','hours','days');
switch choice
    case 1
        sec2min
    case 2
        sec2hour
    case 3
        sec2day
end

print