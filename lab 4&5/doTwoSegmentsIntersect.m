function[lineIntersectFlag, intersectPt] = doTwoSegmentsIntersect(p1,p2,p3,p4)
%input: two segments by p1,p2 and p3,p4
%output: true or false, if true, return intersect point
lineIntersectFlag = 0; %initialize
intersectPt = zeros(1,2);
pa = 0;
pb = 0;
%sa = point of intersection (if exist) along segment p1,p2 respect to p1
%sb = point of intersection (if exist) along segment p3,p4 respect to p3
numA = (p4(1) - p3(1))*(p1(2) - p3(2)) - (p4(2) - p3(2))*(p1(1) - p3(1));
denA = (p4(2) - p3(2))*(p2(1) - p1(1)) - (p4(1) - p3(1))*(p2(2) - p1(2));
sa = numA/denA;
numB = (p3(2) - p1(2))*(p2(1) - p1(1)) - (p3(1) - p1(1))*(p2(2) - p1(2));
denB = (p4(1) - p3(1))*(p2(2) - p1(2)) - (p4(2) - p3(2))*(p2(1) - p1(1));
sb = numB/denB;
pa = p1 + sa*(p2-p1);
pb = p3 + sb*(p4-p3);
if(numA == 0 && denA == 0)
    %coincident
elseif(denA == 0)
    %parallel and distinct
elseif(sa >= 0 && sa <= 1 && sb >= 0 && sb <= 1)
    %intersect at a single point
    lineIntersectFlag = 1;
    intersectPt = pa;
end
end
