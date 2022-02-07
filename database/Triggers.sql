CREATE TRIGGER att_qtd_playlist_delete_in_lib_trigger
AFTER DELETE
ON biblioteca_playlist
FOR EACH ROW
EXECUTE PROCEDURE att_qtd_playlist_delete_in_lib()

/*Stored procedure para verificar inserção na playlist */
CREATE or replace FUNCTION inserirPlaylist (id_musicaF integer, id_playlistF integer)
RETURNS boolean
LANGUAGE PLPGSQL
AS
$$
DECLARE
	exists integer = null;
	qtd_musicaPlaylist integer;
BEGIN
	select qtd_musicas into qtd_musicaPlaylist from playlist
	where id_playlist = id_playlistF;
	
	IF qtd_musicaPlaylist >= 150 THEN
		 raise notice 'Playlist cheia';
		 return false;
	END IF;		 
	
	select id_musica into exists from audio_playlist 
 	where id_musica = id_musicaF
 	and id_playlist = id_playlistF;
	
	IF exists is null THEN
		raise notice 'Música foi adicionada';
		return true;
	END IF;
	
	raise notice 'Música já está na playlist';
	return false;
END;
$$;


/*Trigger para verificar playlist usando o storade procedure */
CREATE or replace FUNCTION verificaPlaylist ()
RETURNS TRIGGER	
LANGUAGE PLPGSQL
AS
$$
DECLARE
-- seu código aqui
BEGIN
  	IF inserirPlaylist(new.id_musica, new.id_playlist) THEN
		update playlist set qtd_musicas = qtd_musicas + 1 where id_playlist = new.id_playlist;
		return new;
	ELSE 
		return null;
	END IF;		
END;
$$;

CREATE TRIGGER verificaPlaylistTrigger
BEFORE INSERT ON audio_playlist
FOR EACH ROW
EXECUTE PROCEDURE verificaPlaylist();



/*Tigger para atualizar a quantidade de playlist quando uma playlist for adicionada em uma biblioteca*/
CREATE OR REPLACE FUNCTION att_qtd_playlist_insert_in_lib()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
	UPDATE biblioteca 
	SET qtd_playlist = qtd_playlist + 1
	WHERE id_biblioteca = NEW.id_biblioteca;
	refresh materialized view viewPlaylist;
	
	RAISE NOTICE 'Playlist adicionada na biblioteca %', NEW.id_biblioteca;
	
	RETURN NEW;
END;
$$;

CREATE TRIGGER att_qtd_playlist_insert_in_lib_trigger
AFTER INSERT
ON biblioteca_playlist
FOR EACH ROW
EXECUTE PROCEDURE att_qtd_playlist_insert_in_lib()

/*Tigger para atualizar a quantidade de playlist quando uma playlist for removida de uma biblioteca*/
CREATE OR REPLACE FUNCTION att_qtd_playlist_delete_in_lib()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
	UPDATE biblioteca 
	SET qtd_playlist = qtd_playlist - 1
	WHERE id_biblioteca = OLD.id_biblioteca;
	refresh materialized view viewPlaylist;
	
	RAISE NOTICE 'Playlist removida da biblioteca %', OLD.id_biblioteca;
	
	RETURN OLD;
END;
$$;



