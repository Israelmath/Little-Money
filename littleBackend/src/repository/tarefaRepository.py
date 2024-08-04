from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.exc import IntegrityError

from datetime import datetime

from src.database.dbConnectionHandler import DBConnHandler
from src.models.tarefaModel import Tarefa


class TarefaRepository:

    def insereNovaTarefa(self, novaTarefa: Tarefa):
        with DBConnHandler() as db:
            try:
                db.session.add(novaTarefa)
                db.session.flush()
                db.session.refresh(novaTarefa)
                db.session.commit()
                db.session.expunge(novaTarefa)

                return novaTarefa

            except NoResultFound:
                return None
            except Exception as err:
                print(f"insereNovaTarefa: err - {err}")
                db.session.rollback()
                return None
