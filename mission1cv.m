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
TIME=[];
ALTITUDE=[];
while t<day % For one day
    M=n*t; % M will need to change on each iteration as t changes
    E=kepler(M,e,tol); % Call function created in part a)
    theta=2*atan(tan(E/2)/sqrt((1-e)/(1+e))); % Rearranged equation 7 to find theta, the true anomaly
    r=a*(1-e^2)/(1+e*cos(theta)); % Radial distance of the spacecraft
    altitude=r-RE;
    mins=t/60;
    fprintf('After %d minutes, the altitude of the spacecraft is %g km\n',mins,altitude)
    timehours=mins/60; % Time (hours)
    TIME=[TIME timehours]; % Appends the current value of time to the end of the matrix so it is kept after being overwritten on the next iteration
    ALTITUDE=[ALTITUDE altitude]; % Doing this for altitude as well allows us to plot time against altitude for all values rather than just the most recent pair
    t=t+60; % Increment t by one minute on each iteration
end
plot(TIME,ALTITUDE)
title('Satellite altitude over one day')
xlabel('Time (hours)')
ylabel('Altitude (km)')