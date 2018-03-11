orbits=linspace(10,20,11); % Creates a 1D matrix containing all integer values between 10 and 20 inclusive
DELTAV=[];
for Nrev=orbits % Calculates parameters for each value from 10-20
    achaser=(1-theta/(2*pi*Nrev))^(2/3)*adebris;
    eccchaser=adebris/achaser-1.0;
    fprintf('To intercept after %d orbits the required semi-major axis of the chaser is %g km and the eccentricity of its orbit is %g\n',Nrev,achaser,eccchaser)
    deltav=dv(Nrev); % Calculate deltav for particular Nrev
    DELTAV=[DELTAV deltav];
end
plot(orbits,DELTAV)
title('\Deltav required for chaser to intercept debris in a certain number of orbits')
xlabel('Number of orbits')
ylabel('\Deltav required (km s^{-1})')