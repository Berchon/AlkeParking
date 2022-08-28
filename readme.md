# Projeto Alkemy (Checkpoint 1)

## Desafio proposto

É hora de reunir conhecimentos e colocá-los em prática em um projeto curto; primeiro os requisitos do programa serão explicados de forma geral e depois você avançará progressivamente em cada um deles. Você receberá uma parte do código inicial que deverá completar segundo os exercícios indicados para cumprir os requisitos.

ℹ - Durante os exercícios você verá algumas mensagens deste tipo; são ajudas que o guiarão nas respostas caso você tenha dúvidas sobre como avançar, lembre também que você pode recorrer ao mentor.

### 🅿️🚘 AlkeParking
AlkeParking é um estacionamento que permite estacionar diversos tipos de veículos (carro, motocicleta, micro-ônibus e ônibus) com capacidade máxima de 20 veículos.

* Quando um veículo vai entrar no estacionamento a placa e o tipo são inseridos, e é verificado que não haja outro veículo com a mesma placa.
* Quando um veículo vai ser retirado, é cobrada uma tarifa determinada pelos seguintes regulamentos.
* As primeiras 2 horas do estacionamento terão um custo fixo determinado pelo tipo de veículo (carro: $20, motocicleta: $15, micro-ônibus: $25, ônibus: $30).
* Após as primeiras 2 horas, serão cobrados $5 por cada 15 minutos ou fração, independentemente do tipo de veículo. Por exemplo, para um carro, seriam aplicadas as seguintes tarifas:

| Entrada | Saída | Tarifa |
|--|--|--|
| 18h00 | 18h46 | $20 |
| 18h00 | 20h00 | $20 |
| 18h00 | 21h13 | $45 |
| 18h00 | 21h18 | $50 |
| 18h00 | 21h30 | $50 |

Os veículos podem (opcionalmente) ter um cartão de desconto, o que reduz em 15% a tarifa total do estacionamento.

* Os valores das tarifas não devem incluir centavos; em caso de tê-los devem ser descartados.
* A pedido da administração do AlkeParking, deve ser mantido um registro do total de veículos retirados do estacionamento, com o total dos ganhos recebidos.
* A administração poderá solicitar a qualquer momento a relação das placas dos veículos que estiverem no estacionamento.

## Decisões tomada pela equipe

1. Utilizar a tabela ascii para fazer a criptografia
2. Possibilitar encriptar e descriptar o texto
3. Possibilitar a criptografia não só de letras, mas sim de qualquer caracter ascii, pois assim poderá ser encriptado números, pontuações, acentução gráfica, etc.

## O que faltou fazer

Por causa do curto tempo disponível, não tivemos tempo de implementar os casos que os códigos ascii resultantes da soma/subtração fique fora do intervalo entre 0 e 255.

## Equipe

| ![Amanda](https://avatars.githubusercontent.com/u/62217873?v=4) |![Luciano](https://avatars.githubusercontent.com/u/63373302?v=4)|
|--|--|
| Amanda | Luciano |