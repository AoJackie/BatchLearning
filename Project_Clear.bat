@echo off
echo -----------------------------------------------------
echo ----------------- һ��������� ----------------------
echo --ɾ�������ļ��������м��ļ���������Hex���к���ļ�--

rem ������������м��ļ�
cd /d ".\Release"
for /D %%i in (*) do (
    if not "%%i"=="Output" (
        rd /s /q "%%i"
        mkdir "%%i"
    )
)
echo ������������м��ļ��ɹ���
rem ����������ɶ�̬���ļ�
cd /d "..\Project\LinkLibrary"
for %%i in (*) do (
    if not "%%i"=="R_FCL_RH850_T01_GHS_Rxx.a" (
        if not "%%i"=="R_FDL_RH850_T01a_GHS_Rxx.a" (
            del "%%i"
        )
    )
)
echo ����������ɶ�̬���ļ��ɹ���
pause