# Estimador_de_frequencia

Projeto final da disciplina de Laboratório de Sistemas Eletrônicos III. Harware estimador de frequência implementado em FPGA DE0 Nano CycloneIV. 

## Funcionamento do Hardware
Utiliza um conversor ADC e comunicação SPI para processar um sinal de entrada de frequêencia fixa gerada por um gerador de função. 
O hardware regula o offset do sinal adquirido e o passa por um processo de zero-crossing, contando os clocks em 1 perídodo. A partir dessa contagem, calcula a frequência do sinal.


![image](https://github.com/user-attachments/assets/d7298438-f4f1-4b3d-aab4-653e685ff18e)
