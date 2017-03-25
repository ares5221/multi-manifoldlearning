function    [newsX] = MPPCAMultiManifolds(X,ppca_dim,maxAngle,r,ncentres,knn,power,crossTan)
%%
%第1步得到每个点的动态领域allNeighbor 切空间Tan
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
%第2步运行MPPCA得到分出来的60个块的信息ppca_label
% 运行MPPCA
tic;
[ppca_label,mse,time_mppca] = MPPCA(X,ppca_dim,ncentres,knn,power);
toc;

%分块后，每块里面的点是哪些存在PP
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
%第3部分扩展
% 1 选择密度最大的点作为起始点扩展
%公式（4）确定每个点的采样密度
[D2,D3] = sort(D1);
disK = sum(D2(2:d+2,:));
[temp,order] = sort(disK); 
%公式（5）将采样密度最大的点作为开始点currentT
currentT = order(1);
% currentT = order(ends);%%%对于稀疏流形从密度最小的地方开始扩展
% 2 这个起始点所在的块作为开始扩展的块m
m = ppca_label(currentT);
mm=PP{m};%m块的所有点
sX=[];
sX=[sX mm];
%%%#####################################%%%newsX作为最终输出的分类情况

newsX{1}=sX;
% 3 找到m块的所有点的不属于m的近邻
MK=[];
for i=1:size(mm,2)
    mNN=allNeighbor{mm(i)};%每个点各自的近邻
    mKZ = setdiff(mNN,mm);%不属于m块的近邻保存在MK
    MK=[MK mKZ];
end;
 %MK是不属于m块的m块中元素的近邻，找到一个夹角最小的作为扩展的点
 deviation = []; 
 minTan=[];
 for i=1:size(MK,2)
      aa = Tan{currentT}; 
      bb= Tan{MK(i)};   
      ss = aa'* bb;
      [U,gM,V] = svd(ss);   
      dev = sqrt(1-min(diag(gM)).^2);
      vvv = [dev currentT MK(i)]';  %夹角偏差，块内开始扩展的点，外部的点
      deviation =[deviation vvv];
      minTan = [minTan dev];
 end;
 %扩展夹角最小的点
 [ktemp,korder] = sort(minTan); 
 KZ = deviation(3,korder(1));
 
 m = ppca_label(KZ);
 mm = PP{m};
 sX = [sX mm];
 [a1,a2,sX]=find(sX);
 
%%以上从起始块扩展了一个小块接下来把这个新形成的sX当做一个整体去扩展另一个小块
isEnd=[0];
mKZ=[0];
while ( (isempty(isEnd)==0) && (isempty(mKZ)==0) )
    k=1;%控制子流形个数增加 
    
    MK=[];
     for i=1:size(sX,2)
          mNN=allNeighbor{sX(i)};%每个点各自的近邻
          mKZ = setdiff(mNN,sX);%不属于m块的近邻保存在MK
          MK=[MK mKZ];
          MK=unique(MK);
      end;
     %MK是不属于m块的m块中元素的近邻，找到一个夹角最小的作为扩展的点
     deviation = []; 
     minTan=[];
     for i=1:size(MK,2)
          aa = Tan{currentT}; 
            bb= Tan{MK(i)};   
            ss = aa'* bb;
            [U,gM,V] = svd(ss);   
            dev = sqrt(1-min(diag(gM)).^2);
            vvv = [dev currentT MK(i)]';  %夹角偏差，块内开始扩展的点，外部的点
            deviation =[deviation vvv];
            minTan = [minTan dev];
     end;
     %扩展夹角最小的点
     [ktemp,korder] = sort(minTan); 
     KZ = deviation(3,korder(1));

     %并且需要要扩展的这个点的近邻与扩展的点的近邻的切空间夹角小于20度
     currNN=allNeighbor{currentT};
     kzNN=allNeighbor{KZ};
     for gg=1:size(currNN,2)
         cc=Tan{currNN(gg)};
         for hh=1:size(kzNN,2)
            dd=Tan{kzNN(hh)};
            jj = cc'* dd;
            [U,gM,V] = svd(jj);   
            dev = sqrt(1-min(diag(gM)).^2);
            if (dev*180/pi<crossTan)%%%%%%%%%%%%%%%%%%如果能扩展就扩展进去
                 m = ppca_label(KZ);
                 mm = PP{m};
                 sX = [sX mm];
                 [a1,a2,sX]=find(sX);
                sX=unique(sX);
                newsX{1}=unique([newsX{1} sX]);%%%%%%newsX是得到的新子流形信息
              
                newysX=[];%%%%已经扩展好的点
                for dd=1:size(newsX,2)
                   ysX=newsX{dd};
                   newysX=union(newysX,ysX);
                end;
                 isEnd=setdiff(1:N ,newysX);
            else%%%%%%%%%%%%%%%%%%否则这个点所在的块作为新的子流形
                m = ppca_label(KZ);
                 mm = PP{m};
                 k=k+1;
                 newsX{k} = mm;
                 
            end;
        end;
     end;
 end;
k=k+1;
newsX{k} = isEnd;%剩余的点作为一个新的未被扩展数据的循环操作

