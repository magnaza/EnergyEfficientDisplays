A = imread('../images/4.1.01.tiff');
%imshow(A);
UtilityClass = UtilityFunctions;
TransformationsClass = Transformations;
P1 = UtilityClass.getConsumption(A);
fprintf('initial PC:%f\n', P1);
v = [];
for x = 0:5:40
    B = TransformationsClass.blue_distortion(A, x);
    D = UtilityClass.distortion(B, A);
    P2 = UtilityClass.getConsumption(B);
    fprintf('%f\n',P2);
    v = [v; {D, P2}];
    %figure, imshow(B);
end
table1=array2table(v);
hold on;
plot(table1.v1, table1.v2);
title('BlueDistortion');
xlabel('Distortion'); 
ylabel('PowerSaving');
legend('bluD');
hold off;