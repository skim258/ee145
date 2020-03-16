function[isInPoly] = isPointInConvexPolygon(q,P)
%input: a point q and a convex polygon P in from of list of vertices
%with first vertice appended to last
%output: true(1) o false(0)
notInPoly = 0;   %initialize
isInPoly = 0;
u = zeros(1,2); %initialize segment vector
v = zeros(1,2); %initialize inner normal vector
for i = 1:length(P)-1    %for every vertice
    u(1) = P(i+1,1) - P(i,1);     %x component of segment as vector
    u(2) = P(i+1,2) - P(i,2);     %y component of segment as vector
    v(1) = q(1) - P(i,1);      %x component of inner normal
    v(2) = q(2) - P(i,2);      %y component of inner normal
    if(dot(u,v) <= 0)    %if any of the dot product is negative
        notInPoly = 1;
    end

end
isInPoly = ~notInPoly;
end
