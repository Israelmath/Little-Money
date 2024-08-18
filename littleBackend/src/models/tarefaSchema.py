from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class TarefaResponse(BaseModel):
    tarefaId: int
    usuarioId: int
    titulo: str
    descricao: str
    horaInicio: datetime
    horaFim: Optional[datetime]
    diaTodo: bool
    valorAcrescimo: float
    valorDesconto: Optional[float] = 0.0
    frequencia: str
    obrigatoria: bool
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class TarefaRequest(BaseModel):
    usuarioId: int
    titulo: str
    descricao: Optional[str] = None
    horaInicio: Optional[datetime] = None
    horaFim: Optional[datetime] = None
    diaTodo: Optional[bool] = False
    valorAcrescimo: float
    valorDesconto: Optional[float] = 0.0
    frequencia: Optional[str] = None
    obrigatoria: Optional[bool] = None
    ativo: Optional[bool] = None
