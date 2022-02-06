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

CREATE TRIGGER att_qtd_playlist_delete_in_lib_trigger
AFTER DELETE
ON biblioteca_playlist
FOR EACH ROW
EXECUTE PROCEDURE att_qtd_playlist_delete_in_lib()
