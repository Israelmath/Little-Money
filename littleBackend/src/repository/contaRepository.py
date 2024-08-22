from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.exc import IntegrityError

from datetime import datetime

from src.database.dbConnectionHandler import DBConnHandler
from src.models.contaModel import Conta


class ContaRepository:

    def selectMinhaConta(self, usuarioId: int):
        try:
            with DBConnHandler() as db:
                data: Conta = db.session.query(Conta).filter(Conta.usuarioId == usuarioId).one()
                return data
        except NoResultFound:
            return None
        except Exception as err:
            db.session.rollback()
            return err

    def criaNovaConta(self, dadosNovaConta: Conta):
        with DBConnHandler() as db:
            try:
                db.session.add(dadosNovaConta)
                db.session.flush()
                db.session.refresh(dadosNovaConta)
                db.session.commit()
                db.session.expunge(dadosNovaConta)

                return dadosNovaConta

            except NoResultFound:
                return None
            except Exception as err:
                print(f"criaNovaConta: err - {err}")
                db.session.rollback()
                return None