function [ output_args ] = mycompair( input_args )
%MYCOMPAIR Summary of this function goes here
%   Detailed explanation goes here
XX=load('ppca_label1500.mat');
XX=XX.ppca_label;
a=zeros(1,1);
%分成60块后，每块里面的点是哪些
for j=1:60
    d=0;
    for i=1:1500 
        if (XX(:,i)==j)
           disp (i);
           d=d+1;
           a(j,d)=i;     
        end;       
    end;
end;
%画出第一块到低60块的图
X=load('X1500.mat');
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
 MM=load('cluster_labels1500.mat');
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
c1=[6,15,16,17,18,20,22,26,27,29,30,32,33,44,45,53,57,58,59,60];
%画出聚类为1的点的位置
figure;
for i=1:20
b=find( a(c1(i),:));
X1=X( :, a(c1(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;

%找出聚类是2的点，查看在X的位置
% for i=1:60
%     b=find( a(i,:));
%     if(unique( MM(a(i,b))) == 2)
%         disp(i);
%     end;
% end;
%由于只有两类，第二类只是全部60捡取第一类此时得到为2的点有a中第c2列
cc=(1:60);
c2=setdiff(cc,c1);
%画出聚类为2的点的位置
figure;
for i=1:40
b=find( a(c2(i),:));
X1=X( :, a(c2(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;
disp 完成第二类scurve聚类出的图像;

end

