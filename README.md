## Project database Spotify 🎵

### Intruções de Execução ⚙

Requisitos
- [NodeJS](https://nodejs.org/en/) Executar servidor
- [Insomnia](https://insomnia.rest/download) Realizar testes de requisição
- [Postgres](https://www.postgresql.org/) Banco de Dados

## Passo #1 - Banco de Dados
- Criar Database com nome Spotify e atualizar a senha do seu BD no script [database.ts](https://github.com/aSTRonuun/Database-Spotify/blob/main/src/database.ts)
- Criar Schema do banco [CreateSQL](https://github.com/aSTRonuun/Database-Spotify/blob/main/database/createTablesUpdate_v2.sql)
- Criar as Views, Procedures e Triggers [Views](https://github.com/aSTRonuun/Database-Spotify/blob/main/database/selectTables.sql) e [Triggers](https://github.com/aSTRonuun/Database-Spotify/blob/main/database/Triggers.sql)


## Passo #2 - Intalar dependências
- Na pasta raiz rodar o seguinte comando no terminal
```
npm install
```

## Passo #3 - Rodar servidor
- Rodar o seguinte comando para startar o servidor
```
npm run dev
```



