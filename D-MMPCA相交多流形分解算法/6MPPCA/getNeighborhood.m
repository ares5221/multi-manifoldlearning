function [sX,allNeighbor,DE] = getNeighborhood(X,D1,d,r,maxAngle)

N = size(X,2);
%�Ծ���������򣬵õ���������Ϣ
[D2,D3] = sort(D1);
nearP = D3(2,:);
%��ʼ��������Ϣ
allNeighbor = cell(N); 
tangent = cell(N);
DE = ones(N,N)*Inf; 
DG = ones(N,N)*Inf; 
P =  ones(N,N)*Inf;
%�ֱ�ȷ��ÿ����Ľ��ڵ㣬������ѭ����ÿ���ҵ�i����Ľ��ڵ����neighbor�У���ŵ��ǵ�i����Ľ��ڵĵ���±꣬U�ǵ�i������пռ���Ϣ
for i = 1:N
    [neighbor,U] = getDNNofOnePoint(i,X,D1(:,i),d,r,maxAngle);
    allNeighbor{i} = neighbor;    
    tangent{i} = U;
end;
%��ʽ��4��ȷ��ÿ����Ĳ����ܶ�
disK = sum(D2(2:d+2,:));
[temp,order] = sort(disK); 
%��ʽ��5���������ܶ����ĵ���Ϊ��ʼ��
currentP = order(1);
currentT = order(1);
Idone = [currentT]; 
deviation = []; 
DE(allNeighbor{currentT},currentT) = D1(allNeighbor{currentT},currentT);
DE(currentT,currentT) = 0;
neighbor = setdiff(allNeighbor{currentT},Idone);
%��ʽ��6��xi�����ĸ�������֮��ļн�ƫ��dev�ļ��㣬Ȼ��ѡ��С�Ľ�����չ
for j = 1:length(neighbor)
    if(length(Idone(Idone==neighbor(j)))==0)
        aa = tangent{currentT}; 
        bb= tangent{neighbor(j)};   
        ss = aa(:,1:d)'* bb(:,1:d);
        [U,gM,V] = svd(ss);   
        dev = sqrt(1-min(diag(gM)).^2);
        vvv = [dev currentT neighbor(j)]';  
        deviation =[deviation vvv];
    end;
end;

%��ʼ��չ
lastLocation=0; sX={};
while(length(Idone) < N)
    if(size(deviation,2)==0)
        disp('%%%%%%%%%%%%%%%%deviationΪ�գ������ڵ�������������%%%%%%%%%%%%%%%%%%%%%%');
        otherIdone = setdiff(1:N,Idone);
        tempSX = Idone(lastLocation+1:end);
        tempNeighbor = nearP(otherIdone);
        aaa = intersect(tempSX,tempNeighbor);
        if (length(aaa)==0)
            tempX = Idone(lastLocation+1:end); sX= [sX tempX];
            noDone = setdiff(1:N,Idone);
            disK = sum(D2(2:d+2,noDone));[temp,order] = sort(disK); 
            noDone = noDone(order);    currentP = noDone(1);; currentT = currentP;
            lastLocation = length(Idone);
        else
            for bb = 1:length(aaa)
                ccc = find(tempNeighbor==aaa(bb));
                vvv = [repmat(0,1,length(ccc)); repmat(aaa(bb),1,length(ccc)); otherIdone(ccc)];  
                deviation =[deviation vvv];
                [pp,qq] = sort(deviation(1,:));  currentP = deviation(2,qq(1));  currentT = deviation(3,qq(1));
                deviation(:,qq(1))=[];  temp = find(deviation(3,:)==currentT); deviation(:,temp)=[];
            end;
        end;
    else
        [pp,qq] = sort(deviation(1,:)); 
        currentP = deviation(2,qq(1)); 
        currentT = deviation(3,qq(1));
        deviation(:,qq(1))=[];  
        temp = find(deviation(3,:)==currentT); 
        deviation(:,temp)=[];
    end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#############
    Idone = [Idone currentT];
    %��ȷ����currentT���пռ������ 
  [neighbor,U,nSame] = getDNNofOnePoint(currentT,X,D1(:,currentT),d,r,maxAngle,currentP,tangent{currentP},allNeighbor);    
    if(nSame)  allNeighbor{currentT} = neighbor;     tangent{currentT} = U;    end;
        
    neighbor = setdiff(allNeighbor{currentT},Idone);
    for j = 1:length(neighbor)
        if(length(Idone(Idone==neighbor(j)))==0)
            aa = tangent{currentT}; bb= tangent{neighbor(j)};     ss = aa(:,1:d)'* bb(:,1:d);
            [U,gM,V] = svd(ss);    dev = sqrt(1-min(diag(gM)).^2);
            vvv = [dev currentT neighbor(j)]';    deviation =[deviation vvv];
        end;
    end;
    DE(allNeighbor{currentT},currentT) = D1(allNeighbor{currentT},currentT); DE(currentT,currentT) = 0;
end;
tempX = Idone(lastLocation+1:end); sX= [sX tempX];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
newSX = {};
for i = 1:length(sX)
    tempSX = sX{i};
    if(length(tempSX)<d+2)
        flag = true;
        for j = 1:length(sX) 
            if(length(intersect(tempSX,sX{j}))>0 & j~=i)  
                sX{j} = union(sX{j},tempSX); sX{i} = []; flag = false; break;
            end;
        end;
        if(flag)
            otherSX = setdiff(1:N,tempSX);
            minD = Inf; minL = Inf;
            for j = 1:length(tempSX)
                tempDD = D1(tempSX(j),otherSX); [D2,D3] = min(tempDD);
                if(minD > D2) minD = D2; minL = D3; end;
            end;
            for j = 1:length(sX)
                aa = find(sX{j}==otherSX(minL));
                if(length(aa)>0) break; end;
            end;
            sX{j} = [sX{j} sX{i}]; sX{i} = []; 
        end;
    end;
end;
for i = 1:length(sX)
    tempSX = sX{i};
    if(length(tempSX)>0)
        newSX = [newSX tempSX];
    end;
end;
sX = newSX;


