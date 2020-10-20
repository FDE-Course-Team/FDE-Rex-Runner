# Dinosaur-Jump

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
从10月19日起，至11月2日止，计划做出一份可玩的发布版本。后续直至课程DDL，用来优化设计。

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
上述指令集无需很复杂，也无需很完整，只要能够清晰地实现相应功能即可。毕竟我们不是打算做通用设计。<br>
GPU内部还应设计一定的存储层次和执行层次。具体可参考NVIDIA公司的CUDA编程模型。

### Host内的指令集

只做一般的指令集，不计划做任何流水线设计，不然可能时间上顾不过来。

### Host与GPU之间的指令集

Host发送给GPU的信号旨在告知GPU，将存储在Texture中```addr```位置、大小为```width```×```height```的图片的```左下角```，放置在屏幕的```(x,y)```位置(以屏幕左下角为(0,0))。

### Texture的存储方式与大小

Texture设计成位宽为8-bit的存储空间。<br>
每块LCD_Graphic显示器的尺寸为64x128，黑白像素，因而需要存储的信息长度就为8192bit，即1024byte。

------

小组工作划分：

------

参考书/网络教程

《计算机体系结构：量化研究方法》<br>
<a href="https://www.cnblogs.com/undefined000/p/trex_1.html">Chrome自带恐龙小游戏的源码研究</a><br>
<a href="https://github.com/wayou/t-rex-runner">Rex-Runner源码</a>