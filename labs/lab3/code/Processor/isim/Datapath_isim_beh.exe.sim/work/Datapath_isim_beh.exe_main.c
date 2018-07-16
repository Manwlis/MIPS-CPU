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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *STD_TEXTIO;
char *IEEE_P_3564397177;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_0290344353_3212880686_init();
    work_a_2895730147_3212880686_init();
    work_a_3230984351_3212880686_init();
    work_a_3720043404_3212880686_init();
    work_a_0922322361_1181938964_init();
    work_a_4202670372_0000452272_init();
    work_a_1507033918_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_0038911295_3212880686_init();
    work_a_1913148318_0953645740_init();
    ieee_p_1242562249_init();
    work_a_1628123915_3212880686_init();
    work_a_0781804642_1181938964_init();
    work_a_2453171190_3212880686_init();
    work_a_0200802635_3212880686_init();
    work_a_4108668482_3212880686_init();
    work_a_2306142521_3212880686_init();
    work_a_2537006236_3212880686_init();
    work_a_0975640890_3212880686_init();
    work_a_1947288536_3212880686_init();
    work_a_3971101896_3212880686_init();
    work_a_0517534542_1181938964_init();
    work_a_2081551473_3212880686_init();
    work_a_1625853307_3212880686_init();
    work_a_2668828412_3212880686_init();
    work_a_3759130379_3212880686_init();
    work_a_1543952170_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_a_3977952979_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_2128221623_3212880686_init();
    work_a_1833817950_0000452272_init();
    work_a_3027548060_3212880686_init();


    xsi_register_tops("work_a_3027548060_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
