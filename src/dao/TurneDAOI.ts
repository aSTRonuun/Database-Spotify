import { Turne } from "../models/Turne";

export interface TurneDAOI {
    create(new_turne: Turne): void;
    update(id: number, new_turne: Turne): void;
    delete(id: number): void;
    getTurne(id: number): Turne;
    getAllTurnes(): Turne[];
}