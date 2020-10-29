# 如何自动化地使用FDE-"Design Compiler"-SMIMS工具链？

## 1 与虚拟机共享文件夹

Design Compiler在CentOS操作系统的虚拟机中，我们需要使用VMware的共享文件夹功能，使之与主机有共享路径。

进入虚拟机设置-选项-共享文件夹

![](2020-10-29-19-01-31.png)

自行设置主机路径和名称，例如"E:\Virtual_Machines\share"和"share"。

然后