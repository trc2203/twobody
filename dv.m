function deltav=dv(Nrev)
RE=6378.14;
mu=3.986e5;
altitudedebris=758.5355;
thetadeg=30;
theta=thetadeg*pi/180;
adebris=altitudedebris+RE;
deltav=abs(sqrt(mu/adebris)-sqrt(mu/((1-theta/(2*pi*Nrev))^(2/3)*adebris)));
end