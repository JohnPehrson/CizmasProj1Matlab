function [findifnumber] = finDif_central(XORY,Ind_i,Ind_j,delta_z,delta_n,switchnumber)
%This is a first-order finite difference for either x or y with the switch
%determining whether the derivative is taken with respect to z (xi) with 1,
%or n with 2

    if switchnumber ==1 %z derivative
        findifnumber = (XORY(Ind_i+1,Ind_j)-XORY(Ind_i-1,Ind_j))/(2*delta_z);
    elseif switchnumber ==2 %n derivative
        findifnumber = (XORY(Ind_i,Ind_j+1)-XORY(Ind_i,Ind_j-1))/(2*delta_n);
    else
        fprintf('error in forward finite difference method');
    end

end