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
static const char *ng0 = "C:/Users/Mike/Desktop/lab3/Processor/ALU_Control.vhd";



static void work_a_3044219816_3212880686_p_0(char *t0)
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
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t1 = (t0 + 2923);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB9:    t5 = (t0 + 2926);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB10:    t8 = (t0 + 2929);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB11:    t11 = (t0 + 2932);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB12:    t14 = (t0 + 2935);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB13:
LAB8:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2970);
    t3 = (t0 + 1676);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 1632);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(20, ng0);
    t17 = (t0 + 592U);
    t18 = *((char **)t17);
    t17 = (t0 + 2938);
    t20 = 1;
    if (4U == 4U)
        goto LAB18;

LAB19:    t20 = 0;

LAB20:    if (t20 != 0)
        goto LAB15;

LAB17:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 2946);
    t20 = 1;
    if (4U == 4U)
        goto LAB26;

LAB27:    t20 = 0;

LAB28:    if (t20 != 0)
        goto LAB24;

LAB25:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 1676);
    t3 = (t1 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB16:    goto LAB2;

LAB4:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 2954);
    t3 = (t0 + 1676);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB5:    xsi_set_current_line(31, ng0);
    t1 = (t0 + 2958);
    t3 = (t0 + 1676);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB6:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 2962);
    t3 = (t0 + 1676);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB7:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2966);
    t3 = (t0 + 1676);
    t5 = (t3 + 32U);
    t6 = *((char **)t5);
    t8 = (t6 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB14:;
LAB15:    xsi_set_current_line(21, ng0);
    t24 = (t0 + 2942);
    t26 = (t0 + 1676);
    t27 = (t26 + 32U);
    t28 = *((char **)t27);
    t29 = (t28 + 40U);
    t30 = *((char **)t29);
    memcpy(t30, t24, 4U);
    xsi_driver_first_trans_fast_port(t26);
    goto LAB16;

LAB18:    t21 = 0;

LAB21:    if (t21 < 4U)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t22 = (t18 + t21);
    t23 = (t17 + t21);
    if (*((unsigned char *)t22) != *((unsigned char *)t23))
        goto LAB19;

LAB23:    t21 = (t21 + 1);
    goto LAB21;

LAB24:    xsi_set_current_line(23, ng0);
    t8 = (t0 + 2950);
    t11 = (t0 + 1676);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    t15 = (t14 + 40U);
    t17 = *((char **)t15);
    memcpy(t17, t8, 4U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB16;

LAB26:    t21 = 0;

LAB29:    if (t21 < 4U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t5 = (t2 + t21);
    t6 = (t1 + t21);
    if (*((unsigned char *)t5) != *((unsigned char *)t6))
        goto LAB27;

LAB31:    t21 = (t21 + 1);
    goto LAB29;

}


extern void work_a_3044219816_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3044219816_3212880686_p_0};
	xsi_register_didat("work_a_3044219816_3212880686", "isim/test2_isim_beh.exe.sim/work/a_3044219816_3212880686.didat");
	xsi_register_executes(pe);
}
