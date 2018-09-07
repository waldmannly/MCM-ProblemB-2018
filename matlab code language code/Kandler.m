function data=Kandler()
 time = 50; %time in years
 timex = [0:1:time]; %time array
%Narr= [high;mid;low]; %population
% initS = [Narr(1)*.999;Narr(2)*.999;Narr(3)*.999]; %initial susecptible pop
% initI = [Narr(1)*.001;Narr(2)*.001;Narr(3)*.001]; %initial infected pop
% initR = [Narr(1)*0;Narr(2)*0;Narr(3)*0]; %initial recovered pop
% initB = [0;0;0]; %initial bateria in water
%N = sum(Narr) ;

C = [ 1 .03 .05; 
     .04  1 .02 ]
 % u is pop 
 d = 10^-4*[ 1; 1; 1];
 r = [ .06; .03 ; .05]; 
 k = 1; 
 
 %1 == a
 %2 == b 
 %3 == c 
flist = @(U) [ r(1)*U(1)*(1- (U(1)/(k-U(2)-U(3)))) -  C(1,2)*U(1)*U(2) + C(1,3)*U(1)*U(3)+... 
               r(2)*U(2)*(1- (U(2)/(k-U(1)-U(3)))) -  C(2,1)*U(1)*U(2) + C(2,3)*U(2)*U(3)+... 
               r(3)*U(3)*(1- (U(3)/(k-U(2)-U(1)))) - (C(1,3)*U(1)+ C(2,3)*U(2))*U(3)+ (C(1,2)+C(2,1))*U(1)*U(2)];                
init = [.45 .1 .45];


% flist = @(Y) [Lambda(1)*Narr(1)-mu(1)*Y(1)-beta(1,1)*Y(1)*Y(2)-beta(1,2)*Y(1)*Y(6)-lambda(1)*Y(1)*Y(4)+epsilon(1)*Y(3),...
%  beta(1,1)*Y(1)*Y(2)+beta(1,2)*Y(1)*Y(6)+lambda(1)*Y(1)*Y(4)-(gamma(1)+mu(1)+alpha(1))*Y(2),...
%  gamma(1)*Y(2)-mu(1)*Y(3)-epsilon(1)*Y(3),...
%  xi(1)*Y(2)-delta(1)*Y(4),...
%  Lambda(2)*Narr(2)-mu(2)*Y(5)-beta(2,2)*Y(5)*Y(6)-beta(2,1)*Y(5)*Y(2)-beta(2,3)*Y(5)*Y(10)-lambda(2)*Y(5)*Y(8)+epsilon(2)*Y(7),...
%  beta(2,2)*Y(5)*Y(6)+beta(2,1)*Y(5)*Y(2)+beta(2,3)*Y(5)*Y(10)+lambda(2)*Y(5)*Y(8)-(gamma(2)+mu(2)+alpha(2))*Y(6),... %6Im
%  gamma(2)*Y(6)-mu(2)*Y(7)-epsilon(2)*Y(7),...
%  xi(2)*Y(6)-delta(2)*Y(8),...
%  Lambda(3)*Narr(3)-mu(3)*Y(9)-beta(3,3)*Y(9)*Y(10)-beta(3,2)*Y(9)*Y(6)-lambda(3)*Y(9)*Y(12)+epsilon(3)*Y(11),...
%  beta(3,3)*Y(9)*Y(10)+beta(3,2)*Y(9)*Y(6)+lambda(3)*Y(9)*Y(12)-(gamma(3)+mu(3)+alpha(3))*Y(10),...
%  gamma(3)*Y(10)-mu(3)*Y(11)-epsilon(3)*Y(11),...
%  xi(3)*Y(10)-delta(3)*Y(12)];
% 
% init = [initS(1) initI(1) initR(1) initB(1) initS(2) initI(2) initR(2) initB(2) initS(3) initI(3) initR(3) initB(3)];

h=.1;
steps=time;

freq=1;
out = RKStage5( flist ,init, 1, time, 1)



hold on
a1 = plot(out(1),out(2)) 
hold off

% endTotal = totals(time,:, :, :)
% totals = [totS totI totR];
% hold on
% a1 = plot(timex,totS,'m--');
% M1 = 'susceptible pop';
% a2 = plot(timex,totI, 'k-.');
% M2 = 'infected pop   ';
% a3 = plot(timex,totR , 'b');
% M3 = 'recovered pop  ';
% xlabel('Time in Days'),ylabel('Total People'), title('SIWR GDP STRUCTURED MODEL total')
% legend([a1; a2; a3], [M1; M2; M3]);
% snapnow
% hold off
% clf
% hold on
% a1 = plot(timex,out(:,1),'m--');
% M1 = 'susceptible pop';
% a2 = plot(timex,out(:,2), 'k-.');
% M2 = 'infected pop ';
% a3 = plot(timex,out(:,3) , 'b');
% M3 = 'recovered pop ';
% xlabel('Time in Days'),ylabel('Total People'), title('SIWR GDP STRUCTURED MODEL high')
% legend([a1; a2; a3], [M1; M2; M3]);
% snapnow
% hold off
% clf
% hold on
% a1 = plot(timex,out(:,5),'m--');
% M1 = 'susceptible pop';
% a2 = plot(timex,out(:,6), 'k-.');
% M2 = 'infected pop ';
% 
% a3 = plot(timex,out(:,7) , 'b');
% M3 = 'recovered pop ';
% xlabel('Time in Days'),ylabel('Total People'), title('SIWR GDP STRUCTURED MODEL mid')
% legend([a1; a2; a3], [M1; M2; M3]);
% snapnow
% hold off
% clf
% hold on
% a1 = plot(timex,out(:,9),'m--');
% M1 = 'susceptible pop';
% a2 = plot(timex,out(:,10), 'k-.');
% M2 = 'infected pop ';
% a3 = plot(timex,out(:,11) , 'b');
% M3 = 'recovered pop ';
% xlabel('Time in Days'),ylabel('Total People'), title('SIWR GDP STRUCTURED MODEL low')
% legend([a1; a2; a3], [M1; M2; M3]);
% snapnow
% hold off
% clf
% hold on
% a1 = plot(timex,out(:,4),'m--');
% M1 = 'bacteria high ';
% a2 = plot(timex,out(:,8), 'k-.');
% M2 = 'bateria mid ';
% a3 = plot(timex,out(:,12) , 'b');
% M3 = 'bateria low ';
% xlabel('Time in Days'),ylabel('Total bateria'), title('bateria differences')
% legend([a1; a2; a3], [M1; M2; M3]);
% snapnow
% hold off

data = out;
end