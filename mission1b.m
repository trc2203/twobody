syms phi; syms theta; syms psi % Creates symbolic variables which Matlab will treat algebraically rather than numerically
A=mat(phi,theta,psi); % Run function to calculate A algebraically
theta=50*pi/180; phi=30*pi/180; psi=70*pi/180;
A=eval(A); % Plugs in given numerical values of phi, theta and psi to A matrix
Ea=acos(0.5*(trace(A)-1)); % Euler angle
e=1/(2*sin(Ea))*[A(2,3)-A(3,2);A(3,1)-A(1,3);A(1,2)-A(2,1)]; % Euler axis
fprintf('The DCM matrix A =\n')
disp(A)
fprintf('The Euler axis values are:\n')
disp(e)
fprintf('The Euler angle is %g radians\n',Ea)