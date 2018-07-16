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
static const char *ng0 = "C:/Users/Mike/Desktop/organwsh/test/sizeContolUnit.vhd";



static void work_a_2524994391_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 592U);
    t3 = *((char **)t2);
    t4 = (31 - 31);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 2964);
    t9 = 1;
    if (6U == 6U)
        goto LAB8;

LAB9:    t9 = 0;

LAB10:    if (t9 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 592U);
    t14 = *((char **)t13);
    t15 = (31 - 31);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t14 + t17);
    t18 = (t0 + 2970);
    t20 = 1;
    if (6U == 6U)
        goto LAB14;

LAB15:    t20 = 0;

LAB16:    t1 = t20;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 1676);
    t3 = (t2 + 32U);
    t7 = *((char **)t3);
    t8 = (t7 + 40U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB3:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 592U);
    t3 = *((char **)t2);
    t4 = (31 - 31);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 2976);
    t1 = 1;
    if (6U == 6U)
        goto LAB23;

LAB24:    t1 = 0;

LAB25:    if (t1 != 0)
        goto LAB20;

LAB22:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1712);
    t3 = (t2 + 32U);
    t7 = *((char **)t3);
    t8 = (t7 + 40U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB21:    t2 = (t0 + 1632);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(15, ng0);
    t24 = (t0 + 1676);
    t25 = (t24 + 32U);
    t26 = *((char **)t25);
    t27 = (t26 + 40U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t24);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t10 = 0;

LAB11:    if (t10 < 6U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t11 = (t2 + t10);
    t12 = (t7 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB9;

LAB13:    t10 = (t10 + 1);
    goto LAB11;

LAB14:    t21 = 0;

LAB17:    if (t21 < 6U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t22 = (t13 + t21);
    t23 = (t18 + t21);
    if (*((unsigned char *)t22) != *((unsigned char *)t23))
        goto LAB15;

LAB19:    t21 = (t21 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(20, ng0);
    t13 = (t0 + 1712);
    t14 = (t13 + 32U);
    t18 = *((char **)t14);
    t19 = (t18 + 40U);
    t22 = *((char **)t19);
    *((unsigned char *)t22) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);
    goto LAB21;

LAB23:    t10 = 0;

LAB26:    if (t10 < 6U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t11 = (t2 + t10);
    t12 = (t7 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB24;

LAB28:    t10 = (t10 + 1);
    goto LAB26;

}


extern void work_a_2524994391_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2524994391_3212880686_p_0};
	xsi_register_didat("work_a_2524994391_3212880686", "isim/test_isim_beh.exe.sim/work/a_2524994391_3212880686.didat");
	xsi_register_executes(pe);
}
