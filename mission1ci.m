n=1; % Only one quaternion to be calculated
syms phi; syms theta; syms psi % Creates symbolic variables which Matlab will treat algebraically rather than numerically
A=mat(phi,theta,psi); % Run function to calculate A algebraically
theta=50*pi/180; phi=30*pi/180; psi=70*pi/180;
A=eval(A); % Plugs in given numerical values of phi, theta and psi to A matrix
Ea=acos(0.5*(trace(A)-1)); % Euler angle
e=1/(2*sin(Ea))*[A(2,3)-A(3,2);A(3,1)-A(1,3);A(1,2)-A(2,1)]; % Euler axis
q=quat(Ea,e,n); % Calculate quaternion from Euler angle and axis
fprintf('The quaternion for the total rotation is:\n')
disp(q)