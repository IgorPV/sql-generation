use db_ecommerce_ex2;
create table produtos(
id int(3) auto_increment,
nome varchar(50) not null,
marca varchar(50) not null,
preço float(5),
primary key(id)
);