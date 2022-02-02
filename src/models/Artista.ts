import { Turne } from "./Turne";

export class Artista {
    private sobre: string;
    private nome: string;
    private qtd_ouvintes: number;

    constructor(sobre: string, nome: string) {
        this.sobre = sobre;
        this.nome = nome;
        this.qtd_ouvintes = 0;
    }

    public getSobre(): string {
        return this.sobre;
    }

    public getNome(): string {
        return this.nome;
    }

    public getQtd_ouvintes(): number {
        return this.qtd_ouvintes;
    }

    public setSobre(sobre: string): void {
        this.sobre = sobre;
    }

    public setNome(nome: string): void {
        this.nome = nome;
    }
}