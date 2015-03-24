clear all;
close all;
clc;
% Read image
img =double(imread('cameraman.tif'));
[rows,cols] = size(img);
%Convert the image to 1D array
vector = reshape(img,1,rows*cols);
%Fit two gaussian curves to the image histogram
GMModel = fitgmdist(double(vector'),2);
sigma = GMModel.Sigma;
mean = GMModel.mu;

img1=zeros([rows,cols]);

for i=1:rows
    for j=1:cols        
        %Use baye's decision theory to decide the pixel of the output image
        class1 = (1/(sigma(:,:,1)*(2*pi)^(1/2)))*exp((-1*((img(i,j)-mean(1))^2)/(2*(sigma(:,:,1)^2))));
        class2 = (1/(sigma(:,:,2)*(2*pi)^(1/2)))*exp((-1*((img(i,j)-mean(2))^2)/(2*(sigma(:,:,2)^2))));        
        if class1 > class2
            img1(i,j)=0;
        else
            img1(i,j)=255;
        end
    end
end

img1 = uint8(img1);
figure,imshow(img1);




