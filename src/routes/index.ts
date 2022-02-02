import { Router } from "express";
import { ArtistaDAO } from "../dao/ArtistaDAO";
import { TurneDAO } from "../dao/TurneDAO";
const router = Router();


router.post("/turne", new TurneDAO().handleCreate);

router.put("/turne", new TurneDAO().handleUpdate);

router.delete("/turne", new TurneDAO().handleDelete);

router.get("/turne/artista", new TurneDAO().getAllTurnesByArtista);


router.post("/artista", new ArtistaDAO().handleCreate);



export default router;