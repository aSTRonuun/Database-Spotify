import { Turne } from "../models/Turne";
import { Request, Response } from "express";
import { pool } from "../database";
import { QueryResult } from "pg";

export class TurneDAO {
    async handleCreate(req: Request, res: Response){
        const { data, descricao } = req.body;
        const response: QueryResult = await pool.query("INSERT INTO Turne (data, descricao) VALUES ($1, $2)", [data, descricao]);
        res.json({
            message: "Turne created successfully",
            turne: {
                data,
                descricao
            }
        });
    }



    update(id: number, new_turne: Turne): void {
        throw new Error("Method not implemented.");
    }
    delete(id: number): void {
        throw new Error("Method not implemented.");
    }
    getTurne(id: number): Turne {
        throw new Error("Method not implemented.");
    }
    getAllTurnes(): Turne[] {
        throw new Error("Method not implemented.");
    }
    
}