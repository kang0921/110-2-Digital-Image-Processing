clc;               % 清除命令窗口的內容，對工作環境中的全部變量無任何影響清除命令窗口的內容，對工作環境中的全部變量無任何影響
clear all;         % 清除工作空間的所有變量，函數，和MEX文件
close all;         % 關閉所有的Figure窗口
I = imread("lateral-head-CT-256-levels.tif");  % 讀取影像
a = im2double(I); % 轉換成雙(單)精度浮點數資料型別
b = [ 1 3 5 8 ];

figure                                          % 創建 figure 視窗
for i = 1 : length(b)
    d = 2^b(i);    
    z = a/d;
    z2 = uint8(255*z);                         % 轉換回8-bit資料型別
    subplot( 1, 4, i );                        % 在一張圖中展現多個子圖
    if i == 1
        title('intensity range 0 - 127');     % 標題     
        imwrite(z2*d, 'IntRes_128bit.tif');   % 輸出影像
    elseif i == 2
        title('intensity range 0 - 31');      % 標題  
        imwrite(z2*d, 'IntRes_32bit.tif');    % 輸出影像
    elseif i == 3
        title('intensity range 0 - 7');       % 標題  
        imwrite(z2*d, 'IntRes_8bit.tif');     % 輸出影像
    elseif i == 4
        title('intensity range 0 - 1');       % 標題  
        imwrite(z2*d, 'IntRes_2bit.tif');     % 輸出影像
    end
    hold on   % 使當前軸及圖形保持而不被刷新，準備接受此後將繪製的圖形，多圖共存。
    imshow( z2*d );                             % 分別呈現降低強度解析的影像
end 
