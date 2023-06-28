function Data_info = Set_data_info(N_class, N_per_class_sample, class)
    % 先產生未抽取樣本的Data_info
    Data_info = ones(N_class);
    Data_info(:, 2:end) = Data_info(:, 2:end) * N_per_class_sample;
    Data_info = tril(Data_info);
    Data_info = sum(Data_info,2);
    Data_info = [Data_info, Data_info+N_per_class_sample-1];
    % 產生抽取樣本後的Data_info
    if class > 0
        reg = ones(N_class, 2)*(-1);
        reg(1:class, :) = 0;
        reg(class, 2) = -1;
        Data_info = Data_info + reg;
    end
end