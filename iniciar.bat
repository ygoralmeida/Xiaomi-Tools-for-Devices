echo Off
title :: Xiaomi Tools for Devices ::
mode 73,19
Color 1f
cd %~dp0


:MenuPrincipal
Cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                      Xiaomi Tools for Devices:                      ³
Echo  ³ VersÆo: 1.0                                                         ³
Echo  ³ Autor : Francisco Eduardo  @srfranciscomont                         ³
Echo  ³ Ajude realizando uma doa‡Æo :) - https://goo.gl/ESm5aP              ³
Echo  ³                                                                     ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ 
Echo  ÚÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³ ^> ³                              Menu:                              ³
Echo  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÂÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
Echo  ³ 1 ³ Instalar drivers (x86/x64)  ³ ³ 5 ³ Instalar TWRP               ³
Echo  ³ 2 ³ Iniciar processo de flash   ³ ³   ³                             ³
Echo  ³ 3 ³ Desbloqueio do bootloader   ³ ³   ³                             ³
Echo  ³ 4 ³ Status do bootloader        ³ ³   ³                             ³
Echo  ÃÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ³   ³                             ³
Echo  ³ 0 ³ Sair                        ³ ³   ³                             ³
Echo  ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ÀÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                              Aten‡Æo:                              ³
Echo  ³                                                                    ³
Echo  ³                 Execute o script como administrador.               ³ 
Echo  ³                                                                    ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para finalizar o script.         ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul
cls
Exit
)

cd %~dp0

cls
Echo. 
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                              Aten‡Æo:                              ³
Echo  ³                                                                    ³
Echo  ³       Encerre qualquer aplicativo aberto antes de continuar.       ³ 
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul
cls

cd %~dp0driver
pnputil.exe -a android_winusb.inf

Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³        Pressione qualquer tecla para voltar a tela inicial.        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul
Goto MenuPrincipal

:Flash
cd %~dp0

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³ Selecione seu aparelho:                                            ³
Echo  ³ (1) Redmi Note 2                                                   ³
Echo  ³ (2) Mi 4C                                                          ³
Echo  ³                                                                    ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                        Realizando download.                        ³
Echo  ³                                                                    ³
Echo  ³               O processo pode demorar algumas horas.               ³
Echo  ³                  Aproveite para tomar um suco :D.                  ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\RDN2.tgz http://bigota.d.miui.com/V8.0.1.0.LHMMIDG/hermes_global_images_V8.0.1.0.LHMMIDG_20160805.0000.29_5.0_global_05ec44b9a8.tgz  >%logs%\wget.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                      Descompactando o firmware.                    ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

7za.exe -aoa e %rom%\RDN2.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\RDN2.tar -o%firmware%\miui >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                Coloque o aparelho em modo "FASTBOOT"               ³
Echo  ³                                                                    ³
Echo  ³          (Desligue o aparelho e aperte Power + Vol Down)           ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                          Iniciando Flash!                          ³
Echo  ³                                                                    ³
Echo  ³ Logs na pasta: logs/fastboot.txt                                   ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                         Realizando limpeza.                        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³        Pressione qualquer tecla para voltar a tela inicial.        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                        Realizando download.                        ³
Echo  ³                                                                    ³
Echo  ³               O processo pode demorar algumas horas.               ³
Echo  ³                  Aproveite para tomar um suco :D.                  ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %rom%\Mi4C.tgz http://bigota.d.miui.com/6.1.7/libra_images_6.1.7_20151221.0000.11_5.1_cn_b09dac70a0.tgz >%logs%\wget.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                      Descompactando o firmware.                    ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

7za.exe -aoa e %rom%\Mi4C.tgz -o%firmware% >%logs%\7zip.txt 2>&1
7za.exe -aoa e %firmware%\Mi4C.tgz -o%firmware%\miui >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                Coloque o aparelho em modo "FASTBOOT"               ³
Echo  ³                                                                    ³
Echo  ³          (Desligue o aparelho e aperte Power + Vol Down)           ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                          Iniciando Flash!                          ³
Echo  ³                                                                    ³
Echo  ³ Logs na pasta: logs/fastboot.txt                                   ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                         Realizando limpeza.                        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

rd /s /q %firmware% >%logs%\limpeza.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³        Pressione qualquer tecla para voltar a tela inicial.        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul
Goto MenuPrincipal

:Unlock
cd %~dp0
cd %~dp0fastboot
set logs="%~dp0logs"

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                              Aten‡Æo:                              ³
Echo  ³                                                                    ³
Echo  ³       Apenas para o aparelho Mi 4C. Em breve mais aparelhos.       ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                Coloque o aparelho em modo "FASTBOOT"               ³
Echo  ³                                                                    ³
Echo  ³          (Desligue o aparelho e aperte Power + Vol Down)           ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                       Realizando desbloqueio                       ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

fastboot oem unlock >%logs%\fastboot.txt 2>&1

Goto Bootloader

:Bootloader
cd %~dp0
set logs="%~dp0logs"

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                               Status:                              ³
Echo  ³                                                                    ³
Echo  ³  Device unlocked: false - Bloqueado                                ³
Echo  ³  Device unlocked: true - Destravado                                ³
Echo  ³                                                                    ³
Echo  ³        Pressione qualquer tecla para voltar a tela inicial.        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                              Aten‡Æo:                              ³
Echo  ³                                                                    ³
Echo  ³       Apenas para o aparelho Mi 4C. Em breve mais aparelhos.       ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                        Realizando download.                        ³
Echo  ³                                                                    ³
Echo  ³                 Isso demora apenas alguns minutos!                 ³
Echo  ³                  Aproveite para ir ao banheiro :D                  ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

cd %~dp0util
wget.exe --no-check-certificate -O %recovery%\recovery.zip https://github.com/franciscomont/Xiaomi-Tools-for-Devices/blob/master/recovery/recovery.zip?raw=true  >%logs%\wget.txt 2>&1

Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                      Descompactando o recovery.                    ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

7za.exe e %recovery%\recovery.zip -o%recovery% >%logs%\7zip.txt 2>&1

cls
Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                Coloque o aparelho em modo "FASTBOOT"               ³
Echo  ³                                                                    ³
Echo  ³          (Desligue o aparelho e aperte Power + Vol Down)           ³
Echo  ³                                                                    ³
Echo  ³          Pressione qualquer tecla para iniciar o script.           ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.
Pause>nul

cd %~dp0fastboot
fastboot flash recovery recovery.img >%logs%\fastboot.txt 2>&1

Echo.
Echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
Echo  ³                                                                    ³
Echo  ³                         Realizando limpeza.                        ³
Echo  ³                                                                    ³
Echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Echo.

rd /s /q %recovery% >%logs%\limpeza.txt 2>&1

Goto Bootloader