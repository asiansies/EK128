%Ths script will correctly store years an temperature.

load hightemp.dat
newmat = hightemp(:,:);
newmat(:,1)= hightemp(:,1)+1900

