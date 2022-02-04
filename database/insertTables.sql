/* Templates */

insert into biblioteca (qtd_podcasts, qtd_playlist, qtd_albuns)
values (0, 0 ,0);

insert into musica (titulo, duracao, genero, id_album, id_artista) 
values ('', 0, '', 0, 0);

insert into audio_playlist(id_playlist, id_musica)
values (0, 0);

insert into ouvinte (nome, tipo_conta, email, senha, data_nasc, pais, id_biblioteca)
values ('', '', '', '', '', '', 0);
