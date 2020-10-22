# FDE-Rex-Runner

复旦大学2020年研究生课程《系统可编程芯片设计》<br>
小组成员：<br>
张朕银20212020089<br>
薛玥20212020163<br>
郭家兴20212020180<br>
张盼20212020094<br>
万欣然20212020049<br>

------

项目计划使用FDE3P7开发板，实现一个Google Chrome浏览器在404页面的小恐龙跑酷游戏。<br>
![](2020-10-20-09-41-32.png)

项目涉及的软件：<br>
- FDE2019
- Design Compiler
- SMMIS
  - VeriInstrument
  - HDLAutoDesign
  - (软件包中的其他软件暂不使用)
- Quartus（仅用于设计验证）
- Vivado（仅用于设计验证）

项目计划时间：<br>
从10月19日起，至11月2日止，计划做出一份可玩的发布版本。后续直至课程DDL（11月9日），用来优化设计。

------

## Top Design

![](2020-10-20-10-00-52.png)

使用两块LCD_Graphic设备拼接成一块长屏幕。<br>
Driver：负责将GRAM中的像素依次给入LCD_Graphic；<br>
GRAM：存储屏幕中需要显示的所有像素<br>
GPU：负责处理图像数据，将Texture中的信息综合处理，写入到GRAM中，并发信号让driver开始给入<br>
Host：负责主要的游戏逻辑<br>
Random：负责生成随机数<br>
Key_Stable：按键防抖动<br>
Texture：存储原图，以供GPU进行处理<br>
另有时钟分频模块未显示<br>

------
## Module Design

Host游戏逻辑模块内部，计划设计一套指令集来实现。<br>
Host和GPU之间的交互也需要设计一套指令。<br>
上述指令集无需很复杂，也无需很通用，只要能够清晰地实现本设计的特定功能即可。<br>
GPU内部还应设计一定的存储层次和执行层次。具体可参考NVIDIA公司的CUDA编程模型。

### Host内的指令集

只做一般的指令集，不计划做任何流水线设计，否则项目进度可能因此耽误。

### Host与GPU之间的指令集

Host发送给GPU的信号旨在告知GPU，将存储在Texture中```addr```位置、大小为```width x height```的图片的```左下角```，放置在屏幕的```(x,y)```位置```(以屏幕左下角为(0,0))```。<br>
由于Texture的地址位宽设计成16位（见下文），图片大小```width x height```考虑为```(1~256)x(1~64)```
<br>
注意到图片的宽和高为零没有意义，因此用数值n表示宽度n+1像素或高度n+1像素以节省位宽。例如```(127,63)```表示```128px x 64px```（px: pixel, 像素）<br>
由于游戏有时需要将贴图的一部分显示出来，坐标```(x,y)```需要有负数范围，以便将图像的左下角定位在屏幕之外，从而显示贴图的一部分。上文已经设定了width、height的范围，因此坐标```(x,y)```的范围考虑为```((-256~255),(-64~63))```。可使用有符号整型```int```的设计。<br> 

### GPU内部设计

GPU接收到Host发来的信息后，将其存储在缓冲队列中，并自行获取并执行。这需要两个指针和一个缓冲区来完成。

### Texture的存储方式与大小

Texture设计成位宽为8-bit的存储空间。<br>
每块LCD_Graphic显示器的尺寸为64x128，黑白像素，因而需要存储的信息长度就为8192bit，即1024byte。<br>
之前测得FDE板载资源上限大约为12张LCD_Graphic当量。两块GRAM会消耗两块当量的资源，那么假使Texture中要存储6张LCD_Graphic当量的图片，则Texture接受的地址范围就是```0x0000~0x1800```，地址位宽设计成16位。

------

## 小组工作划分：

Top design、模块间接口标准定义、Report：张朕银<br>
Driver、GRAM：薛玥<br>
GPU：张盼<br>
Host：郭家兴<br>
Random、Texture：万欣然<br>
有余力的同学可以辅助其他部分的设计和验证，工作量最终写入报告中。


------

参考书/网络教程

《计算机体系结构：量化研究方法》<br>
<a href="https://www.cnblogs.com/undefined000/p/trex_1.html">Chrome自带恐龙小游戏的源码研究</a><br>
<a href="https://github.com/wayou/t-rex-runner">Rex-Runner源码</a>