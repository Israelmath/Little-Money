from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.exc import IntegrityError

from datetime import datetime

from src.database.dbConnectionHandler import DBConnHandler
from src.models.contaModel import Conta


class ContaRepository:

    def selectMinhaConta(self, usuarioId: int):
        try:
            with DBConnHandler() as db:
                data = db.session.query(Conta).filter(Conta.usuarioId == usuarioId).one()
                return data
        except NoResultFound:
            return None
        except Exception as err:
            db.session.rollback()
            return err