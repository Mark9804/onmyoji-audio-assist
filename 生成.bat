@echo off
::设置活动代码页为UTF-8
chcp 65001

::从yys默认安装路径当中提取*.fsb
if not exist fsb (
	mkdir fsb
	)
copy "C:\Program Files (x86)\Onmyoji\res\sound\output\*.fsb" fsb\*.fsb
copy "C:\Program Files (x86)\Onmyoji\Documents\res\sound\output\*.fsb" fsb\*.fsb

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
	::我不管你们怎么样反正我是两行泪了
	call :fileArchiver *-*.wav,story_bgm
	move /y wav\story_bgm\fx-zhujue*.wav wav\
	call :fileArchiver dancing_*.wav,story_bgm
	call :fileArchiver ep15_fumo*.wav,story_bgm
	call :fileArchiver ep15_fumo2*.wav,story_bgm
	call :fileArchiver ep15_naoyang2.wav,story_bgm
	::第一章
	call :fileArchiver EP01_*.wav,story\ep1
	::第11章
	call :fileArchiver EP11_*.wav,story\ep11

	::48*应该是剧情里的sfx
	call :fileArchiver 48*.wav,story_sfx
	call :fileArchiver ep27_01.wav,story_sfx\ep27
	call :fileArchiver ep27_02.wav,story_sfx\ep27
	call :fileArchiver ep28_cinema_sfx*.wav,story_sfx\ep28
	::其他sfx
	call :fileArchiver battle*.wav,sfx
	call :fileArchiver blast.wav,sfx
	call :fileArchiver chime*.wav,sfx
	call :fileArchiver choice_color.wav,sfx
	call :fileArchiver click*.wav.sfx
	call :fileArchiver cobin_*.wav,sfx
	call :fileArchiver coin*.wav,sfx
	call :fileArchiver crack.wav,sfx
	call :fileArchiver cute*.wav,sfx
	call :fileArchiver daoshu_*.wav,sfx
	call :fileArchiver door_*.wav,sfx
	call :fileArchiver eventshow_*.wav,sfx
	call :fileArchiver explo*.wav,sfx
	call :fileArchiver feixiang*.wav,sfx
	::烟花为什么有技能？记下了
	call :fileArchiver firework*.wav,sfx
	call :fileArchiver fly_ball*.wav,sfx
	call :fileArchiver foot_click.wav,sfx

	::安倍晴明的语音文件名是AbenoSeimei*.wav,还有其他的之后再找找
	call :fileArchiver AbenoSeimei*.wav,AbenoSeimei安倍晴明
	::为什么源博雅会叫daoman??
	call :fileArchiver daoman*.wav,MinamotonoHiromasa源博雅
	call :fileArchiver axiang*.wav,AXiang阿香
	call :fileArchiver babaibiqiuni*.wav,BaBaiBiQiuNi八百比丘尼
	::八岐大ser，skr狼人
	call :fileArchiver bachidaser*.wav,BaQiDaShe八岐大蛇
	call :fileArchiver bachidashe*.wav,BaQiDaShe八岐大蛇
	::bailamg是白狼吧
	call :fileArchiver bailamg*.wav,BaiLang白狼
	call :fileArchiver baimugui*.wav,BaiMuGui百目鬼
	call :fileArchiver *baitongzi*.wav,BaiTongZi白童子
	call :fileArchiver baiwuchang*.wav,BaiWuChang白无常
	call :fileArchiver baizangzhu*.wav,BaiZangZhu白藏主
	call :fileArchiver bakekujira*.wav,HuaJing化鲸
	::般若理论上叫做bōrě，决定采用修正后的命名
	call :fileArchiver banruo*.wav,BoRe般若
	call :fileArchiver bianhua*.wav,BiAnHua彼岸花
	call :fileArchiver bingyong*.wav,BingYong兵俑
	::bnh*是哪个式神啊我听不出来也找不到对应名字
	::chhinmao感觉像是妖琴师
	call :fileArchiver chhinmao*.wav,YaoQinShi妖琴师
	call :fileArchiver chishe*.wav,ChiShe赤舌
	::赤天邪鬼是个什么鬼
	call :fileArchiver chitianxiegui*.wav,TianXieGuiChi天邪鬼赤
	call :fileArchiver chongshi*.wav,ChongShi虫师
	call :fileArchiver choushizhinv*.wav,ChouShiZhiNv丑时之女
	call :fileArchiver cimutongzi*.wav,CiMuTongZi茨木童子
	::......
	call :fileArchiver cmtz*.wav,CiMuTongZi茨木童子
	call :fileArchiver daomuxiaogui*.wav,DaoMuXiaoGui盗墓小鬼
	::dasheshen又是啥，语音里面听到一个源氏，是大江山吗
	call :fileArchiver datiangou_m*.wav,DaTianGou大天狗
	::......
	call :fileArchiver denglonggui*.wav,DengLongGui灯笼鬼
	call :fileArchiver dlg*.wav,DengLongGui灯笼鬼
	::达摩分不清种类（也许它们的语音真的一样），统一归为达摩
	call :fileArchiver dmao*.wav,DaMo达摩
	::dtg也没听出来是谁
	call :fileArchiver duyanxiaoseng*.wav,DuYanXiaoSeng独眼小僧
	call :fileArchiver eg_born.wav,EGui恶鬼
	call :fileArchiver egui*.wav,EGui恶鬼
	call :fileArchiver erkounv*.wav,ErKouNv二口女
	call :fileArchiver fenghuanghuo*.wav,FengHuangHuo凤凰火
	call :fileArchiver fengqilin*.wav,FengQiLin风麒麟
	::呱的部分，青蛙是frog不是flog啊
	call :fileArchiver flog*.wav,Frog呱
	call :fileArchiver Frog呱\flog_cimutongzi*.wav,Frog呱\CiMuGua茨木呱
	call :fileArchiver Frog呱\flog_datiangou*.wav,Frog呱\DaTianGouGua大天狗呱
	call :fileArchiver Frog呱\flog_hoaniaowa*.wav,Frog呱\HuaNiaoGua花鸟呱
	call :fileArchiver Frog呱\flog_huang*.wav,Frog呱\HuangGua荒呱
	call :fileArchiver Frog呱\flog_huangchuanzhizhu*.wav,Frog呱\HuangChuanZhiZhuGua荒川之主呱
	call :fileArchiver Frog呱\flog_huiyeji*.wav,Frog呱\HuiYeJiGua辉夜姬呱
	call :fileArchiver Frog呱\flog_jiutuntongzi*.wav,Frog呱\JiuTunTongZiGua酒吞童子呱
	call :fileArchiver Frog呱\flog_liangmianfo*.wav,Frog呱\LiangMianFoGua两面佛呱
	call :fileArchiver Frog呱\flog_qingxingdeng*.wav,Frog呱\QingXingDengGua青行灯呱
	call :fileArchiver Frog呱\flog_yanmo*.wav,Frog呱\YanMoGua阎魔呱
	call :fileArchiver Frog呱\flog_yimolian*.wav,Frog呱\YiMuLianGua一目连呱

	::青蛙瓷器frog ceramics，可以
	call :fileArchiver frog_c*.wav,QingWaCiQi青蛙瓷器
	call :fileArchiver fusen*.wav,HuiBiShou惠比寿
	


	move /Y *.wav wav\
	del /S /Q fsb\*.fsb
	echo 操作完成！文件已保存在wav文件夹中
	pause
	
:fileArchiver
::新建文件夹并且移动指定文件的函数，%~1代表第一个参数，以此类推
	if not exist wav\%~2 (
		mkdir wav\%~2
		)
	move /y %~1 wav\%~2\
