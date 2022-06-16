f = double(imread("car-moire-pattern.tif"));% 讀取圖像
PQ = paddedsize(size(f));                   % 計算padding size
          
F = fft2(f, PQ(1), PQ(2));                  % 將所讀取之圖像進行傅立葉正轉換，大小為padding過後的
M = abs(fftshift(F));                       % 取頻譜
M2 = log(1 + abs(M));

F_ori = fft2(f);                            % 將所讀取之圖像進行傅立葉正轉換
M_ori = abs(fftshift(F_ori));               % 取原始圖像的頻譜
M2_ori = log(1 + abs(M_ori));

C = [80, 60; 160, 60; -80, 60; -160, 60];   % 在傅立葉頻譜上分析欲設定的陷波中心位置 
H = Butternotch('', PQ(1), PQ(2), C, 9, 4); % 基於陷波中心位置產生Butterworth notch reject filter
g = dftfilt(f, H);                          % 進行頻域濾波處理
g_f = fft2(g);                              % 進行傅立葉正轉換
H_spectrum = abs(fftshift(g_f));            % 取頻譜
H2 = log(1 + abs(H_spectrum));

figure; 
subplot(221); imshow(f, []);  title("origin");
subplot(222); imshow(M2_ori, []); title("origin spectrum");
subplot(223); imshow(H2, []); title("Original spectrum multiply by a Butterworth notch reject filter");
subplot(224); imshow(g, []);  title("The filtered image");