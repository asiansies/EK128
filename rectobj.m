%This script will create a rectangle object.

r = rectangle('Position',[0.1, 0.1, 0.4, 0.7],'Curvature',[0.3, 0.3]);
axis([0 0.6 0 0.9])
set(r, 'LineWidth',4,'LineStyle','-','EdgeColor',[.75 0 1])