from typing import List

from fastapi import APIRouter, HTTPException, status

from src.models.mix.tarefaItemTarefaSchema import TarefaItemTarefaResponse
from src.models.tarefaItemModel import TarefaItem
from src.models.tarefaItemSchema import TarefaItemRequest, TarefaItemResponse
from src.repository.tarefaItemRepository import TarefaItemRepository
from src.util.util import carregaTarefaItemTarefa

TAG = "Tarefa Item"
PREFIX = "/tarefaItem"
tarefaItemRouter = APIRouter(prefix=PREFIX, tags=[TAG])


@tarefaItemRouter.get('/tarefasDeHoje/{usuarioId}/', response_model=List[TarefaItemTarefaResponse], status_code=200)
def minhaConta(usuarioId: int) -> List[TarefaItemTarefaResponse]:
    """
    Retorna todas as tarefas do dia de hoje, do usuário atual
    """
    tarefaItemRep: TarefaItemRepository = TarefaItemRepository()
    listaTarefas = tarefaItemRep.buscaTarefasDeHoje(usuarioId)

    if listaTarefas is None:
        raise HTTPException(status_code=status.HTTP_204_NO_CONTENT, detail='Nenhuma tarefa foi encontrada')

    #Mapeia as linhas recebidas do banco
    listaResponse = carregaTarefaItemTarefa(listaTarefas)

    if listaResponse is None:
        raise HTTPException(status_code=status.HTTP_204_NO_CONTENT, detail='Nenhuma tarefa foi encontrada')

    if len(listaResponse) != 0 and listaResponse[0] is None:
        raise HTTPException(status_code=status.HTTP_204_NO_CONTENT, detail='Nenhum usuário foi encontrado')

    return listaResponse

@tarefaItemRouter.patch('/finalizaTarefaItem/', status_code=200)
def finalizaTarefaItem(tarefaItem: TarefaItemRequest):
    """
    Atualiza a situação de um item para 'finalizado'
    """
    tarefaItemEnviada: TarefaItem = TarefaItem(**tarefaItem.model_dump())

    tarefaItemRep: TarefaItemRepository = TarefaItemRepository()
    if not tarefaItemRep.atualizaFinalizaTarefaItem(tarefaItemEnviada):
        raise HTTPException(detail='Não foi possível atualizar a tarefa', status_code=status.HTTP_304_NOT_MODIFIED)

    return 'Ok'
