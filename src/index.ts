import  express  from "express";
const app = express();

import indexRoutes from "./routes/index";

// middlewares
// json() - converte o body da requisição para json
app.use(express.json());

// urlencoded() - converte dados de formulário para json
app.use(express.urlencoded({ extended: false }));

app.use(indexRoutes);

app.listen(3000, () => {
    console.log("🚀 Server is running on port 3000");
})