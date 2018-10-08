function pts=RKStage5(flist,init,h,steps,freq)
Y=init;
pts=zeros(1+fix(steps/freq),length(init));
pts(1,:)=Y; ic=1;
count=0; 
for i=1:steps
    count =count+1; 
   
    k1=h*flist(Y);
    k2=h*flist(Y+0.25*k1);
    k3=h*flist(Y+0.5*k2);
    k4=h*flist(Y+1/2*k1 - k2 + 5/4*k3);
    k5=h*flist(Y +2/3*k2+1/3*k4);
    Y=Y+(3*k1+4.0*k2+10*k3+4*k4+3*k5)/24.0;
    if rem(i,freq)==0 ic=ic+1; pts(ic,:)=Y; end;
end;
