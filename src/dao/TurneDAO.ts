import { Turne } from "../models/Turne";
import { Request, Response } from "express";
import { pool } from "../database";
import { QueryResult } from "pg";


export class TurneDAO {
    async handleCreate(req: Request, res: Response){
        const { data, descricao, idArtista } = req.body;

        const turne = new Turne(data, descricao, idArtista);
        console.log(turne);

        const response: QueryResult = await pool.query("INSERT INTO Turne (data, descricao, id_artista) VALUES ($1, $2, $3)",
            [turne.getData(), turne.getDescricao(), turne.getIdArtista()]);
        res.json({
            message: "Turne created successfully",
            turne: {
                data,
                descricao,
                idArtista
            }
        });
    }

    async handleUpdate(req: Request, res: Response) {
        const { idTurne, data, descricao} = req.body;

        const turneOld = await pool.query("SELECT * FROM Turne WHERE id_turne = $1", [idTurne]);
        const turne = new Turne(data, descricao, turneOld.rows[0].idArtista);

        turne.setData(data ? data : turneOld.rows[0].data);
        turne.setDescricao(descricao ? descricao : turneOld.rows[0].descricao);

        console.log(turne);
        const response: QueryResult = await pool.query("UPDATE Turne SET data = $1, descricao = $2 WHERE id_turne = $3", [turne.getData(), turne.getDescricao(), idTurne]);
        res.json({
            message: "Turne updated successfully",
            turne: {
                data,
                descricao
            }
        });
    }

    async handleDelete(req: Request, res: Response) {
        const { idTurne } = req.body;

        const response = await pool.query("DELETE FROM Turne WHERE id_turne = $1", [idTurne]);
        res.json({
            message: "Turne deleted successfully",
        });
    }

    async getAllTurnesByArtista(req: Request, res: Response) {
        const { idArtista } = req.body;

        const response: QueryResult = await pool.query("SELECT * FROM Turne WHERE id_artista = $1", [idArtista]);
        return res.status(200).json(response.rows);

    }
    
}