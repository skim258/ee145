clc,clear,close all
%square = [-.3,.5; .5,-.3; 1.3,.5; .5,1.3]
%triangle = [-1,-1; -1,0; .1,0]
q = [.5 .5];  %a point
vlist = {[1 1; 0 1; 0 0; 1 0] ,[-.3,.5; .5,-.3; 1.3,.5; .5,1.3]};     %vertex list of polygon defined counter clockwise
p1 = [-1 -.5];  %sample points
p2 = [1 1];
p3 = [1 0];
p4 = [-1 2];

for i = 1:length(vlist)
    P(i).v = cell2mat(vlist(i));     %P = polygon defined counter clockwise
    P(i).v(end+1,:) = P(i).v(1,:);   %append first vertice to last
end
%plot(q(1),q(2),'*r')     %plot 'q'
hold on
%main part------------------------------------------
isInPoly = isPointInConvexPolygon(q,P(1).v)     %sample first polygon in list
[lineIntersectFlag, intersectPt] = doTwoSegmentsIntersect(p1,p2,p3,p4)
polygonIntersectFlag = doTwoConvexPolygonsIntersect(P(1).v,P(2).v)
%plots --------------------------------------------------------
for i = 1:length(P)
    plot(P(i).v(:,1),P(i).v(:,2))
end
axis([-2 2, -2 2])
hold off

figure(2)
plot([p1(1);p2(1)],[p1(2);p2(2)])
hold on
plot([p3(1);p4(1)],[p3(2);p4(2)])
hold off


