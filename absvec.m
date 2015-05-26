vec = randi([-10,10],1,5)


for i = 1:length(vec)
if vec(i)<1
vec(i) = vec(i)*-1;
end

end
disp(vec)