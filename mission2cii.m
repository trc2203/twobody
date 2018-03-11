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
plot(tout/3600,velocitymagnitude)
title('Velocity against time of a satellite over 1 day')
xlabel('Time (hours)')
ylabel('Velocity (km s^{-1})')