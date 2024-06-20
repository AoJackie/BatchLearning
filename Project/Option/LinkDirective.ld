/*************************************************************************************************************
	Copyright (c) 2023—2024 Nanjing InitUp Technology Co.Ltd. All rights reserved.
	南京起越智控技术有限公司版权所有
	------------------------------------------------------------------------------------------------------
	产品名称	：	通用电机控制平台
	
	主控MCU		：	RH850P1M
	------------------------------------------------------------------------------------------------------
	功能说明	：	工程存储空间分配
	------------------------------------------------------------------------------------------------------
	参考		：	
	
*************************************************************************************************************/


/*============================================================================================================
	更新履历：
	------------------------------------------------------------------------------------------------------
	Rev00	Version001	2023/01/11	 @zhoutao   地址初次分配
============================================================================================================*/

/*==========================================================================================================*/
/*  内存布局定义																							*/
/*==========================================================================================================*/
MEMORY
{
	/*======================================================================================================*/
	/*	ROM区域 (1MByte)																						*/
	/*======================================================================================================*/
	/*--- SCONST(ZDA) START --------------------------------------------------------------------------------*/
	/*--- BOOT引导区-----------------------------------------------------------------------------------------*/
	/*--- Vector区域,IBL区域(16KByte) ----------------------------------------------------------------------*/
	iVECT					: ORIGIN = 0x00000000, LENGTH = 0x00800	/* Vector中断向量表					   */
	IBL_TEXT				: ORIGIN = 0x00000800, LENGTH = 0x03700	/* 初始引导加载程序 TEXT区域				*/
	IBL_CONST				: ORIGIN = 0x00003F00, LENGTH = 0x000FC	/* 初始引导加载程序 CONST区域				*/
	IBL_SUM_CONST			: ORIGIN = 0x00003FFC, LENGTH = 0x00004	/* 初始引导加载程序 SUM値					*/

	/*--- CRP区域(16KByte) ---------------------------------------------------------------------------------*/
	CRP_TEXT				: ORIGIN = 0x00004000, LENGTH = 0x00F00	/* XCP校准协议 刷新区 TEXT区域		*/
	CRP_CONST				: ORIGIN = 0x00004F00, LENGTH = 0x00100	/* XCP校准协议 CONST区域			*/
	CRP_LIB_CONST			: ORIGIN = 0x00005000, LENGTH = 0x02FFC	/* XCP校准协议 刷新区 ｶｰﾈﾙCONST区域(RAM処理部)*/
	CRP_SUM_CONST			: ORIGIN = 0x00007FFC, LENGTH = 0x00004	/* XCP校准协议 SUM値				*/

	/*--- HRP区域(32KByte) ---------------------------------------------------------------------------------*/
	HRP_TEXT				: ORIGIN = 0x00008000, LENGTH = 0x07000	/* UDS刷新程序 TEXT区域						*/
	HRP_CMN_CONST			: ORIGIN = 0x0000F000, LENGTH = 0x00DFC	/* UDS刷新程序 APP和BOOT共享数据区域		*/
	HRP_CONST				: ORIGIN = 0x0000FDFC, LENGTH = 0x00200	/* UDS刷新程序 CONST区域					*/
	HRP_SUM_CONST			: ORIGIN = 0x0000FFFC, LENGTH = 0x00004	/* UDS刷新程序 SUM和						*/
	/*--- SCONST(ZDA) END ----------------------------------------------------------------------------------*/


	/*--- 标定参数区域(304KByte)--------------------------------------------------------*/
	/* MAP区域 校准 MAP01		*/
	SWC_MAP_TEXT			: ORIGIN = 0x00010000, LENGTH = 0x0FFFF
	NO_USE_DEFAULT_ROM1		: ORIGIN = 0x00020000, LENGTH = 0x38000	/* RESERVE								*/


	/*--- 厂商参数区域 (32KByte)-------------------------------------------------------------------------*/
	TIER1_MAP_START			: ORIGIN = 0x00058000, LENGTH = 0x00004	/* start flag							*/
	TIER1_MAP_1				: ORIGIN = 0x00058004, LENGTH = 0x00100	/* MAP区域 Fixed MAP1					*/
	TIER1_MAP_2				: ORIGIN = 0x00058104, LENGTH = 0x00100	/* MAP区域 Fixed MAP2					*/
	TIER1_MAP_3				: ORIGIN = 0x00058204, LENGTH = 0x00100	/* MAP区域 Fixed MAP3					*/
	TIER1_MAP_4				: ORIGIN = 0x00058304, LENGTH = 0x00100	/* MAP区域 Fixed MAP4					*/
	RESERVE2				: ORIGIN = 0x00058404, LENGTH = 0x07AE8	/* RESERVE								*/
	TIER1_MAP_END			: ORIGIN = 0x0005FEEC, LENGTH = 0x00114	/* Map区域 Fixed Map情報				*/

	/*--- CONST区域 (64KByte)-------------------------------------------------------------------------------*/
	PRG_TOP_CONST			: ORIGIN = 0x00060000, LENGTH = 0x00040	/* PRG模块 顶部常量区域 				*/
	APL_INFO_CONST			: ORIGIN = 0x00060040, LENGTH = 0x00010	/* APL_INFO								*/
	CAL_DEBUG_CAN			: ORIGIN = 0x00060050, LENGTH = 0x00800	/* MAP区域 开发CAN					*/
	RESERVE1				: ORIGIN = 0x00060850, LENGTH = 0x0F7AC	/* RESERVE								*/
	PRG_SUM_CONST_1			: ORIGIN = 0x0006FFFC, LENGTH = 0x00004	/* PRG模块1 总和值						*/

	/*--- 软件常量定义区域 (64KByte) --------------------------------------------------------------------------*/
	/*------------------------------------------------------------------------------------------------------*/
	/*	注意事项																							*/
	/*		应设置 Rosda start，以便在地图区域中不创建边界。								*/
	/*------------------------------------------------------------------------------------------------------*/
	ROSDA_START				: ORIGIN = 0x00070000, LENGTH = 0x00000	/* SDA START							*/
	BSW_CONST				: ORIGIN = 0x00070000, LENGTH = 0x04260	/* CONST区域 BSW 其他					*/
	BSW_INFO_CONST			: ORIGIN = 0x00074260, LENGTH = 0x000A0	/* CONST区域 BSW 软件信息					*/
	CFC_CONST				: ORIGIN = 0x00074300, LENGTH = 0x05400	/* CONST区域 常用函数					*/
	SWC_CV_CONST			: ORIGIN = 0x00079700, LENGTH = 0x00B00	/* CONST区域 SWC 配置设定区 				*/
	SWC_CV_INFO_CONST		: ORIGIN = 0x0007A200, LENGTH = 0x00070	/* CONST区域 SWC CONV软件信息				*/
	SWC_CONST				: ORIGIN = 0x0007A270, LENGTH = 0x00E10	/* CONST区域 SWC 其他					*/
	SWC_INFO_CONST			: ORIGIN = 0x0007B080, LENGTH = 0x00070	/* CONST区域 SWC 软件信息					*/
	SWC_CV_MAP_CONST		: ORIGIN = 0x0007B0F0, LENGTH = 0x01270	/* CONST区域 SWC 配置设定区（parameter）		*/
	CSTM_ASILD_RODATA		: ORIGIN = 0x0007C360, LENGTH = 0x01000	/* 客户 ASIL-D 定数区域					*/
	ROMPSEC					: ORIGIN = 0x0007D360, LENGTH = 0x01430	/* CONST区域 具有默认值的 RAM 常量		*/
	NO_USE_DEFAULT_ROM2		: ORIGIN = 0x0007E790, LENGTH = 0x05870	/* RESERVE								*/
	ROSDA_END				: ORIGIN = 0x00084000, LENGTH = 0x00000	/* SDA(高速) END						*/

	/*--- 软件代码区域 (496KByte) -------------------------------------------------------------------------*/
	BSW_HDC_TEXT			: ORIGIN = 0x00084000, LENGTH = 0x0B800	/* TEXT区域 SWC 配置设定区				*/
	SWC_TEXT				: ORIGIN = 0x0008F800, LENGTH = 0x03468	/* TEXT区域 SWC							*/

	BSW_TEXT				: ORIGIN = 0x00092C68, LENGTH = 0x3A098	/* TEXT区域 BSW 其他					*/

	/*------------------------------------------------------------------------------------------------------*/
	/*	特記事項																							*/
	/*		- 如果虚函数的位置发生变化，则需要重写整个区域 							*/
	/* 如果更改 -SYSCALL 的 VF 函数位置，则中断驱动程序的 SYSCALL 表条目值和 		*/
	/* 还应检查启动时 SCBP 寄存器的初始值设置。													*/
	/*------------------------------------------------------------------------------------------------------*/
	BSW_VF_TEXT				: ORIGIN = 0x000CCD00, LENGTH = 0x006FC	/* TEXT区域 中断 VF					*/
	PRG_SUM_CONST_2			: ORIGIN = 0x000CD3FC, LENGTH = 0x00004	/* PRG模块2 总和值						*/
	SWC_CV_TEXT				: ORIGIN = 0x000CD400, LENGTH = 0x32B00	/* RESERVE								*/
	PRG_END_CONST			: ORIGIN = 0x000FFF00, LENGTH = 0x00100	/* PRG模块 最终CONST区域				*/


	/*======================================================================================================*/
	/*	RAM区域 (128KByte)																					*/
	/*======================================================================================================*/
	/*--- 堆区域(6KByte) ---------------------------------------------------------------------------------*/
	STACK_DATA				: ORIGIN = 0xFEBE0000, LENGTH = 0x01800

	/*--- 在线标定 Parameters区域(60KByte)																*/
	SDABASE					: ORIGIN = 0xFEBE1800, LENGTH = 0x00000	/* 使用 RAMSDA 的 GP 初始化的特殊部分*/
	CALIB_MAP_START			: ORIGIN = 0xFEBE1800, LENGTH = 0x00004	/* start flag							*/
	CALIB_MAP_DATA			: ORIGIN = 0xFEBE1804, LENGTH = 0x03EE8	/* Map数据(TAG_MPG_CALIB_PARAM)			*/
	CALIB_MAP_END			: ORIGIN = 0xFEBE56EC, LENGTH = 0x00114	/* Map information						*/
	FIXED_MAP				: ORIGIN = 0xFEBE5800, LENGTH = 0x00100	/* MAP区域 Fixed MAP					*/
	TUNING_INFO				: ORIGIN = 0xFEBE5900, LENGTH = 0x00010	/* 调谐信息区						*/
	NO_USE_DEFAULT_RAM				: ORIGIN = 0xFEBE5910, LENGTH = 0x0AEF0	/* RESERVE						*/

	/*--- BOOT模块 IBL,HRP区域(4.5KByte)-------------------------------------------------------------------*/
	/*------------------------------------------------------------------*/
	/*	* IBL 启动必须使用启动例程清除。						*/
	/*------------------------------------------------------------------*/
	IBL_STARTUP				: ORIGIN = 0xFEBF0800, LENGTH = 0x00010	/* 请勿更改此部分的起始位置。	*/
	IBL_DATA				: ORIGIN = 0xFEBF0810, LENGTH = 0x00140	/* 初始引导加载程序 DATA区域				*/
	BSW_CRY_DATA			: ORIGIN = 0xFEBF0950, LENGTH = 0x00020	/* BSW 残留数据区				*/
	SWC_CRY_DATA			: ORIGIN = 0xFEBF0970, LENGTH = 0x00090	/* SWC 残留数据区				*/
	HRP_DATA				: ORIGIN = 0xFEBF0A00, LENGTH = 0x01000	/* SBL预留 DATA区域				*/


	/*--- PRG模块(57.5KByte)-------------------------------------------------------------------------------*/
	/*--- NIDEC ASIL-D 默认值区域(13KByte)----------------------------------------------------------------*/
	SWC_CV_DATA				: ORIGIN = 0xFEBF1A00, LENGTH = 0x01000	/* SWC 配置设定区DATA区域					*/
	SWC_EPSC_TL_PARAM		: ORIGIN = 0xFEBF2A00, LENGTH = 0x01BD0	/* SWC 配置设定区DATA区域(EPSC TL PARAM用)*/
	SWC_DATA				: ORIGIN = 0xFEBF45D0, LENGTH = 0x00430	/* SWC 配置设定区DATA区域					*/
	BSW_DATA				: ORIGIN = 0xFEBF4A00, LENGTH = 0x00400	/* BSW 配置设定区DATA区域					*/

	/*--- NIDEC ASIL-D 无默认区域 (44KByte) ---------------------- -------------------------------------*/
	BSW_BSS					: ORIGIN = 0xFEBF4E00, LENGTH = 0x06900	/* BSW 其他DATA区域					*/
	CFC_BSS					: ORIGIN = 0xFEBFB700, LENGTH = 0x00010	/* 常用函数 其他DATA区域				*/
	SWC_CV_BSS				: ORIGIN = 0xFEBFB710, LENGTH = 0x03B00	/* SWC 配置设定区DATA区域					*/
	TUNE_CLB_BSS			: ORIGIN = 0xFEBFF210, LENGTH = 0x00014	/* 校准控制区					*/
	TUNE_BSS				: ORIGIN = 0xFEBFF224, LENGTH = 0x00500	/* 校准RAM区域					*/
	BSW_TUNE				: ORIGIN = 0xFEBFF724, LENGTH = 0x0030C	/* BSW ASIL-D 校准RAM区域		*/
	SWC_BSS					: ORIGIN = 0xFEBFFA30, LENGTH = 0x003D0	/* SWC 其他DATA区域					*/

	/*--- BOOT模块 CRP区域(0.5KByte)-----------------------------------------------------------------------*/
	CRP_BSS					: ORIGIN = 0xFEBFFE00, LENGTH = 0x00200	/* XCP 刷新功能 DATA区域				*/


}


/*==========================================================================================================*/
/*  部分定义																								*/
/*==========================================================================================================*/
SECTIONS
{
	/*======================================================================================================*/
	/*	ROM区域 (1MByte)																						*/
	/*======================================================================================================*/
	/*--- BOOT模块-----------------------------------------------------------------------------------------*/
	/*--- iVECT ---*/
	intvect_tbl.rozdata	align(4)	0x00000200	:>iVECT				/* 中断向量表					*/

	/*--- IBL_TEXT ---*/
	ibl_entry.text		align(4)	0x00000800	:>IBL_TEXT
	ibl.text			align(4)				:>.
	.R_FDL_Text			align(4)				:>.					/* 数据闪存库						*/
	/*------------------------------------------------------------------------------------------------------*/
	/*	特别说明： */
	/* 由于市场重现 （DiagOnCan） 不重写引导区域，因此 IBL 区域用于市场重现 （DiagOnCan） 			*/
	/* 分配驱动内核文本区域（以弥补市场重现中缺少的文本区域）。										*/
	/* * 如果要在所有领域重写市场复制品，则应修改设计。												*/
	/*------------------------------------------------------------------------------------------------------*/
	hrp_kernel.text		align(4)				:>.

	/*--- IBL_CONST ---*/
	ibl.rozdata			align(4)	0x00003F00	:>IBL_CONST
	.R_FDL_Const		align(4)				:>.					/* 数据闪存库						*/
	rprover.rozdata		align(4)	0x00003FC0	:>.					/* 重现版							*/

	/*--- IBL_SUM_CONST ---*/
	ibl_sum.rozdata		align(4)	0x00003FFC	:>IBL_SUM_CONST

	/*--- CRP_TEXT ---*/
	crp_start.text		align(4)	0x00004000	:>CRP_TEXT
	crp.text			align(4)				:>.
	/*------------------------------------------------------------------------------------------------------*/
	/*	特别说明： */
	/* 由于市场重现 （DiagOnCan） 不重写引导区域，因此校准重现 （XCP） 区域更改为市场重现 （DiagOnCan） 	*/
	/* 预留文本区域（以弥补市场复制的文本区域不足）。													*/
	/* * 如果要在所有领域重写市场复制品，则应修改设计。													*/
	/*------------------------------------------------------------------------------------------------------*/
	hrp_kernel2.text	align(4)				:>.

	/*--- CRP_CONST ---*/
	crp.rozdata			align(4)				:>CRP_CONST
	crp.rodata			align(4)				:>.

	/*--- CRP_LIB_CONST ---*/
	crp_lib.rozdata		align(4)				:>CRP_LIB_CONST

	/*--- CRP_SUM_CONST ---*/
	crp_sum.rozdata		align(4)				:>CRP_SUM_CONST

	/*--- HRP_TEXT ---*/
	hrp_start.text		align(4)	0x00008000	:>HRP_TEXT
	hrp.text			align(4)				:>.
	/*------------------------------------------------------------------------------------------------------*/
	/*	特别说明： */
	/* 对于在市场复现中使用数据闪存的型号，应适当设置数据闪存组件的截面布局。				*/
	/* * 由于此模型中未使用它，因此将其注释掉。												*/
	/*------------------------------------------------------------------------------------------------------*/
/*	hrp_fal.text		align(4)	0x0000B200	:>.	 */				/* 数据Flash 市场复制驱动因素			*/
/*	hrp_main_nvr.text	align(4)	0x0000B400	:>.	 */				/* 数据Flash 市场复制切入点		*/
/*	hrp_get_wrreq.text	align(4)	0x0000B600	:>.	 */				/* 数据Flash 市场复制切入点		*/
/*	hrp_set_wrreq.text	align(4)	0x0000B800	:>	 */				/* 数据Flash 市场复制切入点		*/
/*	hrp_get_wrerr.text	align(4)	0x0000BA00	:>.	 */				/* 数据Flash 市场复制切入点		*/

	/*--- HRP_CMN_CONST ***/
	hrp_cmn.rozdata		align(4)				:>HRP_CMN_CONST

	/*--- HRP_CONST ***/
	hrp.rozdata			align(4)				:>HRP_CONST

	/*--- HRP_SUM_CONST ***/
	hrp_sum.rozdata		align(4)				:>HRP_SUM_CONST


	/*--- CALIB_MAP_TEXT ---*/
	swc_map.text		align(4)				:>SWC_MAP_TEXT
	swc_map.rosdata		align(4)				:>.
	/*--- CAL_DEBUG_CAN ---*/
	cal_debug_can.rosdata		align(4)			:>CAL_DEBUG_CAN

	/*--- TIER1_MAP_START ---*/
	tier1_map_start.rosdata		align(4)		:>TIER1_MAP_START

	/*--- TIER1_MAP_1 ---*/
	tier1_map_1.rosdata			align(4)			:>TIER1_MAP_1

	/*--- TIER1_MAP_2 ---*/
	tier1_map_2.rosdata			align(4)			:>TIER1_MAP_2

	/*--- TIER1_MAP_3 ---*/
	tier1_map_3.rosdata			align(4)			:>TIER1_MAP_3

	/*--- TIER1_MAP_4 ---*/
	tier1_map_4.rosdata			align(4)			:>TIER1_MAP_4

	/*--- TIER1_MAP_END ---*/
	tier1_map_end.rosdata		align(4)		:>TIER1_MAP_END

	/*--- PRG模块------------------------------------------------------------------------------------------*/
	/*--- PRG_TOP_CONST ---*/
	rprover_f.rozdata	align(4)	0x00060000	:>PRG_TOP_CONST		/* ﾘﾌﾟﾛVer								*/
	romsw.rozdata		align(4)	0x00060004	:>.					/* ROMSW								*/
	/*------------------------------------------------------------------------------------------------------*/

	/*------------------------------------------------------------------------------------------------------*/
	syscall_table.rozdata align(4)	0x00060008	:>.					/* SYSCALL例外表					*/
	debugromsw.rozdata	align(4)	0x00060018	:>.					/* DBGROMSW								*/

	/*--- APL_INFO_CONST ---*/
	apl_info.rosdata	align(4)	0x00060040	:>APL_INFO_CONST	/* APL 版本							*/

	pg1_reserve.rosdata	align(4)				:>RESERVE1			/* RESERVE								*/

	prg_sum_1.rosdata	align(4)				:>PRG_SUM_CONST_1

	/*--- ROSDA_START ---*/
	/*------------------------------------------------------------------------------------------------------*/
	/*特别说明： */ 
	/* TP 初始化的定义，以使用 ROSDA。 TP 设置在 rosda start ~ .rosda end 之间。 */ 
	/* 请勿移动或删除此部分。													*/
	/*------------------------------------------------------------------------------------------------------*/
	.rosda_start					0x00070000	:>ROSDA_START

	/*--- BSW_CONST ---*/
	bsw.rosdata			align(4)				:>BSW_CONST
	bsw_hdc.rosdata		align(4)				:>.
	.fixaddr			align(4)				:>.					/* ghs internal (compiler) 				*/
	.fixtype			align(4)				:>.					/* ghs internal (compiler) 				*/
	.secinfo			align(4)				:>.					/* ghs internal (runtime library) 		*/
	.syscall			align(4)				:>.					/* ghs internal (linker) 				*/

	/*--- BSW_INFO_CONST ---*/
	bsw_pfver.rosdata		align(4) 0x00074260	:>BSW_INFO_CONST	/* PF 版本							*/
	bsw_csw.rosdata			align(4) 0x00074270	:>.					/* compile 软件信息						*/
	bsw_pf_mdl_mot.rosdata	align(4) 0x000742A0	:>.					/* PF MDL mot							*/
	bsw_packinfo.rosdata	align(4) 0x000742B0	:>.					/* 软件包名称							*/
	bsw_csw2.rosdata		align(4) 0x000742C0	:>.					/* compile 软件信息2						*/
	bsw_hwver.rosdata		align(4) 0x000742D0	:>.					/* 硬件版本							*/

	/*--- CFC_CONST ---*/
	cfc.rosdata			align(4)				:>CFC_CONST

	/*--- SWC_CV_CONST ---*/
	swc_cv.rosdata		align(4)				:>SWC_CV_CONST

	/*--- SWC_CV_INFO_CONST ---*/
	swc_cv_ctrlver.rosdata		align(4)  0x0007A200:>SWC_CV_INFO_CONST	/* CTRL版本						*/
	swc_cv_ctrl_epsc.rosdata	align(4)  0x0007A220:>.					/* CTRL pc						*/
	swc_cv_ctrl_epsc_tl.rosdata align(4)  0x0007A230:>.					/* CTRL tl_epsc版本				*/
	swc_cv_ctrl_motc_tl.rosdata align(4)  0x0007A250:>.					/* CTRL tl_motc版本				*/

	/*--- SWC_CONST ---*/
	swc.rosdata			align(4)				:>SWC_CONST

	/*--- SWC_INFO_CONST ---*/
	swc_addctrl_a.rosdata	align(4) 0x0007B080	:>SWC_INFO_CONST
	swc_addctrlver.rosdata	align(4) 0x0007B090	:>.

	/*--- SWC_CV_MAP_CONST ---*/
	swc_cv_map.rosdata	align(4)				:>SWC_CV_MAP_CONST

	/*--- CSTM_ASILD_RODATA ---*/
	CstmAsilD_rodata	align(4)				:>CSTM_ASILD_RODATA

	/*--- ROMPSEC ---*/
	/* Create a copy of sdata, data, and user-defined sdata section in ROM and */
	/* create an entry  the run-time ROM copy table */
	rompsec.swc_cv.rosdata ROM(swc_cv.sdata)		align(4)	:>ROMPSEC
	rompsec.swc.rosdata ROM(swc.sdata)				align(4)	:>ROMPSEC
	rompsec.bsw.rosdata ROM(bsw.sdata)				align(4)	:>ROMPSEC

	/*--- ROSDA_END ---*/
	.rosda_end									:>ROSDA_END

	/*--- SWC_CV_TEXT ---*/
	swc_cv.text			align(4)				:>SWC_CV_TEXT


	/*--- SWC_TEXT ---*/
	swc.text			align(4)				:>SWC_TEXT

	/*--- BSW_HDC_TEXT ---*/
	bsw_hdc.text		align(4)				:>BSW_HDC_TEXT

	/*--- BSW_TEXT ---*/
	bsw.text			align(4)				:>BSW_TEXT

	/*--- BSW_VF_TEXT ---*/
	app_entry.text		align(4)	0x000CCD00	:>BSW_VF_TEXT
	fe_fenmi_safty.text	align(4)	0x000CCD40	:>.
	fe_ex_syserr.text	align(4)	0x000CCD80	:>.
	fe_feint.text		align(4)	0x000CCDC0	:>.
	err_int.text		align(4)	0x000CCE00	:>.
	int_inttaud0.text	align(4)	0x000CCF00	:>.
	int_intad.text		align(4)	0x000CD000	:>.
	softerr_int.text	align(4)	0x000CD100	:>.
	/*------------------------------------------------------------------------------------------------------*/

	/*------------------------------------------------------------------------------------------------------*/
	int_syscall.text	align(4)	0x000CD200	:>.
	int_sw0.text		align(4)	0x000CD300	:>.
	prg_sum_2.rosdata	align(4)				:>PRG_SUM_CONST_2

	/*--- PRG_END_CONST ---*/
	prg_e_dummy.rozdata	align(4)				:>PRG_END_CONST
	rprover_e.rozdata	align(4)	0x000FFFFC	:>.					/* ﾘﾌﾟﾛVer								*/

	/*--- NO_USE_DEFAULT_ROM ---*/
	.rozdata			align(4)				:>NO_USE_DEFAULT_ROM1	/* ZDA区域的Rom常量默认部分.使用禁止	*/
	.rosdata			align(4)				:>.						/* SDA区域的ROM常量默认部分.使用禁止	*/
	.rodata				align(4)				:>.						/* 通常区域的ROM常量默认部分.使用禁止	*/
	.text				align(4)				:>.						/* ﾃｷｽﾄﾃﾞﾌｫﾙﾄｾｸｼｮﾝ.使用禁止				*/

	/*======================================================================================================*/
	/*	RAM区域 (128KByte)																					*/
	/*======================================================================================================*/
	/*--- STACK_DATA ---*/
	.stack				0xFEBE0000 pad(0x1800)	:>STACK_DATA		/* definition of stack size				*/

	/*--- SDABASE ---*/
	/*------------------------------------------------------------------------------------------------------*/
	/*	特别说明：																							*/
	/*		使用 RAMSDA 的 GP 初始化的定义。															*/
	/*		您不会移动或删除此部分。																	*/
	/*------------------------------------------------------------------------------------------------------*/
	.sdabase			align(4)				:>SDABASE

	/*--- CALIB_MAP ---*/
	calib_map_start.sbss	align(4)			:>CALIB_MAP_START	/* 校准 MAP区域					*/
	calib_map.sbss			align(4)			:>CALIB_MAP_DATA
	calib_map_end.sbss		align(4)			:>CALIB_MAP_END


	/*--- FIXED_MAP ---*/
	fixed_map.sbss		align(4)				:>FIXED_MAP			/* Fixed MAP区域						*/

	/*--- TUNING_INFO ---*/
	tuning_info.sbss	align(4)				:>TUNING_INFO		/* 调谐信息区						*/

	/*--- IBL_STARTUP ---*/
	ibl_startup.bss		align(4)				:>IBL_STARTUP		/* 初始引导加载程序（启动） DATA区域		*/

	/*--- IBL_DATA ---*/
	ibl.bss				align(4)				:>IBL_DATA			/* 初始引导加载程序 DATA区域				*/
	.R_FDL_Data			align(4)				:>.					/* 数据FLASH数据					*/

	/*--- BSW_CRY_DATA ---*/
	bsw_cry.bss			align(4)				:>BSW_CRY_DATA		/* BSW 残留数据区				*/

	/*--- SWC_CRY_DATA ---*/
	swc_cry.bss			align(4)				:>SWC_CRY_DATA		/* SWC 残留数据区				*/

	/*--- HRP_DATA ---*/
	hrp_cmn_hdcd.bss	align(4)	0xFEBF0A00	:>HRP_DATA			/* UDS刷新 DATA区域		*/
	hrp_cmn_hdcc.bss	align(4)				:>.					/* UDS刷新 DATA区域		*/
	hrp_cry_hdcd.bss	align(4)				:>.					/* UDS刷新 DATA区域		*/
	hrp_cry_hdcc.bss	align(4)				:>.					/* UDS刷新 DATA区域		*/
	hrp.bss				align(4)				:>.					/* UDS刷新 DATA区域				*/

	/*--- SWC_CV_DATA ---*/
	swc_cv.sdata		align(4)				:>SWC_CV_DATA		/* SWC 配置设定区 默认RAM区域		*/

	/*--- SWC_DATA ---*/
	swc.sdata			align(4)				:>SWC_DATA			/* SWC 默认RAM区域				*/

	/*--- BSW_DATA ---*/
	bsw.sdata			align(4)				:>BSW_DATA			/* BSW 默认RAM区域				*/

	/*--- BSW_BSS ---*/
	maxhold.sbss		align(4)	0xFEBF4E00	:>BSW_BSS			/* MAX保持区域							*/
	nvram_e.sbss		align(4)	0xFEBF5510	:>.					/* NVRAM-E区域					*/
	bsw.sbss			align(4)	0xFEBF6C00	:>.					/* BSW 其他DATA区域					*/
	ptime.sbss			align(4)				:>.					/* 加工时间测量结果区域					*/
	bsw_hdc.sbss		align(4)	0xFEBFAC00	:>.					/* BSW UDS功能 DATA区域					*/

	/*--- CFC_BSS ---*/
	cfc.sbss			align(4)				:>CFC_BSS			/* 常用函数 其他DATA区域				*/

	/*--- SWC_CV_BSS ---*/
	swc_cv.sbss			align(4)				:>SWC_CV_BSS		/* SWC 配置设定区DATA区域					*/

	/*--- SWC_BSS ---*/
	swc.sbss			align(4)				:>SWC_BSS			/* SWC 其他DATA区域					*/

	/*--- TUNE_CLB_BSS ---*/
	tunedata_clb.sbss	align(4)				:>TUNE_CLB_BSS		/* TUNEDATA OnlineClb管理区域			*/

	/*--- TUNE_BSS ---*/
	tunedata.sbss		align(4)				:>TUNE_BSS			/* TUNEDATA区域							*/

	/*--- BSW_TUNE ---*/
	bsw_tune.sbss		align(4)				:>BSW_TUNE			/* BSW		ASIL-D 校准RAM区域	*/

	/*--- CRP_BSS ---*/
	crp_cry.bss			align(4)	0xFEBFFE00	:>CRP_BSS			/* xcp校准协议 重现功能 接管数据区域 */
	crp.bss				align(4)	0xFEBFFE40	:>.					/* xcp校准协议 重现功能 DATA区域	*/

	/*--- NO_USE_DEFAULT_RAM ---*/
	.sbss				align(4)				:>NO_USE_DEFAULT_RAM/* SDA区域没有初始值，没有RAM默认放置部分.使用禁止	*/
	.sdata				align(4)				:>.					/* SDA区域没有初始值，没有RAM默认放置部分.使用禁止	*/
	.tdata				align(4)				:>.					/* TDA区域没有初始值，没有RAM默认放置部分.使用禁止				*/
	.bss				align(4)				:>.					/* 通用区域没有初始值，没有RAM默认放置部分.使用禁止	*/
	.data				align(4)				:>.					/* 通用区域没有初始值，没有RAM默认放置部分.使用禁止	*/

// These special symbols mark the bounds of RAM and ROM memory.
// They are used by the MULTI debugger.
	__ghs_ramstart	= MEMADDR(STACK_DATA);
	__ghs_ramend	= MEMENDADDR(NO_USE_DEFAULT_RAM);
	__ghs_romstart	= MEMADDR(IBL_TEXT);
	__ghs_romend	= MEMENDADDR(NO_USE_DEFAULT_ROM1);
}
