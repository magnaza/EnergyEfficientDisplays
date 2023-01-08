
%% la simulazione viene lanciata nel file paretoHSV

classdef HSVAnalysis
    methods

        function out = f1(obj)
            vdd = 10;
            SATURATED = 1;
            limit = 3;
            finalVector = [];
            UtilityClass = UtilityFunctions;
            TransformationsClass = Transformations;
            HSVClass = DVC_utilities;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% first set of images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %figure
            %hold on
            %title('HVScontrast_analysis');
            %xlabel('Distortion'); 
            %ylabel('PowerSaving');
            filename = '../images/4.1.01.tiff'
            for y = 7:1:7
                str = string(y);
                filename = replaceBetween(filename, '4.1.0', '.tiff', str)
                A = imread(filename);
                %figure
                %imshow(A);
%imshow(A); 
                matrixCurrent1 = HSVClass.createCurrentMatrix(A);
                P1 = HSVClass.totalPowerConsumption(matrixCurrent1);
    %fprintf('initial PC:%f\n', P1);
                v = [];
                for x = 10:0.5:14
                    if(x == 10) contrast_scaling = 0.8; brightness_scaling = 0.1; end
                    if(x == 10.5) contrast_scaling = 0.9; brightness_scaling = 0.1; end
                    if(x == 11) contrast_scaling = 0.95; brightness_scaling = 0.12; end
                    if(x == 11.5) contrast_scaling = 0.90; brightness_scaling = 0.12; end
                    if(x == 12) contrast_scaling = 0.9; brightness_scaling = 0.11; end
                    if(x == 12.5) contrast_scaling = 0.9; brightness_scaling = 0.11; end
                    if(x == 13) contrast_scaling = 0.95; brightness_scaling = 0.12; end
                    if(x == 13.5) contrast_scaling = 0.90; brightness_scaling = 0.3; end
                    if(x == 14) contrast_scaling = 0.80; brightness_scaling = 0.3; end

                    B = TransformationsClass.HVS_brightness(A, brightness_scaling);
                    matrixCurrent2 = HSVClass.createCurrentMatrix(B);
                    B_saturated = HSVClass.displayed_image(matrixCurrent2, x, SATURATED);
                    A_saturated = HSVClass.displayed_image(matrixCurrent1, x, SATURATED);
                    matrixCurrent3 = HSVClass.createCurrentMatrix(B_saturated/255);
                    D = UtilityClass.distortion(B_saturated/255, A);
                    D1 = UtilityClass.distortion(A_saturated/255, A);
                    P2 = HSVClass.totalPowerConsumption(matrixCurrent3);
                    PS = (P1 - P2)/P1 * 100;
                    
                    

        %fprintf('%f\n',PS);
                    if D <= 4.00
                    
                    figure
                    subplot(2,1,1)
                    imshow(A);
                    subplot(2,1,2)
                    imshow(B_saturated/255);
                        v = [v; {D, PS, x, brightness_scaling, y}];
                    end
    %figure, imshow(B)
                end
                v = cell2mat(v)
                %tableHVS=array2table(v, 'VariableNames',{'x','y','DVS', 'CS', 'z'});
                %plot(tableHVS.x, tableHVS.y, "-b")
                finalVector = [finalVector; {v}]

            end
            hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% second set of images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            filename = '../images/4.2.01.tiff'
            for y = 7:1:7
                str = string(y);
                filename = replaceBetween(filename, '4.2.0', '.tiff', str)
                A = imread(filename);
%imshow(A);
                matrixCurrent1 = HSVClass.createCurrentMatrix(A);
                P1 = HSVClass.totalPowerConsumption(matrixCurrent1);
    %fprintf('initial PC:%f\n', P1);
                v = [];
                for x = 10:0.5:14
                    if(x == 10) contrast_scaling = 0.5; brightness_scaling = 0.3;end
                    if(x == 10.5) contrast_scaling = 0.5; brightness_scaling = 0.3;end
                    if(x == 11) contrast_scaling = 0.6; brightness_scaling = 0.20;end
                    if(x == 11.5) contrast_scaling = 0.6; brightness_scaling = 0.20;end
                    if(x == 12) contrast_scaling = 0.7; brightness_scaling = 0.20;end
                    if(x == 12.5) contrast_scaling = 0.7; brightness_scaling = 0.20;end
                    if(x == 13) contrast_scaling = 0.8; brightness_scaling = 0.3;end
                    if(x == 13.5) contrast_scaling = 0.8; brightness_scaling = 0.3;end
                    if(x == 14) contrast_scaling = 0.8; brightness_scaling = 0.3;end
                    B = TransformationsClass.HVS_brightness(A, brightness_scaling);
                    matrixCurrent2 = HSVClass.createCurrentMatrix(B);
                    B_saturated = HSVClass.displayed_image(matrixCurrent2, x, SATURATED);
                    A_saturated = HSVClass.displayed_image(matrixCurrent1, x, SATURATED);
                    matrixCurrent3 = HSVClass.createCurrentMatrix(B_saturated/255);
                    D = UtilityClass.distortion(B_saturated/255, A);
                    D1 = UtilityClass.distortion(A_saturated/255, A);
                    P2 = HSVClass.totalPowerConsumption(matrixCurrent3);
                    PS = (P1 - P2)/P1 * 100;
        %fprintf('%f\n',PS);
                    if(D <= 4.00)
                        figure
                    subplot(2,1,1)
                    imshow(A);
                    subplot(2,1,2)
                    imshow(B_saturated/255);
                        v = [v; {D, PS, x, contrast_scaling, y}];
                    end  
                    
                    
    %figure, imshow(B)
                end
                v = cell2mat(v)
                %{
                tableBlue=array2table(v, 'VariableNames',{'x','y','z'});
                hold on;
                plot(tableBlue.x, tableBlue.y, "-r")
                title('histogramEqualization');
                xlabel('Distortion'); 
                ylabel('PowerSaving');
                legend('blueDistortion', 'histogram equalization');
                %}
                finalVector = [finalVector; {v}]
            end
                

            out = finalVector;

        end

    end
end
