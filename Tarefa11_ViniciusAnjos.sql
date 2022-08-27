-- a) Criar tabelas e Relacionamentos
Create table Alunos (
RM int not null,
Nome char(45),
Curso int,
Série int,
Periodo char(20));

Alter Table Alunos
ADD Constraint PK_RM Primary Key(RM);

Create Table Notas(
RM int not null,
Discipl int not null,
Nota1 numeric(10,2),
Nota2 numeric(10,2));

Alter Table Notas
ADD Constraint PK_Discipl Primary Key(Discipl);

Alter Table Notas
ADD Constraint FK_RM Foreign Key(RM)
References Alunos(RM);

Create table Cursos(
Codcurso int not null,
Nome char(20));

Alter Table Cursos
ADD Constraint PK_Codcurso Primary Key(Codcurso);

Create Table Disciplinas(
Codisc int not null,
Nome Char(20));

Alter Table Disciplinas
ADD Constraint PK_Codisc Primary Key(Codisc);

Select * from Alunos;
Select * from Notas;
Select * from Cursos;
Select * from Disciplinas;

Drop Table Alunos;
Drop Table Notas;
Drop Table Cursos;
Drop Table Disciplinas;

-- b) Inserir 5 registros em cada tabela

insert into Alunos values
(21070721,'William',2,1,'Tarde');
insert into Alunos values
(30319090,'Vinicius',3,3,'Manhã');
insert into Alunos values
(69679094,'João',1,2,'Noite');
insert into Alunos values
(14184032,'Marcones',4,4,'Noite');
insert into Alunos values
(87879092,'Larissa',5,5,'Tarde');


insert into Notas values
(21070721,1,8,10);
insert into Notas values
(30319090,3,9,9);
insert into Notas values
(69679094,2,9,7);
insert into Notas values
(14184032,4,0,0);
insert into Notas values
(87879092,5,4,9);


insert into Cursos values
(1,'DSM');
insert into Cursos values
(2,'Plástico');
insert into Cursos values
(3,'Logistica');
insert into Cursos values
(4,'Arquitetura');
insert into Cursos values
(5,'TI');


insert into Disciplinas values
(1,'Design Digital');
insert into Disciplinas values
(2,'Programação');
insert into Disciplinas values
(3,'Matemática');
insert into Disciplinas values
(4,'LPII');
insert into Disciplinas values
(5,'Inglês');


-- c) Selecionar nome, período e série de todos os alunos do curso de informática;

select Alunos.Nome, Alunos.Periodo, Alunos.Série, Alunos.Curso, Cursos.Nome
from Alunos inner join Cursos
on Alunos.Curso = Codcurso
where Cursos.Nome = 'TI';


-- d) Selecionar Nome do aluno, curso, nome da disciplina, nota1 e nota2, de todos os alunos.

select Alunos.Nome, Cursos.Nome, Disciplinas.Nome, Notas.Nota1, Notas.Nota2
from Alunos inner join Cursos
on Cursos.Codcurso = Curso
inner join Notas
on Notas.RM = Alunos.RM
inner join Disciplinas
on Disciplinas.Codisc = Discipl

-- e) Selecionar todas as notas do aluno (Seu nome).

select Alunos.Nome, Notas.Nota1, Notas.Nota2
From Alunos inner join Notas
on Notas.RM = Alunos.RM
Where Nome = 'Larissa'


--f) Selecionar RM, nome e curso de todos os alunos com nota1 superior a 8 na disciplina Matemática;


select Alunos.RM, Alunos.Nome, Cursos.Nome, Notas.Nota1, Disciplinas.Nome
From Alunos inner join Cursos
on Alunos.Curso = Codcurso
inner join Notas
on Alunos.RM = Notas.RM
Inner join Disciplinas
on Disciplinas.Codisc = Notas.Discipl
where Notas.Nota1 > 8 and Disciplinas.Nome = 'Matemática';


--g) Quantas notas (nota1) inferior a 6,0, em Banco de Dados, temos no Cadastro de Notas?

select count(*) as 'Quantidade de notas inferior a 6' from Notas where Nota1 < 6;

--h) Qual a média de Notas (Nota2) na disciplina LPII? 

select avg(Nota2) as 'média de notas' from Notas where Discipl = '4';

--i) Quantos alunos temos no curso de Informática?

select count(Nome) as 'Quantidade de alunos TI' from Alunos where Curso = 5;

-- J) Quantos alunos temos no curso de Plástico?

select count(Nome) as 'Quantidade de alunos no curso Plástico' from Alunos where Curso = 2;

-- k) Selecionar todos os alunos que não possuem Nota1.

select Alunos.Nome, Notas.Nota1
from Alunos inner join Notas
on Notas.RM = Alunos.RM
where Nota1 = '0';

-- l) Selecionar todos os alunos que não possuem Nota2.

select Alunos.Nome, Notas.Nota2
from Alunos inner join Notas
on Notas.RM = Alunos.RM
where Nota2 = '0';

-- m) Selecionar todos os alunos que não possuem Nota1 em Matemática.


select Alunos.Nome, Notas.Nota1, Disciplinas.Nome
from Alunos inner join Notas
on Notas.RM = Alunos.RM
inner join Disciplinas
on Disciplinas.Codisc = Notas.Discipl
where Nota1 = '0' and Disciplinas.Nome = 'Matemática';
