function Omegadot=envisat(t,Omega)
alt=500;
RE=6378;
r=alt+RE;
mu=3.986e5;
n=sqrt(mu/r^3);
Ixx=55533;
Iyy=582633;
Izz=605933;
Omegadot=[Omega(4);Omega(5);Omega(6);(Omega(5)+n*Omega(1))*(Omega(6)+n)*(Iyy-Izz)/Ixx+n*Omega(5);((Omega(4)-n*Omega(2))*(Omega(6)+n)-3*n^2*Omega(2))*(Izz-Ixx)/Iyy-n*Omega(4);3*n^2*Omega(3)*(Ixx-Iyy)/Izz];
end