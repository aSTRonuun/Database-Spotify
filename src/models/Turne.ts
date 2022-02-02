export class Turne {
    private data: string;
    private descricao: string;

    constructor(data: string, descricao: string) {
        this.data = data;
        this.descricao = descricao;
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
}