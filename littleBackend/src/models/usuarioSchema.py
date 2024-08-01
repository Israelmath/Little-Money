from datetime import datetime
from typing import Optional

from pydantic import BaseModel


class UsuarioResponse(BaseModel):
    usuarioId: int
    nome: str
    sobrenome: str
    dataNascimento: datetime
    ativo: bool
    dataUltAlt: datetime
    dataCadastro: datetime


class UsuarioRequest(BaseModel):
    usuarioId: int
    nome: Optional[str] = None
    sobrenome: Optional[str] = None
    dataNascimento: Optional[datetime] = None
    ativo: Optional[bool] = None
    dataUltAlt: Optional[datetime] = None
    dataCadastro: Optional[datetime] = None
