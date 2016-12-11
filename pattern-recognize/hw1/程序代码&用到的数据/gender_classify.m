function [err_m,err_f] = gender_classify(thre,train_m,train_f,test_m,test_f,minRisk)
%% ����ѵ����
ave_m = mean(train_m);
cov_m = cov(train_m);
W_m = -0.5 * inv(cov_m);
w_m = inv(cov_m) * ave_m';
w0_m = -0.5*ave_m*inv(cov_m)*ave_m' - 0.5*log(det(cov_m)) + log(0.5);

%% Ů��ѵ����
ave_f = mean(train_f);
cov_f = cov(train_f);
W_f = -0.5 * inv(cov_f);
w_f = inv(cov_f) * ave_f';
w0_f = -0.5*ave_f*inv(cov_f)*ave_f' - 0.5*log(det(cov_f)) + log(0.5);

%% ���� ��С����/��С���� ѡ��ͬ��lamda����
if(minRisk == true)
    lamda = [0,5;4,0];
else
    lamda = [0,1;1,0];
end

%% �����Ա���ߴ�����
err_m = 0;
for i = 1:size(test_m,1)
    g_m = test_m(i,:)*W_m*test_m(i,:)' + test_m(i,:)*w_m + w0_m;
    g_f = test_m(i,:)*W_f*test_m(i,:)' + test_m(i,:)*w_f + w0_f;
    if(g_m*lamda(2,1) > thre*g_f*lamda(1,2));
    else
        err_m = err_m + 1;
    end
end
err_m = err_m/size(test_m,1);

%% Ů���Ա���ߴ�����
err_f = 0;
for i = 1:size(test_f,1)
    g_m = test_f(i,:)*W_m*test_f(i,:)' + test_f(i,:)*w_m + w0_m;
    g_f = test_f(i,:)*W_f*test_f(i,:)' + test_f(i,:)*w_f + w0_f;
    if(g_m*lamda(2,1) > thre*g_f*lamda(1,2))
        err_f = err_f + 1;
    else       
    end
end
err_f = err_f/size(test_f,1);
end