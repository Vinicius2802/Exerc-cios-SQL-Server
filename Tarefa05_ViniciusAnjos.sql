-- Criar a tabela EMPREGADOS 

Create Table EMPREGADOS
(MATR char(6) not null,
NOME Varchar(12),
SOBRENOME Varchar(15),
DEPT Char(12),
FONE Varchar(14),
DATA_ADM Datetime,
CARGO Char(12),
SEXO Char(1),
IDADE Int,
SALARIO Numeric(10,2),
COMISSAO Numeric(10,2));

select * from EMPREGADOS 

Alter Table EMPREGADOS
ADD Constraint PK_MATR Primary Key Clustered(MATR);


--Inserir 10 registros

select * from EMPREGADOS 

Insert into EMPREGADOS values
(01352, 'william' , 'fraga' , 'TI' , '11 970415085', '17/03/2015' , 'Gerente' , 'M' , '21' , 12523, 1500);

Insert into EMPREGADOS values
(01612, 'Matheus' , 'Marques' , 'TI' , '11 970123085', '01/06/2010' , 'Gerente' , 'M' , '30' , 20523, 2500);

Insert into EMPREGADOS values
(21352, 'Vinicius' , 'Bentos' , 'TI' , '11 976455085', '19/05/2012' , 'Analista' , 'M' , '45' , 1550, 100);

Insert into EMPREGADOS values
(91252, 'João' , 'Santos' , 'Marketing' , '11 970418535', '6/03/2019' , 'BI/dados' , 'M' , '42' , 6020, 600);

Insert into EMPREGADOS values
(012, 'Maria' , 'Luisa' , 'VENDAS' , '11 970099085', '29/05/2017' , 'Analista' , 'F' , '32' , 1520, 100);

Insert into EMPREGADOS values
(0290, 'Carlos' , 'Sousa' , 'TI' , '11 970005085', '17/08/2013' , 'Programador' , 'M' , '25' , 2500, 300);

Insert into EMPREGADOS values
(0129, 'Marcos' , 'Cardoso' , 'Marketing' , '11 977675085', '26/09/2015' , 'Estagiario' , 'M' , '34' , 900, 20);

Insert into EMPREGADOS values
(01992, 'Charlene' , 'Silva' , 'TI' , '11 971005085', '3/05/2010' , 'Programador' , 'F' , '37' , 18022, 1250);

Insert into EMPREGADOS values
(0902, 'Ivan' , 'Soares' , 'VENDAS' , '11 970418505', '25/07/2020' , 'Executivo VD' , 'M' , '19' , 9000, 700);

Insert into EMPREGADOS values
(052, 'Julios' , 'Silva' , 'TI' , '11 970888085', '30/10/2019' , 'Programador' , 'M' , '39' , 20023, 2500);


-- c) Selecionar o sobrenome, primeiro nome, departamento,data de admissão e salário de todos os empregados que ganham mais que R$ 5000.

SELECT SOBRENOME, NOME, DEPT, DATA_ADM, SALARIO FROM EMPREGADOS
WHERE SALARIO > 5000


-- d) Qual a média de salários dos funcionários?

Select * from EMPREGADOS 
Select avg(SALARIO) as 'Media' from EMPREGADOS;

-- e) Quantos funcionários pertencem ao departamento de TI?

Select * From EMPREGADOS
Select Count(DEPT) as 'TI' From EMPREGADOS Where DEPT = 'TI';

-- f) Quantos funcionários temos com cargo igual a programador?

Select * From EMPREGADOS
Select Count(CARGO) as 'PROGRAMADOR' From EMPREGADOS Where CARGO = 'Programador';

-- g) Qual o somatório dos salários?

Select * from EMPREGADOS
select Sum(SALARIO) as 'Soma dos salários' From EMPREGADOS;

-- h) Qual o valor do maior salário?

Select * From EMPREGADOS
Select Max(SALARIO) as 'Maior salário' From EMPREGADOS;

-- i) Qual o valor do menor salário?

Select * From EMPREGADOS
Select Min(SALARIO) as 'Menor salário' From EMPREGADOS;

-- j) Atribuir um aumento de 5% aos funcionários de departamento de TI?

Select * From EMPREGADOS 
UPDATE EMPREGADOS Set SALARIO = SALARIO * 0.5 + SALARIO Where (DEPT) = 'TI';
Select NOME , SOBRENOME , DEPT CARGO , SALARIO From EMPREGADOS Where DEPT = 'TI'; 

-- k) Selecionar os cargos (sem duplicidade).

Select * From EMPREGADOS
Select Distinct CARGO From EMPREGADOS;

-- l) Selecionar os funcionários com idade entre 30 e 40 anos(inclusive).

Select * From EMPREGADOS
Select * From EMPREGADOS Where IDADE >=30 and IDADE <= 40;

-- m) Qual a média de idades?

Select * From EMPREGADOS
Select avg(IDADE) as 'Média_Idades' from EMPREGADOS;

-- n) Selecionar todos os funcionários com idade entre 20 e 30 anos(inclusive) do departamento de TI.

Select * From EMPREGADOS
Select * From EMPREGADOS Where IDADE >=20 and IDADE <=30 and DEPT = 'TI';

-- o) Selecionar todos os funcionários cujo nome inicia-se pela letra 'J'.

Select * From EMPREGADOS
Select * From EMPREGADOS Where NOME like 'J%';

-- p) Selecionar todos os fucionários dos departamentos de TI, Vendas, Marketing.

Select * From EMPREGADOS Where DEPT = 'TI' or DEPT = 'VENDAS' or DEPT = 'Marketing';





Drop Table EMPREGADOS


