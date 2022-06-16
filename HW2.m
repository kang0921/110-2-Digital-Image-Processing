close all;
clf;
clc;

img = imread("cameraman.tif");      % 讀取影像 
img = im2double(img);               % 轉換成雙(單)精度浮點數資料型別

% 生成像素座標
[X, Y]  = meshgrid(1:256, 1:256);   
subplot(141); imshow(img); title("Origin image 256x256");

% 縮減像素採樣至影像解析度為128 × 128
[down_x, down_y]  = meshgrid(1:2:256, 1:2:256);
down_img = img(1:2:256, 1:2:256);   
subplot(142); imshow(down_img); title("128x128");

% 運用鄰近值內插還原影像解析度
inter_nearest = interp2(down_x, down_y, im2double(down_img), X, Y, 'nearest');    
subplot(143); imshow(inter_nearest); title("nearest");
imwrite(inter_nearest, 'interpolation_nearest.tif');

% 運用雙線性內插還原影像解析度
inter_bilinear = interp2(down_x, down_y, im2double(down_img), X, Y, 'bilinear');  
subplot(144); imshow(inter_bilinear); title("bilinear");
imwrite(inter_bilinear, 'interpolation_bilinear.tif');

% 計算運用鄰近值內插還原解析度之影像與原始影像的平均絕對值誤差
difference_nearest = img - inter_nearest;
error_nearest = mae(difference_nearest);
sprintf("error_nearest = %f",error_nearest)

% 計算運用雙線性內插還原解析度之影像與原始影像的平均絕對值誤差
difference_bilinear = img - inter_bilinear;
error_bilinear = mae(difference_bilinear);
sprintf("error_bilinear = %f",error_bilinear)
