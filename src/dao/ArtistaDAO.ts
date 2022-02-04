import { Request, response, Response } from "express";
import { Turne } from "../models/Turne";
import { pool } from "../database";
import { QueryResult } from "pg";
import { Artista } from "../models/Artista";

export class ArtistaDAO {
    async handleCreate(req: Request, resp: Response) {
        const { nome, sobre } = req.body;

        const artista = new Artista(nome, sobre);
        console.log(artista);

        const response: QueryResult = await pool.query("INSERT INTO Artista (nome, sobre, qtd_ouvintes) VALUES ($1, $2, $3)", 
            [artista.getNome(), artista.getSobre(), artista.getQtd_ouvintes()]);
        resp.json({
            message: "Artista created successfully",
            artista: {
                nome,
                sobre
            }
        });
    }

    async handleRead(req: Request, resp: Response) {
        const { id } = req.params;

        const response: QueryResult = await pool.query("SELECT * FROM Artista WHERE id_artista = $1", [id]);
        if(response.rowCount > 0) {
            return resp.status(200).json(response.rows);
        }else {
            return resp.status(404).json({
                message: "Artista not found"
            });
        }
    }

    async handleUpdate(req: Request, resp: Response) {
        const { id } = req.params;
        const { nome, sobre } = req.body;

        const artistaOld = await pool.query("SELECT * FROM Artista WHERE id_artista = $1", [id]);
        const artista = new Artista(artistaOld.rows[0].sobre, artistaOld.rows[0].nome);

        artista.setNome(nome ? nome : artistaOld.rows[0].nome);
        artista.setSobre(sobre ? sobre : artistaOld.rows[0].sobre);

        console.log(artista);
        const response: QueryResult = await pool.query("UPDATE Artista SET nome = $1, sobre = $2 WHERE id_artista = $3",
            [artista.getNome(), artista.getSobre(), id]);
        resp.json({
            message: "Artista updated successfully",
            artista: {
                nome,
                sobre
            }
        });
    }

    async handleDelete(req: Request, resp: Response) {
        const { idArtista } = req.params;

        const response: QueryResult = await pool.query("DELETE FROM Artista WHERE id_artista = $1", [idArtista]);
        if(response.rowCount > 0) {
            resp.json({
                message: "Artista deleted successfully",
            })
        }else {
            resp.json({
                message: "Artista not found",
            })
        }
    }
}