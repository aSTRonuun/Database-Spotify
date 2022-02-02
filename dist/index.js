"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
const index_1 = __importDefault(require("./routes/index"));
// middlewares
// json() - converte o body da requisição para json
app.use(express_1.default.json());
// urlencoded() - converte dados de formulário para json
app.use(express_1.default.urlencoded({ extended: false }));
app.use(index_1.default);
app.listen(3000, () => {
    console.log("🚀 Server is running on port 3000");
});
