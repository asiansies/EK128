exclaimcell = {'Bravo','Fantastic job','Hooray','Cool!','Terrific'};
randstr = randi([1,length(exclaimcell)],1);
print = exclaimcell(randstr);
disp(print)