create table turne(
	id_turne serial primary key,
	data date,
	descricao varchar(100),
	id_artista integer
);

create table artista(
	id_artista serial primary key,
	sobre varchar(100),
	nome varchar(50),
	qtd_ouvintes integer,
	id_biblioteca integer
);

alter table turne add constraint fk_id_artista 
foreign key(id_artista) references artista(id_artista);
