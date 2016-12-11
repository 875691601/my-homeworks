clc
clear
% for k = 1:10
    %************����ͬҪ��ȡ��ѵ���������Լ�����************%
    [train_m,train_f] = preprocess('dataset3.txt',1,0);
    [test_m,test_f] = preprocess('dataset4.txt',1,0);
    %****************************************************%
    [N1,~] = size(train_m);[N2,~] = size(train_f);
    [n1,~] = size(test_m);[n2,~] = size(test_f);
    traindata = [train_m;train_f];
    testdata = [test_m;test_f];
    % ���Ա�ʾΪ1��Ů�Ա�ʾΪ0
    gender = zeros(N1+N2,1);
    gender(1:N1,1) = 1;
    % ѵ�������������
    index = randperm(N1+N2);
    input = traindata(index,:);
    output = gender(index,:);
    % ��һ��
    input = mapminmax(input',0,1);
    test = mapminmax(testdata',0,1);
    %����������,10��������Ԫ��1�������Ԫ���������������sigmoid���亯��
    net = newff(minmax(input),[10 1],{'logsig' 'purelin'},'traingdx'); 
    %����ѵ������
    net.trainparam.show = 50 ; %ÿ���100����ʾһ��ѵ��Ч��
    net.trainparam.epochs = 500 ; %�������ѵ������Ϊ500
    net.trainparam.goal = 0.01 ; %ѵ��Ŀ����С���0.01
    net.trainParam.lr = 0.01 ;  %ѧϰ����0.05
    %��ʼѵ��
    net = train(net,input,output') ;
    result = sim(net,test);
    err_m = 0;
    err_f = 0;
    for i = 1:n1+n2
        if(i <= n1 && result(i)<=0.5)
            % �������ԣ������г�Ů��
            err_m = err_m + 1;
        else
            if(i > n1 && result(i)>0.5)
                % ����Ů�ԣ������г�����
                err_f = err_f + 1;
            else
            end
        end
    end
    err = (err_m + err_f)/(n1+n2);
%     err(k) = (err_m + err_f)/(n1+n2);
% end
% mean(err)