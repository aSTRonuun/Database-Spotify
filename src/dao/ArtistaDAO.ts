import { Request, Response } from "express";
import { Turne } from "../models/Turne";
import { pool } from "../database";
import { QueryResult } from "pg";
import { Artista } from "../models/Artista";

export class ArtistaDAO {
    async handleCreate(req: Request, resp: Response) {
        const { nome, sobre } = req.body;

        const artista = new Artista(nome, sobre);
        console.log(artista);

        const response: QueryResult = await pool.query("INSERT INTO Artista (nome, sobre, qtd_ouvintes) VALUES ($1, $2, $3)", [artista.getNome(), artista.getSobre(), artista.getQtd_ouvintes()]);
        resp.json({
            message: "Artista created successfully",
            artista: {
                nome,
                sobre
            }
        });
    }
}