classdef Transformations
    methods
        function out = blue_distortion(obj, imageA, value)
            B = imageA(:, :, 3);
            B = B - value;
            imageA(:, :, 3) = B;
            out = imageA;
        end
    end
end