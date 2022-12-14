clear all

SATURATED = 1;
DISTORTED = 2;

load('Sample_cell_current.mat');
Vdd = 10;
figure
%get displayed RGB image with cell current and supply voltage with two mode
image_RGB_saturated = displayed_image(I_cell_sample, Vdd, SATURATED); 
image_RGB_distorted = displayed_image(I_cell_sample, Vdd, DISTORTED); 

figure
subplot(2,1,1)
imshow(image_RGB_saturated/255);       % display saturated RGB image
subplot(2,1,2)
imshow(image_RGB_distorted/255);       % display distorted RGB imagz