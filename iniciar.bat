echo Off
title :: Xiaomi Tools for Devices ::
mode 73,19
Color 1f
cd %~dp0


:MenuPrincipal
Cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
Echo  �                      Xiaomi Tools for Devices:                      �
Echo  � Vers�o: 1.1                                                         �
Echo  � Autor : Francisco Eduardo  @srfranciscomont                         �
Echo  � Ajude realizando uma doa눯o :) - https://goo.gl/ESm5aP              �
Echo  �                                                                     �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴� 
Echo  旼컴쩡컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
Echo  � ^> �                              Menu:                              �
Echo  쳐컴탠컴컴컴컴컴컴컴컴컴컴컴컴컴컴쩡쩡컴쩡컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
Echo  � 1 � Instalar drivers (x86/x64)  � � 5 � Instalar TWRP               �
Echo  � 2 � Iniciar processo de flash   � � 6 � Detectar bootloader         �
Echo  � 3 � Desbloqueio do bootloader   � � 7 � Sair do modo Fastboot       �
Echo  � 4 � Status do bootloader        � �   �                             �
Echo  쳐컴탠컴컴컴컴컴컴컴컴컴컴컴컴컴컴� �   �                             �
Echo  � 0 � Sair                        � �   �                             �
Echo  읕컴좔컴컴컴컴컴컴컴컴컴컴컴컴컴컴� 읕컴좔컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                              Aten눯o:                              �
Echo  �                                                                    �
Echo  �                 Execute o script como administrador.               � 
Echo  �                                                                    �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para finalizar o script.         �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul
cls
Exit
)

cd %~dp0

cls
Echo. 
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                              Aten눯o:                              �
Echo  �                                                                    �
Echo  �       Encerre qualquer aplicativo aberto antes de continuar.       � 
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul
cls

cd %~dp0driver
pnputil.exe -a android_winusb.inf

Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul
Goto MenuPrincipal

:Flash
cd %~dp0

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 2 / Prime *MTK - Hermes*                            �
Echo  � (2) Redmi Note 3 *Snapdragon - Kenzo*                              �
Echo  � (3) Mi 4C *Snapdragon - Libra*                                     �
Echo  �                                                                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN2)
If "%Device%"=="2" (Goto RDN3-Kenzo)
If "%Device%"=="3" (Goto Mi4C)
Goto Flash

:RDN2
cd %~dp0
set rom="%~dp0rom"
set firmware="%~dp0firmware"
set logs="%~dp0logs"

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN2.tgz http://bigota.d.miui.com/V8.0.1.0.LHMMIDG/hermes_global_images_V8.0.1.0.LHMMIDG_20160805.0000.29_5.0_global_05ec44b9a8.tgz  >%logs%\wget.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

7za.exe -aoa e %rom%\RDN2.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\RDN2.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  � Logs na pasta: logs/fastboot.txt                                   �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN3-Kenzo.tgz http://bigota.d.miui.com/V7.1.8.0.LHOMICL/kenzo_global_images_V7.1.8.0.LHOMICL_20160129.0000.14_5.1_global_9706e12561.tgz >%logs%\wget.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

7za.exe -aoa e %rom%\RDN3-Kenzo.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\RDN3-Kenzo.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  � Logs na pasta: %~dp0logs/fastboot.txt                              �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �               O processo pode demorar algumas horas.               �
Echo  �                  Aproveite para tomar um suco :D.                  �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\Mi4C.tgz http://bigota.d.miui.com/6.1.7/libra_images_6.1.7_20151221.0000.11_5.1_cn_b09dac70a0.tgz >%logs%\wget.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                      Descompactando o firmware.                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

7za.exe -aoa e %rom%\Mi4C.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\Mi4C.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                          Iniciando Flash!                          �
Echo  �                                                                    �
Echo  � Logs na pasta: logs/fastboot.txt                                   �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul
Goto MenuPrincipal

:Unlock
cd %~dp0

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 3 *Snapdragon - Kenzo*                              �
Echo  � (2) Mi 4C *Snapdragon - Libra*                                     �
Echo  �                                                                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN3K-unlock)
If "%Device%"=="2" (Goto Mi4C-unlock)
Goto Unlock

:RDN3K-Unlock
cd %~dp0
cd %~dp0fastboot
set logs="%~dp0logs"

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

fastboot oem unlock-go >%logs%\fastboot.txt 2>&1

cls
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "Recovery"               �
Echo  �                                                                    �
Echo  �           (Desligue o aparelho e aperte Power + Vol UP)            �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

Goto MenuPrincipal

:Bootloader
cd %~dp0
set logs="%~dp0logs"

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                               Status:                              �
Echo  �                                                                    �
Echo  �  Device unlocked: false - Bloqueado                                �
Echo  �  Device unlocked: true - Destravado                                �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0fastboot
fastboot oem device-info
Pause>nul

Goto MenuPrincipal

:Mi4C-unlock
cd %~dp0
cd %~dp0fastboot
set logs="%~dp0logs"

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                       Realizando desbloqueio                       �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

fastboot oem unlock >%logs%\fastboot.txt 2>&1
fastboot reboot >%logs%\fastboot.txt 2>&1

cls
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "Recovery"               �
Echo  �                                                                    �
Echo  �           (Desligue o aparelho e aperte Power + Vol UP)            �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

Goto MenuPrincipal

:Bootloader
cd %~dp0
set logs="%~dp0logs"

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                               Status:                              �
Echo  �                                                                    �
Echo  �  Device unlocked: false - Bloqueado                                �
Echo  �  Device unlocked: true - Destravado                                �
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0fastboot
fastboot oem device-info
Pause>nul

Goto MenuPrincipal

:TWRP 
cd %~dp0

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  � Selecione seu aparelho:                                            �
Echo  � (1) Redmi Note 2                                                   �
Echo  � (2) Mi 4C                                                          �
Echo  �                                                                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0util 
wget.exe --no-check-certificate -O %recovery%\recovery.zip https://github.com/franciscomont/XiaomiRecoveryDevices/blob/master/recoveryRDN2.zip?raw=true  >%logs%\wget.txt 2>&1

Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                      Descompactando o recovery.                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

7za.exe e %recovery%\recovery.zip -o%recovery% >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cd %~dp0fastboot
fastboot flash recovery recovery.img >%logs%\fastboot.txt 2>&1

Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

rd /s /q %recovery% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
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
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0util 
wget.exe --no-check-certificate -O %recovery%\recovery.zip https://github.com/franciscomont/XiaomiRecoveryDevices/blob/master/recoveryMi4C.zip?raw=true  >%logs%\wget.txt 2>&1

Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                      Descompactando o recovery.                    �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

7za.exe e %recovery%\recovery.zip -o%recovery% >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul

cd %~dp0fastboot
fastboot flash recovery recovery.img >%logs%\fastboot.txt 2>&1

Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                         Realizando limpeza.                        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

rd /s /q %recovery% >%logs%\limpeza.txt 2>&1
Goto Bootloader

:Board
cd %~dp0

cls
Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �                Coloque o aparelho em modo "FASTBOOT"               �
Echo  �                                                                    �
Echo  �          (Desligue o aparelho e aperte Power + Vol Down)           �
Echo  �                                                                    �
Echo  �          Pressione qualquer tecla para iniciar o script.           �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

Pause>nul
cls
Echo.

cd %~dp0fastboot
fastboot.exe getvar product


Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.
Pause>nul
Goto MenuPrincipal

:Fastboot-exit
cd %~dp0

Echo.
Echo  旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo  �                                                                    �
Echo  �        Pressione qualquer tecla para voltar a tela inicial.        �
Echo  �                                                                    �
Echo  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
Echo.

cd %~dp0fastboot
fastboot.exe reboot

Pause>nul
Goto MenuPrincipal