/* Templates */
insert into biblioteca (qtd_podcasts, qtd_playlist, qtd_albuns)
values (0, 0 ,0);

insert into musica (titulo, duracao, genero, id_album, id_artista) 
values ('', 0, '', 0, 0);

insert into audio_playlist(id_playlist, id_musica)
values (0, 0);

insert into ouvinte (nome, tipo_conta, email, senha, data_nasc, pais, id_biblioteca)
values ('', '', '', '', '', '', 0);



/* Inserir biblioteca e ouvinte */ 
insert into biblioteca (qtd_podcasts, qtd_playlist, qtd_albuns)
values (0, 0 ,0);

insert into ouvinte (nome, tipo_conta, email, senha, data_nasc, pais, id_biblioteca)
values ('Vitor Alves', 'true', 'vitor@gmail.com', 'fjkdaofda', '27-03-2001', 'Kiribati', 1);

update biblioteca set id_user = 1 where id_biblioteca = 1;

insert into biblioteca (qtd_podcasts, qtd_playlist, qtd_albuns)
values (0, 0 ,0);

insert into ouvinte (nome, tipo_conta, email, senha, data_nasc, pais, id_biblioteca)
values ('Carlos Henryck', 'false', 'henryck@gmail.com', 'pfjadspoiw', '17-07-2003', 'timor-leste', 2);

update biblioteca set id_user = 2 where id_biblioteca = 2;


/* Inserir playlist*/
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
