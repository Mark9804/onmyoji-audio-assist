::设置活动代码页为UFT-8
@echo off
chcp 65001

::对于fsb\当中以.fsb为拓展名的文件进行提取
for /f %%i in ('dir /b fsb\*.fsb') do fmodex_extractor.exe fsb\%%i

::判断是否存在wav文件夹，若存在则执行清理，不存在则创建后清理
if exist wav (
	goto clean
	)
	mkdir wav
	goto clean
::将提取出的wav文件移动至wav文件夹
:clean
	move /Y *.wav wav
	::del /S /Q fsb\*.fsb
	echo 操作完成！文件已保存wav文件夹中
	pause