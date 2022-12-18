A = imread('../images/4.1.01.tiff');
imshow(A);
UtilityClass = UtilityFunctions;
TransformationsClass = Transformations;


P1 = UtilityClass.getConsumption(A);
B = TransformationsClass.histogram_equalization(A, 1.5);
P2 = UtilityClass.getConsumption(B);
dist1 = UtilityClass.distortion(A, B);
dist2 = UtilityClass.distortion_fede(A, B);

fprintf("distortion: %f\n",dist1);
fprintf("distortion: %f\n",dist2);
Pdiff = (P1 - P2)/P1 * 100;
fprintf("power saving: %f\n", Pdiff);
figure, imshow(B);