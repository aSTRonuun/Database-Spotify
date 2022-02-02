"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Turne = void 0;
class Turne {
    constructor(data, descricao, idArtista) {
        this.data = data;
        this.descricao = descricao;
        this.idArtista = idArtista;
    }
    getData() {
        return this.data;
    }
    getDescricao() {
        return this.descricao;
    }
    setData(data) {
        this.data = data;
    }
    setDescricao(descricao) {
        this.descricao = descricao;
    }
    getIdArtista() {
        return this.idArtista;
    }
}
exports.Turne = Turne;
