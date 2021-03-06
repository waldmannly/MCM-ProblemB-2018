format compact

init1966TOTAL = 1000000*[89;89;301;72;120;171;58;100;42;38;78;530;37;88;29;176;166;40;44;55;28];

init2017TOTAL=  1000000*[422	;261;	983;	229;	129;	428;	66;	129;	84;	77;	281;	1090;	74;	229;	148;	267;	527;	75;	92;	116;	68]; 


init2001Native=  1000000*[191	207	341	77	100	366	62	125	75	78	21	874	68	176	64.5	167	340	66	69	60	68];
init2017Native = 1000000*[295	242	372	76	77	260	63	128	84	77	61	898	72	219	119	154	437	68	74	69	68];					


init = init2017TOTAL ; 
%0.8398   -0.0181
%-0.0124   1
%OPTIMAL 0.2804    1 

%natives -.0405 1 
% OPTIMAL 0.1668 1 
setGlobalx( .05, 1);
%[t,y] = ode45( @vdp1(t,P),[0:49]  ,init);
[t,y] = ode45(@vdp1,[0:50],init);




styles= ['-.' '-.o' '-.*'	'-..'	'-.x'	'-.s'	'-.v' '-.p' '-.h' '-.+'	'-.s' '-.d' '-.^'	'-.v' '-.' '-.o' '-.*'	'-..'	'-.x'	'-.s'	'-.v' '-.p' '-.h' '-.+'	'-.s' '-.d' '-.^'	'-.v' ]; %'-' '--' ':' '-.'

t = t+ 2017;
%t = t+ 2017;

languages = {'Arabic'	,'Bengali'	,'English'	,'French',	'German',	'Hindi',	'Italian'	,'Japanese',	'Javanese'	,'Korean'	,'Malay'	,'Mandarin',	'Marathi',	'Portuguese',	'Punjabi (Lahnda)',	'Russian',	'Spanish',	'Tamil'	,'Telugu'	,'Urdu'	,'Vietnamese'};

longest = length('Punjabi (Lahnda)');


hold on 
for (i = 1:1:21) 
    current = length(languages(i)); 
    needSpaces= longest-current; 
    label = languages(i); 
    for (j= 1:1:needSpaces) 
         label = strcat(label, {' '});
    end 
    M(i) = label;
    
    a(i) = plot(t,y(:,i), styles(i));%, color(i));
end

xlabel('Time in Year'),ylabel('Total Speakers of Language'), title('GDP Model of Change in Language Speakers Over Time');
xlim([min(t) max(t)]);
legend(a, M);



snapnow
hold off 