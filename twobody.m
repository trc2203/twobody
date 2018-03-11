function Xdot=twobody(t,X)
mu=3.986e5;
r=sqrt(X(1)^2+X(2)^2+X(3)^2);
Xdot=[X(4);X(5);X(6);-X(1)*mu/r^3;-X(2)*mu/r^3;-X(3)*mu/r^3];
end