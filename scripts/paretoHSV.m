v1 = [];
avg1 = [];
constant = 7;
v2 = [];
avg2 = [];
% prendo valore di ritorno delle distortion function, che ora sono implementate come classi
HSVClass = HSVAnalysis;
%blueClass = blueDistortionAnalysis;
v1 = HSVClass.f1;
%v2 = histoClass.f1;
v1 = cell2mat(v1);
%v2 = cell2mat(v2);
[n, t] = size(v1);
%[m, t] = size(v2)

% calcolo average dist and PS della blue distortion per il primo set di images
offset = 9;
for x = 1:1:9
    avg_dist = 0;
    avg_ps = 0;
    var = 0;
    for y = 0:1:6
        
        index = x + offset*y;
        dist = v1(index, 1);
        ps = v1(index, 2);
        avg_dist = avg_dist + dist;
        avg_ps = avg_ps + ps;
    end
        avg_dist = avg_dist/7;
        avg_ps = avg_ps/7;
        if(avg_dist <= 3)
            avg1 = [avg1 ; {avg_dist, avg_ps, y}]
        end
end


% calcolo average dist and PS della blue distortion per il secondo set di images
offset2 = 63;
for x = 1:1:9
    avg_dist = 0;
    avg_ps = 0;
    var = 0;
    for y = 0:1:6
        
        index = x + offset2 + offset*y;
        dist = v1(index, 1);
        ps = v1(index, 2);
        avg_dist = avg_dist + dist;
        avg_ps = avg_ps + ps;
    end
        avg_dist = avg_dist/7;
        avg_ps = avg_ps/7;
        if(avg_dist <= 3)
            avg1 = [avg1 ; {avg_dist, avg_ps, y}]
        end
end


blue_avg = [0,0, 1]
avg1 = cell2mat(avg1);
for x = 2:1:21
    dist1 = avg1(x-1, 1)
    dist2 = avg1(x,1)
    avg_dist = (dist1 + dist2)/2
    ps1 = avg1(x-1, 2)
    ps2 = avg1(x, 2)
    avg_ps = (ps1 + ps2)/2
    blue_avg = [blue_avg ; [avg_dist, avg_ps, y]]
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

























%{

i = 0;

% calcolo average dist and PS della histogramEq per il primo set di images

for x = 1:1:15
    avg_dist = 0;
    avg_ps = 0;
    var = 0;
    for y = 0:1:6
        
        index = x + offset*y;
        dist = v2(index, 1);
        ps = v2(index, 2);
        avg_dist = avg_dist + dist;
        avg_ps = avg_ps + ps;
    end
        avg_dist = avg_dist/7;
        avg_ps = avg_ps/7;
        if(avg_dist <= 3)
            avg2 = [avg2 ; {avg_dist, avg_ps, y}];
        end
end

% calcolo average dist and PS della histogramEq per il secondo set di images

for x = 1:1:15
    avg_dist = 0;
    avg_ps = 0;
    var = 0;
    for y = 0:1:6
        
        index = x + offset2 + offset*y;
        dist = v2(index, 1);
        ps = v2(index, 2);
        avg_dist = avg_dist + dist;
        avg_ps = avg_ps + ps;
    end
        avg_dist = avg_dist/7;
        avg_ps = avg_ps/7;
        if(avg_dist <= 3)
            avg2 = [avg2 ; {avg_dist, avg_ps, y}]
        end
end

% plotto average dist e PS di tutte le images per histogramEq

avg2 = cell2mat(avg2);
avg2 = array2table(avg2, 'VariableNames',{'x','y','z'});
avg2 = sortrows(avg2, 1);
plot(avg2.x, avg2.y, "-r")
legend('bluDistortion','histogramEqualization');
%}
hold off
