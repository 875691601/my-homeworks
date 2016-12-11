clear all;
% ���ļ�
[data_male,data_female] = preprocess('dataset1.txt');
[mydata_male,mydata_female] = preprocess('mydataset.txt');

% ��С�����ʱ�Ҷ˹����
disp('*********��С�����ʱ�Ҷ˹���߽��*********');
[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,data_male,data_female,false);
disp('   A.ѵ����Ϊ�ɼ����ݣ����Լ�Ϊ��������');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,mydata_male,mydata_female,false);
disp('   B.ѵ����Ϊ�ɼ����ݣ����Լ�Ϊ�ɼ�����');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,false);
disp('   C.ѵ����Ϊ�������ݣ����Լ�Ϊ�ɼ�����');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,false);
disp('   D.ѵ����Ϊ�������ݣ����Լ�Ϊ��������');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);
disp(' ');

% ��С���ձ�Ҷ˹����
disp('*********��С���ձ�Ҷ˹���߽��*********');
[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,data_male,data_female,true);
disp('   A.ѵ����Ϊ�ɼ����ݣ����Լ�Ϊ��������');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,mydata_male,mydata_female,mydata_male,mydata_female,true);
disp('   B.ѵ����Ϊ�ɼ����ݣ����Լ�Ϊ�ɼ�����');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,true);
disp('   C.ѵ����Ϊ�������ݣ����Լ�Ϊ�ɼ�����');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

[err_m,err_f] = gender_classify(1,data_male,data_female,mydata_male,mydata_female,true);
disp('   D.ѵ����Ϊ�������ݣ����Լ�Ϊ��������');
disp(['   ���Դ����ʣ�',num2str(err_m,3),'  Ů�Դ����ʣ�',num2str(err_f,3)]);

% ROC����
[Sp1,Sn1] = roc(mydata_male,mydata_female,data_male,data_female,false);
[Sp2,Sn2] = roc(mydata_male,mydata_female,data_male,data_female,true);
figure,plot(1-Sp1,Sn1,'bx-'),title('ROC���ߣ�ѵ����Ϊ�ɼ����ݣ����Լ�Ϊ�������ݣ�');
hold on,plot(1-Sp2,Sn2,'r*-');
legend('��С������','��С����');

[Sp1,Sn1] = roc(data_male,data_female,mydata_male,mydata_female,false);
[Sp2,Sn2] = roc(data_male,data_female,mydata_male,mydata_female,true);
figure,plot(1-Sp1,Sn1,'bx-'),title('ROC���ߣ�ѵ����Ϊ�������ݣ����Լ�Ϊ�ɼ����ݣ�');
hold on,plot(1-Sp2,Sn2,'r*-');
legend('��С������','��С����');
