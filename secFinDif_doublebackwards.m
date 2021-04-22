function [XORYnew,XORYdiff] = secFinDif_doublebackwards(alpha,beta,gamma,delta_z,delta_n,XORY,i,j)
%Second order finite difference that solves the laplace equation for all
%internal nodes
        abb = [-2*alpha/(delta_z^2)+2*beta/(delta_z*delta_n),-2*gamma/(delta_n^2)+2*beta/(delta_n*delta_z),-2*beta/(delta_z*delta_n),alpha/(delta_z^2),gamma/(delta_n^2)]/(-1*(alpha/(delta_z^2)-2*beta/(delta_z*delta_n)+gamma/(delta_n^2)));
        
        XORYnew = abb(1)*XORY(i-1,j)+abb(2)*XORY(i,j-1)+abb(3)*XORY(i-1,j-1)+abb(4)*XORY(i-2,j)+abb(5)*XORY(i,j-2);
        XORYdiff = abs(XORY(i,j)-XORYnew);
end

