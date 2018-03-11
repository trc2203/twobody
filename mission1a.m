syms phi; syms theta; syms psi % Creates symbolic variables which Matlab will treat algebraically rather than numerically
A1=[1,0,0;0,cos(phi),sin(phi);0,-sin(phi),cos(phi)];
A2=[cos(theta),0,-sin(theta);0,1,0;sin(theta),0,cos(theta)];
A3=[cos(psi),sin(psi),0;-sin(psi),cos(psi),0;0,0,1];
A=A3*A1*A2;