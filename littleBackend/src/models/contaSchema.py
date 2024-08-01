from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class ContaResponse(BaseModel):
    contaId: int
    usuarioId: int
    saldo: float
    observacao: str
    ativo: bool
    dataUltAlt: Optional[datetime] = datetime.now()
    dataCadastro: Optional[datetime] = None


class ContaRequest(BaseModel):
    contaId: int
    usuarioId: Optional[int] = None
    saldo: Optional[float] = None
    observacao: Optional[float] = None
    ativo: Optional[bool] = None
    dataUltAlt: Optional[datetime] = datetime.now()
    dataCadastro: Optional[datetime] = None
