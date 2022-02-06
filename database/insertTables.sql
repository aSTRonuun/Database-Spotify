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
values 
('Classical Essentials', 'A selection of the greatest classical tunes', 'Mateus Santos', 17, 10000, 148),
('Peaceful Guitar', 'Unwind to these calm classical guitar pieces', 'Junior Santos', 9.5, 15000, 202),
('Relax Mix', 'Musics to keep calm', 'Alex Júnior', 2, 500000, 50),
('Sweater Weather Insrumentals', 'Warm and cozy acoustic instrumentals','Vilma Barbosa', 7, 86819, 150),
('Electric Relaxation', 'The calming and pensive side of electric guitar', 'Mário Mesquita', 3.4, 65579, 71),
('Fireside Acoustic', 'Warming instrumental guitar for sitting by the fire', 'Casemiro', 8.5, 12503, 158),
('Cofe House Classical Guitar', 'Elegant classical guitar to accompany your favourite Italian coffee.', 'Carlos Henryck', 4, 18991, 101),		
('Focus guitar', 'Free your mind and let your thoughts flow to the sounds of guitar', 'Vitor Alves', 3.8, 285367, 70),	
('Relaxing spanish guitar', 'The beautiful sound of the Spanish guitar to help you wind down', 'Alan Martins', 2.5, 87998, 158),		
('Sad Guitar', 'Instrumental guitar for rainy day contemplation', 'Alane Alves', 5, 33311, 124);
		
		
/* Inserir playlists na biblioteca */
insert into biblioteca_playlist(id_playlist, id_biblioteca)
values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

/* Inserir Artistas */ 
insert into artista (nome, sobre, qtd_ouvintes) 
values 
('Jacob Collier', 'The most innovative musicians of his generation', 1704189),
('Lizzy McAlpine', 'glad you could make it', 3083244),
('Billie Eilish', 'Eilish continues to shatter the ceiling of music with her genre-defying sound', 56540683),
('Rafael Alves', 'Rafael Alves se tornou referência no estilo Fingerstyle no Brasil', 11855),
('Olivia Rodrigo', 'I’m 18 years old and writing songs is my favorite thing to do in the world.', 13447723),
('Lewis Capaldi', 'the number 1 spot at American radio.', 9192745),
('Harry Styles', 'Fine Line out now.', 18838395),
('Lil Nas X', 'Lil Nas X is a 22-year-old award-winning rapper, singer, songwriter', 51254709),
('The Kid LAROI', 'the newly eighteen year old rapper/singer born Charlton Howard', 48935954),
('FINNEAS', 'Bios are boring', 8625614);

/* Inserir artistas na biblioteca */
insert into biblioteca_artista(id_artista, id_biblioteca)
values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

/* Inserir Albums */ 
insert into album (qtd_musica, titulo, duracao_total, descricao, id_artista)
values 
(2, 'Djesse Vol.2', 1, '', 1),
(2, 'Give Me A Minute', 1.5, '', 2),
(2, 'Dont smile at me', 0.3, '', 3),
(2, 'Fingerstyle Gospel', 0.5, '', 4),
(2, 'SOUR', 1.2, '', 5),
(2, 'Divinely Uninspired', 0.9, '', 6),
(2, 'Fine Line', 0.65, '', 7),
(2, 'MONTERO', 1, '', 8),
(2, 'F*CK LOVE', 1.2, '', 9),
(2, 'Optimist', 0.8, '', 10);

/* Inserir albums na biblioteca */

insert into biblioteca_album (id_album, id_biblioteca) 
values
(1, 1), 
(2, 1), 
(3, 1), 
(4, 1), 
(5, 1), 
(6, 2), 
(7, 2), 
(8, 2), 
(9, 2), 
(10, 2);

/* Inserir Músicas */
insert into musica(titulo, duracao, genero, id_album) 
values 
('Here comes the sun', 3.58, 'Pop', 1), 
('Where Do I Go ?', 3.26, 'Pop', 2), 
('Getting Older', 4.04, 'Pop', 3), 
('Amazing Grace', 2.06, 'Clássica', 4), 
('traitor', 3.49, 'Pop', 5), 
('Someone You Loved', 3.02, 'Pop', 6), 
('Watermelon Sugar', 2.54, 'Pop', 7), 
('Industry baby', 3.32, 'Hip-hop/Rap', 8), 
('Without you', 2.5, 'Pop Rock', 9), 
('Love is pain', 4.16, 'Alternativa', 10);

/*Inserir músicas nas playlist */
insert into audio_playlist(id_musica, id_playlist) 
values 
(1, 1),
(2, 1), 
(3, 1), 
(4, 1), 
(5, 1), 
(6, 2), 
(7, 2), 
(8, 2), 
(9, 2), 
(10, 2), 
(1, 3), 
(2, 3), 
(3, 3), 
(4, 3), 
(5, 3), 
(6, 4), 
(7, 4), 
(8, 4), 
(9, 4), 
(10, 4), 
(1, 5), 
(2, 5), 
(3, 5), 
(4, 5), 
(5, 5), 
(6, 6), 
(7, 6), 
(8, 6), 
(9, 6), 
(10, 6), 
(1, 7), 
(2, 7), 
(3, 7), 
(4, 7), 
(5, 7), 
(6, 8), 
(7, 8), 
(8, 8), 
(9, 8), 
(10, 8), 
(1, 9), 
(2, 9), 
(3, 9), 
(4, 9), 
(5, 9), 
(6, 10), 
(7, 10), 
(8, 10), 
(9, 10), 
(10, 10);

/* Inserir Turnês*/
insert into turne (data, descricao, id_artista) 
values('05-03-2022', 'Turne pela Europa', 1), 
('18-05-2022', 'Turne em Kiribati', 2), 
('26-04-2022', 'Turne em andorra', 3), 
('28-02-2022', 'Turne em Bangladesh', 4), 
('15-06-2022', 'Turne em Gâmbia', 5), 
('28-08-2022', 'Turne em Liechtenstein', 6), 
('02-09-2022', 'Turne em Quirguistão', 7), 
('12-04-2022', 'Turne em Bahrein', 8), 
('17-07-2022', 'Turne na Estônia', 9), 
('19-06-2022', 'Turne em Vanuatu', 10);

/* Inserir Podcast */
insert into podcaster(name, qtd_ouvintes)
values
('Lucas Silveira', 10526),
('Danilo Santana', 15485),
('Agência de podcast', 251465),
('Spotify Studios', 100235),
('Conner Pe', 20651),
('Half Deaf', 9485),
('Ludoviajante', 30524),
('Andrei Mayer de Oliveira', 24568),
('CarneMoídaTv', 45615),
('4 Curiosos', 45689);

/* Inserir Podcasters */
insert into podcast(podcastdescription, podcastname, id_podcaster) 
values
('Lucas Silveira fala sobre ciência, filosofia e muitas outras tantas coisas das quais ele nem sabe muito bem', 'Matéria Escura', 1),
('Três amigos se reúnem semanalmente para discutir e refletir sobre a vida', 'Uma semana na Vida', 2), 
('Processos criativos e composições', 'Sobre canções', 3), 
('OVNIs, criaturas iterdimensionais... Prepare seu capacete de alumínio', 'Frequência X', 4), 
('This podcast is for English learners who want to practice', 'Listening Time', 5), 
('Assuntos que não quisemos levar para a terapia', 'Pãodecast', 6), 
('Canal sobre filosofia, ciência e piadas ruins', 'Ludocast', 7), 
('Conteúdo neurocientífico de forma simples e fácil', 'Culpa do cérebro', 8), 
('Sem nenhum conhecimento, mas cheio de opinião', 'MoídaCast', 9), 
('Pocast de Entretenimento', '4Curiosos Podcast', 10);

/*Inserir podcasts na biblioteca */
insert into biblioteca_podcast(id_podcast, id_biblioteca)
values 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

/*Inserir episódios */
insert into episodio(descricao, duracao, id_podcast, titulo)
values 
('O livro que eu recomendo é A REALIDADE OCULTA do meu mano BRIAN GREENE', 0.5, 1, 'O que teve antes do big bang ? ps: não sei'),
('Assuntos diversos da semana', 1, 2, 'Semana 12 - Um ciclo se fecha, outro começa'),
('Conversa com o produtor musical Rodrigo Castanho', 0.9, 3, 'Sobre produção com Rodrigo Castanho'),
('Em 1994, 60 crianças testemunharam um disco voador aterrissar no centro do pátio de uma escola em Ruwa, Zimbabwe', 
		0.3, 4, 'Uma escola de outro mundo!'),
('Become a Listening Time Member and receive extra episodes, seminars, and training', 0.3, 5, 'Breakfast and Camping'),
('Participe do programa mandando email para:', 0.3, 6, 'O que a internet quer saber')
('Convido vocês para um papo sobre fótons, neurociência e os segredos da consciência humana', 
		0.15, 7, 'Cores, fótons e os absurdos da percepção humana'),
('Nesse episódio do Podcast explico o que é atenção, Déficit de Atenção e TDAH', 1, 8, 'Melhore seu foco e concentração'),
('PASSADO, PRESENTE E FUTURO. O QUE VOCÊ FARIA SE PUDESSE VIAJAR ENTRE ELES?', 0.5, 9, 'O que você faria se pudesse viajar no tempo ?'),
('Conversa sobre o famigerado Storytelling: a famosa expressão desnecessária em inglês TÃO aclamada para "contar histórias"', 
		1.5, 10, 'A arte de contar histórias com Issac Ness');
