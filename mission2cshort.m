X=[13250.18867790191;7.6500;0.0;-2.84244722051;4.92326300375;4.9736381693];
[tout,yout]=ode45(@twobody,0:10:86400,X,odeset('RelTol',1e-12,'AbsTol',1e-12));
plot(tout/3600,sqrt(yout(1:end,1).^2+yout(1:end,2).^2+yout(1:end,3).^2))