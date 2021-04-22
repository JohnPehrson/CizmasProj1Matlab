function [XORYnew,XORYdiff] = secFinDif_zbackwardsnforwards(alpha,beta,gamma,delta_z,delta_n,XORY,i,j)
%Second order finite difference that solves the laplace equation for all
%internal nodes
        abf = [-2*alpha/(delta_z^2)-2*beta/(delta_z*delta_n),-2*gamma/(delta_n^2)-2*beta/(delta_z*delta_n),2*beta/(delta_z*delta_n),alpha/(delta_z^2),gamma/(delta_n^2)]/(-1*(alpha/(delta_z^2)+2*beta/(delta_z*delta_n)+gamma/(delta_n^2)));
        
        XORYnew = abf(1)*XORY(i-1,j)+abf(2)*XORY(i,j+1)+abf(3)*XORY(i-1,j+1)+abf(4)*XORY(i-2,j)+abf(5)*XORY(i,j+2);
        XORYdiff = abs(XORY(i,j)-XORYnew);
end

