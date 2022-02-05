"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Ouvinte = void 0;
class Ouvinte {
    constructor(nome, email, senha) {
        this.nome = nome;
        this.tipo_conta = false;
        this.email = email;
        this.senha = senha;
    }
    getNome() {
        return this.nome;
    }
    getTipo_conta() {
        return this.tipo_conta;
    }
    getEmail() {
        return this.email;
    }
    getSenha() {
        return this.senha;
    }
    setNome(nome) {
        this.nome = nome;
    }
    setTipo_conta(tipo_conta) {
        this.tipo_conta = tipo_conta;
    }
    setEmail(email) {
        this.email = email;
    }
    setSenha(senha) {
        this.senha = senha;
    }
}
exports.Ouvinte = Ouvinte;
