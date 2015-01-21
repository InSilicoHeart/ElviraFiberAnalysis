function [conduction, CV, APD90] = testConduction(V,dt)

CV = cell(length(V(1,:)),1);

APD90_c = cell(length(V(1,:)),1);
APD_time = cell(length(V(1,:)),1);
maxV = cell(length(V(1,:)),1);
minV = cell(length(V(1,:)),1);

n_cells = length(V(1,:));
conduction = false;

for i=1:n_cells
    [APD90_c{i},APD_time{i}]= calculateAPD(V(:,i),dt);
end

n=length(APD90_c{1});

if(n==0)
    conduction=false;
    CV=[];
    APD90=[];
    return;
end

for i=2:n_cells
    if(n~=length(APD90_c{i}))
        return;
    end
end

conduction_v = true(1,n);

APD90_v = cell2mat(APD90_c);
for i=1:n
  if(~isempty(find(APD90_v(:,i)<150)))
    conduction_v(i)=false;
  end  
end

APD90 = mean(APD90_v);
CV = mean(250./diff(cell2mat(APD_time)));

APD90(~conduction_v)=[];
CV(~conduction_v)=[];

if(n==length(APD90))
    conduction = true;
end
