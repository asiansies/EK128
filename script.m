%This script will flip an image from left to right and display both 
%the original and new images.

%Loads image
I1 = imread('ws22image.jpg');

%Find dimensions
[r c h] = size(I1);

%Changes dimensions
Inew(:,:,:) = I1(:,c:-1:1,:);

%Displays both images.
figure(1)
subplot(2,1,1); imshow(I1);
subplot(2,1,2); imshow(Inew);