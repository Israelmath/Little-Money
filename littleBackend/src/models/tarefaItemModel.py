#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, ForeignKey

from src.database.database import Base


class TarefaItem(Base):
    __tablename__ = "TarefaItem"

    tarefaItemId = Column(Integer, primary_key=True, autoincrement=True)
    tarefaId = Column(Integer, ForeignKey("Tarefa.tarefaId"), nullable=False)
    usuarioId = Column(Integer, ForeignKey("Usuario.usuarioId"), nullable=False)
    finalizado = Column(Boolean, default=True)
    dataFinalizacao = Column(DateTime, default=datetime.now, nullable=False)
    pago = Column(Boolean, default=True)
    ativo = Column(Boolean, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)
