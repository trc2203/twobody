syms phi; syms theta; syms psi
A1=[1,0,0;0,1,phi;0,-phi,1];
A2=[1,0,-theta;0,1,0;theta,0,1];
A3=[1,psi,0;-psi,1,0;0,0,1];
A=A3*A1*A2