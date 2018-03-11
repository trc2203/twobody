tol=1e-12; % Error allowed
e=0.2; % Eccentricity
diff=tol+1; % Difference between successive E values, needs an initial definition greater than tol so that loop can be entered
it=0; % Number of iterations
t=0; % Initial time
mu=3.986e+5; % Earth gravitational parameter in km^3 s^-2
a=20400; % Semi-major axis in km
T=2*pi*sqrt(a^3/mu); % Period in s
day=24*60*60; % Length of a day in seconds
RE=6378.14; % Mean radius of Earth in km
n=sqrt(mu/a^3); % Equation 6
RADIUS=[];
THETA=[];
while t<T % For one orbit
    M=n*t; % M will need to change on each iteration as t changes
    E=kepler(M,e,tol); % Call function created in part a)
    theta=2*atan(tan(E/2)/sqrt((1-e)/(1+e))); % Rearranged equation 7 to find theta, the true anomaly
    r=a*(1-e^2)/(1+e*cos(theta)); % Radial distance of the spacecraft
    altitude=r-RE;
    mins=t/60;
    timehours=mins/60; % Time (hours)
    RADIUS=[RADIUS r]; % Append each new r value to the end of the matrix
    THETA=[THETA theta]; % Append each new theta value to the end of the matrix
    t=t+60; % Increment t by one minute on each iteration
end
p=a*(1-e^2); % Semi-latus rectum
alpha=RE^2*e^2+p^2;
beta=2*RE^2*e;
gamma=RE^2-p^2;
theta1=acos((-beta+sqrt(beta^2-4*alpha*gamma))/(2*alpha));
theta2=acos((-beta-sqrt(beta^2-4*alpha*gamma))/(2*alpha));
fprintf('The two solutions for the eclipse were found to be:\ntheta1=%g radians at periapsis and theta2=%g radians at apoapsis\n',theta1,theta2)
rtheta1=a*(1-e^2)/(1+e*cos(theta1)); % Radial distances at theta 1 and 2
rtheta2=a*(1-e^2)/(1+e*cos(theta2));
CIRCLE=0:0.01*pi:2*pi; % Creates a 1D matrix containing angles for a full circle of 2pi rad in increments of pi/100
RADIUSCIRCLE=[];
count=0;
while count<=200
    RADIUSCIRCLE=[RADIUSCIRCLE RE];
    count=count+1;
end
polarplot(CIRCLE,RADIUSCIRCLE,'Color','k') % Plot of Earth as a circle radius RE
title('Orbit of satellite around Earth with eclipse points at perigee and apogee')
hold on
polarplot(theta1,rtheta1,'*','Color','r') % Plotting +/- theta1 values with * markers
polarplot(-theta1,rtheta1,'*','Color','r')
polarplot(theta2,rtheta2,'o','Color','r') % Plotting +/- theta2 values with o markers
polarplot(-theta2,rtheta2,'o','Color','r')
polarplot(THETA,RADIUS,'Color','b') % Plot of elliptical orbit
hold off