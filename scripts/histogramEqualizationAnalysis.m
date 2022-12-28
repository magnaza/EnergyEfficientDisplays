
%% la simulazione viene lanciata nel file pareto

classdef histogramEqualizationAnalysis
    methods

        function out = f1(obj)
            limit = 3;
            finalVector = [];
            UtilityClass = UtilityFunctions;
            TransformationsClass = Transformations;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% first set of images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


            filename = '../images/4.1.01.tiff'
            for y = 1:1:7
                str = string(y);
                filename = replaceBetween(filename, '4.1.0', '.tiff', str)
                A = imread(filename);
%imshow(A); 
                P1 = UtilityClass.getConsumption(A);
    %fprintf('initial PC:%f\n', P1);
                v = [];
                for x = 1.1:0.1:2
                    B = TransformationsClass.histogram_equalization(A, x);
                    D = UtilityClass.distortion(B, A);
                    P2 = UtilityClass.getConsumption(B);
                    PS = (P1 - P2)/P2 * 100;
        %fprintf('%f\n',PS);
                    if D <= 3.00
                        v = [v; {D, PS, y}];
                    end
    %figure, imshow(B)
                end
                v = cell2mat(v)
                tableBlue=array2table(v, 'VariableNames',{'x','y','z'});
                hold on;
                plot(tableBlue.x, tableBlue.y, "-b")
                title('histogramEqualization');
                xlabel('Distortion'); 
                ylabel('PowerSaving');
                finalVector = [finalVector; {v}]
            end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% second set of images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


            filename = '../images/4.2.01.tiff'
            for y = 1:1:7
                str = string(y);
                filename = replaceBetween(filename, '4.2.0', '.tiff', str)
                A = imread(filename);
%imshow(A);
                P1 = UtilityClass.getConsumption(A);
    %fprintf('initial PC:%f\n', P1);
                v = [];
                for x = 1.1:0.1:2
                    B = TransformationsClass.histogram_equalization(A, x);
                    D = UtilityClass.distortion(B, A);
                    P2 = UtilityClass.getConsumption(B);
                    PS = (P1 - P2)/P2 * 100;
        %fprintf('%f\n',PS);
                    if D <= 3.00
                        v = [v; {D, PS}, y];
                    end
    %figure, imshow(B)
                end
                v = cell2mat(v)
                tableBlue=array2table(v, 'VariableNames',{'x','y','z'});
                hold on;
                plot(tableBlue.x, tableBlue.y, "-r")
                title('histogramEqualization');
                xlabel('Distortion'); 
                ylabel('PowerSaving');
                legend('histogram equalization');
                finalVector = [finalVector; {v}]
            end
            out = finalVector;
        end
    end
end
