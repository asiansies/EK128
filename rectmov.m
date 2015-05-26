%This script will create a movie of rectangles.

p = [0.2, 0.2, 0.5, 0.8];
r = rectangle('Position',p,'Curvature',[0.5, 0.5]);
axis([0 3 0 3])
set(r, 'LineWidth',3,'LineStyle',':')

for i = 1:10
    p = p+.1;
    r = rectangle('Position',p,'Curvature',[0.5, 0.5]);
    axis([0 3 0 3])
    set(r, 'LineWidth',3,'LineStyle',':')
    M(i) = getframe;
end
movie(M)