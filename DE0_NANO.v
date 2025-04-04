// ============================================================================
// Copyright (c) 2011 by Terasic Technologies Inc. 
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// ============================================================================
// Major Functions/Design Description:
//
//   Please refer to DE0_Nano_User_manual.pdf in DE0_Nano system CD.
//
// ============================================================================
// Revision History:
// ============================================================================
//   Ver.: |Author:   |Mod. Date:    |Changes Made:
//   V1.0  |Keith     |01/15/2011    |
// ============================================================================

//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================


module DE0_NANO(

	//////////// CLOCK //////////
	CLOCK_50,

	//////////// LED //////////
	LED,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////////// EPCS //////////
	EPCS_ASDO,
	EPCS_DATA0,
	EPCS_DCLK,
	EPCS_NCSO,

	//////////// Accelerometer and EEPROM //////////
	G_SENSOR_CS_N,
	G_SENSOR_INT,
	I2C_SCLK,
	I2C_SDAT,

	//////////// ADC //////////
	ADC_CS_N,
	ADC_SADDR,
	ADC_SCLK,
	ADC_SDAT,

	//////////// 2x13 GPIO Header //////////
	GPIO_2,
	GPIO_2_IN,

	//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
	GPIO_0,
	GPIO_0_IN,

	//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
	GPIO_1,
	GPIO_1_IN 
	
//=======================================================

);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;

//////////// LED //////////
output		     [7:0]		LED;
assign LED[0] = zer0;

//////////// KEY //////////
input 		     [1:0]		KEY;

//////////// SW //////////
input 		     [3:0]		SW;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		     [1:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// EPCS //////////
output		          		EPCS_ASDO;
input 		          		EPCS_DATA0;
output		          		EPCS_DCLK;
output		          		EPCS_NCSO;

//////////// Accelerometer and EEPROM //////////
output		          		G_SENSOR_CS_N;
input 		          		G_SENSOR_INT;
output		          		I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// ADC //////////
output		          		ADC_CS_N;
output		          		ADC_SADDR;
output		          		ADC_SCLK;
input 		          		ADC_SDAT;

//////////// 2x13 GPIO Header //////////
inout 		    [12:0]		GPIO_2;
input 		     [2:0]		GPIO_2_IN;

//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
inout 		    [33:0]		GPIO_0;
input 		     [1:0]		GPIO_0_IN;

//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
inout 		    [33:0]		GPIO_1;
input 		     [1:0]		GPIO_1_IN;


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire						wSPI_CLK;
wire						wSPI_CLK_n;
wire		     [11:0]	adc_data;       // Dados do ADC (12 bits)
wire 			  [15:0]	cnt_periodo,contagem_final;	 // contagem de amostras em um perÃ­odo	
wire 						zer0;
wire 						amostra_pronta;
wire [24:0] freq;
wire ctrl;

//=======================================================

//=======================================================






//=======================================================
//  Structural coding
//=======================================================
SPIPLL		U0	(
						.inclk0(CLOCK_50),
						.c0(wSPI_CLK),			//clk divided by 25 : 50Mhz/25 = 2MHz
						.c1(wSPI_CLK_n)
					);

ADC_CTRL		U1	(
						.iRST(KEY[0]),
						.iCLK(wSPI_CLK),
						.iCLK_n(wSPI_CLK_n),
						.iGO(KEY[1]),
						.iCH(SW[2:0]),
						.oLED(),
						
						.adc_data(adc_data),
						.fim_amostra(amostra_pronta),
						
						.oDIN(ADC_SADDR),
						.oCS_n(ADC_CS_N),
						.oSCLK(ADC_SCLK),
						.iDOUT(ADC_SDAT)
					);
//wire 	adc_data_sig			
//assign adc_data_sig = adc_data - 12'd2048;
					
top_level  U2	(	 .clk(wSPI_CLK),
						 .reset(KEY[0]),
						 //.entrada({4'd0 ,adc_data, 16'd0}),
						 .entrada(adc_data - 12'd2048),
						 .amostra_pronta(amostra_pronta),
						 .flag(zer0),
						 .cnt(cnt_periodo),
						 .ctrl(ctrl),
						 .contagem_final(contagem_final),
						 .freq(freq)
						 //.x_filt(y)
					);
					
/*calc_freq U3 (.clk(wSPI_CLK),
			     .zer0(zer0),
					.cnt(cnt_periodo),
					.freq(freq)
						);
*/
//assign LED[7:0] = cnt_periodo; // Mostra a contagem de amostras em 7 LEDs

endmodule