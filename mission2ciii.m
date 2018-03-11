rx=13250.18867790191;
ry=7.6500;
rz=0.0;
vx=-2.84244722051;
vy=4.92326300375;
vz=0.49736381693;
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
[x1,y1,z1]=sphere(30); % Creates a matrix with coordinates of a sphere with 30 faces
surf(RE*x1,RE*y1,RE*z1) % Surface plot of this matrix multiplied by the radius of the Earth
axis equal
hold on
x2=yout(1:end,1); % 1st column of X vector rx
y2=yout(1:end,2); % 2nd column of X vector ry
z2=yout(1:end,3); % 3rd column of X vector rz
plot3(x2,y2,z2) % Plots orbit
title('3D scale plot of satellite orbit around Earth')
xlabel('x')
ylabel('y')
zlabel('z')
hold off