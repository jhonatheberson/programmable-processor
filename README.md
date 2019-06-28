# Processador Neander

Implementação do processador neander em vhdl.


### Grupo

 - [Alessandro Cerioli](https://github.com/alecerioli)
 - [Felipe Lima](https://github.com/FelipeLM1)
 - [Jhonatan Heberson](https://github.com/jhonatheberson)
 - [Renato Lins]()
 - [Vinícios Menezes]()
 
 ## Requisitos
 
 - Quartus II
 - Altera Cyclone II 

## Arquitetura do Neander

![neander](https://i.ibb.co/S5T92nv/neander.png)

## Componentes

Os componentes do processador são:

-------------

### UAL (Unidade Lógica e Aritmética)

Unidade Aritmética e Lógica (UAL): conforme a seleção da UAL (selUAL), 5 operações diferentes podem ocorrer. A largura dos dados é de 8 bits. A UAL é capaz de identificar quando o resultado é ZERO (Z) ou NEGATIVO (N).<br>

As operações da UAL são: <br>

 - X+Y , quando selUAL = 000
 - X and Y , quando selUAL = 001
 - X or Y   , quando selUAL = 010
 - not X  , quando selUAL = 011
 - Y , quando selUAL = 100

As entradas da UAL são o X, que é um dado recebido do componente acumulador, Y que é a saída do registrador de dados da memória e o selUAL que seleciona qual operação deve ser feita.<br>
Os resultados das operações são armazenados no AC que podem ser eventualmente enviadas para a memória, ou tambem podem fazer novas operações, ja que o AC é a entrada X do UAL.
 
	


[Ver Código ](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/ual.vhd#L7)

-------------

### AC ( Acumulador)

![reg8](https://i.ibb.co/Z6wGjXH/registrador8.png)

Funcionamento : Acumula os resultados das operações feitas na UAL e envia os resultados acumulados para o RDM e o "x" da UAL.

Variáveis:

Ip: Dados obtidos  a partir da saída da UAL.<br>
Load: Se estiver ativado ,  habilita a entrada paralela. Se estiver desativado, mantém o valor atual.<br>
Qs: Valor acumulado<br>

[Ver Código ](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/registrador8.vhd#L4)

-------------

### Registrador NZ

N (negativo): sinal do resultado de uma operação na ULA<br>

 - Se o resultado da ULA for negativo, N=1
 - Caso contrário, N=0

Z (zero): indica resultado igual a zero<br>

 - Se o resultado da ULA for zero, Z =1
 - Caso contrário, Z=0

[Ver Código](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/ual.vhd#L78)

-------------

### PC 
![pc](https://i.ibb.co/bLkfHbj/PC.png)

Funcionamento:
Apontar para posição de memória onde está sendo executado ou onde será executado o programa.

LOAD=1 :carrega entrada paralela
Incrementar=1 :soma 1

Obs:
load=1 e incrementar=1
ou load=0 e incrementar=0 nunca vão acontecer 

Variáveis:
jumpto: entrada paralela do RDM
load: Se estiver ativado carrega o jumpto.
incrementar : somar 1
clk: clock
QS: saída

[Ver Código](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/pc.vhd#L4)

-------------

### Mux

Função: selecionar uma saída entre os endereços de memória RDM e PC e envia esse endereço para o REM.

-------------

### Registrador REM

![reg8](https://i.ibb.co/Z6wGjXH/registrador8.png)

Função: É o registrador de endereço de memória, ele recebe um endereço a partir do multiplexador e a saída é o endereço da célula de memória que deve ser ativada para leitura ou escrita. Utiliza o componente memoria8 que armazena os 8 bits necessários. Se o load estiver ativado, o registrador armazena a entrada paralela e quando o load estiver desativado o REM mantém o valor atual. A saída de 8 bits armazena o endereço de memória nos 4 bits menos significativo.<br>

Variáveis:

Ip: Endereço de entrada selecionado pelo multiplexador. <br>
Qs: Endereço de saída que usa os 4 bits menos significativo. <br>
Load: 
0- Mantém o valor atual. <br>
1- Ativa a entrada paralela. <br>

[Ver Código ](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/registrador8.vhd#L4)

-------------

### Registrador RDM

![RDM](https://i.ibb.co/7WPWysM/RDM.png)

Funcionamento :
O registrador RDM é responsável por registrar os dados. As entradas de dados do RDM são da saída da memória e da saída do acumulador, que é um resultado de alguma operação da UAL. Foi implementado uma chave (selCP) para selecionar qual dado deve ser carregado. Quando o load estiver ativado e selCP=1 o dado carregado é da saída da memória(Imem) e quando o load=1 e selCP=1, então o registrador RDM carrega a saída do acumulador. Se o load estiver desativado (load=0), o RDM mantém o valor.<br>

Variáveis:
Imem -  saída da memoria <br>
Iac    - saída do acumulador<br>
load - habilitador<br>
selCP - selecionar entre Imem e Iac<br>
clk - clock<br>
Qs - saida de 8 bits<br>

[Ver Código](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/registrador8RDM.vhd#L4)

-------------

### Registrador INST(opcode)

![reg8](https://i.ibb.co/Z6wGjXH/registrador8.png)

Funcionamento: Utiliza o código registrador8. Recebe a saída do RDM que são 8 bits onde os quatro bits mais significativos representa a operação a ser feita. O opcode recebe esses 8 bits e envia os quatro bits mais significativos para o decodificador.

Ip: Saída do RDM.<br>
Qs: 4 bits mais significativos vão para o decodificador.<br>
Load: <br>
0 - Mantém o valor atual. <br>
1- Ativa a entrada paralela. <br>

[Ver Código ](https://github.com/jhonatheberson/programmable-processor/blob/28c792cf8e0bd7a8056d5ee62f80bdb4209a7b9c/registrador8.vhd#L4)

-------------

### Decodificador

Funcionamento:

Recebe um código de instrução de 4 bits, a partir do opcode, e transforma em uma código de instruções de 10 bits que é enviado para a unidade de controle.

![instru](https://i.ibb.co/nDG4gnh/01-Operacoes.png)

Váriaveis:

entrada_dec: Código da instrução.<br>
saida_dec:  Código da instrução decodificado.<br>

[Ver Código](https://github.com/jhonatheberson/programmable-processor/blob/666bacf5a187198ca751a6d3de39412bbffc0716/Decodificador.vhd#L4)

-------------

### Memória
![memoria](https://i.ibb.co/zfpLsZF/memoria.png)

**Célula da memória:**

![celula](https://i.ibb.co/hymZzXL/celula.png)
Funcionamento:

A função da célula da memória é guardar um dado de 8 bits. Quando o enable estiver ativo e rw(read, write) =1 escreve um valor na célula (obs: enquanto estiver escrevendo a saída é 0). Se o enable estiver ativo e rw=0, a saída será a leitura dos dados da célula. E se o enable estiver desativado, mantém o valor. <br>
Para uma célula ser habilitada o enable dela deve estar ativada e rw=1<br>

Variáveis:

E: valor que vai escrever<br>
en: Habilitar célula<br>
rw: 1 escreve - 0 lê dados<br>
clk: clock<br>
S: saída<br>

[Ver Código](https://github.com/jhonatheberson/programmable-processor/blob/666bacf5a187198ca751a6d3de39412bbffc0716/celulamemoria.vhd#L1)

-------------

**Memória completa:** 

![memcompleta](https://i.ibb.co/f9vSfSn/memoria.png)
Funcionamento :

Tem como entradas um dado e um endereço. Para encontrar a célula o endereço passa por um varias portas and que testa as possibilidades de 0 á 15 até encontrar algum endereço a ser ativado.  <br>

Após encontrar alguma célula habilitada o dado de entrada será escrito na célula.<br>
 Se rw=0, faz a leitura dos dados.<br>

Variáveis:

E: Dado para ser escrito.<br>
reset<br>
Ad: endereço de 4 bits - saída do REM - endereço da célula que deve ser habilitada<br>
rw: 1 escreve 0 lê dados<br>
clk<br>
S: leitura dos dados<br>

[Ver Código](https://github.com/jhonatheberson/programmable-processor/blob/b9a7ac0f7c587db3563ee6d05f8bfdff4956c5fc/memoriacompleta.vhd#L4)

### Colaboradores
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/alecerioli">
        <img src="https://i.ibb.co/sb97swP/me.png" width="100px;" alt="Aryclenio Xavier"/>
        <br />
        <sub><b>Alessandro Cerioli</b></sub>
      </a><br />
      <a href="https://github.com/jhonatheberson/programmable-processor/commits?author=alecerioli" title="Code">💻</a>
	  </td>	  
    <td align="center">
      <a href="https://github.com/FelipeLM1">
        <img src="https://avatars2.githubusercontent.com/u/48065743?s=460&v=4" width="100px;" alt="Iago Cassel"/>
        <br/>
        <sub><b>Felipe Lima</b></sub>
      </a><br />
      <a href="https://github.com/jhonatheberson/programmable-processor/commits?author=FelipeLM1" title="Code">💻</a>
    </td>
	
<td align="center">
      <a href="https://github.com/jhonatheberson">
        <img src="https://avatars1.githubusercontent.com/u/42505240?s=460&v=4" width="100px;" alt="Aryclenio Xavier"/>
        <br />
        <sub><b>Jhonat Heberson</b></sub>
      </a><br />
      <a href="https://github.com/jhonatheberson/programmable-processor/commits?author=jhonatheberson" title="Code">💻</a>
    </td>    
  </tr>
</table>


