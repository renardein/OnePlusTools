
chcp 866 > null
@echo off
SET path=%systemroot%/system32/
md temp > NULL
md recovery > NULL
md bootloader > NULL
md backup > NULL
md adb > NULL
del %cd%\update.bat /Q /S > NULL
del %cd%\Temp\update.zip /Q /S > NULL
del %cd%\Temp\Package /Q /S > NULL
:Start
cls
title OP5Tools
echo.
echo  Добро пожаловать OP5Tools: Все в одном!
echo  для  устройств линейки OnePlus5/5T
echo.
echo  Пожалуйста, подождите...
%cd%\adb\adb.exe kill-server
%cd%\adb\adb.exe start-server
goto :Eula
pause


:Eula
cls
title Лицензионное соглашение
if exist %cd%\Temp\EulaAgree.OP5Tools (
goto :menu
)
echo.
echo Данная лицензия разрешает лицам, получившим копию данного программного 
echo обеспечения и сопутствующей документации (в дальнейшем именуемыми 
echo Программное Обеспечение), безвозмездно использовать Программное 
echo Обеспечение без ограничений, включая неограниченное право на 
echo использование, копирование, изменение, слияние, публикацию, 
echo распространение, сублицензирование и или продажу копий Программного 
echo Обеспечения, а также лицам, которым предоставляется данное Программное
echo Обеспечение, при соблюдении следующих условий
echo.
echo Указанное выше уведомление об авторском праве и данные условия должны быть 
echo включены во все копии или значимые части данного Программного Обеспечения.
echo.
echo ДАННОЕ ПРОГРАММНОЕ ОБЕСПЕЧЕНИЕ ПРЕДОСТАВЛЯЕТСЯ КАК ЕСТЬ, БЕЗ КАКИХ-ЛИБО 
echo ГАРАНТИЙ, ЯВНО ВЫРАЖЕННЫХ ИЛИ ПОДРАЗУМЕВАЕМЫХ, ВКЛЮЧАЯ ГАРАНТИИ ТОВАРНОЙ 
echo ПРИГОДНОСТИ, СООТВЕТСТВИЯ ПО ЕГО КОНКРЕТНОМУ НАЗНАЧЕНИЮ И ОТСУТСТВИЯ 
echo НАРУШЕНИЙ, НО НЕ ОГРАНИЧИВАЯСЬ ИМИ. НИ В КАКОМ СЛУЧАЕ АВТОРЫ ИЛИ 
echo ПРАВООБЛАДАТЕЛИ НЕ НЕСУТ ОТВЕТСТВЕННОСТИ ПО КАКИМ-ЛИБО ИСКАМ, ЗА УЩЕРБ 
echo ИЛИ ПО ИНЫМ ТРЕБОВАНИЯМ, В ТОМ ЧИСЛЕ, ПРИ ДЕЙСТВИИ КОНТРАКТА, ДЕЛИКТЕ ИЛИ 
echo ИНОЙ СИТУАЦИИ, ВОЗНИКШИМ ИЗ-ЗА ИСПОЛЬЗОВАНИЯ ПРОГРАММНОГО ОБЕСПЕЧЕНИЯ ИЛИ 
echo ИНЫХ ДЕЙСТВИЙ С ПРОГРАММНЫМ ОБЕСПЕЧЕНИЕМ.  АВТОР НЕ НЕСЕТ ОТВЕСТВЕННОСТИ 
echo ЗА ОКИРПИЧЕННЫЕ СМАРТФОНЫ и Т.д.
echo.
echo  [1] - Согласен
echo.
echo  [2] - Отказаться
echo.
set /P Eula="Выберите действие: "
if %Eula%==1 goto EulaAccept
if %Eula%==2 goto exit
goto :eula


:EulaAccept
echo KEK > %cd%\temp\EulaAgree.OP5Tools
goto :menu

:exit
exit

:menu
color F0
cls
title OP5Tools
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo  Главное меню:
echo.
echo  [1] - Загрузить и установить драйвера      [6] - Создать/Восстановить бэкап
echo.
echo  [2] - Операции с загрузчиком               [7] - Установить APK
echo.
echo  [3] - Операции с Recovery                  [8] - Другое
echo.
echo  [4] - Операции с прошивкой                 [9] - О программе
echo.
echo  [5] - Перезагрузится в ...
echo.
set /P option="Выберите действие: "
if %option%==1 goto drivers
if %option%==2 goto bootoption
if %option%==3 goto recoveryopt
if %option%==4 goto firmwareopt
if %option%==5 goto rebootto
if %option%==6 goto adbbackup
if %option%==7 goto apkinstall
if %option%==8 goto menu
if %option%==9 goto aboutinfo
goto :menu


:aboutinfo
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo  О программе:
echo.
echo  OP5Tools
echo  Нашкодил Алексей Лис (Dr.Leo6565)
echo  для 4pda.ru
echo  VK: https://vk.com/drleo2001
echo  4PDA: https://4pda.ru/forum/index.php?showuser=5144357
echo.
echo.
echo  v1.0alpha
echo.
echo [0] - Меню
echo.
set /P about="Выберите действие: "
if %about%==0 goto menu
goto :menu

:adbbackup
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo  Что делаем?
echo.
echo.
echo  [1] - Восстанавливаем из резервной копии (%CD%\backup\OP5Tools.backup)
echo.
echo  [2] - Сохраняем файлы внутренней и внешней карты памяти
echo.
echo  [3] - Сохраняем все установленные приложения
echo.
echo  [4] - Меню
echo.
set /p backup="Выберите действие: "
if /i %backup%==1 goto adbbackuprestore
if /i %backup%==2 goto adbbackupsd
if /i %backup%==3 goto adbbackupall
if /i %backup%==4 goto menu
goto :adbbackup
:apkinstall
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo Установка APK
echo  ---------------------------------------------------------
echo  Перетащите APK в это окно и нажмите Enter
echo  ---------------------------------------------------------
set /P apklink="Перетащите файл:"
if /i %apklink%== %CD%\adb\adb install %apklink% 
echo  Успешно
echo.
goto :menu
:adbbackuprestore
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Восстановление из (%CD%\backup\OP5Tools.backup)
echo  ---------------------------------------------------------
echo  Разблокируйте свое устройство и следуйте инструкциям
echo  на вашем экране
echo  ---------------------------------------------------------
%CD%\adb\adb restore %CD%\backup\OP5Tools.backup
echo  Операция завершена
pause
goto :menu


:adbbackupsd
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Бэкап приложений
echo  ---------------------------------------------------------
echo  Разблокируйте свое устройство и следуйте инструкциям
echo  на вашем экране
echo  ---------------------------------------------------------
%CD%\adb\adb backup -shared -f %CD%\backup\OP5Tools.backup
echo  Операция завершена
pause
goto :menu

:adbbackupall
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Бэкап Внутренней и внешней памяти
echo  ---------------------------------------------------------
echo  Разблокируйте свое устройство и следуйте инструкциям
echo  на вашем экране
echo  ---------------------------------------------------------
%CD%\adb\adb backup -all -f %CD%\backup\OP5Tools.backup
echo  Операция завершена
pause
goto :menu



:rebootto
cls
title OP5Tools
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Перезагрузится в:
echo.
echo  [1] - Qualcomm Dloader
echo.
echo  [2] - Bootloader
echo.
echo  [3] - Recovery
echo.
echo  [4] - Меню
echo.
set /P rebootto="Выберите действие: "
if %rebootto%==1 goto rebqdload
if %rebootto%==2 goto rebbootload
if %rebootto%==3 goto rebrecovery
if %rebootto%==4 goto menu
goto :rebootto

:rebqdload
cls
%cd%\adb\adb reboot edl
goto :menu

:rebbootload
cls
%cd%\adb\adb reboot bootloader
goto :menu

:rebrecovery
cls
%cd%\adb\adb reboot recovery
goto :menu



:firmwareopt
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo  Операции с прошивкой
echo.
echo  [1] - Сброс настроек
echo.
echo  [2] - Меню
echo.
set /P firmware1="Выберите действие: "
if %firmware1%==1 goto formatdata
if %firmware1%==2 goto menu
goto :firmwareopt

:formatdata
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Сброс настроек
echo.
echo  Нажатие любой кнопки приведет к полной очистке!
echo  Закройте окно если не хотите.
echo.
pause
pause
echo ------------------------------------------
%cd%\adb\adb reboot bootloader
%cd%\adb\fastboot erase userdata
%cd%\adb\fastboot reboot
echo ------------------------------------------
echo  Операция завершена
goto :firmwareopt


:recoveryopt
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Операции с Recovery
echo.
echo  [1] - Установить свое рекавери (/recovery/recovery.img)
echo.
echo  [2] - Установить TWRP codeworkx (корректно работает на 8.1) 
echo.
echo  [3] - Меню
echo.
set /P recovery1="Выберите действие: "
if %recovery1%==1 goto installrecovery
if %recovery1%==2 goto twrpofficial
if %recovery1%==3 goto menu
goto :recoveryopt

:installrecovery
cls
title OP5Tools
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Установка Recovery.img
echo.
if not exist %cd%\recovery\recovery.img (
echo  Файл recovery.img не найден!
echo  Отмена операции..
pause
goto recoveryopt
)
pause
echo  ------------------------------------------------
%cd%\adb\adb reboot bootloader
%cd%\adb\fastboot flash recovery %cd%\recovery\recovery.img
echo  ------------------------------------------------
echo  Операция завершена.
goto :menu

:twrpofficial
cls
del %cd%\recovery\recovery.img /Q /S
%cd%\tools\wget -nc --no-check-certificate "https://drive.google.com/uc?export=download&id=1w4TSa6Mqc_7GMzfFMGvZ_aBdBbmey1QH" -O %cd%\recovery\recovery.img
goto :installrecovery




:bootoption
cls
echo.
echo  Операции с загрузчиком:
echo.
echo  [1] - Проверить статус загрузчика
echo.
echo  [2] - Разблокировать загрузчик
echo.
echo  [3] - Закрыть загрузчик (!)
echo  только для стоковых прошивок без модификаций в системе
echo.
echo  [4] - Меню
echo.
set /P bootoption="Выберите действие: "
if %bootoption%==1 goto bootloadergetstatus
if %bootoption%==2 goto bootloaderunlock
if %bootoption%==3 goto bootloaderlock
if %bootoption%==4 goto menu
goto :bootloaderoption
pause

:bootloadergetstatus
cls
%cd%\adb\adb reboot bootloader
echo.
echo ------------------------------------------------------------------
%cd%\adb\fastboot oem device-info
echo ------------------------------------------------------------------
echo.
echo  Если Вы видите строку "Device unlocked: true"
echo  значит загрузчик разблокирован
echo.
echo  Если Вы видите строку "Device critical unlocked: true"
echo  значит прошивка загрузчика разрешена
pause
goto :bootoption

:bootloaderunlock
cls
%cd%\adb\adb reboot bootloader
echo.
echo ------------------------------------------------------------------
echo  Следуйте инструкциям на экране вашего устройства
echo ------------------------------------------------------------------
echo.
%cd%\adb\fastboot oem unlock-go
pause
goto :bootoption

:bootloaderlock
cls
cls
color F4
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Блокировка загрузчика
echo.
echo.
echo  [!] В КАКИХ СЛУЧАЯХ МОЖНО ЗАКРЫТЬ ЗАГРУЗЧИК?
echo  Для закрытие загрузчика, на смартфоне должна быть установлена заводская 
echo  стоковая прошивка без каких либо изменений в системе, ядре, рекавери 
echo  и т.д.!
echo.
echo  [!] ЧТО ПРОИЗОЙДЕТ ЕСЛИ ЗАКРЫТЬ ЗАГРУЗЧИК С ИЗМЕНЕНИЯМИ В СИСТЕМЕ ИЛИ
echo  КАСТОМНОЙ ПРОШИВКОЙ?
echo  Ваше устройство не сможет запустится. По сути вы получите обычный кирпич. 
echo.
echo  Если смартфон соотвествует требованиям, вы можете закрыть загрузчик.
echo.
echo  [1] - Продолжить закрытие загрузчика
echo.
echo  [2] - Отмена
echo.
set /P blockboot="Выберите действие: "
if %blockboot%==1 goto bootlockcont
if %blockboot%==2 goto menu
goto :menu

:bootlockcont
cls
color F0
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Блокировка загрузчика
echo.
%cd%\adb\adb reboot bootloader
ping -n 4 localhost > NULL
echo.
echo ---------------------------------------------------------------
echo  Следуйте инструкциям на экране вашего смартфона
echo  Используйте клавиши громкости для переключения вариантов
echo  Клавишу Power для принятия варианта
echo ---------------------------------------------------------------
echo.
%cd%\adb\fastboot oem lock-go
ping -n 6 localhost > NULL
goto :menu



:drivers
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Главное меню - Скачивание/Установка драйверов
echo.
echo  [Внимание] Отключите проверку цифровых подписей и запустите от Админа
echo.
echo  [1] - Скачать и установить драйвера.
echo.
echo  [2] - Отключить проверку подпискей (Потребуется перезагрузка и Права Админа)
echo.
echo  [3] - Включить проверку подпискей (Потребуется перезагрузка и Права Админа)
echo.
echo  [0] - Выход
echo.
set /p bootzip="Выберите: "
if /i %bootzip%==1 goto driversdowninstall
if /i %bootzip%==2 goto driverCheckOff
if /i %bootzip%==3 goto driverCheckOn
if /i %bootzip%==0 goto menu
goto :menu

:driversdowninstall
cls
echo.
echo  Dr.Leo6565                                            OP5Tools
echo.
echo                                                       v1.0alpha
echo.
echo  Главное меню - Скачивание/Установка драйверов
echo.
echo.
if exist %cd%\drivers (
echo  Содержимое папки drivers будет очищено.
echo  После скачивания файла драйвера откроется программа установки. Вы знаете что делать.
echo.
pause
del %cd%\drivers /Q /S
)
md %cd%\drivers
%cd%\tools\wget -nc --no-check-certificate "https://drive.google.com/uc?export=download&id=1yB97Py2_DGJYguJz-uqCpllIZiAlM---" -O %CD%\drivers\UniversalAdbDriverSetup.msi
cls
echo.
msiexec /i %CD%\drivers\UniversalAdbDriverSetup.msi  /qb
ping -n 3 localhost > NULL
goto :menu

:driverCheckOff
cls
echo.
echo Проверка подписи драйверов будет отключена
bcdedit.exe -set loadoptions DISABLE_INTEGRITY_CHECKS
bcdedit.exe -set TESTSIGNING ON
echo Операция выполнена. Требуется перезагрузка
ping -n 6 localhost > NULL
goto :menu

:driverCheckOn
cls
echo.
echo Проверка подписи драйверов будет включена
bcdedit.exe -set TESTSIGNING OFF
bcdedit.exe /set loadoptions ENABLE_INTEGRITY_CHECKS
echo Операция выполнена. Требуется перезагрузка
ping -n 6 localhost > NULL
goto :menu

