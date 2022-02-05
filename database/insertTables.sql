/* Inserir biblioteca e ouvinte */ 
insert into biblioteca (qtd_podcasts, qtd_playlist, qtd_albuns)
values (0, 0 ,0);

insert into ouvinte (nome, tipo_conta, email, senha)
values ('Vitor Alves', 'true', 'vitor@gmail.com', 'fjkdaofda');

update biblioteca set id_user = 1 where id_biblioteca = 1;

insert into biblioteca (qtd_podcasts, qtd_playlist, qtd_albuns)
values (0, 0 ,0);

insert into ouvinte (nome, tipo_conta, email, senha)
values ('Carlos Henryck', 'false', 'henryck@gmail.com', 'pfjadspoiw');

update biblioteca set id_user = 2 where id_biblioteca = 2;


/* Inserir playlists*/
insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Classical Essentials', 'A selection of the greatest classical tunes', 'Mateus Santos',
17, 10000, 148);

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Peaceful Guitar', 'Unwind to these calm classical guitar pieces', 'Junior Santos',
9.5, 15000, 202);

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Relax Mix', 'Musics to keep calm', 'Alex Júnior', 2, 500000, 50);

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Sweater Weather Insrumentals', 'Warm and cozy acoustic instrumentals',
		'Vilma Barbosa', 7, 86819, 150);
		
insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Electric Relaxation', 'The calming and pensive side of electric guitar',
		'Mário Mesquita', 3.4, 65579, 71);

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Fireside Acoustic', 'Warming instrumental guitar for sitting by the fire',
		'Casemiro', 8.5, 12503, 158);
		
insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Cofe House Classical Guitar', 'Elegant classical guitar to accompany your favourite Italian coffee.',
		'Carlos Henryck', 4, 18991, 101);		

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Focus guitar', 'Free your mind and let your thoughts flow to the sounds of guitar',
		'Vitor Alves', 3.8, 285367, 70);	

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Relaxing spanish guitar', 'The beautiful sound of the Spanish guitar to help you wind down',
		'Alan Martins', 2.5, 87998, 158);		

insert into playlist (titulo, descricao, autor, duracao_total, curtidas, qtd_musicas)
values ('Sad Guitar', 'Instrumental guitar for rainy day contemplation',
		'Alane Alves', 5, 33311, 124);
		
		
/* Inserir playlists na biblioteca */
insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (1, 1);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (2, 1);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (3, 1);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (4, 1);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (5, 1);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (6, 2);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (7, 2);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (8, 2);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (9, 2);

insert into biblioteca_playlist(id_playlist, id_biblioteca)
values (10, 2);

/* Inserir Artistas */ 
insert into artista (nome, sobre, qtd_ouvintes) 
values ('Jacob Collier', 'The most innovative musicians of his generation', 1704189);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Lizzy McAlpine', 'glad you could make it', 3083244);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Billie Eilish', 'Eilish continues to shatter the ceiling of music with her genre-defying sound', 56540683);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Rafael Alves', 'Rafael Alves se tornou referência no estilo Fingerstyle no Brasil', 11855);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Olivia Rodrigo', 'I’m 18 years old and writing songs is my favorite thing to do in the world.', 13447723);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Lewis Capaldi', 'the number 1 spot at American radio.', 9192745);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Harry Styles', 'Fine Line out now.', 18838395);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('Lil Nas X', 'Lil Nas X is a 22-year-old award-winning rapper, singer, songwriter', 51254709);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('The Kid LAROI', 'the newly eighteen year old rapper/singer born Charlton Howard', 48935954);

insert into artista (nome, sobre, qtd_ouvintes) 
values ('FINNEAS', 'Bios are boring', 8625614);

/* Inserir artistas na biblioteca */
insert into biblioteca_artista(id_artista, id_biblioteca)
values (1, 1);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (2, 1);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (3, 1);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (4, 1);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (5, 1);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (6, 2);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (7, 2);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (8, 2);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (9, 2);

insert into biblioteca_artista(id_artista, id_biblioteca)
values (10, 2);

/* Inserir Albums */ 
insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Djesse Vol.2', 1, '', 1);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Give Me A Minute', 1.5, '', 2);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Dont smile at me', 0.3, '', 3);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Fingerstyle Gospel', 0.5, '', 4);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'SOUR', 1.2, '', 5);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Divinely Uninspired', 0.9, '', 6);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Fine Line', 0.65, '', 7);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'MONTERO', 1, '', 8);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'F*CK LOVE', 1.2, '', 9);

insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values (2, 'Optimist', 0.8, '', 10);

/* Inserir albums na biblioteca */

insert into biblioteca_album (id_album, id_biblioteca) 
values(1, 1);

insert into biblioteca_album (id_album, id_biblioteca) 
values(2, 1);

insert into biblioteca_album (id_album, id_biblioteca) 
values(3, 1);

insert into biblioteca_album (id_album, id_biblioteca) 
values(4, 1);

insert into biblioteca_album (id_album, id_biblioteca) 
values(5, 1);

insert into biblioteca_album (id_album, id_biblioteca) 
values(6, 2);

insert into biblioteca_album (id_album, id_biblioteca) 
values(7, 2);

insert into biblioteca_album (id_album, id_biblioteca) 
values(8, 2);

insert into biblioteca_album (id_album, id_biblioteca) 
values(9, 2);

insert into biblioteca_album (id_album, id_biblioteca) 
values(10, 2);

/* Inserir Músicas */
insert into musica(titulo, duracao, genero, id_album) 
values ('Here comes the sun', 3.58, 'Pop', 1);

insert into musica(titulo, duracao, genero, id_album) 
values ('Where Do I Go ?', 3.26, 'Pop', 2);

insert into musica(titulo, duracao, genero, id_album) 
values ('Getting Older', 4.04, 'Pop', 3);

insert into musica(titulo, duracao, genero, id_album) 
values ('Amazing Grace', 2.06, 'Clássica', 4);

insert into musica(titulo, duracao, genero, id_album) 
values ('traitor', 3.49, 'Pop', 5);

insert into musica(titulo, duracao, genero, id_album) 
values ('Someone You Loved', 3.02, 'Pop', 6);

insert into musica(titulo, duracao, genero, id_album) 
values ('Watermelon Sugar', 2.54, 'Pop', 7);

insert into musica(titulo, duracao, genero, id_album) 
values ('Industry baby', 3.32, 'Hip-hop/Rap', 8);

insert into musica(titulo, duracao, genero, id_album) 
values ('Without you', 2.5, 'Pop Rock', 9);

insert into musica(titulo, duracao, genero, id_album) 
values ('Love is pain', 4.16, 'Alternativa', 10);

/* Inserir Turnês*/
insert into turne (data, descricao, id_artista) 
values('05-03-2022', 'Turne pela Europa', 1);

insert into turne (data, descricao, id_artista) 
values('18-05-2022', 'Turne em Kiribati', 2);

insert into turne (data, descricao, id_artista) 
values('26-04-2022', 'Turne em andorra', 3);

insert into turne (data, descricao, id_artista) 
values('28-02-2022', 'Turne em Bangladesh', 4);

insert into turne (data, descricao, id_artista) 
values('15-06-2022', 'Turne em Gâmbia', 5);

insert into turne (data, descricao, id_artista) 
values('28-08-2022', 'Turne em Liechtenstein', 6);

insert into turne (data, descricao, id_artista) 
values('02-09-2022', 'Turne em Quirguistão', 7);

insert into turne (data, descricao, id_artista) 
values('12-04-2022', 'Turne em Bahrein', 8);

insert into turne (data, descricao, id_artista) 
values('17-07-2022', 'Turne na Estônia', 9);

insert into turne (data, descricao, id_artista) 
values('19-06-2022', 'Turne em Vanuatu', 10);

/* Inserir Podcast */
insert into podcaster(name, qtd_ouvintes)
values('Lucas Silveira', 10526);

insert into podcaster(name, qtd_ouvintes)
values('Danilo Santana', 15485);

insert into podcaster(name, qtd_ouvintes)
values('Agência de podcast', 251465);

insert into podcaster(name, qtd_ouvintes)
values('Spotify Studios', 100235);

insert into podcaster(name, qtd_ouvintes)
values('Conner Pe', 20651);

insert into podcaster(name, qtd_ouvintes)
values('Half Deaf', 9485);

insert into podcaster(name, qtd_ouvintes)
values('Ludoviajante', 30524);

insert into podcaster(name, qtd_ouvintes)
values('Andrei Mayer de Oliveira', 24568);

insert into podcaster(name, qtd_ouvintes)
values('CarneMoídaTv', 45615);

insert into podcaster(name, qtd_ouvintes)
values('4 Curiosos', 45689);

/* Inserir Podcasters */
insert into podcast(descricao, titulo, id_podcaster) 
values('Lucas Silveira fala sobre ciência, 
	   filosofia e muitas outras tantas coisas das quais ele nem sabe muito bem', 'Matéria Escura', 1);

insert into podcast(descricao, titulo, id_podcaster) 
values('Três amigos se reúnem semanalmente para discutir e refletir sobre a vida', 'Uma semana na Vida', 2);

insert into podcast(descricao, titulo, id_podcaster) 
values('Processos criativos e composições', 'Sobre canções', 3);

insert into podcast(descricao, titulo, id_podcaster) 
values('OVNIs, criaturas iterdimensionais... Prepare seu capacete de alumínio', 'Frequência X', 4);

insert into podcast(descricao, titulo, id_podcaster) 
values('This podcast is for English learners who want to practice', 'Listening Time', 5);

insert into podcast(descricao, titulo, id_podcaster) 
values('Assuntos que não quisemos levar para a terapia', 'Pãodecast', 6);

insert into podcast(descricao, titulo, id_podcaster) 
values('Canal sobre filosofia, ciência e piadas ruins', 'Ludocast', 7);

insert into podcast(descricao, titulo, id_podcaster) 
values('Conteúdo neurocientífico de forma simples e fácil', 'Culpa do cérebro', 8);

insert into podcast(descricao, titulo, id_podcaster) 
values('Sem nenhum conhecimento, mas cheio de opinião', 'MoídaCast', 9);

insert into podcast(descricao, titulo, id_podcaster) 
values('Pocast de Entretenimento', '4Curiosos Podcast', 10);
