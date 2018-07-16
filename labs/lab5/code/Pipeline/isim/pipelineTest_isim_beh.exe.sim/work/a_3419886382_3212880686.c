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
static const char *ng0 = "C:/Users/Mike/Desktop/organwsh/lab5/Pipeline/Stall_Unit.vhd";



static void work_a_3419886382_3212880686_p_0(char *t0)
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
    char *t11;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned char t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5797);
    t5 = 1;
    if (6U == 6U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if (t5 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 1032U);
    t10 = *((char **)t9);
    t9 = (t0 + 5803);
    t12 = 1;
    if (6U == 6U)
        goto LAB14;

LAB15:    t12 = 0;

LAB16:    t1 = t12;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 3552);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 3616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5817);
    t4 = (t0 + 3680);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB3:    t2 = (t0 + 3472);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t17 = (t0 + 1192U);
    t18 = *((char **)t17);
    t17 = (t0 + 1352U);
    t19 = *((char **)t17);
    t20 = 1;
    if (5U == 5U)
        goto LAB26;

LAB27:    t20 = 0;

LAB28:    if (t20 == 1)
        goto LAB23;

LAB24:    t16 = (unsigned char)0;

LAB25:    if (t16 != 0)
        goto LAB20;

LAB22:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t1 = 1;
    if (5U == 5U)
        goto LAB40;

LAB41:    t1 = 0;

LAB42:    if (t1 != 0)
        goto LAB38;

LAB39:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t1 = 1;
    if (5U == 5U)
        goto LAB48;

LAB49:    t1 = 0;

LAB50:    if (t1 != 0)
        goto LAB46;

LAB47:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3552);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 5815);
    t4 = (t0 + 3680);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB21:    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 6U)
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

LAB17:    if (t13 < 6U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t14 = (t10 + t13);
    t15 = (t9 + t13);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB15;

LAB19:    t13 = (t13 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(24, ng0);
    t29 = (t0 + 3552);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    *((unsigned char *)t33) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t29);
    xsi_set_current_line(25, ng0);
    t2 = (t0 + 3616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(26, ng0);
    t2 = (t0 + 5809);
    t4 = (t0 + 3680);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB21;

LAB23:    t23 = (t0 + 1192U);
    t24 = *((char **)t23);
    t23 = (t0 + 1512U);
    t25 = *((char **)t23);
    t26 = 1;
    if (5U == 5U)
        goto LAB32;

LAB33:    t26 = 0;

LAB34:    t16 = t26;
    goto LAB25;

LAB26:    t21 = 0;

LAB29:    if (t21 < 5U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t17 = (t18 + t21);
    t22 = (t19 + t21);
    if (*((unsigned char *)t17) != *((unsigned char *)t22))
        goto LAB27;

LAB31:    t21 = (t21 + 1);
    goto LAB29;

LAB32:    t27 = 0;

LAB35:    if (t27 < 5U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t23 = (t24 + t27);
    t28 = (t25 + t27);
    if (*((unsigned char *)t23) != *((unsigned char *)t28))
        goto LAB33;

LAB37:    t27 = (t27 + 1);
    goto LAB35;

LAB38:    xsi_set_current_line(28, ng0);
    t8 = (t0 + 3552);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(29, ng0);
    t2 = (t0 + 3616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(30, ng0);
    t2 = (t0 + 5811);
    t4 = (t0 + 3680);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB21;

LAB40:    t6 = 0;

LAB43:    if (t6 < 5U)
        goto LAB44;
    else
        goto LAB42;

LAB44:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB41;

LAB45:    t6 = (t6 + 1);
    goto LAB43;

LAB46:    xsi_set_current_line(32, ng0);
    t8 = (t0 + 3552);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t14 = *((char **)t11);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(34, ng0);
    t2 = (t0 + 5813);
    t4 = (t0 + 3680);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB21;

LAB48:    t6 = 0;

LAB51:    if (t6 < 5U)
        goto LAB52;
    else
        goto LAB50;

LAB52:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB49;

LAB53:    t6 = (t6 + 1);
    goto LAB51;

}


extern void work_a_3419886382_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3419886382_3212880686_p_0};
	xsi_register_didat("work_a_3419886382_3212880686", "isim/pipelineTest_isim_beh.exe.sim/work/a_3419886382_3212880686.didat");
	xsi_register_executes(pe);
}
