
   


data = fminsearch(@(x) funToMinLang(x), [1])

%-0.0275 1


%0.8398   -0.0181
% 
% f = @(x) funToMinLang(x);
% X = -.05:.05: 3; 
% Z = ones(1, length(X)); 
% count =0; 
% for i=X
%     count= count +1; 
% Z(count) = f(i);
% 
% end 
% plot(X,Z) 