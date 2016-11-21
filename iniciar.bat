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
Echo  � Vers�o: 1.0                                                         �
Echo  � Autor : Francisco Eduardo  @srfranciscomont                         �
Echo  � Ajude realizando uma doa��o :) - https://goo.gl/ESm5aP              �
Echo  �                                                                     �
Echo  ����������������������������������������������������������������������� 
Echo  ���������������������������������������������������������������������Ŀ
Echo  � ^> �                              Menu:                              �
Echo  ���������������������������������������������������������������������Ĵ
Echo  � 1 � Instalar drivers (x86/x64)  � � 5 � Instalar TWRP               �
Echo  � 2 � Iniciar processo de flash   � �   �                             �
Echo  � 3 � Desbloqueio do bootloader   � �   �                             �
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
Echo  � (1) Redmi Note 2                                                   �
Echo  � (2) Mi 4C                                                          �
Echo  �                                                                    �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.
Set "Device="
Set /p "Device=>"
If "%Device%"=="1" (Goto RDN2)
If "%Device%"=="2" (Goto Mi4C)
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
7za.exe -aoa e %firmware%\Mi4C.tgz -o%firmware%\miui >%logs%\7zip.txt 2>&1

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
cd %~dp0fastboot
set logs="%~dp0logs"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                              Aten��o:                              �
Echo  �                                                                    �
Echo  �       Apenas para o aparelho Mi 4C. Em breve mais aparelhos.       �
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

fastboot oem unlock >%logs%\fastboot.txt 2>&1

Goto Bootloader

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
fastboot reboot

Goto MenuPrincipal

:TWRP 
cd %~dp0
set logs="%~dp0logs"
set recovery="%~dp0recovery"

cls
Echo.
Echo  ��������������������������������������������������������������������Ŀ
Echo  �                              Aten��o:                              �
Echo  �                                                                    �
Echo  �       Apenas para o aparelho Mi 4C. Em breve mais aparelhos.       �
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
Echo  �                        Realizando download.                        �
Echo  �                                                                    �
Echo  �                 Isso demora apenas alguns minutos!                 �
Echo  �                  Aproveite para ir ao banheiro :D                  �
Echo  �                                                                    �
Echo  ����������������������������������������������������������������������
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %recovery%\recovery.zip https://github.com/franciscomont/Xiaomi-Tools-for-Devices/blob/master/recovery/recovery.zip?raw=true  >%logs%\wget.txt 2>&1

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