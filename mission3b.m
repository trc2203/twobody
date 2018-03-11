RE=6378.14;
mu=3.986e5;
altitudedebris=758.5355;
thetadeg=30;
theta=thetadeg*pi/180;
adebris=altitudedebris+RE; % Semi-major axis of debris
Tdebris=2*pi*sqrt(adebris^3/mu);
Tdebrishrs=datestr(Tdebris/(24*60*60),'HH:MM:SS.FFF'); % Orbital period in hours, minutes and seconds
fprintf('The orbital period of the satellite is %s hours, %s minutes and %s seconds\n',Tdebrishrs(1:2),Tdebrishrs(4:5),Tdebrishrs(7:end))
Nrev=10;
achaser=(1-theta/(2*pi*Nrev))^(2/3)*adebris;
eccchaser=adebris/achaser-1.0;
fprintf('To intercept after %d orbits the required semi-major axis of the chaser is %g km and the eccentricity of its orbit is %g\n',Nrev,achaser,eccchaser)
wdebris=2*pi/Tdebris;
vdebris=wdebris*adebris;
rxdebris=adebris*cos(theta);
rydebris=adebris*sin(theta);
rzdebris=0.0;
vxdebris=-vdebris*sin(theta);
vydebris=vdebris*cos(theta);
vzdebris=0.0;
Rdebris=[rxdebris;rydebris;rzdebris];
Vdebris=[vxdebris;vydebris;vzdebris];
Xdebris=[Rdebris;Vdebris];
Tchaser=2*pi*sqrt(achaser^3/mu);
vchaser0=sqrt(mu*(2/adebris-1/achaser));
t0=0;
ts=10;
tf=Nrev*Tchaser;
options=odeset('RelTol',1e-12,'AbsTol',1e-12);
[~,yout]=ode45(@twobody,t0:ts:tf,Xdebris,options); % 1 day in 10 sec intervals, tout unused so not assigned to save processing time
youtdebris=yout; % So I can keep yout for debris after it gets redefined later
rxchaser=adebris;
rychaser=0;
rzchaser=0;
vxchaser=0;
vychaser=vchaser0;
vzchaser=0;
Rchaser=[rxchaser;rychaser;rzchaser];
Vchaser=[vxchaser;vychaser;vzchaser];
Xchaser=[Rchaser;Vchaser];
[tout,yout]=ode45(@twobody,t0:ts:tf,Xchaser,options); % This will redefine yout to be for the chaser now, tout will be identical
youtchaser=yout;
xdist=youtdebris(1:end,1)-youtchaser(1:end,1);
ydist=youtdebris(1:end,2)-youtchaser(1:end,2);
dist=sqrt(xdist.^2+ydist.^2); % z component == 0 as both orbits are equatorial
plot(tout/Tchaser,dist)
title('Number of orbits required for the chaser and debris to intercept')
xlabel('Time (chaser orbits)')
ylabel('Distance (km)')