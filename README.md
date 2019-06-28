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

### UAL (Unidade Lógica e Aritmética)

You can rename the current file by clicking the file name in the navigation bar or by clicking the **Rename** button in the file explorer.

### AC ( Acumulador)

Funcionamento : Acumula os resultados das operações feitas na UAL e envia os resultados acumulados para o RDM e o "x" da UAL.

Variáveis:

Ip: Dados obtidos  a partir da saída da UAL.<br>
Load: Se estiver ativado ,  habilita a entrada paralela. Se estiver desativado, mantém o valor atual.<br>
Qs: Valor acumulado<br>

### Registrador NZ

N (negativo): sinal do resultado de uma operação na ULA
• se o resultado da ULA for negativo, N=1
• Caso contrário, N=0

Z (zero): indica resultado igual a zero
• Se o resultado da ULA for zero, Z =1
• Caso contrário, Z=0

### PC **

Função:
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
QS: saida

### Mux

Função: selecionar uma saída entre os endereços de memória RDM e PC e envia esse endereço para o REM.

### Registrador REM

Função: É o registrador de endereço de memória, ele recebe um endereço a partir do multiplexador e a saída é o endereço da célula de memória que deve ser ativada para leitura ou escrita. Utiliza o componente memoria8 que armazena os 8 bits necessários. Se o load estiver ativado, o registrador armazena a entrada paralela e quando o load estiver desativado o REM mantém o valor atual. A saída de 8 bits armazena o endereço de memória nos 4 bits menos significativo.<br>

Variáveis:

Ip: Endereço de entrada selecionado pelo multiplexador. <br>
Qs: Endereço de saída que usa os 4 bits menos significativo. <br>
Load: 
0- Mantém o valor atual. <br>
1- Ativa a entrada paralela. <br>

### Registrador RDM

Funcionamento :
O registrador RDM é responsável por registrar os dados. As entradas de dados do RDM são da saída da memória e da saída do acumulador, que é um resultado de alguma operação da UAL. Foi implementado uma chave (selCP) para selecionar qual dado deve ser carregado. Quando o load estiver ativado e selCP=1 o dado carregado é da saída da memória(Imem) e quando o load=1 e selCP=1, então o registrador RDM carrega a saída do acumulador. Se o load estiver desativado (load=0), o RDM mantém o valor.<br>

Variáveis:
Imem -  saída da memoria <br>
Iac    - saída do acumulador<br>
load - habilitador<br>
selCP - selecionar entre Imem e Iac<br>
clk - clock<br>
Qs - saida de 8 bits<br>

### Registrador INST(opcode)

Funcionamento: Utiliza o código registrador8. Recebe a saída do RDM que são 8 bits onde os quatro bits mais significativos representa a operação a ser feita. O opcode recebe esses 8 bits e envia os quatro bits mais significativos para o decodificador.

Ip: Saída do RDM.<br>
Qs: 4 bits mais significativos vão para o decodificador.<br>
Load: <br>
0 - Mantém o valor atual. <br>
1- Ativa a entrada paralela. <br>



### Decodificador

Funcionamento:

Recebe um código de instrução de 4 bits, a partir do opcode, e transforma em uma código de instruções de 10 bits que é enviado para a unidade de controle.

Váriaveis:

entrada_dec: Código da instrução.<br>
 saida_dec:  Código da instrução decodificado.<br>


### Memória

**Célula da memória:**

Funcionamento:

A função da célula da memória é guardar um dado de 8 bits. Quando o enable estiver ativo e rw(read, write) =1 escreve um valor na célula (obs: enquanto estiver escrevendo a saída é 0). Se o enable estiver ativo e rw=0, a saída será a leitura dos dados da célula. E se o enable estiver desativado, mantém o valor.<br>

Variáveis:

E: valor que vai escrever<br>
en: Habilitar célula<br>
rw: 1 escreve 0 lê dados<br>
clk: clock<br>
S: saída<br>

**Memória completa:**

Funcionamento :

Tem como entradas um dado e um endereço, se rw=1 o dado de entrada será escrito na célula do endereço de entrada e se rw=0 faz a leitura dos dados no mesmo endereço.

obs:
para uma célula ser habilitada o enable dela deve estar ativada e rw=1

Variáveis:

E: Dado para ser escrito.
reset
Ad: endereço de 4 bits - saída do REM - endereço da célula que deve ser habilitada
rw: 1 escreve 0 lê dados
clk
S: leitura dos dados






### Unidade de Controle

You can publish your file by opening the **Publish** sub-menu and by clicking **Publish to**. For some locations, you can choose between the following formats:

- Markdown: publish the Markdown text on a website that can interpret it (**GitHub** for instance),
- HTML: publish the file converted to HTML via a Handlebars template (on a blog for example).


## Getting Started

open the project with extension example.qpf, then compile the prject and board the FPGA.

### Installing

open Quartus II, then click on queue and "open project"

after compile the project by doing the following instructions:

`` `
click on the "processing" tab
`` `

after this

`` `
Start compilation
`` `

when you finish compiling, click on the "Assignments" toolbar

`` `
Pin Planner
`` `
Make your pinning the way you want


`` `
repeat Start compilation
`` `

and ship the processor in the FPGA by performing the following steps:


`` `
tools
`` `
and

`` `
Programmer
`` `
After selecting the type of FPGA

`` `
Start
`` `


## Deployment

to know how the processor and its features please read the following files in this repository:

```
00NEANDER.PNG
```
```
01Operacoes.PNG
```

## Built With

* [Quartus II](https://www.intel.com/content/www/us/en/programmable/downloads/software/quartus-ii-we/120.html) - development and deployment and debug


## Contributing

Please read [CONTRIBUTING.md](https://github.com/jhonatheberson/programmable-processor/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/jhonatheberson/programmable-processor/tree/master). 

## Authors

* **Jhonat Heberson** - *Initial work* - [PurpleBooth](https://github.com/jhonatheberson/)

See also the list of [contributors](https://github.com/jhonatheberson/programmable-processor/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/jhonatheberson/LICENSE.md) file for details



