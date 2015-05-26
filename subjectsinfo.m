%This script will return the names of eligible subjects for an experiment.

subjects(3) = struct('name','Billy','sub_id',424,'height',7.8,'weight',500.8);
subjects(1) = struct('name','Joey','sub_id',111,'height',5.7,'weight',222.2);
subjects(2) = struct('name','Alicia','sub_id',265,'height',5.5,'weight',220.1);

for i =  1:length(subjects)
    avgweight = (sum([subjects.weight]))/(length(subjects));
    avgheight = (sum([subjects.height]))/(length(subjects));
    if subjects(i).weight < avgweight || subjects(i).height < avgheight
        fprintf('%s\n',subjects(i).name)
    end
end