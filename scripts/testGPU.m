% test cpu vs gpu performance
% plot random matrix eigenvalues (a disc) 

% tested on HP Z600 workstation
% CPU: Intel Xeon X5675 x2
% GPU: Nvidia Quadro 4000

% results
% testGPU n = 1.5e3
% cpu version time: 3.7018
% gpu version time: 2.5215
% testGPU n = 2.5e3
% cpu version time: 12.917
% gpu version time: 6.4503
% testGPU n = 4e3
% cpu version time: 49.6286
% gpu version time: 19.5269
% testGPU n = 5e3
% cpu version time: 87.2824
% gpu version time: 31.3096

clear
clc
clf
close all
%% cpu version
tStart = tic; % start timing
n = 5e3; % set matrix size nxn
M = rand(n,n); % generate a random square matrix
eigM = eig(M); % compute its eigenvalues

x = real(eigM); 
y = imag(eigM);

tElasped = toc(tStart); % stop timing
disp(['cpu version time: ',num2str(tElasped)])

figure(1)
plot(x(2:end),y(2:end),'marker','o','linestyle','none') 
axis equal
% same as 'scatter' but scatter won't overload for gpuArray so have to use
% 'plot'

%% gpu version
tStart = tic;
Mg = gpuArray.rand(n,n); % only this line is different
eigMg = eig(Mg); % eig is overloaded for gpuArray

xg = real(eigMg); % overload real method
yg = imag(eigMg); % overload imag method
tElasped = toc(tStart);
disp(['gpu version time: ',num2str(tElasped)])

figure(2)
plot(xg(2:end),yg(2:end),'marker','o','linestyle','none') % overload plot method
axis equal
