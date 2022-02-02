export class Turne {
    private data: string;
    private descricao: string;
    private readonly idArtista: number;

    constructor(data: string, descricao: string, idArtista: number) {
        this.data = data;
        this.descricao = descricao;
        this.idArtista = idArtista;
    }

    public getData(): string {
        return this.data;
    }

    public getDescricao(): string {
        return this.descricao;
    }

    public setData(data: string): void {
        this.data = data;
    }

    public setDescricao(descricao: string): void {
        this.descricao = descricao;
    }

    public getIdArtista(): number {
        return this.idArtista;
    }
}