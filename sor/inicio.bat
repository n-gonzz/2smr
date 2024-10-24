@echo off
REM Ficheiro de inicio de sesion

REM Mapeamos comun para todo usuario que inicie sesion
net use R: \\dserver00\comun /persistent:no

REM Miramos se o usuario que inicia sesion e un profesor
REM Se é un profesor mapeamos alumnos a S:
   net user /domain %username% | findstr /C:"g-profe" && (
   net use S: \\dserver00\usuarios\persoais\alumnos /persistent:no
   )


REM Miramos se o usuario que inicia sesion e un alumno
REM Se e un alumno abrimos un aviso (Como facer dobre clic sobre o ficheiro: st$
   net user /domain %username% | findstr /C:"g-alum" && (
   start \\dserver00\netlogon\avisos\aviso_alumnos.html
   )
