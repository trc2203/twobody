tol=1e-6; % Error allowed
M=60; % In degrees
M=M*pi/180; % In radians
e=0.25; % Eccentricity
[E,it]=kepler2(M,e,tol); % Call function created in part a)
fprintf('The eccentric anomaly calculated by the Newton-Raphson method is %f radians\n',E)
fprintf('The number of iterations to reduce the error below %f was %d\n',tol,it)