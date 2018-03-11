RE=6378.14;
mu=3.986e5;
altitudedebris=758.5355;
adebris=altitudedebris+RE; % Semi-major axis of debris
n=120;
newaltitude=[];
deltav=[];
while n<=500
    newaltitude=[newaltitude n]; % Creating matrix containing each possible altitude to bring debris down to from 120-500 in integer steps
    deltav=[deltav abs(sqrt(mu/adebris)-sqrt(mu/(n+RE)))]; % For each possible new altitude, calculate the deltav required for the maneuvre
    n=n+1;
end
plot(deltav,newaltitude) % Plots deltav required against altitude to bring debris down to
title('\Deltav required to reduce perigee of debris orbit to a particular distance')
xlabel('\Deltav (km s^{-1})')
ylabel('New altitude (km)')