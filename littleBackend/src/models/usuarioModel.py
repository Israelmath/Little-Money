#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, Numeric, Date
from sqlalchemy_serializer import SerializerMixin

from src.database.database import Base


class Usuario(Base, SerializerMixin):
    __tablename__ = "Usuario"

    usuarioId = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(30), nullable=False)
    sobrenome = Column(String(60), nullable=False)
    apelido = Column(String(15), nullable=False)
    dataNascimento = Column(Date, nullable=False)
    ativo = Column(Boolean, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)