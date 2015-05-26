function geoseries = geomser(r, n)
%This function will recieve two values and calculate the sum of a geomteric
%series.
%Format of call: geomser(r,n)

exp = (0:n);
sum(r.^exp)

end

