f = @(t,y) (2 - exp(-4*t) - 2*y);
h = 0.1;  % Define Step Size
t_final = 5;
t = 0:h:t_final;
y = zeros(1,numel(t));
y(1) = 1;  % y0
ic=1;
pts(1,:)=[1 1];

flist = @(Y) (2 - exp(-4*Y(1)) - 2*Y(2) ); 
out2 = RKStage5(flist, [1 1] ,h,length(t),1)
% You know the value a t = 0, thats why you'll state with t = h i.e. i = 2
for i = 2:numel(t)
    k1 = h*f(t(i-1),y(i-1));
    k2 = h*f(t(i-1)+h/2, y(i-1)+k1/2);
    k3 = h*f(t(i-1)+h/2, y(i-1)+k2/2);
    k4 = h*f(t(i-1)+h, y(i-1)+k3);
    y(i) = y(i-1) + (k1+2*k2+2*k3+k4)/6;
    ic=ic+1;
    pts(ic,:)= [t(i) y(i)];
end

for i = 2:numel(t)
    k1 = h*f(t(i-1),y(i-1));
    k2 = h*f(t(i-1)+h/2, y(i-1)+k1/2);
    k3 = h*f(t(i-1)+h/2, y(i-1)+k2/2);
    k4 = h*f(t(i-1)+h, y(i-1)+k3);
    y(i) = y(i-1) + (k1+2*k2+2*k3+k4)/6;
    ic=ic+1;
    pts(ic,:)= [t(i) y(i)];
end