format long
clear
type choleraData.m
totalPop = 10000000;
%no class division
high= 0;
mid = 0;
low = 10000000;
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**0 high, 0 mid, 1 low **')
data(1,:,:,:) = choleraData(high,mid,low);
clear
clf
totalPop = 10000000;
%relatively large class sizes
high= totalPop*.1;
mid = totalPop*.3;
low = totalPop*.6;
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**.10 high, .30 mid, .60 low **')
data(2,:,:,:) = choleraData(high,mid,low);
clear
clf
totalPop = 10000000;
%half of the relatively large class sizes
high= totalPop*.05;
mid = totalPop*.15;
low = totalPop*.8;
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**.05 high, .15 mid, .80 low **')
data(2,:,:,:) = choleraData(high,mid,low);
clear
clf
totalPop = 10000000;

%wikipedia numbers (circa 1980)
high= totalPop*.02;
mid = totalPop*.05;
low = totalPop*.93;
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**.02 high, .05 mid, .93 low **')
data(2,:,:,:) = choleraData(high,mid,low);
clear
clf
totalPop = 10000000;
% half wikipedia numbers because its GDP is about half of what it was
%wikipedia numbers (circa 1980)
high= totalPop*.01;
mid = totalPop*.025;
low = totalPop*.965;
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**.01 high, .025 mid, .965 low **')
data(2,:,:,:) = choleraData(high,mid,low);
clear
clf
totalPop = 10000000;
%very small class sizes
high= 10000; %.001 percent
mid = 100000; %.01 percent
low = 9890000; %.998 percent
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**********************************')
disp('**.001 high, .01 mid, .998 low **')
data(3,:,:,:) = choleraData(high,mid,low);