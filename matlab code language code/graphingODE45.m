init1966 = 1000000*[89;89;301;72;120;171;58;100;42;38;78;530;37;88;29;176;166;40;44;55;28];
[t,y] = ode45(@vdp1,[0:100],init1966);
%[y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21] = y(:,1:21);
%plot(t,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,y18,y19,y20,y21)
t = t+ 1966;

styles= ['-.+' '-.o' '-.*'	'-..'	'-.x'	'-.s' '-.d' '-.^'	'-.v'	'-.>'	'-.<'	'-.p' '-.h' '-.+' '-.o' '-.*'	'-..'	'-.x'	'-.s' '-.d' '-.^'	'-.v' '-.>'	'-.<'	'-.p' '-.h']; %'-' '--' ':' '-.'

hold on 
for (i = 1:1:21) 
    if (i<10)
        M(i) = strcat({'Language '}, {int2str(i)}, {' '});
    else
        M(i) = strcat({'Language '}, {int2str(i)});
    end 
    a(i) = plot(t,y(:,i), styles(i))%, color(i));
end

xlabel('Time in Year'),ylabel('Total Speakers of Language'), title('GDP Model of Changine in Language Speakers Over Time')
xlim([min(t) max(t)])
legend(a, M);
snapnow
hold off 