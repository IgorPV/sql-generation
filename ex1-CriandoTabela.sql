use db_rh_exercicio1;

create table Funcionarios (
id integer(4) auto_increment,
nome varchar(50) not null,
cargo varchar(50) not null,
salario float(5),
primary key (id)
);
