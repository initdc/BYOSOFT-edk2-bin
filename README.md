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

使用本仓库的固件，验证你们所需的功能，如果功能缺失或者功能缺陷等，在本仓库上报issue，我们讲负责定期解决和更新

