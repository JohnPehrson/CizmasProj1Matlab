function [alpha,beta,gamma] = AlBeGa_static(Imax,Jmax,x,y,alpha,beta,gamma,delta_z,delta_n)
%Calculates alpha,beta,gamme for node movement
%Alpha,beta,gamma are static for one iteration

% initialize derivatives
xz = 0;
xn = 0;
yz = 0;
yn = 0;

    for j = 1:Jmax
        for i = 1:Imax
            
            %now pick what difference method to use based on where the node
            %location is relative to the boundaries
            
            %derivative in n
            if j ==1 %bottom wall
               xn = finDif_forward(x,i,j,delta_z,delta_n,2);
               yn = finDif_forward(y,i,j,delta_z,delta_n,2);
            elseif j == Jmax %top wall
               xn = finDif_backward(x,i,j,delta_z,delta_n,2);
               yn = finDif_backward(y,i,j,delta_z,delta_n,2);
            else  %centered between top and bottom somewhere
               xn = finDif_central(x,i,j,delta_z,delta_n,2);
               yn = finDif_central(y,i,j,delta_z,delta_n,2);
            end
                
            %derivative in z
            if i==1  %left wall
               xz = finDif_forward(x,i,j,delta_z,delta_n,1);
               yz = finDif_forward(y,i,j,delta_z,delta_n,1);
            elseif i==Imax  %right wall
               xz = finDif_backward(x,i,j,delta_z,delta_n,1);
               yz = finDif_backward(y,i,j,delta_z,delta_n,1);
            else  %centered
               xz = finDif_central(x,i,j,delta_z,delta_n,1);
               yz = finDif_central(y,i,j,delta_z,delta_n,1);
            end  
            
            alpha(i,j) = xn^2+yn^2;
            beta(i,j) = xz*xn+yz*yn;                
            gamma(i,j) = xz^2+yz^2;
            
        end
    end


end

