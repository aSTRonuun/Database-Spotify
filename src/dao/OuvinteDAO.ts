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

    async getPlaylistsByOuvinteInYourBiblioteca(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query(`
            SELECT P.id_playlist, P.descricao, P.duracao_total, P.curtidas
            FROM Ouvinte as O
                INNER JOIN Biblioteca as B
                ON B.id_user = O.id_user
                INNER JOIN Biblioteca_playlist as BP
                ON B.id_biblioteca = BP.id_biblioteca
                INNER JOIN Playlist as P
                ON BP.id_playlist = P.id_playlist
            WHERE O.id_user = $1
        `, [id]);
        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows);
        }else{
            return resp.json({message: "Não há playlists na sua biblioteca"});
        }
    }

}