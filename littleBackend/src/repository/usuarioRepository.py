from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.exc import IntegrityError

from datetime import datetime

from src.database.dbConnectionHandler import DBConnHandler
from src.models.contaModel import Conta
from src.models.usuarioModel import Usuario


class UsuarioRepository:

    def insereNovoUsuario(self, novoUsuario: Usuario):
        with DBConnHandler() as db:
            try:
                db.session.add(novoUsuario)
                db.session.flush()
                db.session.refresh(novoUsuario)
                db.session.commit()
                db.session.expunge(novoUsuario)

                return novoUsuario

            except NoResultFound:
                return None
            except Exception as err:
                print(f"insereNovoUsuario: err - {err}")
                db.session.rollback()
                return None