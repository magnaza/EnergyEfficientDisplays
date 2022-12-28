v1 = [];
%v2 = [];
%histoClass = histogramEqualizationAnalysis;
blueClass = blueDistortionAnalysis;
v1 = blueClass.f1;
%v2 = histoClass.f1;
v1 = cell2mat(v1);
tableBlue=array2table(v1, 'VariableNames',{'x','y','z'});
%proof = [proof1;proof2];
[n, t] = size(v1);


    for y = 1:1:7
        i = 1;
        while v1(n, 3) == y
            avg_dist = v1(i, 1);
            avg_ps = v1(i, 2);
            i = i + 1;
        end
        avg_dist = avg_dist/i;
        avg_ps = avg_ps/i;
    end

