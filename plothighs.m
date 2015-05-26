%This script will plot data from a file

load avehighs.dat

for i = 1:3
    x = 1:12;
    subplot(1,3,i); plot(x,avehighs(i,2:end),'bo')
    title(sprintf('Location %d',avehighs(i,1)))
    xlabel('Month')
    ylabel('Ave High Temps')
    axis ([0 12 0 90])
end