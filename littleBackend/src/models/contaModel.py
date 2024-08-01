#SQLAlchemy primeiro

from datetime import datetime
from sqlalchemy import String, Column, Integer, Boolean, DateTime, Numeric, ForeignKey
from sqlalchemy_serializer import SerializerMixin

from src.database.database import Base


class Conta(Base, SerializerMixin):
    __tablename__ = "Conta"

    contaId = Column(Integer, primary_key=True, autoincrement=True)
    usuarioId = Column(Integer, ForeignKey("Usuario.usuarioId"), nullable=False)
    saldo = Column(Numeric(precision=7, scale=2), nullable=False)
    observacao = Column(String(120), nullable=False)
    ativo = Column(Boolean, default=True)
    dataUltAlt = Column(DateTime, default=datetime.now, nullable=False)
    dataCadastro = Column(DateTime, default=datetime.now, nullable=False)
