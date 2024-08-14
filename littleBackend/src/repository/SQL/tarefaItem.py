from datetime import date
from sqlalchemy import text, TextClause


def sqlTarefaItemDescricao(usuarioId: int, dataBusca: date) -> TextClause:
    """
    SQL que facilita a busca com o JOIN
    :return: O retorno precisa ser :TextClause, porque o 'execute' do SQLAlchemy precisa dessa classe
    """
    return text(f"""
    SELECT 
        t.tarefaId,
        ti.usuarioId,
        t.titulo,
        t.descricao,
        t.valorAcrescimo,
        t.valorDesconto,
        t.obrigatoria,
        ti.dataItem,
        ti.finalizado,
        ti.pago,
        ti.ativo
    FROM TarefaItem ti
        JOIN Tarefa t
            ON t.tarefaId = ti.tarefaId
    WHERE ti.usuarioId = {usuarioId}
      AND ti.dataItem = '{dataBusca}'
    """)
