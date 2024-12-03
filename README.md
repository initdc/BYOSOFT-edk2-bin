# risc_v_qemu

#### 介绍
RISC_V QEMU的UEFI固件，包含常用的各种功能。

#### 软件架构
软件架构说明


#### 安装教程

1.  Qemu 9.1.0
下载Windows版本  https://qemu.weilnetz.de/w64/qemu-w64-setup-20240903.exe

#### 使用说明

RISCV_VIRT_CODE.fd 和 RISCV_VIRT_VARS.fd 从本仓库下载，并复制到Qemu的安装目录。
然后打开Windows cmd 命令行，进入到Qemu的安装目录，最后运行下面的命令。

```
qemu-system-riscv64 -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off ^
-m 4096 ^
-smp 2 ^
-device virtio-gpu-pci ^
-full-screen ^
-device qemu-xhci ^
-device usb-kbd ^
-device usb-mouse ^
-device virtio-mouse-pci ^
-device virtio-mouse-device ^
-blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd ^
-blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd ^
-serial stdio
```

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
