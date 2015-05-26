function index = myfind(vec,key)
%Will look for a key and return an index.
%Format of call: myfind(vector, key)

len = length(vec);
index = [];

for i = 1:len
    if vec(i) == key
        index = i;
    end
end
end

