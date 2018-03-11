alt=1688;
RE=6371;
r=alt+RE;
mu=3.986e5;
T=2*pi*sqrt(r^3/mu);
Omega=deg2rad([4;4;4;1;1;10]);
options=odeset('RelTol',1e-12,'AbsTol',1e-12);
[tout,yout]=ode45(@twobody,0:1:T,Omega,options); % Integrate to find angles and angular velocity over one orbital period
yout(:,1:3)=wrapToPi(yout(:,1:3));
plot(yout(:,1:3)*180/pi);
xlabel('Time (s)')
ylabel('Euler Angles (\circ)')
legend('\phi','\theta','\psi','Location','best')