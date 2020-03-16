p = [3;5];
plot([0,p(1)],[0,p(2)],'r')
Rx = @(phi)[cos(phi) -sin(phi); sin(phi) cos(phi)];
q = Rx(3*pi/2)*p;
hold on
plot([0,q(1)],[0,q(2)],'b')
grid on
axis([-6,6,-6,6])
hold off