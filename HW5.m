f = im2double(imread("knee_mri_blur.tif")); % 讀取磁振造影圖像knee_mri_sag.tif
h = fspecial('log', 25, 4);                 % 將圖像進行LoG濾波
g = imfilter(f, h, 'replicate');

T1 = 0;
T2 = max(abs(g()))*0.08;
E1 = zerocross(g, T1, h);                   % 將濾波後之圖像輸入zerocross，以取得邊緣圖像
E2 = zerocross(g, T2, h);

figure;                                     % 將產生的邊緣圖像輸出
subplot(221); imshow(f, []); title("原圖");   
subplot(222); imshow(g, []); title("LoG");
subplot(223); imshow(E1, []); title("門檻值 = 0");
subplot(224); imshow(E2, []); title("門檻值 = 最大灰階值的8%");

function H = zerocross(LoG, threshold, h)
    H = edge(LoG, "zerocross", threshold, h);
end