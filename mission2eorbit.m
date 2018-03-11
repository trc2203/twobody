rx=29813.01758236574;
ry=29813.01758236573;
rz=0.0;
vx=-2.16659498816;
vy=2.16531033816;
vz=0.26798824280;
R=[rx;ry;rz];
V=[vx;vy;vz];
X=[R;V];
t0=0;
ts=10;
days=1;
tf=86400*days;
options=odeset('RelTol',1e-12,'AbsTol',1e-12);
[tout,yout]=ode45(@twobody,t0:ts:tf,X,options); % 1 day in 10 sec intervals
positionmagnitude=sqrt(yout(1:end,1).^2+yout(1:end,2).^2+yout(1:end,3).^2);
velocitymagnitude=sqrt(yout(1:end,4).^2+yout(1:end,5).^2+yout(1:end,6).^2);
RE=6378.14;
[x1,y1,z1]=sphere(20);
surf(RE*x1,RE*y1,RE*z1)
axis equal
hold on
x2=yout(1:end,1);
y2=yout(1:end,2);
z2=yout(1:end,3);
plot3(x2,y2,z2)
title('3D scale plot of satellite orbit around Earth')
xlabel('x')
ylabel('y')
zlabel('z')
hold off