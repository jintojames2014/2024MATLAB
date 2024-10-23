%% chirp_function_5e5_review.m
% Chrip Fourier transform algorithm 
% Reference: page 158; Boaz Porat; A course in Digital Signal Processing

function X = chirp_function_5e5_review(x,theta0,dtheta,K);
%computes the chirp Fourier transform on a frequency interval.

%%documentation section: DOCtext : description
% Input parameters:
% x: input vector
% theta0 : initial frequency (in radians)
% dtheta : frequency increment (in radians)
% K : number of point on the frequency axis

% Output:
% X : the chirp Fourier transform of x


%%code : BEGIN

N = length(x);
x = reshape(x,1,N);
n = 0:N-1;

g = x.*exp(-j*(0.5*dtheta*n+theta0).*n);

L = 1;
while (L<N+K-1), L=2*L; end

g = [g, zeros(1,L-N)];

h = [exp(j*0.5*dtheta*(0:k-1),^2), ...
exp(j*0.5*dtheta*(-L+K:-1).^2)];  % Jinto check: line n and line (n-1) via ...

X = ifft(fft(g).*fft(h));

X = x(1:K).*exp(-j*0.5*dtheta*(0:K-1).^2);

%%code : END

%%file: INFO
% intial entry: 2024Oct23: Notepad++
