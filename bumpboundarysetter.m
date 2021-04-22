function [xnew,xdif] = bumpboundarysetter(i,j,x,y)
%This function sets the x location of nodes on the bump 
%x,y are both matraxies
normal = fun_normal(x(i,j));
xnew = (1/normal)*(y(i,1)-(4/3)*y(i,2)+(1/3)*y(i,3))+(4/3)*x(i,2)-(1/3)*x(i,3);
xdif = abs(xnew-x(i,j));
end

