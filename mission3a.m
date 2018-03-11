RE=6378.14;
mu=3.986e5;
altitude=758.5355;
thetadeg=30;
theta=thetadeg*pi/180;
r=altitude+RE;
T=2*pi*sqrt(r^3/mu);
Thrs=datestr(T/(24*60*60),'HH:MM:SS.FFF'); % Orbital period in hours, minutes and seconds
fprintf('The orbital period of the satellite is %s hours, %s minutes and %s seconds\n',Thrs(1:2),Thrs(4:5),Thrs(7:end))
w=2*pi/T;
v=w*r;
rx=r*cos(theta);
ry=r*sin(theta);
rz=0.0;
vx=-v*sin(theta);
vy=v*cos(theta);
vz=0.0;
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
[x1,y1,z1]=sphere(50);
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