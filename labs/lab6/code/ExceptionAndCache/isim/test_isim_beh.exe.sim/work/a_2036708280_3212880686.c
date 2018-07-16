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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Mike/Desktop/organwsh/lab6/ExceptionAndCache/InitializationUnit.vhd";



static void work_a_2036708280_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5359);
    t5 = 1;
    if (32U == 32U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 1352U);
    t10 = *((char **)t9);
    t9 = (t0 + 5391);
    t12 = 1;
    if (32U == 32U)
        goto LAB14;

LAB15:    t12 = 0;

LAB16:    t1 = t12;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 3232);
    t4 = (t2 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 2U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 3296);
    t4 = (t2 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t1;
    xsi_driver_first_trans_fast_port(t2);

LAB3:    t2 = (t0 + 3152);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(20, ng0);
    t16 = (t0 + 5423);
    t18 = (t0 + 3232);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t16, 2U);
    xsi_driver_first_trans_fast_port(t18);
    xsi_set_current_line(21, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 32U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t7 = (t3 + t6);
    t8 = (t2 + t6);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t13 = 0;

LAB17:    if (t13 < 32U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t14 = (t10 + t13);
    t15 = (t9 + t13);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB15;

LAB19:    t13 = (t13 + 1);
    goto LAB17;

}


extern void work_a_2036708280_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2036708280_3212880686_p_0};
	xsi_register_didat("work_a_2036708280_3212880686", "isim/test_isim_beh.exe.sim/work/a_2036708280_3212880686.didat");
	xsi_register_executes(pe);
}
