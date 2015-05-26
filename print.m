function print(deg,radians)

fprintf(' %.2d degrees is %.2d radians\n',deg, radians)

end

function radians = degstorads(deg)

radians = deg*pi/180;

end

