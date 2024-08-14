#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, Numeric, ForeignKey
from sqlalchemy.dialects.mysql import TIME
from sqlalchemy_serializer import SerializerMixin

from src.database.database import Base


class Tarefa(Base, SerializerMixin):
    __tablename__ = "Tarefa"

    tarefaId = Column(Integer, primary_key=True, autoincrement=True)
    usuarioId = Column(Integer, ForeignKey("Usuario.usuarioId"), nullable=False)
    titulo = Column(String(30), unique=True, nullable=False)
    descricao = Column(String(120), nullable=False)
    horaInicio = Column(TIME)
    horaFim = Column(TIME)
    diaTodo = Column(Boolean, nullable=False, default=False)
    valorAcrescimo = Column(Numeric(precision=5, scale=2), nullable=False)
    valorDesconto = Column(Numeric(precision=5, scale=2), nullable=False, default=0.0)
    frequencia = Column(String(1), nullable=False, default='D')
    obrigatoria = Column(Boolean, default=True)
    ativo = Column(Boolean, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)
