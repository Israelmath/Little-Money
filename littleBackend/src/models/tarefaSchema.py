from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class TarefaResponse(BaseModel):
    tarefaId: int
    usuarioId: int
    titulo: str
    descricao: str
    valor: float
    frequencia: str
    obrigatoria: bool
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class TarefaRequest(BaseModel):
    usuarioId: int
    titulo: Optional[str] = None
    descricao: Optional[str] = None
    valor: float
    frequencia: Optional[str] = None
    obrigatoria: Optional[bool] = None
    ativo: Optional[bool] = None
