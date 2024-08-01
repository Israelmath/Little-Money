from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class TarefaResponse(BaseModel):
    tarefaId: int
    titulo: int
    descricao: str
    valor: float
    frequencia: str
    obrigatoria: bool
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class TarefaRequest(BaseModel):
    tarefaId: int
    titulo: Optional[int] = None
    descricao: Optional[str] = None
    valor: float
    frequencia: Optional[str] = None
    obrigatoria: Optional[bool] = None
    ativo: Optional[bool] = None
    dataUltAlt: Optional[datetime] = None
    dataCadastro: Optional[datetime] = None
