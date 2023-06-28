clearvars; clc;
% 當投票數(Knn_ticket) = 1時，測試樣本為71.73.84.107.120.134，其分類結果會是錯誤的

% 讀取樣本
load dataset/iris.mat         % Matlab內建的樣本
data = struct;
data.origin = meas;         % 將內建的樣本更改名稱
data.info = species;

% 設置樣本資訊
data.class = 3;                % 樣本類別

% 設置Knn參數
Knn_ticket = 1;
% 抽取測試樣本
data.dst = 135;
data.test = data.origin(data.dst, :);
% 抽取訓練樣本
data.train = data.origin;               
data.train(data.dst, :) = [];
% 訓練樣本的資訊
data.train_info = data.info;            
data.train_info(data.dst, :) = [];

% Knn
ind = Knn_test(Knn_ticket, data.test, data.train, data.train_info, data.class);

fprintf("Knn的結果分析： 該data_test為%d類\n", ind);