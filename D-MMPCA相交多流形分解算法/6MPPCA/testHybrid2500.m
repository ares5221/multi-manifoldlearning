function [ output_args ] = mycompair( input_args )
%MYCOMPAIR Summary of this function goes here
%   Detailed explanation goes here
XX=load('ppca_lables.mat');
XX=XX.ppca_label;
a=zeros(1,1);
%�ֳ�60���ÿ������ĵ�����Щ
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
%������һ�鵽��60���ͼ
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


%�ȽϷֳɵ�60���ӿ���ڶ����ǲ��Ƕ������ھ���ĵڶ���
 MM=load('cluster_lables.mat');
 MM=MM.cluster_labels;
for i=1:60
    b=find( a(i,:));
    if( MM(a(i,b))~= unique( MM(a(i,b)) ))
        disp �в�һ���ĵ�;
    end;   
end;

%�ҳ�������1�ĵ㣬�鿴��X��λ��
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 1)
        disp(i);
    end;
end;
%��ʱ�õ�Ϊ1�ĵ���a�е�cc��
c1=[14,24,25,26,31,38,44,52,60];
%��������Ϊ1�ĵ��λ��
figure;
for i=1:9
b=find( a(c1(i),:));
X1=X( :, a(c1(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;

%�ҳ�������2�ĵ㣬�鿴��X��λ��
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 2)
        disp(i);
    end;
end;
%��ʱ�õ�Ϊ2�ĵ���a�е�c2��
c2=[2,3,4,5,10,11,18,20,23,34,39,40,42,46,50];
%��������Ϊ2�ĵ��λ��
figure;
for i=1:15
b=find( a(c2(i),:));
X1=X( :, a(c2(i),b));
  hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor',[0.5 0.5 0.5]);       hold off;
end;

%%%%�ҳ�������3�ĵ㣬�鿴��X��λ��
for i=1:60
    b=find( a(i,:));
    if(unique( MM(a(i,b))) == 3)
        disp(i);
    end;
end;
%��ʱ�õ�Ϊ3�ĵ���a�е�c3��
c3=[1,6,7,8,9,12,13,15,16,17,19,21,22,27,28,29,30,32,33,35,36,37,41,43,45,47,48,49,51,53,54,55,56,57,58,59];
%��������Ϊ3�ĵ��λ��
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

