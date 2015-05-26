%Will create two random vectors with 20 integers.

v1 = randi([1,5],1,20);
v2 = randi([1,500],1,20);

max1 = max(v1)
max2 = max(v2)
min1 = min(v1)
min2 = min(v2)

mv1 = mean(v1)
mv2 = mean(v2)

mdv1 = median(v1)
mdv2 = median(v2)

sv1 = std(v1)
sv2 = std(v2)

mov1 = mode(v1)
mov2 = mode(v2)