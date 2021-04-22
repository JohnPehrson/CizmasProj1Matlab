function [z,n,x,y,delta_z,delta_n] = AlgebraicGridGen(Imax,Jmax,X_L,X_R,Y_U,z,n,x,y)
%This is a subroutine to find the algebraic grid using mapping from z,n
%coordinates to the x,y coordinates of the real geomtric plane

%% Generate the z,n grid

for i = 1:Imax
    for j = 1:Jmax
        z(i,j) = (i-1)/(Imax-1);
        n(i,j) = (j-1)/(Jmax-1);        
    end
end

%% Map the z,n grid onto the x,y plane
for i = 1:Imax
    for j = 1:Jmax
        x(i,j) = X_L + z(i,j)*(X_R-X_L);
        y(i,j) = YL(x(i,j)) +n(i,j)*(Y_U-YL(x(i,j)));
        
    end
end
delta_z = z(2,1)-z(1,1);  %constant z
delta_n = n(1,2)-n(1,1);  %constant n
end

