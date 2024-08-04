from fastapi import APIRouter, status, HTTPException

from src.models.tarefaModel import Tarefa
from src.models.tarefaSchema import TarefaResponse, TarefaRequest
from src.repository.tarefaRepository import TarefaRepository

TAG = "Tarefa"
PREFIX = "/tarefa"
tarefaRouter = APIRouter(prefix=PREFIX, tags=[TAG])

@tarefaRouter.post('/', status_code=status.HTTP_201_CREATED)
def insereTarefa(tarefaEnviada: TarefaRequest) -> TarefaResponse:
    """
    Insere uma tarefa
    """
    novaTarefa: Tarefa = Tarefa(**tarefaEnviada.model_dump())

    tarefaRepository: TarefaRepository = TarefaRepository()
    novaSalva = tarefaRepository.insereNovaTarefa(novaTarefa)
    if novaSalva is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Não foi possível inserir o usuario"
        )

    return TarefaResponse(**novaSalva.to_dict())
