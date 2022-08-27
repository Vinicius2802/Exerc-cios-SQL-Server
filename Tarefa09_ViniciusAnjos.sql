
--Criar a tabela Produtos;

Create Table Clientes
(CodCli int not null,
Nome varchar (30),
Endereço varchar (40),
Cidade varchar (30),
Fone char (9),
Idade int);

alter table Clientes
add constraint PK_CodCli primary key (CodCli);



Create Table Transportadora
(Codigo int not null,
Nome varchar (20));

alter table Transportadora
add constraint PK_Codigo primary key (Codigo);



Create Table Pedidos
(NumPed integer primary key,
Cliente int,
Data_Entrega datetime,
TransPort int);

alter table Pedidos
add constraint FK_Cliente foreign key (Cliente)
references Clientes(CodCli);

alter table Pedidos
add constraint FK_TransPort foreign key (TransPort)
references Transportadora(Codigo)

Select * From Clientes
Select * From Transportadora
Select * From Pedidos


drop table Clientes
drop table Transportadora
drop table Pedidos

-- b) Inserir 5 registros em cada tabela.

Insert into Clientes values
(1,'William','Av Irecê','São Paulo',970415085,21);
Insert into Clientes values
(2,'João','Av Matheus','ABC',972516778,19);
Insert into Clientes values
(3,'Vinicius','AV Paulo Abreu','Maua',004199993,35);
Insert into Clientes values
(4,'Carlos','Rua 21 de maio','SBC',877244509,80);
Insert into Clientes values
(5,'Larissa','Mourão','São Paulo',142236659,30);



insert into Transportadora values
(1,'Loggi');
insert into Transportadora values
(2,'JadLoggi');
insert into Transportadora values
(3,'Correios');
insert into Transportadora values
(4,'Sedex');
insert into Transportadora values
(5,'ABC');


insert into Pedidos values
(1,3,'19/06/2022',1);
insert into Pedidos values
(2,3,'19/06/2022',4);
insert into Pedidos values
(3,1,'6/04/2022',2);
insert into Pedidos values
(4,5,'25/12/2023',3);
insert into Pedidos values
(5,4,'1/4/2010',5);
insert into Pedidos values
(6,4,'1/5/2019',5);
insert into Pedidos values
(7,1,'1/4/2021',4);
insert into Pedidos values
(8,5,'1/4/2015',5);
insert into Pedidos values
(9,3,'1/4/2007',1);

--c) Selecionar todos os pedidos da transportadora ABC.

select * from Pedidos where TransPort = '5';

--d) Quantos pedidos existem para o cliente 2? 

select Cliente from Pedidos where NumPed like '2';

--e) Qual o número do Pedido mais recente? 

SELECT MAX(Data_Entrega)
FROM pedidos

--f) Temos quantos pedidos para a Transportadora ABC? 

select * from Pedidos where TransPort = '5';

--g) Quantos Clientes residem em Mauá? 

select * from Clientes where Cidade = 'Maua';

-- h) Selecionar Número do Pedido, Data_Entrega e Nome do Cliente. 

select Pedidos.NumPed, Pedidos.Data_Entrega, Clientes.Nome 
from Pedidos inner join Clientes
on Clientes.CodCli = Pedidos.Cliente;

-- J) Selecionar todos os clientes da cidade de Santo André, Mauá e SBC.

select * from Clientes where Cidade = 'Maua' or Cidade = 'Santo André' or Cidade = 'SBC';

-- k) Selecionar as cidades que possuem clientes, sem duplicidade.

Select Distinct Cidade from Clientes;

-- l) Qual a média de idade dos clientes?

select avg(Idade) as 'média idade' from Clientes;

-- m) Selecionar todos os clientes (todos os atributos) que possuem idade abaixo da média.

Select * From Clientes Where Idade < (Select avg(Idade) From clientes); 

-- n) Quantos clientes possuem idade acima da média?

select count(*) as 'Acima da média ' from clientes where Idade > (select avg(Idade) from clientes);
