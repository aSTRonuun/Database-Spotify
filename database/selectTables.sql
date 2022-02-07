/* Musicas */
select * from musica;
select * from artista;
select * from album;
select * from turne;

/* Podcast */ 
select * from episodio;
select * from podcast;
select * from podcaster;

/* Geral */
select * from biblioteca;
select * from ouvinte;
select * from playlist;
select * from audio_playlist;

/* Buscar por músicas em uma playlist da biblioteca, separando elas por gênero */
select m.genero, count(m), trunc(avg(m.duracao), 2)
from ouvinte as o
inner join biblioteca as b on b.id_user = o.id_user
inner join biblioteca_playlist as bp on b.id_biblioteca = bp.id_biblioteca
inner join playlist as p on p.id_playlist = bp.id_playlist
inner join audio_playlist as ap on ap.id_playlist = p.id_playlist
inner join musica as m on m.id_musica = ap.id_musica
where o.id_user = 1 and p.id_playlist = 1
group by m.genero
having avg(m.duracao) > 2;

/*  Buscar por informações de artistas com turnes depois de certa data, e com uma restrição de ouvintes */
select * from artista as a
full outer join turne as t on a.id_artista = t.id_artista
where exists(
	select data from turne 
	where data > '25-03-2022'
) and a.qtd_ouvintes = any(
	select qtd_ouvintes from artista
	where qtd_ouvintes > 10000 and qtd_ouvintes < 8000000
);


/* Selecionar os podcasts e seus respectivos episodios de uma biblioteca */
create view viewPodcasts as 
(select o.id_user, p.podcastName, podcaster.name, p.podcastDescription, podcaster.qtd_ouvintes, e.titulo, e.duracao, e.descricao from biblioteca as b 
join ouvinte as o on o.id_user = b.id_user
join biblioteca_podcast as bp on bp.id_biblioteca = b.id_biblioteca
join podcast as p on p.id_podcast = bp.id_podcast
join podcaster on podcaster.id_podcaster = p.id_podcaster
join episodio as e on e.id_podcast = p.id_podcast
where exists(
	select e.duracao from podcast
	join episodio on p.id_podcast = e.id_podcast
	where e.duracao > 0.5 and e.duracao <= 1
));

/*Ver álbuns de artista da biblioteca de um ouvinte */
select ar.nome, a.titulo, a.qtd_musica, a.duracao_total from ouvinte as o 
join biblioteca as b on b.id_user = o.id_user
join biblioteca_album as ba on ba.id_biblioteca = b.id_biblioteca
join album as a on a.id_album = ba.id_album
join artista as ar on ar.id_artista = a.id_artista
where exists(
	select a.qtd_musica from album
	where a.qtd_musica = 1
);

/*  Buscar por nomes artistas com musicas de um determinado genero */
SELECT A.nome
FROM Artista as A
WHERE exists (
	SELECT *
	FROM Album as Al, Musica as M
	WHERE A.id_artista = Al.id_artista and Al.id_album = M.id_album and M.genero = 'Pop'
)

/* Dado um ouvinte, buscar por todas as playlists que estao em sua biblioteca */
create materialized view viewPlaylist as
(SELECT O.id_user, P.id_playlist, P.descricao, P.duracao_total, P.curtidas
FROM Ouvinte as O
	INNER JOIN Biblioteca as B
	ON B.id_user = O.id_user
	INNER JOIN Biblioteca_playlist as BP
	ON B.id_biblioteca = BP.id_biblioteca
	INNER JOIN Playlist as P
	ON BP.id_playlist = P.id_playlist) with data;