function [normalout] = fun_normal(x)
%Returns xn given an x location, used to enforce edges normal to bumps
normalout = -1/(0.1*pi*cos((x-2)*pi));
disp(normalout);
end


