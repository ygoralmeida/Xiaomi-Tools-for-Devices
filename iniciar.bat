echo Off
title :: Xiaomi Tools for Devices ::
mode 73,19
Color 1f
cd %~dp0


:MenuPrincipal
Cls
Echo.
Echo  ���������������������������������������������������������������������Ŀ
Echo  �                      Xiaomi Tools for Devices:                      �
Echo  � Vers�o: 1.3                                                         �
Echo  � Autor : Francisco Eduardo  @srfranciscomont                         �
Echo  � Ajude realizando uma doa��o :) - https://goo.gl/ESm5aP              �
Echo  �                                                                     �
Echo  ����������������������������������������������������������������������� 
Echo  ���������������������������������������������������������������������Ŀ
Echo  � ^> �                              Menu:                              �
Echo  ���������������������������������������������������������������������Ĵ
Echo  � 1 � Instalar drivers (x86/x64)  � � 5 � Instalar TWRP               �
Echo  � 2 � Iniciar processo de flash   � � 6 � Detectar bootloader         �
Echo  � 3 � Desbloqueio do bootloader   � � 7 � Sair do modo Fastboot       �
Echo  � 4 � Status do bootloader        � �   �                             �
Echo  ���������������������������������Ĵ �   �                             �
Echo  � 0 � Sair                        � �   �                             �
Echo  ����������������������������������� �����������������������������������
Set "Menu="
Set /p "Menu=>"
If "%Menu%"=="1" (Goto Drivers)
If "%Menu%"=="2" (Goto Flash)
If "%Menu%"=="3" (Goto Unlock)
If "%Menu%"=="4" (Goto Bootloader)
If "%Menu%"=="5" (Goto Twrp)
If "%Menu%"=="5" (Goto Board)
If "%Menu%"=="5" (Goto Fastboot-exit)
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
Echo  � (1) Redmi Note 2 / Prime *MTK - Hermes*                            �
Echo  � (2) Redmi Note 3 *MTK - Hennessy*                                  �
Echo  � (3) Redmi Note 3 *Snapdragon - Kate (Special Edition)*             �
Echo  � (4) Redmi Note 3 *Snapdragon - Kenzo*                              �
Echo  � (5) Mi 4C *Snapdragon - Libra*                                     �
Echo  �                                                                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN2)
If "%Device%"=="2" (Goto RDN3-Hennessy)
If "%Device%"=="3" (Goto RDN3-Kate)
If "%Device%"=="4" (Goto RDN3-Kenzo)
If "%Device%"=="5" (Goto Mi4C)
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
wget.exe --no-check-certificate -O %rom%\RDN2.tgz http://bigota.d.miui.com/V8.0.1.0.LHMMIDG/hermes_global_images_V8.0.1.0.LHMMIDG_20160805.0000.29_5.0_global_05ec44b9a8.tgz  >%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe -aoa e %rom%\RDN2.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\RDN2.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

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
Echo  � Logs na pasta: logs/fastboot.txt                                   �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash system %firmware%\miui\system.img >%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\miui\cache.img >%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\miui\userdata.img >%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\miui\recovery.img >%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\miui\boot.img >%logs%\fastboot.txt 2>&1
fastboot flash secro %firmware%\miui\secro.img >%logs%\fastboot.txt 2>&1
fastboot flash lk %firmware%\miui\lk.bin >%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\miui\logo.bin >%logs%\fastboot.txt 2>&1
fastboot reboot

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

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

:RDN3-Hennessy
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
wget.exe --no-check-certificate -O %rom%\RDN3-Henessy.tgz http://bigota.d.miui.com/6.6.17/hennessy_images_6.6.17_20160523.0000.23_5.0_cn_f1f61b75ae.tgz >%logs%\wget.txt 

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe -aoa e %rom%\RDN3-Henessy.tgz -o%firmware% >%logs%\7zip.txt  >%logs%\fastboot.txt 2>&1
7za.exe -aoa e %firmware%\RDN3-Henessy.tar -o%firmware%\miui >%logs%\7zip.txt  >%logs%\fastboot.txt 2>&1

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
Echo  � Logs na pasta: %~dp0logs/fastboot.txt                              �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash boot %firmware%\miui\boot.img >%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\miui\system.img >%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\miui\cache.img >%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\miui\userdata.img >%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\miui\recovery.img >%logs%\fastboot.txt 2>&1
fastboot flash tee1 %firmware%\miui\trustzone.bin >%logs%\fastboot.txt 2>&1
fastboot flash tee2 %firmware%\miui\trustzone.bin >%logs%\fastboot.txt 2>&1
fastboot flash lk %firmware%\miui\lk.bin >%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\miui\logo.bin >%logs%\fastboot.txt 2>&1
fastboot reboot >%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt   2>&1

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

:RDN3-Kate
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
wget.exe --no-check-certificate -O %rom%\RDN3-Kate.tgz http://bigota.d.miui.com/6.10.13/kate_global_images_6.10.13_20160805.0000.29_6.0_global_bcf1097faa.tgz >%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe -aoa e %rom%\RDN3-Kate.tgz -o%firmware% >%logs%\7zip.txt  >%logs%\fastboot.txt 2>&1
7za.exe -aoa e %firmware%\RDN3-Kate.tar -o%firmware%\miui >%logs%\7zip.txt  >%logs%\fastboot.txt 2>&1

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
Echo  � Logs na pasta: %~dp0logs/fastboot.txt                              �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash tz %firmware%\miui\tz.mbn  >%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\miui\sbl1.mbn  >%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\miui\rpm.mbn >%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\miui\emmc_appsboot.mbn >%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\miui\hyp.mbn >%logs%\fastboot.txt 2>&1
fastboot flash keymaster %firmware%\miui\keymaster.mbn >%logs%\fastboot.txt 2>&1
fastboot flash cmnlib %firmware%\miui\cmnlib.mbn >%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\miui\tz.mbn >%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\miui\sbl1.mbn >%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\miui\rpm.mbn >%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\miui\emmc_appsboot.mbn >%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\miui\hyp.mbn >%logs%\fastboot.txt 2>&1
fastboot flash keymasterbak %firmware%\miui\keymaster.mbn >%logs%\fastboot.txt 2>&1
fastboot flash cmnlibbak %firmware%\miui\cmnlib.mbn >%logs%\fastboot.txt 2>&1
fastboot erase boot  >%logs%\fastboot.txt 2>&1
fastboot flash modem %firmware%\miui\NON-HLOS.bin >%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\miui\system.img >%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\miui\cache.img  >%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\miui\userdata.img >%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\miui\recovery.img >%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\miui\boot.img >%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\miui\cust.img >%logs%\fastboot.txt 2>&1
fastboot flash sec %firmware%\miui\sec.dat >%logs%\fastboot.txt 2>&1
fastboot flash dsp %firmware%\miui\adspso.bin >%logs%\fastboot.txt 2>&1
fastboot flash mdtp %firmware%\miui\mdtp.img >%logs%\fastboot.txt 2>&1
fastboot erase splash >%logs%\fastboot.txt 2>&1
fastboot flash splash %firmware%\miui\splash.img  >%logs%\fastboot.txt 2>&1
fastboot erase DDR  >%logs%\fastboot.txt
fastboot reboot  >%logs%\fastboot.txt 

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt   2>&1

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


:RDN3-Kenzo
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
wget.exe --no-check-certificate -O %rom%\RDN3-Kenzo.tgz http://bigota.d.miui.com/V7.1.8.0.LHOMICL/kenzo_global_images_V7.1.8.0.LHOMICL_20160129.0000.14_5.1_global_9706e12561.tgz >%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe -aoa e %rom%\RDN3-Kenzo.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\RDN3-Kenzo.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

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
Echo  � Logs na pasta: %~dp0logs/fastboot.txt                              �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash tz %firmware%\miui\tz.mbn >%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\miui\sbl1.mbn >%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\miui\rpm.mbn >%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\miui\emmc_appsboot.mbn >%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\miui\hyp.mbn >%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\miui\tz.mbn >%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\miui\sbl1.mbn >%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\miui\rpm.mbn >%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\miui\emmc_appsboot.mbn >%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\miui\hyp.mbn >%logs%\fastboot.txt 2>&1
fastboot erase boot
fastboot flash modem %firmware%\miui\NON-HLOS.bin >%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\miui\system.img >%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\miui\cache.img >%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\miui\userdata.img >%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\miui\recovery.img >%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\miui\boot.img >%logs%\fastboot.txt 2>&1
fastboot flash sec %firmware%\miui\sec.dat >%logs%\fastboot.txt 2>&1
fastboot flash dsp %firmware%\miui\adspso.bin >%logs%\fastboot.txt 2>&1
fastboot flash mdtp %firmware%\miui\mdtp.img >%logs%\fastboot.txt 2>&1
fastboot erase splash >%logs%\fastboot.txt 2>&1
fastboot flash splash %firmware%\miui\splash.img >%logs%\fastboot.txt 2>&1
fastboot erase DDR >%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\miui\cust.img >%logs%\fastboot.txt 2>&1
fastboot reboot >%logs%\fastboot.txt 2>&1


cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

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



:Mi4C
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
wget.exe --no-check-certificate -O %rom%\Mi4C.tgz http://bigota.d.miui.com/6.1.7/libra_images_6.1.7_20151221.0000.11_5.1_cn_b09dac70a0.tgz >%logs%\wget.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe -aoa e %rom%\Mi4C.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\Mi4C.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

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
Echo  � Logs na pasta: logs/fastboot.txt                                   �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot flash pmic %firmware%\miui\pmic.mbn >%logs%\fastboot.txt 2>&1
fastboot flash pmicbak %firmware%\miui\pmic.mbn >%logs%\fastboot.txt 2>&1
fastboot flash hyp %firmware%\miui\hyp.mbn >%logs%\fastboot.txt 2>&1
fastboot flash hypbak %firmware%\miui\hyp.mbn >%logs%\fastboot.txt 2>&1
fastboot flash tz %firmware%\miui\tz.mbn >%logs%\fastboot.txt 2>&1
fastboot flash tzbak %firmware%\miui\tz.mbn >%logs%\fastboot.txt 2>&1
fastboot flash sbl1 %firmware%\miui\sbl1.mbn >%logs%\fastboot.txt 2>&1
fastboot flash sbl1bak %firmware%\miui\sbl1.mbn >%logs%\fastboot.txt 2>&1
fastboot flash sdi %firmware%\miui\sdi.mbn >%logs%\fastboot.txt 2>&1
fastboot flash rpm %firmware%\miui\rpm.mbn >%logs%\fastboot.txt 2>&1
fastboot flash rpmbak %firmware%\miui\rpm.mbn >%logs%\fastboot.txt 2>&1
fastboot flash aboot %firmware%\miui\emmc_appsboot.mbn >%logs%\fastboot.txt 2>&1
fastboot flash abootbak %firmware%\miui\emmc_appsboot.mbn >%logs%\fastboot.txt 2>&1
fastboot erase boot >%logs%\fastboot.txt 2>&1
fastboot erase sec >%logs%\fastboot.txt 2>&1
fastboot flash misc %firmware%\miui\misc.img >%logs%\fastboot.txt 2>&1
fastboot flash modem %firmware%\miui\NON-HLOS.bin >%logs%\fastboot.txt 2>&1
fastboot flash cache %firmware%\miui\cache.img >%logs%\fastboot.txt 2>&1
fastboot flash userdata %firmware%\miui\userdata.img >%logs%\fastboot.txt 2>&1
fastboot flash system %firmware%\miui\system.img >%logs%\fastboot.txt 2>&1
fastboot flash recovery %firmware%\miui\recovery.img >%logs%\fastboot.txt 2>&1
fastboot flash boot %firmware%\miui\boot.img >%logs%\fastboot.txt 2>&1
fastboot flash bluetooth %firmware%\miui\BTFM.bin >%logs%\fastboot.txt 2>&1
fastboot flash logo %firmware%\miui\logo.img >%logs%\fastboot.txt 2>&1
fastboot flash bk2 %firmware%\miui\bk2.img >%logs%\fastboot.txt 2>&1
fastboot flash cust %firmware%\miui\cust.img >%logs%\fastboot.txt 2>&1
fastboot reboot >%logs%\fastboot.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

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

:Unlock
cd %~dp0

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 3 *Snapdragon - Kate (Special Edition)*             �
Echo  � (2) Redmi Note 3 *Snapdragon - Kenzo*                              �
Echo  � (3) Mi 4C *Snapdragon - Libra*                                     �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN3K-unlock)
If "%Device%"=="2" (Goto RDN3KE-unlock)
If "%Device%"=="2" (Goto Mi4C-unlock)
Goto Unlock

:RDN3K-Unlock
cd %~dp0
set logs="%~dp0logs"

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
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cd %~dp0fastboot
fastboot oem unlock-go >%logs%\fastboot.txt 2>&1

cls
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "Recovery"               �
Echo  �                                                                    �
Echo  �           (Desligue o aparelho e aperte Power + Vol UP)            �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

Goto MenuPrincipal

:RDN3KE-unlock
cd %~dp0
set logs="%~dp0logs"

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
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cd %~dp0fastboot
fastboot oem unlock-go >%logs%\fastboot.txt 2>&1

cls
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "Recovery"               �
Echo  �                                                                    �
Echo  �           (Desligue o aparelho e aperte Power + Vol UP)            �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

Goto MenuPrincipal

:Mi4C-unlock
cd %~dp0
set logs="%~dp0logs"

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
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cd %~dp0fastboot
fastboot oem unlock >%logs%\fastboot.txt 2>&1

cls
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "Recovery"               �
Echo  �                                                                    �
Echo  �           (Desligue o aparelho e aperte Power + Vol UP)            �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

Goto MenuPrincipal

:Bootloader
cd %~dp0
set logs="%~dp0logs"

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

:Mi4C-unlock
cd %~dp0
set logs="%~dp0logs"

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
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

cd %~dp0fastboot
fastboot oem unlock >%logs%\fastboot.txt 2>&1
fastboot reboot >%logs%\fastboot.txt 2>&1

cls
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "Recovery"               �
Echo  �                                                                    �
Echo  �           (Desligue o aparelho e aperte Power + Vol UP)            �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul

Goto MenuPrincipal

:Bootloader
cd %~dp0
set logs="%~dp0logs"

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

:TWRP 
cd %~dp0

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 2                                                   �
Echo  � (2) Mi 4C                                                          �
Echo  �                                                                    �
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
set logs="%~dp0logs"
set recovery="%~dp0recovery"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util 
wget.exe --no-check-certificate -O %recovery%\recovery.zip https://github.com/franciscomont/XiaomiRecoveryDevices/blob/master/recoveryRDN2.zip?raw=true  >%logs%\wget.txt 2>&1

Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o recovery.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe e %recovery%\recovery.zip -o%recovery% >%logs%\7zip.txt 2>&1

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

cd %~dp0fastboot
fastboot flash recovery recovery.img >%logs%\fastboot.txt 2>&1

Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %recovery% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
fastboot reboot
Goto MenuPrincipal


:Mi4CRecovery
cd %~dp0
set logs="%~dp0logs"
set recovery="%~dp0recovery"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util 
wget.exe --no-check-certificate -O %recovery%\recovery.zip https://github.com/franciscomont/XiaomiRecoveryDevices/blob/master/recoveryMi4C.zip?raw=true  >%logs%\wget.txt 2>&1

Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                      Descompactando o recovery.                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

7za.exe e %recovery%\recovery.zip -o%recovery% >%logs%\7zip.txt 2>&1

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

cd %~dp0fastboot
fastboot flash recovery recovery.img >%logs%\fastboot.txt 2>&1

Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

rd /s /q %recovery% >%logs%\limpeza.txt 2>&1
Goto Bootloader

:Board
cd %~dp0

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

cd %~dp0fastboot
fastboot.exe getvar product


Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Pause>nul
Goto MenuPrincipal

:Fastboot-exit
cd %~dp0

Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0fastboot
fastboot.exe reboot

Pause>nul
Goto MenuPrincipal