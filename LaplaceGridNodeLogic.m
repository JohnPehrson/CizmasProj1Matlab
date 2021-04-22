function [xnew,ynew,xdif,ydif] = LaplaceGridNodeLogic(i,j,Imax,Jmax,alpha,beta,gamma,x,y,delta_z,delta_n)
%Identifies what steps should be taken based on where the node is in the
%grid
%alpha,beta,gamma are all doubles
%x and y inputs are matraxies

X_L = 0;
X_R = 5;
Y_U = 1;

    %% Logic for node placement
    if i>=2 && i<=(Imax-1) && j>=2 && j<=(Jmax-1) %central derivatives
        [xnew,xdif] = secFinDif_central(alpha,beta,gamma,delta_z,delta_n,x,i,j);
        [ynew,ydif] = secFinDif_central(alpha,beta,gamma,delta_z,delta_n,y,i,j);
    elseif (i ==1 && j==1) || (i == 1 && j == Jmax) || (i == Imax && j == 1) || (i == Imax && j == Jmax) %corner
        xnew = x(i,j);
        xdif = 0;
        ynew = y(i,j);
        ydif = 0;
    elseif j == 1 
        if x(i,j)<(X_R/5) %double forward  flat bottom wall left of bump
            [xnew,xdif] = secFinDif_doubleforward(alpha,beta,gamma,delta_z,delta_n,x,i,j);
            ynew = YL(xnew);
            ydif = 0;
        elseif x(i,j)<=(2*X_R/5) %zbackwards-nforwards  flat bottom wall left of bump
            [xnew,xdif] = secFinDif_zbackwardsnforwards(alpha,beta,gamma,delta_z,delta_n,x,i,j);
            ynew = YL(xnew);
            ydif = 0;            
        elseif x(i,j)>((2*X_R)/5) && x(i,j)<=((3*X_R)/5) %double forward   %bottom bump
            %xdef
            [xnew,xdif] = bumpboundarysetter(i,j,x,y);
            %ydef based on xdef
            ynew = YL(xnew);
            ydif = abs(ynew-y(i,j));
        elseif x(i,j)>=((3*X_R)/5) && x(i,j)<=((4*X_R)/5)%double forwards  % flat bottom wall right of the bump
            [xnew,xdif] = secFinDif_doubleforward(alpha,beta,gamma,delta_z,delta_n,x,i,j);
            ynew = YL(xnew);
            ydif = 0;
        elseif x(i,j)>=((4*X_R)/5)
            [xnew,xdif] = secFinDif_zbackwardsnforwards(alpha,beta,gamma,delta_z,delta_n,x,i,j);
            ynew = YL(xnew);
            ydif = 0;
        else
            fprintf('error in bump');
        end
        
    elseif j == Jmax
        if i<=(Imax/2) %zforwards-nbackwards %top wall left side
            [xnew,xdif] = secFinDif_zforwardsnbackwards(alpha,beta,gamma,delta_z,delta_n,x,i,j);
            ynew = Y_U;
            ydif = 0;
        elseif i>(Imax/2) %double backwards  %top wall right side
            [xnew,xdif] = secFinDif_doublebackwards(alpha,beta,gamma,delta_z,delta_n,x,i,j);
            ynew = Y_U;
            ydif = 0;
        end      
            
    elseif i == 1
        if j<=(Jmax/2) %double forwards  %left wall lower half
            xnew = X_L;
            xdif = 0;
            [ynew,ydif] = secFinDif_doubleforward(alpha,beta,gamma,delta_z,delta_n,y,i,j);
        elseif j>(Jmax/2) %zforwards-nbackwards %left wall upper half
            xnew = X_L;
            xdif = 0;
            [ynew,ydif] = secFinDif_zforwardsnbackwards(alpha,beta,gamma,delta_z,delta_n,y,i,j);
        end
        
    elseif i == Imax
        if j<=(Jmax/2) %zbackwards-nforwards  %right wall lower half
            xnew = X_R;
            xdif = 0;
            [ynew,ydif] = secFinDif_zbackwardsnforwards(alpha,beta,gamma,delta_z,delta_n,y,i,j);
        elseif j>(Jmax/2) %double backwards  %right wall upper half
            xnew = X_R;
            xdif = 0;
            [ynew,ydif] = secFinDif_doublebackwards(alpha,beta,gamma,delta_z,delta_n,y,i,j);
        end
    end

    if xnew >X_R
        xnew = X_R;
    end
    
end

