function[endpt,p1,p2,p3,p4] = computeLink(startPt,L,W,phi,exaggerate)
%plots 2d link from zero-width start point with length L and width W
%with rotation 'phi' in radians respect to x axis
%enter exaggerated value for exaggerated link 0 otherwise
%returns zero-width endpoint of the link and vertex of the link clockwise
offsetR = 0;
if(exaggerate)
    offsetR = -exaggerate;
end
Rx = @(phi)[cos(phi) -sin(phi); sin(phi) cos(phi)]; %rotation matrix respect to x axis
%vertices without startPt offset
p1 = Rx(phi)*[offsetR;0 - W] + startPt';
p2 = Rx(phi)*[offsetR;0 + W] + startPt';
p3 = Rx(phi)*[offsetR+L; 0 + W] + startPt';
p4 = Rx(phi)*[offsetR+L; 0 - W] + startPt';

endPtNO = Rx(phi)*[offsetR + L;0];  %circle at startPt without offset
endpt = [endPtNO(1),endPtNO(2)] + startPt;  %with offset

end