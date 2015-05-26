function [meanval] = meanvec(vec)
%Will return mean values of a vector excluding the minimum and maximum
%value.

minv = min(vec);
maxv = max(vec);
exval = [minv,maxv];
newvec = setxor(exval,vec);
meanval = sum(newvec)/length(newvec);

end

