/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x2f00eba5 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Mike/Desktop/organwsh/lab3/Processor/Immed_Control.vhd";



static void work_a_0197754119_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(16, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2794);
    t4 = xsi_mem_cmp(t1, t2, 6U);
    if (t4 == 1)
        goto LAB3;

LAB7:    t5 = (t0 + 2800);
    t7 = xsi_mem_cmp(t5, t2, 6U);
    if (t7 == 1)
        goto LAB4;

LAB8:    t8 = (t0 + 2806);
    t10 = xsi_mem_cmp(t8, t2, 6U);
    if (t10 == 1)
        goto LAB5;

LAB9:
LAB6:    xsi_set_current_line(25, ng0);
    t1 = (t0 + 2818);
    t3 = (t0 + 1584);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 1540);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(19, ng0);
    t11 = (t0 + 2812);
    t13 = (t0 + 1584);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 2U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB2;

LAB4:    xsi_set_current_line(21, ng0);
    t1 = (t0 + 2814);
    t3 = (t0 + 1584);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB5:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 2816);
    t3 = (t0 + 1584);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 2U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB10:;
}


extern void work_a_0197754119_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0197754119_3212880686_p_0};
	xsi_register_didat("work_a_0197754119_3212880686", "isim/processor_test_isim_beh.exe.sim/work/a_0197754119_3212880686.didat");
	xsi_register_executes(pe);
}
