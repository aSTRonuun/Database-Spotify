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

create table biblioteca(
	id_biblioteca serial primary key,
	qtd_podcasts integer,
	qtd_playlist integer,
	qtd_albuns integer
);

alter table artista add constraint fk_id_biblioteca 
foreign key(id_biblioteca) references biblioteca(id_biblioteca);

create table album(
	id_album serial primary key,
	qtd_musica integer,
	titulo varchar(50),
	duracao_total numeric,
	descricao varchar(100),
	id_artista integer references artista(id_artista),
	id_biblioteca integer references biblioteca(id_biblioteca)
);

create table musica(
	id_musica serial primary key,
	titulo varchar(50),
	duracao numeric,
	genero varchar(20),
	id_album integer references album(id_album),
	id_artista integer references artista(id_artista)
);

create table playlist(
	id_playlist serial primary key,
	descricao varchar(100),
	autor varchar(50),
	duracao_total numeric,
	curtidas integer,
	qtd_musicas integer,
	id_biblioteca integer references biblioteca(id_biblioteca)
);

create table audio_playlist(
	id_audio_playlist serial primary key,
	adicionado_em date,
	id_playlist integer references playlist(id_playlist),
	id_musica integer references musica(id_musica),
	id_episodio integer
);

create table podcaster(
	id_podcaster serial primary key,
	name varchar(50),
	qtd_ouvintes int
);

create table podcast(
	id_podcast serial primary key,
	descricao varchar(150),
	titulo varchar(50),
	id_biblioteca integer references biblioteca(id_biblioteca),
	id_podcaster integer references podcaster(id_podcaster)
);

create table episodio(
	id_episodio serial primary key,
	descricao varchar(150),
	duracao numeric,
	lancando_em date,
	titulo varchar(50),
	id_podcast integer references podcast(id_podcast)
);

alter table audio_playlist add constraint fk_id_episodio
foreign key(id_episodio) references episodio(id_episodio);

create table ouvinte(
	id_user serial primary key,
	nome varchar(50),
	tipo_conta boolean,
	email varchar(50),
	senha varchar(50),
	data_nasc date,
	pais varchar(50),
	id_biblioteca integer references biblioteca(id_biblioteca)
);
