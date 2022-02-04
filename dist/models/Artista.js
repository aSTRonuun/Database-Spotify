"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Artista = void 0;
class Artista {
    constructor(nome, sobre) {
        this.sobre = sobre;
        this.nome = nome;
        this.qtd_ouvintes = 0;
    }
    getSobre() {
        return this.sobre;
    }
    getNome() {
        return this.nome;
    }
    getQtd_ouvintes() {
        return this.qtd_ouvintes;
    }
    setSobre(sobre) {
        this.sobre = sobre;
    }
    setNome(nome) {
        this.nome = nome;
    }
}
exports.Artista = Artista;
