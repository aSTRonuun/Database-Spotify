import { Router } from "express";
import { ArtistaDAO } from "../dao/ArtistaDAO";
import { TurneDAO } from "../dao/TurneDAO";
const router = Router();


router.post("/turne", new TurneDAO().handleCreate);

router.put("/turne/:id", new TurneDAO().handleUpdate);

router.delete("/turne/:id", new TurneDAO().handleDelete);

router.get("/turne/artista/:id", new TurneDAO().getAllTurnesByArtista);


router.post("/artista", new ArtistaDAO().handleCreate);

router.get("/artista/:id", new ArtistaDAO().handleRead);

router.put("/artista/:id", new ArtistaDAO().handleUpdate);

router.delete("/artista/:id", new ArtistaDAO().handleDelete);



export default router;