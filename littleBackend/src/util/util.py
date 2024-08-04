from typing import List

from src.models.mix.tarefaItemTarefaSchema import TarefaItemTarefaResponse


def carregaTarefaItemTarefa(lista: List) -> List[TarefaItemTarefaResponse]:
    listaCarregada: List[TarefaItemTarefaResponse] = []

    for task in lista:
        listaCarregada.append(
            TarefaItemTarefaResponse(
                tarefaId=task[0],
                usuarioId=task[1],
                titulo=task[2],
                descricao=task[3],
                valor=task[4],
                obrigatoria=task[5],
                dataItem=task[6],
                finalizado=task[7],
                pago=task[8],
                ativo=task[9]
            )
        )

    return listaCarregada
