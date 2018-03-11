function q=quat(Ea,e,n)
    q=[cos(Ea(n)/2);e(1,n)*sin(Ea(n)/2);e(2,n)*sin(Ea(n)/2);e(3,n)*sin(Ea(n)/2)];
end