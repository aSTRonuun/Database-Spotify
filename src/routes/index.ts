import { Router } from "express";
import { ArtistaDAO } from "../dao/ArtistaDAO";
import { OuvinteDAO } from "../dao/OuvinteDAO";
import { TurneDAO } from "../dao/TurneDAO";
const router = Router();

// CRUD Ouvinte
router.post("/ouvinte", new OuvinteDAO().handleCreate);
router.get("/ouvinte/:id", new OuvinteDAO().handleRead);
router.put("/ouvinte/:id", new OuvinteDAO().handleUpdate);
router.delete("/ouvinte/:id", new OuvinteDAO().handleDelete);

// Consultas Ouvinte
router.get("/ouvinte/biblioteca/playlist/:id", new OuvinteDAO().getViewPlaylist);
router.get("/ouvinte/biblioteca/podcast/:id", new OuvinteDAO().getViewPodcasts);
router.get("/ouvinte/:id/biblioteca/playlist/:id_playlist/musica/", new OuvinteDAO().getMusicasByOuvinteByBibliotecaByPlaylist);
router.get("/ouvinte/biblioteca/albuns/:id", new OuvinteDAO().getSinglesByOuvinteByBiblioteca);

// CRUD Artista
router.post("/artista", new ArtistaDAO().handleCreate);
router.get("/artista/:id", new ArtistaDAO().handleRead);
router.put("/artista/:id", new ArtistaDAO().handleUpdate);
router.delete("/artista/:id", new ArtistaDAO().handleDelete);

// Consultas Artista
router.get("/artista/nome/:genero", new ArtistaDAO().getAllArtitsByMusicGenre);
router.get("/artista/turne/:data", new ArtistaDAO().getArtistsByDateTurne);

// CRUD Turne
router.post("/turne", new TurneDAO().handleCreate);
router.put("/turne/:id", new TurneDAO().handleUpdate);
router.delete("/turne/:id", new TurneDAO().handleDelete);
router.get("/turne/artista/:id", new TurneDAO().getAllTurnesByArtista);

export default router;