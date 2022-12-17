classdef UtilityFunctions
    methods
        
        
        function out = distortion(obj, imageA, imageB)

            A_lab = rgb2lab(imageA);
            B_lab = rgb2lab(imageB);

            s = size(imageA);
            w = s(1);
            h = s(2);
            diff = sum(sum(sqrt((A_lab(:, :, 1)-B_lab(:, :, 1))^2 + (A_lab(:, :, 2)-B_lab(:, :, 2))^2 + (A_lab(:, :, 3)-B_lab(:, :, 3))^2)));

            out = 100 * (diff)/(w * h * sqrt(100^2 + 255^2 + 255^2));

        end

        function out = getConsumption(obj, imageA)

            R = imageA(:, :, 1);
            G = imageA(:, :, 2);
            B = imageA(:, :, 3);

            y  = 0.7755;
            Wo = 1.48169521*10^(-6);
            Wr = 2.13636845*10^(-7);
            Wg = 1.77746705*10^(-7);
            Wb = 2.14348309*10^(-7);

            Ri = double(R).^y;
            Ri = Ri.*Wr;

            Gi = double(G).^y;
            Gi = Gi.*Wg;

            Bi = double(B).^y;
            Bi = Bi.*Wb;

            I = Ri + Gi + Bi;

            out = sum(sum(I));
        end

        function out = distortion_fede(obj, A, B)
            A_lab = rgb2lab(A);
            B_lab = rgb2lab(B);

            C = A_lab - B_lab;
            C = double(C).^2;
            out = sum(sum(sum(C)));
            out = sqrt(out);
            [W, H, Z] = size(A_lab);
            M = 100^2 + 255^2 + 255^2;
            M = sqrt(M);
            DEN = W * H * M;
            out = out / DEN * 100;
        end
    end
end

