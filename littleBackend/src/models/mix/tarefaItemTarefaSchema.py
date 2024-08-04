from datetime import datetime, date
from typing import Optional

from pydantic import BaseModel


class TarefaItemTarefaResponse(BaseModel):
    tarefaId: int
    usuarioId: int
    titulo: str
    descricao:str
    valorAcrescimo: float
    valorDesconto: Optional[float]
    obrigatoria: bool
    dataItem: date
    finalizado: bool
    pago: bool
    ativo: bool