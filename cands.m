%Will create vectors and prompt user for color and plot style.

x = (randi([-50,50],1,5));
y = (randi([-50,50],1,5));

color = input('Red, blue or green?: ','s');
style = input('o or *?: ','s');

pstr = strcat(color(1), style)