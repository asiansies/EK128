%Ths script will display whether the condition of an aircraft is subsonic,
%transonic, or supersonic.

speed = input('Please enter the speed of the aircraft: ');
sound = input('Please enter the speed of sound at the altitude of the aircraft: ');
mach = (speed/sound);

if mach > 1
    disp('The condition is: supersonic.')
else
    if mach == 1 
        disp('The condition is: transonic.')
    else
        if mach < 1
            disp('The condition is: supersonic.')
        end
    end
end