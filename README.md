# FDE-Rex-Runner

复旦大学2020年研究生课程《系统可编程芯片设计》<br>
小组成员：<br>
张朕银20212020089<br>
薛玥20212020163<br>
郭家兴20212020180<br>
张盼20212020094<br>
万欣然20212020049<br>

------
本文档在Github页面显示存在问题，请clone到本地查看。

----

# 项目介绍

项目计划使用FDE3P7开发板，实现一个Google Chrome浏览器在404页面的小恐龙跑酷游戏。<br>
<img src="2020-10-20-09-41-32.png">

项目涉及的软件：<br>
- FDE2019
- Design Compiler
- SMIMS
  - VeriInstrument
  - HDLAutoDesign
  - (软件包中的其他软件暂不使用)
- Quartus（仅用于设计验证）
- Vivado（仅用于设计验证）

项目计划时间：<br>
从10月19日起，至11月2日止，计划做出一份可玩的发布版本。后续直至课程DDL（11月9日），用来优化设计。

------

# Top Design

使用两块LCD_Graphic设备拼接成一块长屏幕。（初代版本只做一块LCD_Graphic）<br>
- Driver 输入：data，start输出：addr，以及通向LCD_Graphic的端口。包办LCD_Graphic的指令，向Decider输出addr以获取对应位置的图像信息data。start信号从低到高变化时（同步信号，并非上升沿）开始图像写入。<br>
- Decider 接到Driver的是dataD和addrD，接到Texture的是dataT和addrT，并且从GameCenter获取游戏状态。作用是根据当前游戏状态，响应Driver的图像需求。<br>
- Texture 存储所有图像素材。<br>
- GameCenter 响应按键信息，进行游戏状态跳转以及相关运算。<br>

----

## Driver

测试：在屏幕上显示间隔的竖条纹。

## GameCenter

状态机跳转

GameCenter向Devider展示的信息有：state（游戏状态），jump_height,barrier_pos
<br>因为是最初版本所以连背景图都不要了。云也不要了。

测试：LED灯测试，按键正常使用，用LED灯展示当前游戏状态。

## Decider

纯组合逻辑？

很大，可能需要划分子模块。

先对addrD进行预处理，得到像素点位置posX和posY，再根据posX、posY和state信息确定

测试：

## Texture

纯组合逻辑。不接受时钟上升沿。

测试

------

# 小组工作划分：

Top design、Report、Decider：张朕银<br>
Driver：薛玥<br>
Decider、PPT：张盼<br>
Host：郭家兴<br>
Texture：万欣然<br>
有余力的同学可以辅助其他部分的设计和验证，工作量最终写入报告中。


------

# 参考书/网络教程

《计算机体系结构：量化研究方法》<br>
<a href="https://www.cnblogs.com/undefined000/p/trex_1.html">Chrome自带恐龙小游戏的源码研究</a><br>
<a href="https://github.com/wayou/t-rex-runner">Rex-Runner源码</a>