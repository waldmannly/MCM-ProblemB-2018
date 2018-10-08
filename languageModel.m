

time = 50*365; %time in days
timex = [0:1:time/365]; %time array
 
numSpeakerPerLanguage= [6000000, 4000000]%, 200000000, 50000000];

%rate of natural increase 
B = .0001*1/365*[6.23; 0.84;17.75;4.37;0.71;5.07;0.17;2.88;2.33;0.31;1.14;4.42;0.91;3.38;0.67;11.05;0.30;0.45;1.01;0.28];
%D = ones(1,20)*.0005 %mortality rate

%scaling vector for effect of GDP on language change 
E = ones(1,20)/365; 

%gdpEachLang = ones(1,20)*.5; 

%gdp matrix 
k =10000* [1	0.02083078311	0.006518460588	0.02777545229	0.0199992446	0.02588929626	0.03739830437	0.05729227739	0.2678456895	0.1100006105	0.03014251605	0.007770685331	0.104620808	0.01857769265	0.02211904977	0.007332298352	0.1129339601	0.05602098268	0.08672034003	0.1245595149;
0.02843250787	1	0.007615524673	0.03245009146	0.02336513945	0.03024649329	0.04369248012	0.06693463067	0.3129244135	0.1285138342	0.03521553465	0.009078500217	0.1222286051	0.02170433875	0.02584171017	0.008566332228	0.1319408698	0.06544937567	0.1013154686	0.1455230182;
0.09086062525	0.07777158242	1	0.103699456	0.07466703921	0.09665750572	0.1396263067	0.2139003152	1	0.4106865067	0.1125368719	0.0290117991	0.3906010519	0.06935968499	0.08258131695	0.02737508439	0.4216381469	0.2091539453	0.3237697803	0.4650420738;
0.02132355572	0.01825176381	0.005711422484	1	0.01752317648	0.02268399214	0.03276809203	0.05019903041	0.2346842283	0.09638164591	0.02641062895	0.006808611684	0.09166790644	0.01627762415	0.01938053264	0.006424500556	0.09895182313	0.04908513226	0.07598366105	0.1091380402;
0.02961468879	0.02534850716	0.007932166737	0.03379931746	1	0.031504097	0.04550914774	0.06971767197	0.3259353401	0.1338572462	0.03667974363	0.009455970604	0.1273106867	0.02260677252	0.02691616962	0.00892250744	0.1374267728	0.06817066229	0.1055280134	0.1515736465;
0.02287707626	0.01958148996	0.006127526262	0.02610966364	0.01879982165	1	0.03515540044	0.053856264	0.2517820694	0.1034034985	0.0283347665	0.007304650814	0.09834634116	0.01746352502	0.02079249488	0.006892555398	0.1061609252	0.05266121318	0.0815194253	0.1170892557;
0.01583685182	0.01355545401	0.004241832495	0.0180746381	0.01301433743	0.01684723819	1	0.03728245966	0.1742982923	0.0715819568	0.0196149846	0.00505670704	0.06808109632	0.01208927465	0.01439378252	0.004771430462	0.07349080898	0.0364551755	0.05643251981	0.08105603932;
0.01033771796	0.008848504859	0.002768913193	0.01179846304	0.008495283736	0.01099726124	0.01588606036	1	0.1137755538	0.04672608473	0.01280394493	0.003300833509	0.04444085099	0.007891436571	0.009395735069	0.003114615387	0.04797211366	0.02379660595	0.03683708605	0.05291041948;
0.002211241129	0.001892697978	0.0005922714047	0.002523694962	0.001817143869	0.002352317646	0.003398033319	0.005205612146	1	0.009994724252	0.002738767855	0.0007060493279	0.009505912033	0.00168798077	0.002009750693	0.0006662172129	0.01026125023	0.005090101514	0.007879464317	0.0113175554;
0.005384255613	0.004608619829	0.001442149657	0.00614506423	0.004424649554	0.005727769496	0.00827403205	0.01267539123	0.05925840372	1	0.006668755391	0.001719192903	0.02314639482	0.004110144215	0.004893637019	0.001622203803	0.02498560353	0.01239412893	0.01918608035	0.02755765095;
0.01964903672	0.01681846976	0.005262909787	0.02242549414	0.01614709772	0.02090263933	0.03019484423	0.04625694722	0.2162546941	0.08881288487	1	0.006273937739	0.08446931098	0.01499935746	0.01785859743	0.005919990501	0.09118122847	0.04523052246	0.07001673479	0.1005675314;
0.07621868336	0.06523890407	0.02041484579	0.08698857157	0.06263464953	0.08108141235	0.1171259082	0.1794308629	0.8388527279	0.3445054965	0.09440186202	1	0.3276567579	0.05818256097	0.069273563	0.02296366422	0.3536923097	0.1754493576	0.2715951634	0.3901018122;
0.005661124358	0.004845603894	0.001516307757	0.006461055212	0.004652173515	0.006022302383	0.008699498638	0.01332718415	0.06230558443	0.02558806282	0.007011675576	0.001807597098	1	0.004321495709	0.005145277216	0.001705620632	0.02627041116	0.0130314588	0.02017266538	0.02897471819;
0.0318807839	0.02728815707	0.008539130545	0.03638561741	0.02619884835	0.03391476829	0.04899147565	0.07505241909	0.3508756826	0.1440999084	0.03948645176	0.01017953481	0.1370524107	1	0.02897577595	0.009605251421	0.1479425726	0.07338703332	0.1136029427	0.1631719551;
0.02677653022	0.02291920313	0.007171978198	0.03056012008	0.02200429753	0.02848486477	0.04114772498	0.06303619678	0.294698943	0.1210288794	0.03316449721	0.008549746528	0.1151097171	0.02044022585	1	0.008067408434	0.1242563162	0.0616374466	0.09541461202	0.1370474076;
0.08077568264	0.06913943903	0.02163541841	0.09218948611	0.06637948006	0.08592914681	0.1241286883	0.1901587616	0.8890064581	0.3651029567	0.1000460059	0.02579167676	0.3472468577	0.06166120789	0.07341532409	1	0.3748390356	0.1859392081	0.2878334256	0.4134254069;
0.005244404818	0.004488915417	0.001404691224	0.005985452172	0.004309723591	0.005578996263	0.008059122126	0.01234616029	0.0577192244	0.02370450664	0.006495540965	0.001674538542	0.02254518976	0.004003387222	0.004766529564	0.001580068639	1	0.0120722035	0.0186877406	0.02684186781;
0.01057231374	0.009049305646	0.002831748662	0.01206620778	0.008688068809	0.01124682416	0.01624656572	0.02488890247	0.1163574839	0.04778644858	0.01309450726	0.003375739945	0.04544935559	0.008070518427	0.009608954254	0.00318529594	0.04906075387	1	0.03767303699	0.05411112559;
0.006829671154	0.005845814197	0.001829297979	0.007794720557	0.005612456687	0.007265402112	0.01049521458	0.01607812854	0.0751664556	0.03086984907	0.008458997788	0.002180714109	0.02936009662	0.005213521682	0.006207344894	0.002057688065	0.03169304505	0.01572136074	1	0.03495556439;
0.004754927035	0.004069949979	0.00127358671	0.00542680997	0.003907482723	0.005058289945	0.007306937394	0.011193852	0.05233209679	0.02149208602	0.005889290475	0.001518248278	0.02044097205	0.003629737748	0.004321653472	0.001432595566	0.02206520831	0.01094546451	0.01694355148	1;];
%S = randi([-1, 1], 20)
%random = diag(diag(S)) - S  + diag(ones(1,20)) 
%k = random; 


% flist = @(P) [-k(1,2)*P(1)*E(1)+k(2,1)*P(2)*E(1),...
% -k(1,2)*P(2)*E(2)+k(2,1)*P(1)*E(2)];
% j=1
% 
% flist = @(P) [B(1)*P(1)-D(1)*P(1)+symsum(-k(1,j)*P(1)*E(1)+k(j,1)*P(j)*E(1),j,1,5),...
% B(2)*P(2)-D(2)*P(2)+symsum(-k(2,j)*P(2)*E(2)+k(j,2)*P(j)*E(2),j,1,5),...
% B(3)*P(3)-D(3)*P(3)+symsum(-k(3,j)*P(3)*E(3)+k(j,3)*P(j)*E(3),j,1,5),...
% B(4)*P(4)-D(4)*P(4)+symsum(-k(4,j)*P(4)*E(4)+k(j,4)*P(j)*E(4),j,1,5),...
% B(5)*P(5)-D(5)*P(5)+symsum(-k(5,j)*P(5)*E(5)+k(j,5)*P(j)*E(5),j,1,5)]
syms P
flist1 = [B(1)*P(1)-k(1,2)*P(1)*E(1)+...
 B(2)*P(2)-k(2,1)*P(2)*E(2)+k(1,2)*P(1)*E(2)];

flist = @(P) [B(1)*P(1)-k(1,2)*P(1)*E(1)+k(2,1)*P(2)*E(1)-k(1,3)*P(1)*E(1)+k(3,1)*P(3)*E(1)-k(1,4)*P(1)*E(1)+k(4,1)*P(4)*E(1)+...%-k(1,5)*P(1)*E(1)+k(5,1)*P(5)*E(1)-k(1,6)*P(1)*E(1)+k(6,1)*P(6)*E(1)-k(1,7)*P(1)*E(1)+k(7,1)*P(7)*E(1)-k(1,8)*P(1)*E(1)+k(8,1)*P(8)*E(1)-k(1,9)*P(1)*E(1)+k(9,1)*P(9)*E(1)-k(1,10)*P(1)*E(1)+k(10,1)*P(10)*E(1)-k(1,11)*P(1)*E(1)+k(11,1)*P(11)*E(1)-k(1,12)*P(1)*E(1)+k(12,1)*P(12)*E(1)-k(1,13)*P(1)*E(1)+k(13,1)*P(13)*E(1)-k(1,14)*P(1)*E(1)+k(14,1)*P(14)*E(1)-k(1,15)*P(1)*E(1)+k(15,1)*P(15)*E(1)-k(1,16)*P(1)*E(1)+k(16,1)*P(16)*E(1)-k(1,17)*P(1)*E(1)+k(17,1)*P(17)*E(1)-k(1,18)*P(1)*E(1)+k(18,1)*P(18)*E(1)-k(1,19)*P(1)*E(1)+k(19,1)*P(19)*E(1)-k(1,20)*P(1)*E(1)+k(20,1)*P(20)*E(1),...
              B(2)*P(2)-k(2,1)*P(2)*E(2)+k(1,2)*P(1)*E(2)-k(2,3)*P(2)*E(2)+k(3,2)*P(3)*E(2)-k(2,4)*P(2)*E(2)+k(4,2)*P(4)*E(2)+...%-k(2,5)*P(2)*E(2)+k(5,2)*P(5)*E(2)-k(2,6)*P(2)*E(2)+k(6,2)*P(6)*E(2)-k(2,7)*P(2)*E(2)+k(7,2)*P(7)*E(2)-k(2,8)*P(2)*E(2)+k(8,2)*P(8)*E(2)-k(2,9)*P(2)*E(2)+k(9,2)*P(9)*E(2)-k(2,10)*P(2)*E(2)+k(10,2)*P(10)*E(2)-k(2,11)*P(2)*E(2)+k(11,2)*P(11)*E(2)-k(2,12)*P(2)*E(2)+k(12,2)*P(12)*E(2)-k(2,13)*P(2)*E(2)+k(13,2)*P(13)*E(2)-k(2,14)*P(2)*E(2)+k(14,2)*P(14)*E(2)-k(2,15)*P(2)*E(2)+k(15,2)*P(15)*E(2)-k(2,16)*P(2)*E(2)+k(16,2)*P(16)*E(2)-k(2,17)*P(2)*E(2)+k(17,2)*P(17)*E(2)-k(2,18)*P(2)*E(2)+k(18,2)*P(18)*E(2)-k(2,19)*P(2)*E(2)+k(19,2)*P(19)*E(2)-k(2,20)*P(2)*E(2)+k(20,2)*P(20)*E(2),...
              B(3)*P(3)-k(3,1)*P(3)*E(3)+k(1,3)*P(1)*E(3)-k(3,2)*P(3)*E(3)+k(2,3)*P(2)*E(3)-k(3,4)*P(3)*E(3)+k(4,3)*P(4)*E(3)+...%-k(3,5)*P(3)*E(3)+k(5,3)*P(5)*E(3)-k(3,6)*P(3)*E(3)+k(6,3)*P(6)*E(3)-k(3,7)*P(3)*E(3)+k(7,3)*P(7)*E(3)-k(3,8)*P(3)*E(3)+k(8,3)*P(8)*E(3)-k(3,9)*P(3)*E(3)+k(9,3)*P(9)*E(3)-k(3,10)*P(3)*E(3)+k(10,3)*P(10)*E(3)-k(3,11)*P(3)*E(3)+k(11,3)*P(11)*E(3)-k(3,12)*P(3)*E(3)+k(12,3)*P(12)*E(3)-k(3,13)*P(3)*E(3)+k(13,3)*P(13)*E(3)-k(3,14)*P(3)*E(3)+k(14,3)*P(14)*E(3)-k(3,15)*P(3)*E(3)+k(15,3)*P(15)*E(3)-k(3,16)*P(3)*E(3)+k(16,3)*P(16)*E(3)-k(3,17)*P(3)*E(3)+k(17,3)*P(17)*E(3)-k(3,18)*P(3)*E(3)+k(18,3)*P(18)*E(3)-k(3,19)*P(3)*E(3)+k(19,3)*P(19)*E(3)-k(3,20)*P(3)*E(3)+k(20,3)*P(20)*E(3),...
              B(4)*P(4)-k(4,1)*P(4)*E(4)+k(1,4)*P(1)*E(4)-k(4,2)*P(4)*E(4)+k(2,4)*P(2)*E(4)-k(4,3)*P(4)*E(4)+k(3,4)*P(3)*E(4)]%-k(4,5)*P(4)*E(4)+k(5,4)*P(5)*E(4)-k(4,6)*P(4)*E(4)+k(6,4)*P(6)*E(4)-k(4,7)*P(4)*E(4)+k(7,4)*P(7)*E(4)-k(4,8)*P(4)*E(4)+k(8,4)*P(8)*E(4)-k(4,9)*P(4)*E(4)+k(9,4)*P(9)*E(4)-k(4,10)*P(4)*E(4)+k(10,4)*P(10)*E(4)-k(4,11)*P(4)*E(4)+k(11,4)*P(11)*E(4)-k(4,12)*P(4)*E(4)+k(12,4)*P(12)*E(4)-k(4,13)*P(4)*E(4)+k(13,4)*P(13)*E(4)-k(4,14)*P(4)*E(4)+k(14,4)*P(14)*E(4)-k(4,15)*P(4)*E(4)+k(15,4)*P(15)*E(4)-k(4,16)*P(4)*E(4)+k(16,4)*P(16)*E(4)-k(4,17)*P(4)*E(4)+k(17,4)*P(17)*E(4)-k(4,18)*P(4)*E(4)+k(18,4)*P(18)*E(4)-k(4,19)*P(4)*E(4)+k(19,4)*P(19)*E(4)-k(4,20)*P(4)*E(4)+k(20,4)*P(20)*E(4)]
% B(5)*P(5)+symsum(-k(5,j)*P(5)*E(5)+k(j,5)*P(j)*E(5),j,1,20),...
% B(6)*P(6)+symsum(-k(6,j)*P(6)*E(6)+k(j,6)*P(j)*E(6),j,1,20),...
% B(7)*P(7)+symsum(-k(7,j)*P(7)*E(7)+k(j,7)*P(j)*E(7),j,1,20),...
% B(8)*P(8)+symsum(-k(8,j)*P(8)*E(8)+k(j,8)*P(j)*E(8),j,1,20),...
% B(9)*P(9)+symsum(-k(9,j)*P(9)*E(9)+k(j,9)*P(j)*E(9),j,1,20),...
% B(10)*P(10)+symsum(-k(10,j)*P(10)*E(10)+k(j,10)*P(j)*E(10),j,1,20),...
% B(11)*P(11)+symsum(-k(11,j)*P(11)*E(11)+k(j,11)*P(j)*E(11),j,1,20),...
% B(12)*P(12)+symsum(-k(12,j)*P(12)*E(12)+k(j,12)*P(j)*E(12),j,1,20),...
% B(13)*P(13)+symsum(-k(13,j)*P(13)*E(13)+k(j,13)*P(j)*E(13),j,1,20),...
% B(14)*P(14)+symsum(-k(14,j)*P(14)*E(14)+k(j,14)*P(j)*E(14),j,1,20),...
% B(15)*P(15)+symsum(-k(15,j)*P(15)*E(15)+k(j,15)*P(j)*E(15),j,1,20),...
% B(16)*P(16)+symsum(-k(16,j)*P(16)*E(16)+k(j,16)*P(j)*E(16),j,1,20),...
% B(17)*P(17)+symsum(-k(17,j)*P(17)*E(17)+k(j,17)*P(j)*E(17),j,1,20),...
% B(18)*P(18)+symsum(-k(18,j)*P(18)*E(18)+k(j,18)*P(j)*E(18),j,1,20),...
% B(19)*P(19)+symsum(-k(19,j)*P(19)*E(19)+k(j,19)*P(j)*E(19),j,1,20),...
% B(20)*P(20)+symsum(-k(20,j)*P(20)*E(20)+k(j,20)*P(j)*E(20),j,1,20)]

%flist = @(P) [ BR(1)*P(1)-DR(1)*P(1)   + symsum( - k(1,j)*P(1)* gdpE(1)  +  k(j,1)*P(j)*gdpE(1), j, 1,20) ,...
%               BR(2)*P(2)-DR(2)*P(2)   + symsum( - k(2,j)*P(2)* gdpE(2)  +  k(j,2)*P(j)*gdpE(2), j, 1,20),...
%               BR(3)*P(3)  -DR(3)*P(3)   + symsum( - k(3,j)*P(3)* gdpE(3)  +  k(j,3)*P(j)*gdpE(3), j, 1,20),...
%               BR(4)*P(4)  -DR(4)*P(4)   + symsum( - k(4,j)*P(4)* gdpE(4)  +  k(j,4)*P(j)*gdpE(4), j, 1,20),...
%               BR(5)*P(5)  -DR(5)*P(5)   + symsum( - k(5,j)*P(5)* gdpE(5)  +  k(j,5)*P(j)*gdpE(5), j, 1,20),...
%               BR(6)*P(6)  -DR(6)*P(6)   + symsum( - k(6,j)*P(6)* gdpE(6)  +  k(j,6)*P(j)*gdpE(6), j, 1,20),...
%               BR(7)*P(7)  -DR(7)*P(7)   + symsum( - k(7,j)*P(7)* gdpE(7)  +  k(j,7)*P(j)*gdpE(7), j, 1,20),...
%               BR(8)*P(8)  -  DR(8)*P(8)   + symsum( - k(8,j)*P(8)* gdpE(8)  +  k(j,8)*P(j)*gdpE(8), j, 1,20),...
%               BR(9)*P(9)  -  DR(9)*P(9)   + symsum( - k(9,j)*P(9)* gdpE(9)  +  k(j,9)*P(j)*gdpE(9), j, 1,20),...
%               BR(10)*P(10) - DR(10)*P(10) + symsum( - k(10,j)*P(10)*gdpE(10) + k(j,10)*P(j)*gdpE(10), j, 1,20),...
%               BR(11)*P(11) - DR(11)*P(11) + symsum( - k(11,j)*P(11)*gdpE(11) + k(j,11)*P(j)*gdpE(11), j, 1,20),...
%               BR(12)*P(12) - DR(12)*P(12) + symsum( - k(12,j)*P(12)*gdpE(12) + k(j,12)*P(j)*gdpE(12), j, 1,20),...
%               BR(13)*P(13) - DR(13)*P(13) + symsum( - k(13,j)*P(13)*gdpE(13) + k(j,13)*P(j)*gdpE(13), j, 1,20),...
%               BR(14)*P(14) - DR(14)*P(14) + symsum( - k(14,j)*P(14)*gdpE(14) + k(j,14)*P(j)*gdpE(14), j, 1,20),...
%               BR(15)*P(15) - DR(15)*P(15) + symsum( - k(15,j)*P(15)*gdpE(15) + k(j,15)*P(j)*gdpE(15), j, 1,20),...
%               BR(16)*P(16) - DR(16)*P(16) + symsum( - k(16,j)*P(16)*gdpE(16) + k(j,16)*P(j)*gdpE(16), j, 1,20),...
%               BR(17)*P(17) - DR(17)*P(17) + symsum( - k(17,j)*P(17)*gdpE(17) + k(j,17)*P(j)*gdpE(17), j, 1,20),...
%               BR(18)*P(18) - DR(18)*P(18) + symsum( - k(18,j)*P(18)*gdpE(18) + k(j,18)*P(j)*gdpE(18), j, 1,20),...
%               BR(19)*P(19) - DR(19)*P(19) + symsum( - k(19,j)*P(19)*gdpE(19) + k(j,19)*P(j)*gdpE(19), j, 1,20),...
%               BR(20)*P(20) - DR(20)*P(20) + symsum( - k(20,j)*P(20)*gdpE(20) + k(j,20)*P(j)*gdpE(20), j, 1,20)]

% flistOld = @(Y) [Lambda(1)*Narr(1)-mu(1)*Y(1)-beta(1,1)*Y(1)*Y(2)-beta(1,2)*Y(1)*Y(6)-lambda(1)*Y(1)*Y(4)+epsilon(1)*Y(3),...
% beta(1,1)*Y(1)*Y(2)+beta(1,2)*Y(1)*Y(6)+lambda(1)*Y(1)*Y(4)-(gamma(1)+mu(1)+alpha(1))*Y(2),...
% gamma(1)*Y(2)-mu(1)*Y(3)-epsilon(1)*Y(3),...
% xi(1)*Y(2)-delta(1)*Y(4),...
% Lambda(2)*Narr(2)-mu(2)*Y(5)-beta(2,2)*Y(5)*Y(6)-beta(2,1)*Y(5)*Y(2)-beta(2,3)*Y(5)*Y(10)-lambda(2)*Y(5)*Y(8)+epsilon(2)*Y(7),...
% beta(2,2)*Y(5)*Y(6)+beta(2,1)*Y(5)*Y(2)+beta(2,3)*Y(5)*Y(10)+lambda(2)*Y(5)*Y(8)-(gamma(2)+mu(2)+alpha(2))*Y(6),... %6Im
% gamma(2)*Y(6)-mu(2)*Y(7)-epsilon(2)*Y(7),...
% xi(2)*Y(6)-delta(2)*Y(8),...
% Lambda(3)*Narr(3)-mu(3)*Y(9)-beta(3,3)*Y(9)*Y(10)-beta(3,2)*Y(9)*Y(6)-lambda(3)*Y(9)*Y(12)+epsilon(3)*Y(11),...
% beta(3,3)*Y(9)*Y(10)+beta(3,2)*Y(9)*Y(6)+lambda(3)*Y(9)*Y(12)-(gamma(3)+mu(3)+alpha(3))*Y(10),...
% gamma(3)*Y(10)-mu(3)*Y(11)-epsilon(3)*Y(11),...
% xi(3)*Y(10)-delta(3)*Y(12)];

init = numSpeakerPerLanguage; 

h=1;
steps=time;

freq=365;

out = RKStage5( flist ,init, h, time, freq);

out1 = ode45(flist, [0 50], [20000000 6000000]);

% totS = out(:,1)+out(:,5)+out(:,9);
% totI = out(:,2)+out(:,6)+out(:,10);
% totR = out(:,3)+out(:,7)+out(:,11);
% totB = out(:,4)+out(:,8)+out(:,12);
% totals = [totS totI totR];
% endTotal = totals(time,:, :, :)
% totals = [totS totI totR, totB];

hold on
a1 = plot(timex,out(:,1),'m--');
M1 = '1';
a2 = plot(timex,out(:,2), 'k-.');
M2 = '2';
a3 = plot(timex,out(:,3) , 'b');
M3 = '3';
a4 = plot(timex,out(:,4) , 'r.');
M4 = '4';
% xlabel('Time in Days'),ylabel('Total People'), title('SIWR GDP STRUCTURED MODEL total')
legend([a1; a2; a3; a4], [M1; M2; M3; M4]);
snapnow
hold off
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
% peaksinfected = [max(out(:,2)); max(out(:,6)); max(out(:,10))]
% peakTotInfected = max(totI)
% peaksbacteria = [max(out(:,4)); max(out(:,8)); max(out(:,12))]
% peakTotBateria = max(totB)
% sumtotals = sum(totals,1)
data = out;
