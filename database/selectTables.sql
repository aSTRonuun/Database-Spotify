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
select * from biblioteca_playlist;

/* Buscar por músicas em uma playlist da biblioteca, separando elas por gênero */
select musica.genero, count(musica), trunc(avg(musica.duracao), 2)
from biblioteca 
inner join playlist on biblioteca.id_biblioteca = playlist.id_biblioteca
inner join audio_playlist on audio_playlist.id_playlist = playlist.id_playlist
inner join musica on musica.id_musica = audio_playlist.id_musica
where playlist.id_playlist = 1
group by musica.genero
having avg(musica.duracao) > 3;

/*  Buscar por nomes artistas com musicas de um determinado genero */
SELECT A.nome
FROM Artista as A
WHERE exists (
	SELECT *
	FROM Album as Al, Musica as M
	WHERE A.id_artista = Al.id_artista and Al.id_album = M.id_album and M.genero = 'pop'
)

/*  Buscar por informações de artistas com turnes depois de certa data, e com uma restrição de ouvintes */
select * from artista as a
full outer join turne as t on a.id_artista = t.id_artista
where exists(
	select data from turne 
	where data > '25-03-2022'
) and a.qtd_ouvintes >= any(
	select qtd_ouvintes from artista
	where qtd_ouvintes > 0 and qtd_ouvintes < 200
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

