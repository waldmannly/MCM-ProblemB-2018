%symsum(-k(1,j)*P(1)*E(1)+k(j,1)*P(j)*E(1),j,1,20)
list=''
%for i = 1:1:20
i=9
for j=21:1:21
    if (j ~= i) 
        eqn = strcat('-k(',int2str(i),',',int2str(j),')*P(',int2str(i),')*E(',int2str(i),')+k(',int2str(j),',',int2str(i),')*P(',int2str(j),')*E(',int2str(i),')')
        list = strcat(list,eqn)
    end 
      
end
%eqns(i)= eqn; 
%end 