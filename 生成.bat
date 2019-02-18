@echo off
::设置活动代码页为UTF-8
chcp 65001

::从yys默认安装路径当中提取*.fsb
if not exist fsb (
	mkdir fsb
	)
copy "C:\Program Files (x86)\Onmyoji\res\sound\output\*.fsb" fsb\*.fsb

::对于fsb\当中以.fsb为拓展名的文件进行提取
for /f %%i in ('dir /b fsb\*.fsb') do fmodex_extractor.exe fsb\%%i

::判断是否存在wav文件夹，若存在则执行清理，不存在则创建后清理
if not exist wav (
	mkdir wav
	)
	goto clean
::将提取出的wav文件移动至wav文件夹

:clean
	::含有[0-9]*-[0-9]*为剧情BGM，但是其中乱入了一个fx-zhujue01_skill1004_3.wav
	::这里我真的想吐槽一下网易的音频命名
	::有拼音有罗马音还有缩写
	::命名不规范调用两行泪知道吗
	mkdir wav\story_bgm
		move /y *-*.wav wav\story_bgm\
		move /y wav\story_bgm\fx-zhujue*.wav wav\
    ::48*应该是剧情里的sfx
    mkdir wav\story_sfx
		move /y 48*.wav wav\story_sfx\
    ::安倍晴明的语音文件名是AbenoSeimei*
    mkdir wav\AbenoSeimei安倍晴明
        move /y AbenoSeimei*.wav wav\AbenoSeimei安倍晴明\
	move /Y *.wav wav\
	del /S /Q fsb\*.fsb
	echo 操作完成！文件已保存在wav文件夹中
	pause