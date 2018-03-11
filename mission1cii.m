theta=50*pi/180;
phi=30*pi/180;
psi=70*pi/180;
A(:,:,1)=[1,0,0;0,cos(phi),sin(phi);0,-sin(phi),cos(phi)]; % Generates a 3D matrix made up of A1, A2 and A3
A(:,:,2)=[cos(theta),0,-sin(theta);0,1,0;sin(theta),0,cos(theta)];
A(:,:,3)=[cos(psi),sin(psi),0;-sin(psi),cos(psi),0;0,0,1];
for n=[1,2,3] % Computes the Euler axis and angle, and quaternion for each of A1, A2 and A3
    Ea(n)=acos(0.5*(A(1,1,n)+A(2,2,n)+A(3,3,n)-1));
    e(:,n)=1/(2*sin(Ea(n)))*[A(2,3,n)-A(3,2,n);A(3,1,n)-A(1,3,n);A(1,2,n)-A(2,1,n)];
    q(:,:,n)=quat(Ea,e,n); % Here the variable q is analogous to q~ = (q0,q) = (q0,q1,q2,q3) from the script, not q = (q1,q2,q3)
    fprintf('The quaternion for rotation number %d is:\n',n)
    disp(q(:,:,n))
end
px1=[0,-q(4,1,1),q(3,1,1);q(4,1,1),0,-q(2,1,1);-q(3,1,1),q(2,1,1),0]; % px1 and px3 are the cross matrices for quaternion-based rotations 1 and 3
px3=[0,-q(4,1,3),q(3,1,3);q(4,1,3),0,-q(2,1,3);-q(3,1,3),q(2,1,3),0];
r=[q(1,1,1),-q(2:4,1,1)';q(2:4,1,1),q(1,1,1)*eye(3)-px1]*q(:,1,2); % Using equation 6 to find composite rotation for a rotation A2 followed by A1 i.e. 21 rotation
r=[q(1,1,3),-q(2:4,1,3)';q(2:4,1,3),q(1,1,3)*eye(3)-px3]*r; % Find composite rotation for a total rotation consisting of the calculated rotation r followed by A3 i.e. 213 rotation
fprintf('The quaternion for the three successive rotations is:\n')
disp(r)