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
static const char *ng0 = "C:/Users/Mike/Desktop/organwsh/Processor/Adder.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1153420228_3212880686_p_0(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(16, ng0);

LAB3:    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = (31 - 29);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3400);
    t10 = ((IEEE_P_2592010699) + 2332);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 29;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t14 = (0 - 29);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 0;
    t17 = (t13 + 4U);
    *((int *)t17) = 1;
    t17 = (t13 + 8U);
    *((int *)t17) = 1;
    t18 = (1 - 0);
    t15 = (t18 * 1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t6, t16, (char)101);
    t15 = (30U + 2U);
    t19 = (32U != t15);
    if (t19 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 1920);
    t20 = (t17 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 40U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 32U);
    xsi_driver_first_trans_fast(t17);

LAB2:    t24 = (t0 + 1868);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_1153420228_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(17, ng0);

LAB3:    t2 = (t0 + 592U);
    t3 = *((char **)t2);
    t2 = (t0 + 3232U);
    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t4 = (t0 + 3280U);
    t6 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t1, t3, t2, t5, t4);
    t7 = (t1 + 12U);
    t8 = *((unsigned int *)t7);
    t9 = (1U * t8);
    t10 = (32U != t9);
    if (t10 == 1)
        goto LAB5;

LAB6:    t11 = (t0 + 1956);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 32U);
    xsi_driver_first_trans_fast_port(t11);

LAB2:    t16 = (t0 + 1876);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t9, 0);
    goto LAB6;

}


extern void work_a_1153420228_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1153420228_3212880686_p_0,(void *)work_a_1153420228_3212880686_p_1};
	xsi_register_didat("work_a_1153420228_3212880686", "isim/Datapath_isim_beh.exe.sim/work/a_1153420228_3212880686.didat");
	xsi_register_executes(pe);
}
