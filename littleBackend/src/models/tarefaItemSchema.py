from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class TarefaItemResponse(BaseModel):
    tarefaId: int
    usuarioId: int
    finalizado: bool
    dataFinalizacao: Optional[datetime] = None
    pago: bool
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class TarefaItemRequest(BaseModel):
    tarefaId: int
    usuarioId: int
    finalizado: bool
    dataFinalizacao: datetime
    pago: bool
    ativo: bool
    dataUltAlt: Optional[datetime] = None
    dataCadastro: Optional[datetime] = None
