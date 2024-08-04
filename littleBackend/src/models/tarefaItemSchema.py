from datetime import datetime, time, date
from typing import Optional

from pydantic import BaseModel


class TarefaItemResponse(BaseModel):
    tarefaId: int
    usuarioId: int
    dataItem: Optional[date]
    dataFinalizacao: Optional[datetime]
    finalizado: bool
    pago: bool
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class TarefaItemRequest(BaseModel):
    tarefaId: int
    usuarioId: int
    dataItem: date
    dataFinalizacao: Optional[datetime] = None
    finalizado: Optional[bool] = False
    pago: Optional[bool] = False
    ativo: Optional[bool] = False
    dataUltAlt: Optional[datetime] = None
    dataCadastro: Optional[datetime] = None
