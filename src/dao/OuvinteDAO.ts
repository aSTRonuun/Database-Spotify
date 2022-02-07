import { Request, Response } from "express";
import { Query, QueryResult } from "pg";
import { pool } from "../database";
import { Ouvinte } from "../models/Ouvinte";

export class OuvinteDAO {
    async handleCreate(req: Request, resp: Response) {
        const { nome, email, senha } = req.body;

        const ouvinte = new Ouvinte(nome, email, senha);

        const response: QueryResult = await pool.query("INSERT INTO Ouvinte (nome, tipo_conta, email, senha) VALUES ($1, $2, $3, $4)", [ouvinte.getNome(), ouvinte.getTipo_conta(), ouvinte.getEmail(), ouvinte.getSenha()]);
        if(response.rowCount > 0) {
            return resp.status(200).json({
                message: "Ouvinte created successfully",
                ouvinte: {
                    nome,
                    email,
                    senha
                }
            })
        }else {
            return resp.status(404).json({
                message: "Ouvinte not created"
            });
        }
    }

    async handleUpdate(req: Request, resp: Response) {
        const { id } = req.params;
        const { nome, email, senha, tipo_conta } = req.body;

        const oldOuvinte: QueryResult = await pool.query("SELECT * FROM Ouvinte WHERE id_user = $1", [id]);
        const ouvinte = new Ouvinte(oldOuvinte.rows[0].nome, oldOuvinte.rows[0].email, oldOuvinte.rows[0].senha);

        ouvinte.setNome(nome ? nome : ouvinte.getNome());
        ouvinte.setEmail(email ? email : ouvinte.getEmail());
        ouvinte.setSenha(senha ? senha : ouvinte.getSenha());
        ouvinte.setTipo_conta(tipo_conta ? tipo_conta : ouvinte.getTipo_conta());

        const response: QueryResult = await pool.query("UPDATE Ouvinte SET nome = $1, email = $2, senha = $3, tipo_conta = $4 WHERE id_user = $5",
            [ouvinte.getNome(), ouvinte.getEmail(), ouvinte.getSenha(), ouvinte.getTipo_conta(), id]);
        if(response.rowCount > 0) {
            return resp.status(200).json({
                message: "Ouvinte updated successfully",
                ouvinte: {
                    nome,
                    email,
                    senha,
                    tipo_conta
                }
            });
        }else {
            return resp.status(404).json({
                message: "Ouvinte not updated"
            });
        }
    }

    async handleRead(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query("SELECT * FROM Ouvinte WHERE id_user = $1", [id]);
        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows[0]);
        }else {
            return resp.status(404).json({
                message: "Ouvinte not found"
            })
        }
    }

    async handleDelete(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query("DELETE FROM Ouvinte WHERE id_user = $1", [id]);
        if(response.rowCount > 0) {
            return resp.status(200).json({
                message: "Ouvinte deleted successfully"
            });
        } else {
            return resp.status(404).json({
                message: "Ouvinte not found"
            })
        }
    }

    async getViewPlaylist(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query("SELECT * FROM viewPlaylist WHERE id_user = $1", [id]);
        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows);
        }else{
            return resp.status(404).json({ message: "Nenhuma playlist encontrada" });
        }
    }

    async getViewPodcasts(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query("SELECT * FROM viewPodcasts WHERE id_user = $1", [id]);
        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows);
        }else {
            return resp.status(404).json({
                message: "Nenhum podcast encontrado"
            })
        }
    }

    async getMusicasByOuvinteByBibliotecaByPlaylist(req: Request, resp: Response) {
        const { id, id_playlist } = req.params;

        const response: QueryResult = await pool.query(`
            select m.genero, count(m), trunc(avg(m.duracao), 2)
            from ouvinte as o
            inner join biblioteca as b on b.id_user = o.id_user
            inner join biblioteca_playlist as bp on b.id_biblioteca = bp.id_biblioteca
            inner join playlist as p on p.id_playlist = bp.id_playlist
            inner join audio_playlist as ap on ap.id_playlist = p.id_playlist
            inner join musica as m on m.id_musica = ap.id_musica
            where o.id_user = $1 and p.id_playlist = $2
            group by m.genero
            having avg(m.duracao) > 2
        `, [id, id_playlist]);

        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows);
        }else {
            return resp.status(404).json({
                message: "Não há músicas com mais de 2 minutos de duração"
            })
        }
    }
    
    async getSinglesByOuvinteByBiblioteca(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query(`
            select ar.nome, a.titulo, a.qtd_musica, a.duracao_total from ouvinte as o 
            join biblioteca as b on b.id_user = o.id_user
            join biblioteca_album as ba on ba.id_biblioteca = b.id_biblioteca
            join album as a on a.id_album = ba.id_album
            join artista as ar on ar.id_artista = a.id_artista
            where exists(
                select a.qtd_musica from album
                where a.qtd_musica = 1
            );
        `)

        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows);
        }else {
            return resp.status(404).json({
                message: "Não há singles"
            })
        }
    }

}