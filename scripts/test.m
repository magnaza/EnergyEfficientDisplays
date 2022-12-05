A = imread('../images/4.1.01.tiff');
R = A(1:256, 1:256, 1);
G = A(1:256, 1:256, 2);
B = A(1:256, 1:256, 3);

y  = 0.7755
Wo = 1.48169521*10-6
Wr = 2.13636845*10-7
Wg = 1.77746705*10-7
Wb = 2.14348309*10-7

Ri = double(R).^y
Ri = Ri.*Wr

Gi = double(G).^y
Gi = Gi.*Wg

Bi = double(B).^y
Bi = Bi.*Wg

I = Ri + Gi + Bi
TotalPower = sum(sum(I))

imshow(A)
