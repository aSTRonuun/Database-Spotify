export class Ouvinte {
    private nome: string;
    private tipo_conta: boolean;
    private email: string;
    private senha: string;

    constructor(nome: string, email: string, senha: string) {
        this.nome = nome;
        this.tipo_conta = false;
        this.email = email;
        this.senha = senha;
    }

    public getNome(): string {
        return this.nome;
    }

    public getTipo_conta(): boolean {
        return this.tipo_conta;
    }

    public getEmail(): string {
        return this.email;
    }

    public getSenha(): string {
        return this.senha;
    }

    public setNome(nome: string): void {
        this.nome = nome;
    }

    public setTipo_conta(tipo_conta: boolean): void {
        this.tipo_conta = tipo_conta;
    }

    public setEmail(email: string): void {
        this.email = email;
    }

    public setSenha(senha: string): void {
        this.senha = senha;
    }
}