clear all;close all;clc;
%John Pehrson
%Aero 489 Cizmas
%UIN: 826006092
%Date: March 3, 2021
%% This program creates a near-orthogonal grid for  x(z,n), y(z,n) using the laplace equations 

%Procedure
    %1. Preliminary Definitions
    %2. Create an z,n and algebraic grid for the geometry based on z,n
    %3. Iterate the algebraic grid using the laplace equations
    %4. Plot the laplace grid
    
%% Preliminary Definitions
Imax = 10;   %must be greater than 10
Jmax = 5;   %must be greater than 5
X_L = 0;
X_R = 5;
% Y_L = YL(x); %% left undefined, call when necessary
Y_U = 1;

%% Set up matraxies for variables
z = zeros(Imax,Jmax);
n = zeros(Imax,Jmax);
x = zeros(Imax,Jmax);
y = zeros(Imax,Jmax);
alpha = zeros(Imax,Jmax);
beta = zeros(Imax,Jmax);
gamma = zeros(Imax,Jmax);

%% Generate the z,n grid and algebraic grid
[z,n,x,y,delta_z,delta_n] = AlgebraicGridGen(Imax,Jmax,X_L,X_R,Y_U,z,n,x,y);

%% Convert the algebraic grid into a laplace-conforming grid
% [xout,yout,iterations,maxerr] = AlgebraicToLaplaceGrid(Imax,Jmax,X_L,X_R,Y_U,z,n,x,y,alpha,beta,gamma,delta_z,delta_n);

% Plot the most updated x,y grid
for j = 1:Jmax
    plot(x(:,j),y(:,j),'k');
    hold on;
end 
for i = 1:Imax
    plot(x(i,:),y(i,:),'k');
    hold on;
end 

save('testgridX.mat','x');
save('testgridY.mat','y');



