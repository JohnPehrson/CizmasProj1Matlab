function [XORYnew,XORYdiff] = secFinDif_central(alpha,beta,gamma,delta_z,delta_n,XORY,i,j)
%Second order finite difference that solves the laplace equation for all
%internal nodes
        ac = [-beta/(2*delta_z*delta_n),gamma/(delta_n^2),beta/(2*delta_z*delta_n),alpha/(delta_z^2),alpha/(delta_z^2),beta/(2*delta_z*delta_n),gamma/(delta_n^2),-beta/(2*delta_z*delta_n)]/(2*alpha/(delta_z^2)+2*gamma/(delta_n^2));
        XORYnew = ac(1)*XORY(i-1,j-1)+ac(2)*XORY(i,j-1)+ac(3)*XORY(i+1,j-1)+ac(4)*XORY(i-1,j)+ac(5)*XORY(i+1,j)+ac(6)*XORY(i-1,j+1)+ac(7)*XORY(i,j+1)+ac(8)*XORY(i+1,j+1);
        XORYdiff = abs(XORY(i,j)-XORYnew);

end

