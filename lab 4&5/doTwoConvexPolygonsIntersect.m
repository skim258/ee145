function[polygonIntersectFlag] = doTwoConvexPolygonsIntersect(P1,P2)
%input: two convex polygons P1 and P2
%output: true(1) or false(0)
polygonIntersectFlag = 0;   %initialize
for i = 1:length(P1)-1    %check if vertice in P1 is in P2
    if(isPointInConvexPolygon(P1(i,:),P2))
        polygonIntersectFlag = 1;
        break;
    end
end
for i = 1:length(P2)-1    %check if vertice in P2 is in P1
    if(isPointInConvexPolygon(P2(i,:),P1))
        polygonIntersectFlag = 1;
        break;
    end
end
for i = 1:length(P1)-1
    for j = 1:length(P2)-1
        if(doTwoSegmentsIntersect(P1(i,:),P1(i+1,:),P2(j,:),P2(j+1,:)))
            polygonIntersectFlag = 1;
            break;
        end
        
    end
end
end