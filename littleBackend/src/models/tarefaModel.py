#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, Numeric

from src.database.database import Base


class Tarefa(Base):
    __tablename__ = "Tarefa"

    tarefaId = Column(Integer, primary_key=True, autoincrement=True)
    titulo = Column(String(30), nullable=False)
    descricao = Column(String(120), nullable=False)
    valor = Column(Numeric(precision=5, scale=2), nullable=False)
    frequencia = Column(String(1), nullable=False, default='D')
    obrigatoria = Column(Boolean, default=True)
    ativo = Column(Boolean, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)
