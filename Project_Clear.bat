@echo off
echo -----------------------------------------------------
echo ----------------- 一键清除工具 ----------------------
echo --删除编译文件带来的中间文件，仅保留Hex裁切后的文件--

rem 清除编译生成中间文件
cd /d ".\Release"
for /D %%i in (*) do (
    if not "%%i"=="Output" (
        rd /s /q "%%i"
        mkdir "%%i"
    )
)
echo 清除编译生成中间文件成功！
rem 清除编译生成动态库文件
cd /d "..\Project\LinkLibrary"
for %%i in (*) do (
    if not "%%i"=="R_FCL_RH850_T01_GHS_Rxx.a" (
        if not "%%i"=="R_FDL_RH850_T01a_GHS_Rxx.a" (
            del "%%i"
        )
    )
)
echo 清除编译生成动态库文件成功！
pause