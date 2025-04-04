function yprime = twobody(t,y)
r = sqrt(y(1)^2 + y(3)^2);
yprime = [y(2);...
         -y(1)/r^3;...
          y(4);...
         -y(3)/r^3];