@echo off
REM QEMU RISC-V 64-bit virtual machine setup with GPU and USB devices
REM This batch file sets up a QEMU virtual machine with RISC-V 64-bit architecture.

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
