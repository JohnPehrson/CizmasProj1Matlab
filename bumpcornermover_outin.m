function [xout,yout] = bumpcornermover_outin(Imax,x,y)
%function to move the outermost nodes on the flat wall to the bump
%in order to retain fine geometric accuracy
%input all x and y along with Imax, Jmax, and X_R,X_L
%we know the bump is on the bottom wall, so j = 1 for all calcs

%find and move left corner
ileft = -1;
for i = 1:Imax
    if x(i,1)<=2
        if i>ileft
            ileft = i;
        end
    end
end
x(ileft,1) = 2;

%find and move right corner
iright = Imax;
for i = 1:Imax
    if x(i,1)>=3
        if i<iright
            iright = i;
        end
    end
end
x(iright,1) = 3;

xout = x;
yout = y;
end

