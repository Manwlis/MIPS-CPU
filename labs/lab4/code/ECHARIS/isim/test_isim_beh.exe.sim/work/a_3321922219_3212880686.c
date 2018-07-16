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
static const char *ng0 = "C:/Users/Mike/Desktop/organwsh/test/beqRM_MuxCtr.vhd";



static void work_a_3321922219_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3148);
    t8 = 1;
    if (6U == 6U)
        goto LAB5;

LAB6:    t8 = 0;

LAB7:    if (t8 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3154);
    t8 = 1;
    if (6U == 6U)
        goto LAB13;

LAB14:    t8 = 0;

LAB15:    if (t8 != 0)
        goto LAB11;

LAB12:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1768);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1804);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1840);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 1724);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(18, ng0);
    t12 = (t0 + 1768);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(19, ng0);
    t1 = (t0 + 1804);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(20, ng0);
    t1 = (t0 + 1840);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    t9 = 0;

LAB8:    if (t9 < 6U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t10 = (t1 + t9);
    t11 = (t6 + t9);
    if (*((unsigned char *)t10) != *((unsigned char *)t11))
        goto LAB6;

LAB10:    t9 = (t9 + 1);
    goto LAB8;

LAB11:    xsi_set_current_line(22, ng0);
    t12 = (t0 + 1768);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(23, ng0);
    t1 = (t0 + 1804);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1840);
    t2 = (t1 + 32U);
    t6 = *((char **)t2);
    t7 = (t6 + 40U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB13:    t9 = 0;

LAB16:    if (t9 < 6U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t10 = (t1 + t9);
    t11 = (t6 + t9);
    if (*((unsigned char *)t10) != *((unsigned char *)t11))
        goto LAB14;

LAB18:    t9 = (t9 + 1);
    goto LAB16;

}


extern void work_a_3321922219_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3321922219_3212880686_p_0};
	xsi_register_didat("work_a_3321922219_3212880686", "isim/test_isim_beh.exe.sim/work/a_3321922219_3212880686.didat");
	xsi_register_executes(pe);
}
