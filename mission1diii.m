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
E1=2*atan(sqrt((1-e)/(1+e))*tan(theta1/2)); % Eccentric anomalies at theta 1 and 2
E2=2*atan(sqrt((1-e)/(1+e))*tan(theta2/2));
fprintf('The Eccentric Anomalies are E1=%g radians and E2=%g radians\n',E1,E2)
M1=E1-e*sin(E1); % Mean anomalies at theta 1 and 2
M2=E2-e*sin(E2);
t1=M1/n; % Rearranging equation 5 to find time spacecraft crosses each point in its orbit
t2=M2/n;
EclipseTime1=2*t1/60; % Calculate eclipse time for periapsis
EclipseTime2=(T-2*t2)/60; % Calculate eclipse time for apoapsis
fprintf('The eclipse time for the periapsis is %g minutes and for the apoapsis is %g minutes\n',EclipseTime1,EclipseTime2)