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
                valorAcrescimo=task[4],
                valorDesconto=task[5],
                obrigatoria=task[6],
                dataItem=task[7],
                finalizado=task[8],
                pago=task[9],
                ativo=task[10]
            )
        )

    return listaCarregada
