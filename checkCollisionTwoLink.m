function[obsHitFlag,collideFirstLink,collideSecondLink] =  checkCollisionTwoLink(L1,L2,W,alpha,beta,obsCirc,circR)
%Input: L1, L2, W, ?, ?, (xo,yo), r 
%Output: the function returns 1 if the two-link manipulator defined by L1, L2, W, ?, ? collides with the obstacle
%defined by (xo,yo) and r. The function returns 0 otherwise. 

collideFirstLink = 0;   %collision with first link
collideSecondLink = 0;   %collision with second link

p0 = [0,0];
obsHitFlag = 0;
%extended parameters by the circular obstacle
%figure(2)  
extL1 = L1+2*circR;
extL2 = L2+2*circR;
extW = W+2*circR;
% hold on
[endpt1ext,p1,p2,p3,p4] = computeLink(p0,extL1,extW,alpha,circR);  %compute extended first link
[endpt1,p1NE,p2NE,p3NE,p4NE] = computeLink(p0,L1,W,alpha,0);  %compute extended first link
P = [p1(1),p1(2); p2(1),p2(2);p3(1),p3(2);p4(1),p4(2);p1(1),p1(2)];     %first Link in form of polygon
[isInPoly] = isPointInConvexPolygon(obsCirc,P);
if(isInPoly)
    obsHitFlag = 1;
    collideFirstLink = 1;
end
% viscircles(p0,W,'Color','r');  %starting circle
% fill([p1(1);p2(1);p3(1);p4(1)], [p1(2);p2(2);p3(2);p4(2)], 'r')
% hold on
% viscircles(endpt1,W,'Color','r');  %middle circle
[endpt2ext,p1,p2,p3,p4] = computeLink(endpt1,extL2,extW,alpha + beta,circR);  %compute extended second link
[endpt2,p1NE,p2NE,p3NE,p4NE] = computeLink(endpt1,L2,W,alpha + beta,0);  %compute extended second link
% hold on
% viscircles(endpt2,W,'Color','r');  %end circle
%hold on
P = [p1(1),p1(2); p2(1),p2(2);p3(1),p3(2);p4(1),p4(2);p1(1),p1(2)];     %second Link in form of polygon
[isInPoly] = isPointInConvexPolygon(obsCirc,P);
if(isInPoly)
    obsHitFlag = 1;
    collideSecondLink = 1;
end
%  fill([p1(1);p2(1);p3(1);p4(1)], [p1(2);p2(2);p3(2);p4(2)], 'r') 
%  plot(obsCirc(1),obsCirc(2),'*b')  
% title('exaggerated workspace')
%axis([-7,2,-2,7])

%check if obstacle hits any of the circles
if((obsCirc(1) - p0(1))^2 + (obsCirc(2) - p0(2))^2 < 2*extW/2^2)
    obsHitFlag = 1;
elseif((obsCirc(1) - endpt1(1))^2 + (endpt1(2) - p0(2))^2 < 2*extW/2^2)
    obsHitFlag = 1;
elseif((obsCirc(1) - endpt2(1))^2 + (endpt2(2) - p0(2))^2 < 2*extW/2^2)
    obsHitFlag = 1;
end

if(obsHitFlag)
    fprintf('The object is hit\n');
end
% hold off
end