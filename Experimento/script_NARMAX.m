


% NARMAX 

clear all;
clc;
l = 2;

for m=0:1:l  
    for p=0:1:m
        
        if(m>0 && p>0)
            fprintf('m=%d  ', m);
            fprintf('p=%d \n', p);
        end
%         for i=1:1:p
%             fprintf('y_n%d ', p);
%         end
%         for j=(p + 1):1:m
%             fprintf('x_n%d ', m);
%         end
%         fprintf('\n');
    end
end