from typing import List

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
            detail="Não foi possível inserir a tarefa"
        )

    return TarefaResponse(**novaSalva.to_dict())

@tarefaRouter.get('/tarefasCadastradas/{usuarioId}/')
def tarefasCadastradas(usuarioId: int) -> List[TarefaResponse]:
    """
    Busca todas as tarefas cadastradas de um usuário
    """
    tarefaRep: TarefaRepository = TarefaRepository()
    listaTarefas = tarefaRep.buscaTarefasCadastradas(usuarioId)

    if listaTarefas is None or len(listaTarefas) == 0:
        raise HTTPException(detail="Não encontramos nenhuma tarefa cadastrada para esse usuário", status_code=status.HTTP_404_NOT_FOUND)

    return [TarefaResponse(**tarefa.to_dict()) for tarefa in listaTarefas]
