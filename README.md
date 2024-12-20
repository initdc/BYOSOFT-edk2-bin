# risc_v_qemu

#### 介绍
RISC-V 64位 QEMU的UEFI固件，可以在Windows/Linux上qemu环境下运行。

#### 软件架构
本仓库中的UEFI二进制固件都放在根目录，方便下载和验证。

#### 安装教程
Windows:
Qemu 下载Windows版本并安装  
https://qemu.weilnetz.de/w64/qemu-w64-setup-20240903.exe
注意事项：
如需启用PXE Boot
需下载OpenVPN  https://swupdate.openvpn.org/community/releases/OpenVPN-2.6.12-I001-amd64.msi
安装成功后进入控制面板->网络和 Internet->网络和共享中心->更改适配器设置
将虚拟网卡OpenVPN TAP-Windows6改名为tap0
运行时添加
```
-netdev tap,id=net0,ifname=tap0,script=no,downscript=no 
-device virtio-net-pci,netdev=net0 
```

Linux:
1.  下载Qemu 9.1.0
```
wget https://download.qemu.org/qemu-9.1.0.tar.xz
tar -xvf qemu-9.1.0.tar.xz
cd qemu-9.1.0
```
2.  安装编译依赖
```
sudo apt update
sudo apt install build-essential libglib2.0-dev libpixman-1-dev zlib1g-dev ninja-build
```
3.  配置编译安装
```
./configure --target-list=riscv64-softmmu
make -j$(nproc)
sudo make install
```

#### 使用说明

RISCV_VIRT_CODE.fd 和 RISCV_VIRT_VARS.fd 从本仓库下载，并复制到Qemu的安装目录。
然后打开Windows cmd 命令行，进入到Qemu的安装目录，最后运行下面的命令，进入到BIOS。

```
qemu-system-riscv64 -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off ^
-m 4096 ^
-smp 2 ^
-device virtio-gpu-pci ^
-device qemu-xhci ^
-device usb-kbd ^
-device usb-mouse ^
-blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd ^
-blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd ^
-serial stdio ^
-device virtio-rng-pci ^
-display sdl -device virtio-vga,xres=1280,yres=720
```

#### 参与贡献

使用本仓库的固件，验证期望的功能，如果功能缺失或者功能缺陷的话，请在本仓库报issue，我们负责定期解决和更新，计划每季度更新。

#### 功能清单

| 功能 | 
| ------ | 
| 图形界面 |
| 中英文显示 |
| 热键启动 |
| 启动Logo |
| 输入设备（USB键盘）                               |
| 输出设备（virtio-gpu-pci 显示）                   |
| 串口日志 |
| 串口输入输出 （待支持） |
| 存储设备（virtio-blk-device 硬盘、U盘）             |
| 网络设备 （virtio-net-pci 网卡）                  |
| 文件系统（FAT32）                               |
| UEFI Shell |
| 操作系统启动（openSUSE，OS待上传）                          |
| 固件升级 （待支持）                                |
| SMBIOS (Type 0, 1, 3, 4, 16, 17, 19, 32等） |
| ACPI（待支持）                                 |
| 内存映射 (4K)                                 |
| 运行时服务                                     |
| BIOS口令                                    |
| 安全启动                                      |
| 可信度量 （待支持）                                |
| 密码算法强度                                    |
| 密码加密算法                                    |
| 密码中的随机数 （virtio-rng-pci）                  |



