create table turne(
	id_turne serial primary key,
	data date,
	descricao varchar(100)
);

alter table turne add column id_artista integer;
alter table turne add constraint fk_id_artista foreign key(id_artista)
references artista(id_artista);

create table artista(
	id_artista serial primary key,
	sobre varchar(100),
	id_turne integer references turne(id_turne),
	nome varchar(50),
	qtd_ouvintes integer
)

alter table artista drop column id_turne;

create table album(
	id_album serial primary key,
	qtd_musica serial,
	titulo varchar(50),
	duracao_total numeric,
	descricao varchar(100),
	id_artista integer references artista(id_artista)
);

alter table album add id_musica integer;
alter table album add constraint fk_id_musica foreign key(id_musica)
references musica(id_musica);

create table artistas_musica(
	id_artistas_musicas serial primary key,
	nome_artista varchar(50)
);

drop table artistas_musica;

create table musica(
	id_musica serial primary key,
	titulo varchar(50),
	duracao numeric,
	genero varchar(20),
	id_album integer references album(id_album),
	id_artista_musicas integer references artistas_musica(id_artistas_musicas)
);

alter table musica drop column id_artista_musicas;
alter table musica add column id_artista integer; 
alter table musica add constraint fk_id_artista foreign key(id_artista)
references artista(id_artista);

create table podcaster(
	id_podcaster serial primary key,
	name varchar(50),
	qtd_ouvintes int
);

create table podcast(
	id_podcast serial primary key,
	descricao varchar(150),
	titulo varchar(50),
	id_episodio integer,
	id_podcaster integer references podcaster(id_podcaster)
);

alter table podcast drop column id_episodio; 
alter table podcast add constraint fk_id_episodio
foreign key(id_episodio) references episodio(id_episodio);

create table episodio(
	id_episodio serial primary key,
	descricao varchar(150),
	duracao numeric,
	lancando_em date,
	titulo varchar(50),
	id_podcast integer references podcast(id_podcast)
);

alter table episodio rename column lancando_em to lancado_em;
alter table episodio alter column lancado_em type timestamp;

create table audio_playlist(
	id_playlist serial primary key,
	adicionado_em date,
	id_musica integer references musica(id_musica),
	id_episodio integer references episodio(id_episodio)
);

alter table audio_playlist alter column adicionado_em type timestamp;

create table playlist(
	id_playlist serial primary key,
	descricao varchar(100),
	autor varchar(50),
	duracao_total numeric,
	curtidas integer,
	qtd_musicas integer,
	id_audio_playlist integer references audio_playlist(id_playlist)
);

create table biblioteca(
	id_biblioteca serial primary key,
	qtd_podcasts integer,
	qtd_playlist integer,
	qtd_albuns integer,
	id_album integer references album(id_album),
	id_playlist integer references playlist(id_playlist),
	id_podcast integer references podcast(id_podcast),
	id_artistas integer references artista(id_artista)
);

create table ouvintes(
	id_user serial primary key,
	nome varchar(50),
	tipo_conta boolean,
	email varchar(50),
	senha varchar(50),
	data_nasc date,
	pais varchar(50),
	id_biblioteca integer references biblioteca(id_biblioteca)
);
