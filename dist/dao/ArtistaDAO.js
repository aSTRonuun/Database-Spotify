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
exports.ArtistaDAO = void 0;
const database_1 = require("../database");
const Artista_1 = require("../models/Artista");
class ArtistaDAO {
    handleCreate(req, resp) {
        return __awaiter(this, void 0, void 0, function* () {
            const { nome, sobre } = req.body;
            const artista = new Artista_1.Artista(nome, sobre);
            console.log(artista);
            const response = yield database_1.pool.query("INSERT INTO Artista (nome, sobre, qtd_ouvintes) VALUES ($1, $2, $3)", [artista.getNome(), artista.getSobre(), artista.getQtd_ouvintes()]);
            resp.json({
                message: "Artista created successfully",
                artista: {
                    nome,
                    sobre
                }
            });
        });
    }
    handleRead(req, resp) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const response = yield database_1.pool.query("SELECT * FROM Artista WHERE id_artista = $1", [id]);
            if (response.rowCount > 0) {
                return resp.status(200).json(response.rows);
            }
            else {
                return resp.status(404).json({
                    message: "Artista not found"
                });
            }
        });
    }
    handleUpdate(req, resp) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const { nome, sobre } = req.body;
            const artistaOld = yield database_1.pool.query("SELECT * FROM Artista WHERE id_artista = $1", [id]);
            const artista = new Artista_1.Artista(artistaOld.rows[0].sobre, artistaOld.rows[0].nome);
            artista.setNome(nome ? nome : artistaOld.rows[0].nome);
            artista.setSobre(sobre ? sobre : artistaOld.rows[0].sobre);
            console.log(artista);
            const response = yield database_1.pool.query("UPDATE Artista SET nome = $1, sobre = $2 WHERE id_artista = $3", [artista.getNome(), artista.getSobre(), id]);
            resp.json({
                message: "Artista updated successfully",
                artista: {
                    nome,
                    sobre
                }
            });
        });
    }
    handleDelete(req, resp) {
        return __awaiter(this, void 0, void 0, function* () {
            const { idArtista } = req.params;
            const response = yield database_1.pool.query("DELETE FROM Artista WHERE id_artista = $1", [idArtista]);
            if (response.rowCount > 0) {
                resp.json({
                    message: "Artista deleted successfully",
                });
            }
            else {
                resp.json({
                    message: "Artista not found",
                });
            }
        });
    }
}
exports.ArtistaDAO = ArtistaDAO;
