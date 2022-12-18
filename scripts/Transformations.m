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
            A_in(:, :, 3) = A_in(:, :, 3)/value;
            A_out = hsv2rgb(A_in);
            out = A_out;
        end
    end
end