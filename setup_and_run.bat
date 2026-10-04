@echo off
setlocal EnableDelayedExpansion

:: 1. Auto-Elevate ke Administrator (Wajib untuk edit hosts & file XAMPP)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Membutuhkan hak akses Administrator...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Pastikan bekerja di folder script berada
cd /d "%~dp0"

echo ======================================================
echo          CI4 AUTO SETUP & LAUNCHER WIZARD
echo ======================================================
echo.

:: 2. Setup File .env
if not exist ".env" (
    if exist "env" (
        echo [INFO] Menyalin file 'env' menjadi '.env'...
        copy env .env >nul
    ) else (
        echo [WARN] File 'env' bawaan tidak ditemukan!
    )
) else (
    echo [INFO] File .env sudah ada.
)
echo.

:: 3. Pemilihan Database
set "default_db=db_testsub"
echo [SETUP DATABASE]
echo Default database template: %default_db%
set /p db_choice="Gunakan database sendiri? (y/n, default n): "

if /i "%db_choice%"=="y" (
    set /p custom_db="Masukkan nama database baru: "
    if not "!custom_db!"=="" (
        echo [INFO] Memperbarui database ke: !custom_db!...
        powershell -Command "if (Test-Path .env) { (Get-Content .env) -replace '#?\s*database\.default\.database\s*=.*', 'database.default.database = !custom_db!' | Set-Content .env }"
        powershell -Command "if (Test-Path app/Config/Database.php) { (Get-Content app/Config/Database.php) -replace '''database''\s*=>\s*''.*?''', '''database'' => ''!custom_db!''' | Set-Content app/Config/Database.php }"
    )
) else (
    echo [INFO] Menggunakan database default (%default_db%).
)
echo.

:: 4. Jalankan Service XAMPP (Apache & MySQL)
echo [XAMPP] Memastikan Apache & MySQL berjalan...
if exist "C:\xampp\xampp_start.exe" (
    start "" /min "C:\xampp\xampp_start.exe"
) else (
    echo [WARN] Path C:\xampp\xampp_start.exe tidak ditemukan. Pastikan XAMPP terinstall di C:\xampp.
)
echo.

:: 5. Opsi Jalankan (Spark Serve vs VirtualHost XAMPP)
echo [METODE MENJALANKAN]
echo [1] spark serve (localhost:8080)
echo [2] VirtualHost Apache / Domain Lokal (ex: testsub)
set /p run_mode="Pilih metode (1/2, default 1): "

if "%run_mode%"=="2" (
    set /p proj_name="Masukkan nama domain/project lokal (ex: testsub): "
    if "!proj_name!"=="" set "proj_name=testsub"

    set "hosts=C:\Windows\System32\drivers\etc\hosts"
    set "vhosts=C:\xampp\apache\conf\extra\httpd-vhosts.conf"

    echo [INFO] Menambahkan domain ke hosts file...
    findstr /C:"127.0.0.1 !proj_name!" "!hosts!" >nul 2>&1
    if !errorlevel! neq 0 (
        echo 127.0.0.1 !proj_name! >> "!hosts!"
    )

    echo [INFO] Menambahkan VirtualHost ke Apache...
    findstr /C:"ServerName !proj_name!" "!vhosts!" >nul 2>&1
    if !errorlevel! neq 0 (
        (
            echo.
            echo ^<VirtualHost *:80^>
            echo     DocumentRoot "C:/xampp/htdocs/!proj_name!/public"
            echo     ServerName !proj_name!
            echo     ^<Directory "C:/xampp/htdocs/!proj_name!/public"^>
            echo         AllowOverride All
            echo         Require all granted
            echo     ^</Directory^>
            echo ^</VirtualHost^>
        ) >> "!vhosts!"
    )

    :: Update baseURL di .env
    powershell -Command "if (Test-Path .env) { (Get-Content .env) -replace '#?\s*app\.baseURL\s*=.*', 'app.baseURL = ''http://!proj_name!/''' | Set-Content .env }"

    :: Restart Apache agar VirtualHost aktif
    echo [INFO] Merestart Apache...
    C:\xampp\apache\bin\httpd.exe -k restart >nul 2>&1

    echo.
    echo ======================================================
    echo Aplikasi siap di: http://!proj_name!
    echo ======================================================
    start http://!proj_name!
    pause
) else (
    :: Update baseURL di .env ke localhost:8080
    powershell -Command "if (Test-Path .env) { (Get-Content .env) -replace '#?\s*app\.baseURL\s*=.*', 'app.baseURL = ''http://localhost:8080/''' | Set-Content .env }"

    echo.
    echo ======================================================
    echo Membuka browser dan menjalankan 'php spark serve'...
    echo ======================================================
    start http://localhost:8080
    php spark serve
)
