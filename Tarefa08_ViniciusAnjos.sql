-- a) Criar as seguintes tabelas:

CREATE TABLE Clientes(
Codcli int not null,
Nome varchar (30),
Ender varchar (40),
Bairro varchar (20),
Cidade varchar (20),
Idade int);

Alter Table Clientes
ADD Constraint PK_Codcli Primary Key(Codcli);

CREATE TABLE Produtos (
Codprod int not null,
Descricão varchar (20),
Preco numeric (9,2));

Alter Table Produtos
ADD Constraint PK_Codprod Primary Key(Codprod);

CREATE TABLE Pedidos (
Codped int not null,
Codcli int not null,
Data datetime);

Alter Table Pedidos
ADD Constraint PK_Codped Primary Key(Codped);

Alter Table Pedidos
ADD Constraint FK_Codcli Foreign Key(Codcli)
References Clientes(Codcli);

CREATE TABLE Itens_Pedidos(
Codped int,
codprod int,
Qtde int);

Alter Table Itens_Pedidos 
ADD Constraint FK_Codped Foreign Key(Codped)
References Pedidos(Codped);

Alter Table Itens_Pedidos 
ADD Constraint FK_Codprod Foreign Key(Codprod)
References Produtos(Codprod);

Select * From Clientes;
Select * From Produtos;
Select * From Pedidos;
Select * From Itens_Pedidos;



Drop Table Clientes
Drop Table Produtos
Drop Table Pedidos
Drop table Itens_Pedidos

-- b) Inserir 5 registros em cada tabela.


Insert into Clientes values
(1,'william','Av Irecê','Guarapiranga','São Paulo',21);
Insert into Clientes values
(2,'João','Av Matheus','Mauá','São Paulo',19);
Insert into Clientes values
(3,'Alice','AV Paulo Abreu','Paulista','São Paulo',35);
Insert into Clientes values
(4,'Alceu','Rua 21 de maio','Centro','São Paulo',80);
Insert into Clientes values
(5,'Larissa','Mourão','Capão Redondo','São Paulo',30);

Insert into Produtos values
(1,'Maçã',5.20);
Insert into Produtos values
(2,'Batata',10.42);
Insert into Produtos values
(3,'Banana',7.75);
Insert into Produtos values
(4,'Melão',25.10);
Insert into Produtos values
(5,'Uva',10.00);

Insert into Pedidos values
(1,1,'10/02/2022');
Insert into Pedidos values
(2,2,'30/5/2000');
Insert into Pedidos values
(3,3,'2/6/2020');
Insert into Pedidos values
(4,4,'25/7/2009');
Insert into Pedidos values
(5,5,'29/9/2011');

Insert into Itens_Pedidos values
(1,1,8);
Insert into Itens_Pedidos values
(2,2,7);
Insert into Itens_Pedidos values
(3,3,1);
Insert into Itens_Pedidos values
(4,4,2);
Insert into Itens_Pedidos values
(5,5,10);

--C) Selecionar todos os produtos com preço entre 10 e 70.

Select * From Produtos Where Preco >= 10 and Preco <= 70;

--D) Qual a média de idade dos clientes?

select AVG(idade) from Clientes;

-- E) Qual é a média de preços dos produtos?

select AVG(Preco) from Produtos;

-- F) Quantos pedidos temos no cadastro?

select count (*) as 'Quantidade' from Pedidos;

-- G)Selecionar todos os clientes que moram em Santo André, SBC, SBS ou Mauá.

select * from Clientes where Bairro = 'Santo André' or Bairro = 'SBC' or Bairro = 'SBS' or Bairro = 'Mauá';

-- H)Selecionar todas as cidades onde temos clientes, sem repetição.

Select Distinct Cidade from Clientes;

-- i) Selecionar todos os produtos com preço acima da média.

Select * From Produtos Where Preco > (Select avg(Preco) From Produtos);

-- j) Reajustar o preço de todos os produtos com 10% de aumento.

Select * From Produtos 
UPDATE Produtos Set Preco = Preco * 0.1 + Preco;

-- k) Quantos itens tem o Pedido do código 01?

Select Qtde From Itens_Pedidos Where Codped Like '1';

-- l) Quantos pedidos temos na data mais recente?

Select Count(*) as 'Qtde de pedidos mais recentes' From Pedidos Where Data = (Select Max(Data) From Pedidos);

-- m) Adicionar o atributo Qtde_estq na tabela produtos.

Alter Table Produtos 
ADD Qtde_estq Int null;

--n) Alterar os registros adicionando quantidade em estoque de cada produto, um valor para cada código

Update Produtos set Qtde_estq = '200'where Codprod = '1';
Update Produtos set Qtde_estq = '300'where Codprod = '2';
Update Produtos set Qtde_estq = '100'where Codprod = '3';
Update Produtos set Qtde_estq = '20'where Codprod = '4';
Update Produtos set Qtde_estq = '512'where Codprod = '5';

-- o) Selecionar os clientes com nome iniciado pela letra 'A'.

Select Nome From Clientes Where Nome Like 'A%';