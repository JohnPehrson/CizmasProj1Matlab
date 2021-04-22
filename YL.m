function [height] = YL(x)
%This function returns the height of the lower wall in the x,y frame
height = -1;
    if  x<=2
        height = 0;
    elseif x>2 && x<3
        height = 0.1*sin(3.141592*(x-2));
    elseif x>=3 
        height = 0;
%     elseif x<0 || x>5
%         height = -1;
%         fprintf('Error in YL function');
    end
    
end

