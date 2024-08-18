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
                horaInicio=task[7],
                horaFim=task[8],
                diaTodo=task[9],
                dataItem=task[10],
                finalizado=task[11],
                pago=task[12],
                ativo=task[13]
            )
        )

    return listaCarregada
