#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, ForeignKey, Date
from sqlalchemy.dialects.mysql import TIME
from sqlalchemy_serializer import SerializerMixin

from src.database.database import Base


class TarefaItem(Base, SerializerMixin):
    __tablename__ = "TarefaItem"

    tarefaId = Column(Integer, primary_key=True, nullable=False)
    usuarioId = Column(Integer, primary_key=True, nullable=False)
    dataItem = Column(Date, primary_key=True, default=datetime.now, nullable=False)
    dataFinalizacao = Column(DateTime, nullable=True)
    finalizado = Column(Boolean, nullable=False, default=False)
    pago = Column(Boolean, nullable=False, default=True)
    ativo = Column(Boolean, nullable=False, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)
