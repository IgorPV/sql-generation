use db_escola_ex3;

create table aluno(

id int(4) auto_increment,
nome varchar(50) not null,
ano int(2),
idade int(2),
nota decimal(2),
primary key(id)

);