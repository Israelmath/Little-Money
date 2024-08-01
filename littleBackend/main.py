import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from src.controller.contaController import contaRouter
from src.controller.usuarioController import usuarioRouter
from src.controller.tarefaController import tarefaRouter
from src.controller.tarefaItemController import tarefaItemRouter

app = FastAPI()

origens = [
    '0.0.0.0:8000'
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origens,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)


#Incluindo rotas
app.include_router(contaRouter)
app.include_router(tarefaRouter)
app.include_router(tarefaItemRouter)
app.include_router(usuarioRouter)


if __name__ == '__main__':
    from src.database.database import Base
    from src.database.dbConnectionHandler import DBConnHandler

    connHandler: DBConnHandler = DBConnHandler()

    Base.metadata.create_all(connHandler.get_engine())
    uvicorn.run(app, host='0.0.0.0', port=8000)
