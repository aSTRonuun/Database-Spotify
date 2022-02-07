"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const ArtistaDAO_1 = require("../dao/ArtistaDAO");
const OuvinteDAO_1 = require("../dao/OuvinteDAO");
const TurneDAO_1 = require("../dao/TurneDAO");
const router = (0, express_1.Router)();
// CRUD Ouvinte
router.post("/ouvinte", new OuvinteDAO_1.OuvinteDAO().handleCreate);
router.get("/ouvinte/:id", new OuvinteDAO_1.OuvinteDAO().handleRead);
router.put("/ouvinte/:id", new OuvinteDAO_1.OuvinteDAO().handleUpdate);
router.delete("/ouvinte/:id", new OuvinteDAO_1.OuvinteDAO().handleDelete);
// Consultas Ouvinte
router.get("/ouvinte/biblioteca/playlist/:id", new OuvinteDAO_1.OuvinteDAO().getViewPlaylist);
router.get("/ouvinte/biblioteca/podcast/:id", new OuvinteDAO_1.OuvinteDAO().getViewPodcasts);
router.get("/ouvinte/:id/biblioteca/playlist/:id_playlist/musica/", new OuvinteDAO_1.OuvinteDAO().getMusicasByOuvinteByBibliotecaByPlaylist);
router.get("/ouvinte/biblioteca/albuns/:id", new OuvinteDAO_1.OuvinteDAO().getSinglesByOuvinteByBiblioteca);
// CRUD Artista
router.post("/artista", new ArtistaDAO_1.ArtistaDAO().handleCreate);
router.get("/artista/:id", new ArtistaDAO_1.ArtistaDAO().handleRead);
router.put("/artista/:id", new ArtistaDAO_1.ArtistaDAO().handleUpdate);
router.delete("/artista/:id", new ArtistaDAO_1.ArtistaDAO().handleDelete);
// Consultas Artista
router.get("/artista/nome/:genero", new ArtistaDAO_1.ArtistaDAO().getAllArtitsByMusicGenre);
router.get("/artista/turne/:data", new ArtistaDAO_1.ArtistaDAO().getArtistsByDateTurne);
// CRUD Turne
router.post("/turne", new TurneDAO_1.TurneDAO().handleCreate);
router.put("/turne/:id", new TurneDAO_1.TurneDAO().handleUpdate);
router.delete("/turne/:id", new TurneDAO_1.TurneDAO().handleDelete);
router.get("/turne/artista/:id", new TurneDAO_1.TurneDAO().getAllTurnesByArtista);
exports.default = router;
