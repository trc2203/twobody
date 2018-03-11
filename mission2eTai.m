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
position=[yout(1:end,1:3)];
velocity=[yout(1:end,4:6)];
mu=3.986e5;
thrs=tout/3600;
a=-0.5*mu/(0.5*velocitymagnitude(1)^2-mu/positionmagnitude(1)); %Vis-viva equation, a = semi-major axis
fprintf('The semi-major axis of the orbit of the satellite is %g km\n',a)
T=2*pi*sqrt(a^3/mu); % Orbital period in s
Thrs=datestr(T/(24*60*60),'HH:MM:SS.FFF'); % Orbital period in hours, minutes and seconds
fprintf('The orbital period of the satellite is %s hours, %s minutes and %s seconds\n',Thrs(1:2),Thrs(4:5),Thrs(7:end))
h=cross(position(1,1:3),velocity(1,1:3));
hmagnitude=sqrt(h(1)^2+h(2)^2+h(3)^2);
hz=h(3);
inc=acos(hz/hmagnitude);
incdeg=inc*180/pi;
fprintf('The inclination of the satellite orbit is %g degrees\n',incdeg)