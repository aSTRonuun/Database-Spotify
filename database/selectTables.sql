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


select musica.genero, count(musica), trunc(avg(musica.duracao), 2)
from biblioteca 
inner join playlist on biblioteca.id_biblioteca = playlist.id_biblioteca
inner join audio_playlist on audio_playlist.id_playlist = playlist.id_playlist
inner join musica on musica.id_musica = audio_playlist.id_musica
where playlist.id_playlist = 1
group by musica.genero
having avg(musica.duracao) > 3;

// Buscar por nomes artistas com musicas de um determinado genero
SELECT A.nome
FROM Artista as A
WHERE exists (
	SELECT *
	FROM Album as Al, Musica as M
	WHERE A.id_artista = Al.id_artista and Al.id_album = M.id_album and M.genero = 'pop'
)
