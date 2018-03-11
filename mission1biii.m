tol=1e-12; % Error allowed
M=60; % In degrees
M=M*pi/180; % In radians
e=0.25; % Eccentricity
wantfirst=0; % Will not output value of E after first iteration
[E,it]=kepler(M,e,tol); % Call function created in part a)
fprintf('The eccentric anomaly calculated by the Newton-Raphson method is %f radians\n',E)
fprintf('The number of iterations to reduce the error below %f was %d\n',tol,it)
theta=2*atan(tan(E/2)/sqrt((1-e)/(1+e))); % Equation 7
fprintf('The true anomaly for the calculated value of E is %f radians\n',theta)
a=16000; % In km
r=a*(1-e^2)/(1+e*cos(theta)); % Radial distance of the spacecraft
fprintf('The radial distance r for the given a value is %f km\n',r)