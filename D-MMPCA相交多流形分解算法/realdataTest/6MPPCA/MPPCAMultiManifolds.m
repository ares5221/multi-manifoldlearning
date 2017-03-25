function    [newsX] = MPPCAMultiManifolds(X,ppca_dim,maxAngle,r,ncentres,knn,power,crossTan)
%%
%��1���õ�ÿ����Ķ�̬����allNeighbor �пռ�Tan
N = size(X,2); 
D1 = L2_distance(X,X,1);
allNeighbor = cell(N,1);
Tan=cell(N,1);

for i = 1:N
    [neighbor,U,nSame] = getDNNofOnePoint(i,X,D1(:,i),ppca_dim,r,maxAngle);
    allNeighbor{i} = neighbor;
    Tan{i} = U;
end;
%%
%��2������MPPCA�õ��ֳ�����60�������Ϣppca_label
% ����MPPCA
tic;
[ppca_label,mse,time_mppca] = MPPCA(X,ppca_dim,ncentres,knn,power);
toc;

%�ֿ��ÿ������ĵ�����Щ����PP
PP={};
for j=1:ncentres
    d = find(ppca_label==j);
    PP{j}=d;
end;

% figure;
% for i=1:ncentres
% X1=X( :, PP{i});
%   hold on;        
% hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
% end;

%%
%��3������չ
% 1 ѡ���ܶ����ĵ���Ϊ��ʼ����չ
%��ʽ��4��ȷ��ÿ����Ĳ����ܶ�
[D2,D3] = sort(D1);
disK = sum(D2(2:d+2,:));
[temp,order] = sort(disK); 
%��ʽ��5���������ܶ����ĵ���Ϊ��ʼ��currentT
currentT = order(1);
% currentT = order(ends);%%%����ϡ�����δ��ܶ���С�ĵط���ʼ��չ
% 2 �����ʼ�����ڵĿ���Ϊ��ʼ��չ�Ŀ�m
m = ppca_label(currentT);
mm=PP{m};%m������е�
sX=[];
sX=[sX mm];
%%%#####################################%%%newsX��Ϊ��������ķ������

newsX{1}=sX;
% 3 �ҵ�m������е�Ĳ�����m�Ľ���
MK=[];
for i=1:size(mm,2)
    mNN=allNeighbor{mm(i)};%ÿ������ԵĽ���
    mKZ = setdiff(mNN,mm);%������m��Ľ��ڱ�����MK
    MK=[MK mKZ];
end;
 %MK�ǲ�����m���m����Ԫ�صĽ��ڣ��ҵ�һ���н���С����Ϊ��չ�ĵ�
 deviation = []; 
 minTan=[];
 for i=1:size(MK,2)
      aa = Tan{currentT}; 
      bb= Tan{MK(i)};   
      ss = aa'* bb;
      [U,gM,V] = svd(ss);   
      dev = sqrt(1-min(diag(gM)).^2);
      vvv = [dev currentT MK(i)]';  %�н�ƫ����ڿ�ʼ��չ�ĵ㣬�ⲿ�ĵ�
      deviation =[deviation vvv];
      minTan = [minTan dev];
 end;
 %��չ�н���С�ĵ�
 [ktemp,korder] = sort(minTan); 
 KZ = deviation(3,korder(1));
 
 m = ppca_label(KZ);
 mm = PP{m};
 sX = [sX mm];
 [a1,a2,sX]=find(sX);
 
%%���ϴ���ʼ����չ��һ��С���������������γɵ�sX����һ������ȥ��չ��һ��С��
isEnd=[0];
mKZ=[0];
while ( (isempty(isEnd)==0) && (isempty(mKZ)==0) )
    k=1;%���������θ������� 
    
    MK=[];
     for i=1:size(sX,2)
          mNN=allNeighbor{sX(i)};%ÿ������ԵĽ���
          mKZ = setdiff(mNN,sX);%������m��Ľ��ڱ�����MK
          MK=[MK mKZ];
          MK=unique(MK);
      end;
     %MK�ǲ�����m���m����Ԫ�صĽ��ڣ��ҵ�һ���н���С����Ϊ��չ�ĵ�
     deviation = []; 
     minTan=[];
     for i=1:size(MK,2)
          aa = Tan{currentT}; 
            bb= Tan{MK(i)};   
            ss = aa'* bb;
            [U,gM,V] = svd(ss);   
            dev = sqrt(1-min(diag(gM)).^2);
            vvv = [dev currentT MK(i)]';  %�н�ƫ����ڿ�ʼ��չ�ĵ㣬�ⲿ�ĵ�
            deviation =[deviation vvv];
            minTan = [minTan dev];
     end;
     %��չ�н���С�ĵ�
     [ktemp,korder] = sort(minTan); 
     KZ = deviation(3,korder(1));

     %������ҪҪ��չ�������Ľ�������չ�ĵ�Ľ��ڵ��пռ�н�С��20��
     currNN=allNeighbor{currentT};
     kzNN=allNeighbor{KZ};
     for gg=1:size(currNN,2)
         cc=Tan{currNN(gg)};
         for hh=1:size(kzNN,2)
            dd=Tan{kzNN(hh)};
            jj = cc'* dd;
            [U,gM,V] = svd(jj);   
            dev = sqrt(1-min(diag(gM)).^2);
            if (dev*180/pi<crossTan)%%%%%%%%%%%%%%%%%%�������չ����չ��ȥ
                 m = ppca_label(KZ);
                 mm = PP{m};
                 sX = [sX mm];
                 [a1,a2,sX]=find(sX);
                sX=unique(sX);
                newsX{1}=unique([newsX{1} sX]);%%%%%%newsX�ǵõ�������������Ϣ
              
                newysX=[];%%%%�Ѿ���չ�õĵ�
                for dd=1:size(newsX,2)
                   ysX=newsX{dd};
                   newysX=union(newysX,ysX);
                end;
                 isEnd=setdiff(1:N ,newysX);
            else%%%%%%%%%%%%%%%%%%������������ڵĿ���Ϊ�µ�������
                m = ppca_label(KZ);
                 mm = PP{m};
                 k=k+1;
                 newsX{k} = mm;
                 
            end;
        end;
     end;
 end;
k=k+1;
newsX{k} = isEnd;%ʣ��ĵ���Ϊһ���µ�δ����չ���ݵ�ѭ������

