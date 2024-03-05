@echo off

rem 1. Crear un archivo de texto llamado mytext.txt con la cadena "Hola Mundo"
echo Hola Mundo > mytext.txt

rem 2. Desplegar el contenido del archivo mytext.txt en la terminal
type mytext.txt

rem 3. Crear un subdirectorio llamado backup
mkdir backup

rem 4. Copiar el archivo mytext.txt al subdirectorio backup
copy mytext.txt backup

rem 5. Listar el contenido del subdirectorio backup
dir backup

rem 6. Eliminar el archivo mytext.txt del subdirectorio backup
del backup\mytext.txt

rem 7. Eliminar el subdirectorio backup
rmdir backup /s /q

REM Pausa para que el usuario pueda ver la salida
pause > nul
