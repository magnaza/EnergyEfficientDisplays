DVC_class = DVC_utilities;
A = imread('../images/4.1.01.tiff');
matrixCurrent = DVC_class.createCurrentMatrix(A);
Icell = DVC_class.cellCurrent(A(1, 2, :))
PS = DVC_class.totalPowerConsumption(matrixCurrent);
vdd = 10;
SATURATED = 1;
DISTORTED = 2;
image_RGB_saturated = displayed_image(matrixCurrent, vdd, SATURATED); 

figure
imshow(image_RGB_saturated/255);       % display saturated RGB image
