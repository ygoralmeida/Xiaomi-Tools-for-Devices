echo Off
title :: Xiaomi Tools for Devices ::
mode 73,19
Color 1f
cd %~dp0
set versao=1.6 Stable


:MenuPrincipal
Cls
Echo.
Echo  ���������������������������������������������������������������������Ŀ
Echo  �                      Xiaomi Tools for Devices:                      �
Echo  � Vers�o: %versao%                                                  �
Echo  � Autor: Francisco Eduardo @github.com/franciscomont                  �
Echo  � Realize uma doa��o :) - https://goo.gl/ESm5aP                       �
Echo  �                                                                     �
Echo  ����������������������������������������������������������������������� 
Echo  ���������������������������������������������������������������������Ŀ
Echo  � ^> �                              Menu:                              �
Echo  ���������������������������������������������������������������������Ĵ
Echo  � 1 � Instalar drivers (x86/x64)  � � 5 � Instalar TWRP               �
Echo  � 2 � Flash do rom stock          � �   �                             �
Echo  � 3 � Status do bootloader        � �   �                             �
Echo  � 4 � Desbloquear bootloader      � �   �                             �
Echo  ���������������������������������Ĵ �   �                             �
Echo  � 0 � Sair                        � �   �                             �
Echo  ����������������������������������� �����������������������������������
Set "Menu="
Set /p "Menu=>"
If "%Menu%"=="1" (Goto Drivers)
If "%Menu%"=="2" (Goto Flash)
If "%Menu%"=="3" (Goto InfoBootloader)
If "%Menu%"=="4" (Goto Unlock)
If "%Menu%"=="5" (Goto Twrp)
If "%Menu%"=="0" (Goto Exit)
Goto MenuPrincipal

:Drivers
If Not "%SafeBoot_Option%"=="" (Goto)
Reg Add "HKLM" /F>nul 2>&1
If Not "%ErrorLevel%"=="0" (
Color 4f

cls
Echo. 
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                              Aten��o:                              �
Echo  �                                                                    �
Echo  �                 Execute o script como administrador.               � 
Echo  �                                                                    �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para finalizar o script.         �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
cls
Exit
)

cd %~dp0

cls
Echo. 
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                              Aten��o:                              �
Echo  �                                                                    �
Echo  �       Encerre qualquer aplicativo aberto antes de continuar.       � 
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
cls

cd %~dp0driver
pnputil.exe -a android_winusb.inf

Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:Flash
cd %~dp0

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 2 / Prime Hermes                                    �
Echo  � (2) Redmi Note 3 Hennessy                                          �
Echo  � (3) Redmi Note 3 Pro Kate Special Edition                          �
Echo  � (4) Redmi Note 3 Pro Kenzo                                         �
Echo  � (5) Mi 4C Libra                                                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN2)
If "%Device%"=="2" (Goto RDN3H)
If "%Device%"=="3" (Goto RDN3Ka)
If "%Device%"=="4" (Goto RDN3Ke)
If "%Device%"=="5" (Goto MI4C)
Goto Flash

:RDN2
cd %~dp0
set rom="%~dp0rom"
set firmware="%~dp0firmware"
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN2.tgz http://bigota.d.miui.com/V8.0.1.0.LHMMIDG/hermes_global_images_V8.0.1.0.LHMMIDG_20160805.0000.29_5.0_global_05ec44b9a8.tgz >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
7za.exe e %rom%\RDN2.tgz -o%firmware% -aoa >>%logs%\7zip.txt 2>&1
7za.exe e %firmware%\RDN2.tar -o%firmware% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot oem device-info >>%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\system.img >>%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\cache.img >>%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\userdata.img >>%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\recovery.img >>%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\boot.img >>%logs%\fastboot.txt 2>&1
fastboot flash secro %firmware%\secro.img >>%logs%\fastboot.txt 2>&1
fastboot flash lk %firmware%\lk.bin >>%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\logo.bin >>%logs%\fastboot.txt 2>&1
fastboot reboot >>%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:RDN3H
cd %~dp0
set rom="%~dp0rom"
set firmware="%~dp0firmware"
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN3H.tgz http://bigota.d.miui.com/6.6.17/hennessy_images_6.6.17_20160523.0000.23_5.0_cn_f1f61b75ae.tgz >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe e %rom%\RDN3H.tgz -o%firmware% -aoa >>%logs%\7zip.txt 2>&1
7za.exe e %firmware%\RDN3H.tar -o%firmware% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot oem device-info >>%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\boot.img >>%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\system.img >>%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\cache.img >>%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\userdata.img >>%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\recovery.img >>%logs%\fastboot.txt 2>&1
fastboot flash tee1 %firmware%\trustzone.bin >>%logs%\fastboot.txt 2>&1
fastboot flash tee2 %firmware%\trustzone.bin >>%logs%\fastboot.txt 2>&1
fastboot flash lk %firmware%\lk.bin >>%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\logo.bin >>%logs%\fastboot.txt 2>&1
fastboot reboot >>%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:RDN3KA
cd %~dp0
set rom="%~dp0rom"
set firmware="%~dp0firmware"
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN3KA.tgz http://bigota.d.miui.com/6.10.13/kate_global_images_6.10.13_20160805.0000.29_6.0_global_bcf1097faa.tgz >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe e %rom%\RDN3KA.tgz -o%firmware% -aoa >>%logs%\7zip.txt 2>&1
7za.exe e %rom%\RDN3KA.tar -o%firmware% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot oem device-info >>%logs%\fastboot.txt 2>&1
fastboot flash tz %firmware%\tz.mbn  >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\sbl1.mbn  >>%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash keymaster %firmware%\keymaster.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash cmnlib %firmware%\cmnlib.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash keymasterbak %firmware%\keymaster.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash cmnlibbak %firmware%\cmnlib.mbn >>%logs%\fastboot.txt 2>&1
fastboot erase boot  >>%logs%\fastboot.txt 2>&1
fastboot flash modem %firmware%\NON-HLOS.bin >>%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\system.img >>%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\cache.img  >>%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\userdata.img >>%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\recovery.img >>%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\boot.img >>%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\cust.img >>%logs%\fastboot.txt 2>&1
fastboot flash sec %firmware%\sec.dat >>%logs%\fastboot.txt 2>&1
fastboot flash dsp %firmware%\adspso.bin >>%logs%\fastboot.txt 2>&1
fastboot flash mdtp %firmware%\mdtp.img >>%logs%\fastboot.txt 2>&1
fastboot erase splash >>%logs%\fastboot.txt 2>&1
fastboot flash splash %firmware%\splash.img  >>%logs%\fastboot.txt 2>&1
fastboot erase DDR  >>%logs%\fastboot.txt
fastboot reboot  >>%logs%\fastboot.txt 

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:RDN3KE
cd %~dp0
set rom="%~dp0rom"
set firmware="%~dp0firmware"
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN3KE.tgz http://bigota.d.miui.com/V7.1.8.0.LHOMICL/kenzo_global_images_V7.1.8.0.LHOMICL_20160129.0000.14_5.1_global_9706e12561.tgz >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe e %rom%\RDN3KE.tgz -o%firmware% -aoa >>%logs%\7zip.txt 2>&1
7za.exe e %rom%\RDN3KE.tar -o%firmware% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash tz %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot erase boot >>%logs%\fastboot.txt 2>&1
fastboot flash modem %firmware%\NON-HLOS.bin >>%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\system.img >>%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\cache.img >>%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\userdata.img >>%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\recovery.img >>%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\boot.img >>%logs%\fastboot.txt 2>&1
fastboot flash sec %firmware%\sec.dat >>%logs%\fastboot.txt 2>&1
fastboot flash dsp %firmware%\adspso.bin >>%logs%\fastboot.txt 2>&1
fastboot flash mdtp %firmware%\mdtp.img >>%logs%\fastboot.txt 2>&1
fastboot erase splash >>%logs%\fastboot.txt 2>&1
fastboot flash splash %firmware%\splash.img >>%logs%\fastboot.txt 2>&1
fastboot erase DDR >>%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\cust.img >>%logs%\fastboot.txt 2>&1
fastboot reboot >>%logs%\fastboot.txt 2>&1


cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:MI4C
cd %~dp0
set logs="%~dp0logs"
set firmware="%~dp0firmware"
set rom="%~dp0rom"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\MI4C.tgz http://bigota.d.miui.com/V8.1.1.0.LXKCNDI/libra_images_V8.1.1.0.LXKCNDI_20161107.0000.00_5.1_cn_103869def5.tgz >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
7za.exe e %rom%\MI4C.tgz -o%firmware% >>%logs%\7zip.txt 2>&1
7za.exe e %firmware%\MI4C.tar -o%firmware% >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash pmic %firmware%\pmic.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash pmicbak %firmware%\pmic.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash tz %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sdi %firmware%\sdi.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot erase boot >>%logs%\fastboot.txt 2>&1
fastboot erase sec >>%logs%\fastboot.txt 2>&1
fastboot flash misc %firmware%\misc.img >>%logs%\fastboot.txt 2>&1
fastboot flash modem %firmware%\NON-HLOS.bin >>%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\cache.img >>%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\userdata.img >>%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\system.img >>%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\recovery.img >>%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\boot.img >>%logs%\fastboot.txt 2>&1
fastboot flash bluetooth %firmware%\BTFM.bin >>%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\logo.img >>%logs%\fastboot.txt 2>&1
fastboot flash bk2 %firmware%\bk2.img >>%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\cust.img >>%logs%\fastboot.txt 2>&1
fastboot reboot >>%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:InfoBootloader
cd %~dp0

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                               Status:                              �
Echo  �                                                                    �
Echo  �  Device unlocked: false - Bloqueado                                �
Echo  �  Device unlocked: true - Destravado                                �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot oem device-info

Pause>nul
Goto MenuPrincipal

:Unlock
cd %~dp0

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Mi 4C Libra                                                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto MI4C-unlock)
Goto Unlock

:MI4C-unlock
cd %~dp0
set logs="%~dp0logs"
set firmware="%~dp0firmware"
set recovery="%~dp0recovery"
set rom="%~dp0rom"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando downgrade.                       �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\MI4C-Downgrade.tgz http://bigota.d.miui.com/6.1.7/libra_images_6.1.7_20151221.0000.11_5.1_cn_b09dac70a0.tgz >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe e %rom%\MI4C-Downgrade.tgz -o %firmware% -aoa >>%logs%\7zip.txt 2>&1
7za.exe e %firmware%\MI4C-Downgrade.tar -o%firmware% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash pmic %firmware%\pmic.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash pmicbak %firmware%\pmic.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\hyp.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash tz %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\tz.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\sbl1.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash sdi %firmware%\sdi.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\rpm.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\emmc_appsboot.mbn >>%logs%\fastboot.txt 2>&1
fastboot erase boot >>%logs%\fastboot.txt 2>&1
fastboot erase sec >>%logs%\fastboot.txt 2>&1
fastboot flash misc %firmware%\misc.img >>%logs%\fastboot.txt 2>&1
fastboot flash modem %firmware%\NON-HLOS.bin >>%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\cache.img >>%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\userdata.img >>%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\system.img >>%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\recovery.img >>%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\boot.img >>%logs%\fastboot.txt 2>&1
fastboot flash bluetooth %firmware%\BTFM.bin >>%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\logo.img >>%logs%\fastboot.txt 2>&1
fastboot flash bk2 %firmware%\bk2.img >>%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\cust.img >>%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cd %~dp0fastboot
fastboot oem unlock >>%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cd %~dp0fastboot
fastboot reboot
Goto MenuPrincipal

:TWRP 
cd %~dp0
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 2                                                   �
Echo  � (2) Mi 4C                                                          �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN2Recovery)
If "%Device%"=="2" (Goto Mi4CRecovery)
Goto TWRP

:RDN2Recovery
cd %~dp0
set recovery="%~dp0recovery"
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                    Realizando download do TWRP.                    �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util 
wget.exe --no-check-certificate -O %recovery%\recoveryRDN2.zip https://github.com/franciscomont/XiaomiRecoveryDevices/blob/master/recoveryRDN2.zip?raw=true >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o recovery.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util 
7za.exe e %recovery%\recoveryRDN2.zip -o%recovery% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Instalando a TWRP.                         �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash recovery %recovery%\recovery.img >>%logs%\recovery.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %recovery% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:Mi4CRecovery
cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                    Realizando download do TWRP.                    �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util 
wget.exe --no-check-certificate -O %recovery%\recoveryMi4C.zip https://github.com/franciscomont/XiaomiRecoveryDevices/blob/master/recoveryMi4C.zip?raw=true  >>%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o recovery.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util 
7za.exe e %recovery%\recoveryMI4C.zip -o%recovery% -aoa >>%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Instalando a TWRP.                         �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash recovery %recovery%\recovery.img >>%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %recovery% >>%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal



