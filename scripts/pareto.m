v1 = [];
avg1 = [];
constant = 7;
v2 = [];
avg2 = [];
%% prendo valore di ritorno delle distortion function, che ora sono implementate come classi
histoClass = histogramEqualizationAnalysis;
blueClass = blueDistortionAnalysis;
v1 = blueClass.f1;
v2 = histoClass.f1;
v1 = cell2mat(v1);
v2 = cell2mat(v2);
[n, t] = size(v1);
[m, t] = size(v2)

%% calcolo average dist and PS della blue distortion per il primo set di images
i = 1;
    for y = 1:1:7

        avg_dist = 0;
        avg_ps = 0;
        var = 0;
        while v1(i, 3) == y
            avg_dist = avg_dist + v1(i, 1);
            avg_ps = avg_dist + v1(i, 2);
            i = i + 1;
            var = var + 1;
        end
        avg_dist = avg_dist/(var);
        avg_ps = avg_ps/(var);
        avg1 = [avg1 ; {avg_dist, avg_ps, y}]
    end

%% calcolo average dist and PS della blue distortion per il secondo set di images

for y = 1:1:7

        avg_dist = 0;
        avg_ps = 0;
        var = 0;
        if i == m
                i = i - 1;
        end
        while v1(i, 3) == y
            avg_dist = avg_dist + v1(i, 1);
            avg_ps = avg_dist + v1(i, 2);
            i = i + 1;
            var = var + 1;
            if i == n
                break;
            end
        end
        avg_dist = avg_dist/(var);
        avg_ps = avg_ps/(var);
        avg1 = [avg1 ; {avg_dist, avg_ps, y + constant}]
    end

% plotto average dist and PS for blue distortion di tutte le images
avg1 = cell2mat(avg1);
avg1 = array2table(avg1, 'VariableNames',{'x','y','z'});
avg1 = sortrows(avg1, 1);
figure
hold on
plot(avg1.x, avg1.y, "-b")
title('Pareto curve');
xlabel('avg Distortion'); 
ylabel('% avg PowerSaving');
legend('bluDistortion');


%% calcolo average dist and PS della histogramEq per il primo set di images
i = 1;
    for y = 1:1:7

        avg_dist = 0;
        avg_ps = 0;
        var = 0;
        while v2(i, 3) == y
            avg_dist = avg_dist + v2(i, 1);
            avg_ps = avg_dist + v2(i, 2);
            i = i + 1;
            var = var + 1;
        end
        avg_dist = avg_dist/(var);
        avg_ps = avg_ps/(var);
        avg2 = [avg2 ; {avg_dist, avg_ps, y}]
    end

%% calcolo average dist and PS della histogramEq per il secondo set di images

    for y = 1:1:7

        avg_dist = 0;
        avg_ps = 0;
        var = 0;
        if i == m
                i = i - 1;
        end
        while v2(i, 3) == y
            avg_dist = avg_dist + v2(i, 1);
            avg_ps = avg_dist + v2(i, 2);
            i = i + 1;
            var = var + 1;
            if i == m
                break;
            end
        end
        avg_dist = avg_dist/(var);
        avg_ps = avg_ps/(var);
        avg2 = [avg2 ; {avg_dist, avg_ps, y + constant}]
    end

%% plotto average dist e PS di tutte le images per histogramEq

avg2 = cell2mat(avg2);
avg2 = array2table(avg2, 'VariableNames',{'x','y','z'});
avg2 = sortrows(avg2, 1);
plot(avg2.x, avg2.y, "-r")
legend('histogramEqualization');
hold off
