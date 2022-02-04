"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.TurneDAO = void 0;
const Turne_1 = require("../models/Turne");
const database_1 = require("../database");
class TurneDAO {
    handleCreate(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { data, descricao, idArtista } = req.body;
            const turne = new Turne_1.Turne(data, descricao, idArtista);
            console.log(turne);
            const response = yield database_1.pool.query("INSERT INTO Turne (data, descricao, id_artista) VALUES ($1, $2, $3)", [turne.getData(), turne.getDescricao(), turne.getIdArtista()]);
            res.json({
                message: "Turne created successfully",
                turne: {
                    data,
                    descricao,
                    idArtista
                }
            });
        });
    }
    handleUpdate(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const { data, descricao } = req.body;
            const turneOld = yield database_1.pool.query("SELECT * FROM Turne WHERE id_turne = $1", [id]);
            const turne = new Turne_1.Turne(data, descricao, turneOld.rows[0].idArtista);
            turne.setData(data ? data : turneOld.rows[0].data);
            turne.setDescricao(descricao ? descricao : turneOld.rows[0].descricao);
            console.log(turne);
            const response = yield database_1.pool.query("UPDATE Turne SET data = $1, descricao = $2 WHERE id_turne = $3", [turne.getData(), turne.getDescricao(), id]);
            res.json({
                message: "Turne updated successfully",
                turne: {
                    data,
                    descricao
                }
            });
        });
    }
    handleDelete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const response = yield database_1.pool.query("DELETE FROM Turne WHERE id_turne = $1", [id]);
            res.json({
                message: "Turne deleted successfully",
            });
        });
    }
    getAllTurnesByArtista(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const response = yield database_1.pool.query("SELECT * FROM Turne WHERE id_artista = $1", [id]);
            if (response.rowCount > 0) {
                return res.status(200).json(response.rows);
            }
            else {
                return res.status(404).json({
                    message: "No turnes found for this artist"
                });
            }
        });
    }
}
exports.TurneDAO = TurneDAO;
