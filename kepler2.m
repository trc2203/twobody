function [E,it]=kepler2(M,e,tol)
E=M;
diff=tol+1; % Difference between successive E values, needs an initial definition greater than tol so that loop can be entered
it=0; % Number of iterations
while abs(diff)>tol % The difference between the required error and the current error, use abs because it is only difference between the numbers which matters, not which one is bigger than the other
    En=E;
    E=E-(E-M-e*sin(E))/(1-e*cos(E));
    diff=E-En;
    it=it+1;
    if it==1
        fprintf('The eccentric anomaly after one iteration is %f radians\n',E)
    end
end
end