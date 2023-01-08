classdef Transformations
    methods
        function out = blue_distortion(obj, imageA, value)
            B = imageA(:, :, 3);
            B = B - value;
            imageA(:, :, 3) = B;
            out = imageA;
        end

        function out = histogram_equalization(obj, imageA, value)
            A_in = rgb2hsv(imageA);
            B = A_in(:, :, 3);
            C = B / value;
            A_in(:, :, 3) = C;
            A_out = im2uint8(hsv2rgb(A_in));
            out = A_out;
        end

        function out = HVS_brightness(obj, imageA, value)
            A_in = rgb2hsv(imageA);
            [h, l, z] = size(A_in);
            for y=1:1:h
                for x=1:1:l
                    u = A_in(y, x, 3);
                    u1 = u - value;
                    if(u1 <= 1)
                        A_in(y, x, 3) = u1;
                    end
                end
            end
            A_out = im2uint8(hsv2rgb(A_in));
            out = A_out;
        end

        function out = HVS_weighted_brightness(obj, imageA, value)
            A_in = rgb2hsv(imageA);
            [h, l, z] = size(A_in);
            for y=1:1:h
                for x=1:1:l
                    u = A_in(y, z, 3); 
                    u1 = u + value;
                    u2 = u - value/2;
                    if(u <= 0.3)
                        if(u2 > 0)
                            A_in(y, z, 3) = u2;
                        end
                    else
                        if(u1 <= 1)
                            A_in(y, z, 3) = u1;
                        end
                    end
                    U2 = A_in(y, z, 3);
                end
            end
            A_out = im2uint8(hsv2rgb(A_in));
            figure
                    subplot(2,1,1)
                    imshow(imageA);
                    subplot(2,1,2)
                    imshow(A_out);
                        out = A_out;
        end

        function out = HVS_contrast(obj, imageA, value)
            A_in = rgb2hsv(imageA);
            
            [h, l, z] = size(A_in);
            for y=1:1:h
                for x=1:1:l
                   u = A_in(y, x, 3);
                   u1 = u * value;
                   if(u1 <= 1)
                        A_in(y, x, 3) = u1;
                   end
                    %A_in(y, x, 3)
                end
            end
            A_out = im2uint8(hsv2rgb(A_in));
            out = A_out;
        end

        function out = HVS_weighted_contrast(obj, imageA, value)
            A_in = rgb2hsv(imageA);
            [h, l, z] = size(A_in);
            for y=1:1:h
                for x=1:1:l
                    u = A_in(y, z, 3); 
                    u1 = u/value;
                    u2 = u * value;
                    if(u <= 0.3)
                        A_in(y, z, 3) = u/value;
                    else
                        if(u2 <= 1)
                            A_in(y, z, 3) = u*value;
                        end
                    end
                end
            end
            A_out = im2uint8(hsv2rgb(A_in));
            out = A_out;
        end
    end
end