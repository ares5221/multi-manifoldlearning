function [ output_args ] = mycompair( input_args )
%MYCOMPAIR Summary of this function goes here
%   Detailed explanation goes here
XX=load('ppca_lables.mat');
XX=XX.ppca_label;
a=zeros(1,1);
%分成60块后，每块里面的点是哪些
for j=1:70
    d=0;
    for i=1:2500 
        if (XX(:,i)==j)
           disp (i);
           d=d+1;
           a(j,d)=i;     
        end;       
    end;
end;
%画出第一块到低60块的图
X=load('X.mat');
X=X.X;
figure;
for i=1:60
b=find( a(i,:));
X1=X( :, a(i,b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;


%比较分成的60个子块如第二块是不是都是属于聚类的第二类
 MM=load('cluster_lables.mat');
 MM=MM.cluster_labels;
for i=1:60
    b=find( a(i,:));
    if( MM(a(i,b))~= unique( MM(a(i,b)) ))
        disp 有不一样的点;
    end;   
end;

%找出聚类是1的点，查看在X的位置
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 1)
        disp(i);
    end;
end;
%此时得到为1的点有a中第cc列
c1=[14,24,25,26,31,38,44,52,60];
%画出聚类为1的点的位置
figure;
for i=1:9
b=find( a(c1(i),:));
X1=X( :, a(c1(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;

%找出聚类是2的点，查看在X的位置
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 2)
        disp(i);
    end;
end;
%此时得到为2的点有a中第c2列
c2=[2,3,4,5,10,11,18,20,23,34,39,40,42,46,50];
%画出聚类为2的点的位置
figure;
for i=1:15
b=find( a(c2(i),:));
X1=X( :, a(c2(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;

%%%%找出聚类是3的点，查看在X的位置
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 3)
        disp(i);
    end;
end;
%此时得到为3的点有a中第c3列
c3=[1,6,7,8,9,12,13,15,16,17,19,21,22,27,28,29,30,32,33,35,36,37,41,43,45,47,48,49,51,53,54,55,56,57,58,59];
%画出聚类为3的点的位置
figure;
for i=1:36
b=find( a(c3(i),:));
X1=X( :, a(c3(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;
aa,
%{
X2=X( :,find( a(2,:) ) );
figure;  hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;

X3=X( :,find( a(3,:) ) );
figure;  hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
%end;
%}
end

