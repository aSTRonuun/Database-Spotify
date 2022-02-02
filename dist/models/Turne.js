"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Turne = void 0;
class Turne {
    constructor(data, descricao) {
        this.data = data;
        this.descricao = descricao;
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
}
exports.Turne = Turne;
