function plotEnvironment(L1,L2,W,alpha,beta,obsCirc,circR)
%input: L1,L2,W,alpha,beta,(xo,yo),r where x0,y0 is center of the obstacle circle
%output:  the function plots the two-link manipulator defined by L1, L2, W, ?, ?, and the obstacle defined by (xo,yo)
%and r 
p0 = [0,0]; %reference point
viscircles(p0,W,'Color','r');  %circle at startPt
hold on
[endpt1,p1,p2,p3,p4] = computeLink(p0,L1,W,alpha,0);  %compute first link
fill([p1(1);p2(1);p3(1);p4(1)], [p1(2);p2(2);p3(2);p4(2)], 'r')
viscircles(endpt1,W,'Color','r');  %ending circle
hold on

[endpt2,p1,p2,p3,p4] = computeLink(endpt1,L2,W,alpha+beta,0);  %compute second link
fill([p1(1);p2(1);p3(1);p4(1)], [p1(2);p2(2);p3(2);p4(2)], 'r')
viscircles(endpt2,W,'Color','r');  %ending circle

viscircles(obsCirc,circR,'Color','b');    %plot obstacle
hold off
title('normal workspace')
axis([-5,5,-5,5])
end