from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class TarefaItemResponse(BaseModel):
    tarefaItemId: int
    tarefaId: int
    usuarioId: int
    finalizado: bool
    dataFinalizacao: datetime
    pago: bool
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class TarefaItemRequest(BaseModel):
    tarefaItemId: int
    tarefaId: int
    usuarioId: int
    finalizado: bool
    dataFinalizacao: datetime
    pago: bool
    ativo: bool
    dataUltAlt: Optional[datetime] = None
    dataCadastro: Optional[datetime] = None
