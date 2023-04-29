# 1102-Digital-Image-Processing
## 數位影像處理

### 課程資訊
- 系級：資工四甲
- 教授：林正忠 輔大電機系副教授

## 作業
### 作業一：強度解析度調整
- 數位影像常會因為儀器限制等因素影響影像強度解析度，造成影像的失真與信息的遺失。本次作業目標為將原強度解析度256階層的灰階影像分別調降至128、32、8與2階，並且分別將影像輸出，以輔助學生觀察影像強度解析度不足時所造成之影像失真的現象。
### 作業二：影像縮放與內插
- 本作業的目的是練習運用影像內插進行尺寸變換，並觀察不同內插演算法用於放大影像的效果。首先將原始影像進行縮減像素採樣(downsampling)，以取得解析度較低的影像，之後針對此降低解析度的影像進行影像放大以還原影像解析度，並比較使用了鄰近值內插法與雙線性內插法所產生之還原影像的誤差。
### 作業三：頻譜與相位
- 頻率域影像處理乃是數位影像處理常用的技術之一。想要在頻域處理影像信號，必需先對數位影像進行離散傅立葉轉換，以得到影像的頻譜(spectrum)與相位(phase)，並且針對頻譜與相位進行訊號處理。本次作業的目標在於練習將影像進行離散傅立葉轉換，以取得頻譜與相位，並且活用頻譜與相位的信息進行影像重建。
### 作業四：陷波濾波器
- 陷波濾波器(Notch filter)乃是選擇性濾波器的一種，可用於頻域濾波，將特定的頻率信號濾除或保留。陷波濾波器在處理具有特殊頻段的雜訊上有良好的效果。本次作業的目標在於練習撰寫並使用陷波濾波器將受到莫列波紋干擾的圖像進行雜訊濾波，以還原圖像訊息。
### 作業五：過零檢測
- 在數位影像或醫學影像的處理中，常會需要利用邊緣檢測技術判斷目標物的區域，協助區分出特定目標的輪廓。在較為進階的邊緣偵測方法中，Marr-Hildreth邊緣偵測法是常見的方法之一，在該算法中需要藉由過零檢測以準確判斷邊緣中心線的位置。本次作業的目標是自行撰寫過零檢測的運算函式，並將其作為Marr-Hildreth邊緣偵測法的一環用於目標影像的邊緣偵測。
