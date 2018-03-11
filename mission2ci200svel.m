alt=1688;
RE=6371;
r=alt+RE;
mu=3.986e5;
T=2*pi*sqrt(r^3/mu);
Omega=deg2rad([4;4;4;1;1;5]);
options=odeset('RelTol',1e-12,'AbsTol',1e-12);
[tout,yout]=ode45(@twobody,0:1:T,Omega,options); % Integrate to find angles and angular velocity over one orbital period
plot(yout(1:200,4:6)*180/pi);
xlabel('Time (s)')
ylabel('Angular velocities (\circ s^{-1})')
legend('\omega_x','\omega_y','\omega_z','Location','northeast')
grid on