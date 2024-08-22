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
    usuarioId: int
    saldo: Optional[float] = 0.0
    observacao: Optional[str] = None
    ativo: Optional[bool] = True
    dataUltAlt: Optional[datetime] = datetime.now()
    dataCadastro: Optional[datetime] = datetime.now()
