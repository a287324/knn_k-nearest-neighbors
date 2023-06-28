function ind = Knn_test(ticket, dst, data, data_info, data_class)
    % step 1: 先計算所有樣本和測試樣本的幾何距離
    dist = data-dst;
    dist = dist.^2;
    dist = sum(dist,2);
    
    % step 2: 找出最近的k個樣本
    [~, knn_sample] = mink(dist, ticket);
    
    % step 3: 判斷最近的k個樣本的類別並投票
    ballot = struct;
    ballot.box = data_info(knn_sample);
    ballot.result = sum(ballot.box == (1:data_class), 1);
    
    % step 4: 分析投票結果
        % step 4.1 找出最高票數及其類別
    [ticket_max, ind] = max(ballot.result);
        % step 4.2 判斷此最高票數是否有同票(即最高票是否只有一類),將幾何距離最近的類別當作該類別
    if sum(ballot.result == ticket_max) ~= 1
        [~, ind] = min(dist);
    end
end