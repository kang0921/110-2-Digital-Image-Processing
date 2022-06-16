f_boy = imread('boy.tif');                % 讀取影像 boy.tif
f_rect = imread('rectangle_688x600.tif'); % 讀取影像 rectangle_688x600.tif

% boy的頻譜
F_boy = fft2(f_boy);     % DFT
S_boy = abs(F_boy);      % Fourier Spectrum
S2_boy = log(1 + abs(S_boy));   % Log transform

% boy的相位
phi_boy = angle(F_boy);

% rectangle_688x600的頻譜
F_rect = fft2(f_rect);   % DFT
S_rect = abs(F_rect);    % Fourier Spectrum
S2_rect = log(1+S_rect); % Log transform

% rectangle_688x600的相位
phi_rect = angle(F_rect);

% 產生688x600的單位頻譜信號 (spectrum value = 1 for every pixel)
unit_spectrum_signal = ones(688, 600);

% 產生688x600的零相位信號 (phase angle = 0 for every pixel)
zero_phase_signal = zeros(688, 600);

% 利用boy圖像的相位與單位頻譜信號重建影像
DFT1 = unit_spectrum_signal.*exp(j*phi_boy);
I_DFT1 = ifft2(DFT1) ;

% 利用boy圖像的頻譜與零相位信號重建影像
DFT2 = S2_boy.*exp(j*zero_phase_signal);
I_DFT2 = ifftshift(DFT2) ;


% 利用boy圖像的相位與rectangle圖像的頻譜重建圖像
DFT3 = S_rect.*exp(j*phi_boy);
I_DFT3 = ifft2(DFT3) ;

% 利用boy圖像的頻譜與rectangle圖像的相位重建圖像
DFT4 = S_boy.*exp(j*phi_rect);
I_DFT4 = ifft2(DFT4) ;

figure; 

subplot(2,2,1); imshow (I_DFT1,[]); title('利用boy圖像的相位與單位頻譜信號重建影像');
colorbar('Direction','reverse');
subplot(2,2,2); imshow (I_DFT2,[]); title('利用boy圖像的頻譜與零相位信號重建影像');
colorbar('Direction','reverse');
subplot(2,2,3); imshow (I_DFT3,[]); title('利用boy圖像的相位與rectangle圖像的頻譜重建圖像');
colorbar('Direction','reverse');
subplot(2,2,4); imshow (I_DFT4,[]); title('利用boy圖像的頻譜與rectangle圖像的相位重建圖像');
colorbar('Direction','reverse');