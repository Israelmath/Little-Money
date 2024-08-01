#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, Numeric

from src.database.database import Base


class Usuario(Base):
    __tablename__ = "Usuario"

    usuarioId = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(30), nullable=False)
    sobrenome = Column(String(60), nullable=False)
    dataNascimento = Column(DateTime, nullable=False)
    ativo = Column(Boolean, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)
