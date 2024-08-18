from datetime import datetime, date, time, timedelta
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
    horaInicio: datetime
    horaFim: Optional[datetime]
    diaTodo: bool
    dataItem: date
    finalizado: bool
    pago: bool
    ativo: bool
