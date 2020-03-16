clc,clear,close all
%parameters
p0 = [0,0]; %reference pt
L1 = 3;   %length of the link robot
L2 = 2;    %length of the link robot
W = .3;   %width of the link robot
alpha = 1.3*pi/2;   %first link's angle in radians
beta = pi/4;   %first link's angle in radians
obsCirc = [-3,4];    %obstacle(circle center) defined by (xo,yo)
circR = 1;  %circle radius
obsHitFlag = 0;     %flag if the circular obstacle is hit
sampling_method = 'unifRand';
n = 10000;

plotEnvironment(L1,L2,W,alpha,beta,obsCirc,circR);   %plot environment
[collision,firstLinkCollide,secondLinkCollide] = checkCollisionTwoLink(L1,L2,W,alpha,beta,obsCirc,circR);
figure(2)
plotSampleConfigurationSpaceTwoLink(L1, L2, W, obsCirc, circR, sampling_method, n )