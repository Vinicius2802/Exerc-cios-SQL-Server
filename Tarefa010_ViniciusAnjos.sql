-- A) Criar as tabelas x relacionamentos

Create Table Est_Cliente
(CPF varchar(13) not null,
Nome varchar(40),
Nascto datetime);

Alter Table Est_Cliente
ADD Constraint Pk_CPF Primary Key(CPF);


Create table Est_Modelo
(CodMod int not null,
Descr varchar(40));

alter table Est_Modelo
ADD Constraint Pk_CodMod Primary Key(CodMod);


Create table Est_Patio
(Num int not null,
Ender varchar(40),
Capacidade int);

Alter table Est_Patio
ADD constraint Pk_Num Primary Key(Num);


Create table Est_Veiculo
(Placa varchar(8) not null,
Cliente_CPF varchar(13),
Modelo int,
Cor varchar(20),
Ano int);

Alter table Est_Veiculo
ADD Constraint PK_Placa Primary Key(Placa);

Alter Table Est_Veiculo
ADD Constraint FK_Cliente_CPF Foreign Key(Cliente_CPF)
references Est_Cliente(CPF);

Alter Table Est_Veiculo
ADD Constraint FK_Modelo Foreign Key(Modelo)
references Est_Modelo(CodMod);


Create table Est_Estaciona
(Codigo int not null,
Patio_num int,
Placa_Veic varchar(8),
Data_entr datetime,
Data_saida datetime,
Hora_entr varchar(10),
Hora_saida varchar(10));

Alter table Est_Estaciona
Add constraint Pk_Codigo Primary Key(Codigo);

Alter Table Est_Estaciona
ADD Constraint FK_Patio_num Foreign Key(Patio_num)
references Est_Patio(Num);

select * from Est_Cliente;
select * from Est_Modelo;
select * from Est_Patio;
select * from Est_Veiculo;
select * from Est_Estaciona;

drop table Est_Cliente
drop table Est_Modelo
drop table Est_Patio
drop table Est_Veiculo
drop table Est_Estaciona


-- B) Inserir 5 registros em cada tabela;

insert into Est_Cliente values('44548632196', 'Marcos', '12/06/2000');
insert into Est_Cliente values('45548682136', 'Clóvis', '12/10/2001');
insert into Est_Cliente values('55247921833', 'Elisa', '12/06/1980');
insert into Est_Cliente values('21396615783', 'Mika', '09/01/2000');
insert into Est_Cliente values('11940028922', 'João', '12/06/2000');

insert into Est_Modelo values(1, 'Fusca');
insert into Est_Modelo values(25, 'Gol');
insert into Est_Modelo values(98, 'Uno');
insert into Est_Modelo values(36, 'Celta');
insert into Est_Modelo values(11, 'Pálio');

insert into Est_Patio values(1, 'Rua Pedro Leite', 50);
insert into Est_Patio values(10, 'Rua Dom Pedro II', 50);
insert into Est_Patio values(51, 'Rua João da Silva Pinto', 50);
insert into Est_Patio values(62, 'Rua José de almada', 50);
insert into Est_Patio values(65, 'Rua José Ribeiro Ramos', 50);

insert into Est_Veiculo values('FXR-9915', '44548632196', 1, 'Rosa', 2021);
insert into Est_Veiculo values('JJJ-2020', '45548682136', 25, 'Verde', 1999);
insert into Est_Veiculo values('JEX-1010', '55247921833', 98, 'Preto', 2000);
insert into Est_Veiculo values('PIU-9825', '21396615783', 36, 'Amarelo', 2005);
insert into Est_Veiculo values('PCC-1993', '11940028922', 11, 'Vermelho', 2015);

insert into Est_Estaciona values( 1, 1, 'FXR-9915', '17/03/2022', '17/03/2022', '11:23', '14:00');
insert into Est_Estaciona values( 2, 10, 'JJJ-2020', '23/10/2022', '13/11/2022', '05:00', '22:41');
insert into Est_Estaciona values( 3, 51, 'JEX-1010', '17/03/2020', '21/01/2021', '23:11', '00:14');
insert into Est_Estaciona values( 4, 62, 'PIU-9825', '18/06/2022', '18/06/2022', '10:23', '01:23');
insert into Est_Estaciona values( 5, 65, 'PCC-1993', '01/09/2022', '15/11/2022', '11:23', '14:00');


-- C) Exiba a placa e o nome do dono de todos os veículos;

Select Est_Veiculo.Placa , Est_Cliente.Nome
from Est_Cliente inner join Est_Veiculo
on Est_Cliente.CPF = Cliente_CPF
where Est_Veiculo.Placa = "Placa";

--d) Exiba o CPF e o nome do cliente que possui o veículo de placa JJJ-2020

Select Est_Veiculo.Placa , Est_Cliente.Nome,Est_Cliente.CPF
from Est_Cliente inner join Est_Veiculo
on Est_Cliente.CPF = Cliente_CPF
where Est_Veiculo.Placa = 'JJJ-2020';

--e) Exiba a placa e a cor do veículo que possui o código de estacionamento 1;


Select Est_Veiculo.Placa , Est_Veiculo.Cor,Est_Estaciona.Codigo
from Est_Veiculo inner join Est_Estaciona
on Est_Veiculo.Placa = Placa_Veic
where Est_Estaciona.Codigo = '1';

--f) Exiba a placa e o ano do veículo que possui o código de estacionamento 1;

Select Est_Veiculo.Placa , Est_Veiculo.Ano,Est_Estaciona.Codigo
from Est_Veiculo inner join Est_Estaciona
on Est_Veiculo.Placa = Placa_Veic
where Est_Estaciona.Codigo = '1';


--g) Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000;

Select Est_Veiculo.Placa , Est_Veiculo.Ano,Est_Modelo.Descr
from Est_Veiculo inner join Est_Modelo
on Est_Veiculo.Modelo = CodMod
where Est_Veiculo.Ano > 2000;

--h) Exiba o endereço, data de entrada e de saída dos estacionamentos do veiculo de placa "JEX-1010";

select Est_Estaciona.Data_entr, Est_Patio.Ender, Est_Estaciona.Data_saida
from Est_Patio inner join Est_Estaciona
on Est_Patio.Num = Patio_num
where Est_Estaciona.Placa_Veic = 'JEX-1010';

--i) Exiba a quantidade de vezes os veículos de cor verde estacionaram.

 select count (*) as 'Quantidade' from Est_Veiculo where Cor = 'Verde';

 -- j) Liste todos os clientes que possuem carro de modelo 1

 select Est_Cliente.Nome, Est_Veiculo.Modelo
 from Est_Cliente inner join Est_Veiculo
 on Est_Cliente.CPF = Cliente_CPF
 where Est_Veiculo.Modelo = '1';

 --k) Liste as placas, os horários de entrada e saída dos veículos de cor verde;

 select Est_Estaciona.Placa_Veic ,Est_Estaciona.Hora_entr, Est_Estaciona.Hora_saida
 from Est_Estaciona inner join Est_Veiculo
 on Est_Veiculo.Placa = Placa_Veic
 where Est_Veiculo.Cor = 'Verde';

 -- l) Liste todos os estacionamentos do veículo de placa “JJJ-2020”

 select count(*) as 'Quantidade de Estacionamento' from Est_Estaciona where Placa_Veic = 'JJJ-2020';

--m) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2

 select Est_Estaciona.Codigo, Est_Cliente.Nome
 from Est_Veiculo inner join Est_Estaciona
 on Est_Veiculo.Placa = Placa_Veic
inner join Est_Cliente
on Est_Cliente.CPF = Est_Veiculo.Cliente_CPF 
where Codigo = '2';

--n) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3;
 select Est_Estaciona.Codigo ,Est_Veiculo.Cliente_CPF
 from Est_Veiculo inner join Est_Estaciona
 on Est_Veiculo.Placa = Placa_Veic
inner join Est_Cliente
on Est_Cliente.CPF = Est_Veiculo.Cliente_CPF 
where Codigo = '3';

--o) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2;

 select Est_Estaciona.Codigo, Est_Modelo.Descr
 from Est_Veiculo inner join Est_Estaciona
 on Est_Veiculo.Placa = Placa_Veic
inner join Est_Modelo
on Est_Modelo.CodMod = Est_Veiculo.Modelo 
where Codigo = '2';

--p) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos;

select Est_Cliente.Nome, Est_Modelo.Descr, Est_Veiculo.Placa
from Est_Veiculo inner join Est_Modelo
on Est_Veiculo.Modelo = CodMod
inner join Est_Cliente
on Est_Veiculo.Cliente_CPF = CPF

--q) Selecionar todos os clientes com nome iniciado por 'João';

select * from Est_Cliente where Nome like 'João%';

--r) Selecionar as cores de veículos sem duplicidade;

Select Distinct Cor from Est_Veiculo;


--s) Quantos veículos com ano maior que 2020 temos no cadastro?

select count(*) as 'Veículo com ano acima de 2020' from Est_Veiculo where Ano > 2020;

