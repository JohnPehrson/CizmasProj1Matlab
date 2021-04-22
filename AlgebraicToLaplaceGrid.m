function [xout,yout,iterations,maxerr] = AlgebraicToLaplaceGrid(Imax,Jmax,X_L,X_R,Y_U,z,n,x,y,alpha,beta,gamma,delta_z,delta_n)
%This function accepts the algebraic grid and associated variables and
%outputs the final laplace grid

%% Iteration/solving conditions
 itMax = 300;          %maximum number of iterations
 relErrMax = 0.00008;     %maximum relative error allowable to converge
 relErrMax_inloop = 1;  %dummy variable to initiate the loop
 itcount = 0;
 xplotter = linspace(X_L,X_R);
 
%% Loop for each iteration
while itcount<itMax && relErrMax<relErrMax_inloop
    itcount = itcount+1;
    relErrMax_inloop = 0;
    %calculate static alpha/beta/gamma
    [alpha,beta,gamma] = AlBeGa_static(Imax,Jmax,x,y,alpha,beta,gamma,delta_z,delta_n);
    %loops over each node on the grid
    for j = 1:Jmax
        for i = 1:Imax      
            %node move logic with boundary conditions
            [xnew,ynew,xdif,ydif] = LaplaceGridNodeLogic(i,j,Imax,Jmax,alpha(i,j),beta(i,j),gamma(i,j),x,y,delta_z,delta_n);
            %is the error larger than other errors?
            if x(i,j) == 2 || x(i,j) == 3 %bump corners
                %don't apply the error calcs, forcing them even if strange
            else
                relErrMax_inloop = max([relErrMax_inloop,xdif,ydif]);
            end
            %changes the grid nodes
            x(i,j) = xnew;
            y(i,j) = ynew;
            
        end
    end
    
        %function to move the outermost nodes on the flat wall to the bump
        %in order to retain fine geometric accuracy
        [x,y] = bumpcornermover_outin(Imax,x,y);
    
        %plotting in the while loop to see how the grid changes over time
        clf;
        for j = 1:Jmax
        plot(x(:,j),y(:,j),'k');
        hold on;
        end 
        for i = 1:Imax
            plot(x(i,:),y(i,:),'k');
            hold on;
        end 
        for k = 1:length(xplotter)
            yplotter(k) = YL(xplotter(k));
        end
        plot(xplotter,yplotter);
        hold on;
        title(['Maximum error is ' num2str(relErrMax_inloop)]);
        axis([0 5 -1 2]);
        pause(0.01); 
           
end


%% Output final values
iterations = itcount;
xout = x;
yout = y;
maxerr = relErrMax_inloop;
end

