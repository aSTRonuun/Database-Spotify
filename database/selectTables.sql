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
from biblioteca as b
inner join ouvinte as o on b.id_user = o.id_user
inner join biblioteca_playlist as bp on b.id_biblioteca = bp.id_biblioteca
inner join playlist as p on p.id_playlist = bp.id_playlist
inner join audio_playlist as ap on ap.id_playlist = p.id_playlist
inner join musica as m on m.id_musica = ap.id_musica
where b.id_biblioteca = 1 and p.id_playlist = 1
group by m.genero
having avg(m.duracao) > 2;

/*  Buscar por nomes artistas com musicas de um determinado genero */
SELECT A.nome
FROM Artista as A
WHERE exists (
	SELECT *
	FROM Album as Al, Musica as M
	WHERE A.id_artista = Al.id_artista and Al.id_album = M.id_album and M.genero = 'pop'
)

/*  Buscar por informações de artistas com turnes depois de certa data, e com uma restrição de ouvintes */
sselect * from artista as a
full outer join turne as t on a.id_artista = t.id_artista
where exists(
	select data from turne 
	where data > '25-03-2022'
) and a.qtd_ouvintes = any(
	select qtd_ouvintes from artista
	where qtd_ouvintes > 10000 and qtd_ouvintes < 8000000
);

/* Dado um ouvinte, buscar por todas as playlists que estao em sua biblioteca */
SELECT P.id_playlist, P.descricao, P.duracao_total, P.curtidas
FROM Ouvinte as O
	INNER JOIN Biblioteca as B
	ON B.id_user = O.id_user
	INNER JOIN Biblioteca_playlist as BP
	ON B.id_biblioteca = BP.id_biblioteca
	INNER JOIN Playlist as P
	ON BP.id_playlist = P.id_playlist
WHERE O.id_user = 1

/* Selecionar os podcasts e seus respectivos episodios de uma biblioteca */
select p.titulo, podcaster.name, p.descricao, podcaster.qtd_ouvintes, e.titulo, e.duracao, e.descricao from biblioteca as b 
join ouvinte as o on o.id_user = b.id_user
join biblioteca_podcast as bp on bp.id_biblioteca = b.id_biblioteca
join podcast as p on p.id_podcast = bp.id_podcast
join podcaster on podcaster.id_podcaster = p.id_podcaster
join episodio as e on e.id_podcast = p.id_podcast
where exists(
	select e.duracao from podcast
	join episodio on p.id_podcast = e.id_podcast
	where e.duracao > 0.5 and e.duracao <= 1
)and b.id_biblioteca = 1;

