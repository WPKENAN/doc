# app2代码

1. 解析参数

   ![1542865870559](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542865870559.png)

2. 读入图片

![1542865791815](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542865791815.png)

3. 读入读取marker文件![1542865975752](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542865975752.png)
4. 备份image->temp buffer![1542867358218](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542867358218.png)
5. 如果p.b_intensity=1；背景阈值重新设置为max(min(markers[1:n-1]),bkg_thresh)![1542867909452](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542867909452.png)
6. datatype修改为8bit![1542868191876](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542868191876.png)
7. downsample图像到256x256x256以下![1542945509313](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542945509313.png)

8. 291行跟177行冲突![1542945565404](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542945565404.png)

![1542945584916](C:\Users\Anzhi\AppData\Roaming\Typora\typora-user-images\1542945584916.png)

9. 

