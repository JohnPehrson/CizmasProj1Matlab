function [xout,yout] = bumpcornermover(Imax,x,y)
%function to move the outermost nodes on the flat wall to the bump
%in order to retain fine geometric accuracy
%input all x and y along with Imax, Jmax, and X_R,X_L
%we know the bump is on the bottom wall, so j = 1 for all calcs

%find and move left corner
[~, ileft] = min(abs(x(:,1) - 2));
x(ileft,1)=2 ;
y(ileft,1)=YL(x(ileft,1));

%find and move right corner
[~, iright] = min(abs(x(:,1) - 3));
x(iright,1)=3;
y(iright,1)=YL(x(iright,1));


xout = x;
yout = y;
end

