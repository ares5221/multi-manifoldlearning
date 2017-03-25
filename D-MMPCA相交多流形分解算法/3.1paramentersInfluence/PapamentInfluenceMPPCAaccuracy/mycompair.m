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
%画出第一块的图
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


%比较分成的60个子快如第二块是不是都是属于聚类的第二类
 MM=load('cluster_lables.mat');
 MM=MM.cluster_labels;
for i=1:60
    b=find( a(i,:));
    if( MM(a(i,b))~= unique( MM(a(i,b)) ))
        disp youbuyiyang;
    end;
    
end;

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

