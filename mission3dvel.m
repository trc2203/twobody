alt=500;
RE=6371;
r=alt+RE;
mu=3.986e5;
n=sqrt(mu/r^3);
T=2*pi*sqrt(r^3/mu);
Omega=deg2rad([2;4;7;0;0;0]); % Convert degrees input to radians
options=odeset('RelTol',1e-12,'AbsTol',1e-12);
[tout,yout]=ode45(@envisat,0:60:10*T,Omega,options); % Integrate to find angles and angular velocity over ten orbital periods
plot(tout/T,yout(:,4:6)*180/pi);
xlabel('Time (orbital periods)')
ylabel('Angular velocities (\circ s^{-1})')
mylegend=legend('$\dot{\phi}$','$\dot{\theta}$','$\dot{\psi}$','Location','northeast');
set(mylegend,'Interpreter','latex')
grid on