alt=500;
RE=6371;
r=alt+RE;
mu=3.986e5;
n=sqrt(mu/r^3);
T=2*pi*sqrt(r^3/mu);
Omega=deg2rad([2;4;7;0;0;0]);
options=odeset('RelTol',1e-12,'AbsTol',1e-12);
[tout,yout]=ode45(@envisat,0:60:T,Omega,options);
plot(tout,yout(:,4:6)*180/pi);
xlabel('Time (s)')
ylabel('Angular velocities (\circ s^{-1})')
legend('\phi','\theta','\psi','Location','northeast')