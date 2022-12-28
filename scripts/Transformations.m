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
    end
end