from typing import List

from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.exc import IntegrityError

from datetime import datetime, date

from src.database.dbConnectionHandler import DBConnHandler
from src.models.mix.tarefaItemTarefaSchema import TarefaItemTarefaResponse
from src.models.tarefaItemModel import TarefaItem
from src.models.tarefaModel import Tarefa
from src.repository.SQL.tarefaItem import sqlTarefaItemDescricao


class TarefaItemRepository:

    def buscaTarefasDeHoje(self, usuarioId: int) -> List[TarefaItemTarefaResponse]:
        hoje: date = date.today()

        with DBConnHandler() as db:
            try:
                listaTarefasDetalhes = db.session.execute(sqlTarefaItemDescricao(usuarioId, hoje))

                return listaTarefasDetalhes

            except NoResultFound:
                return None

            except Exception as err:
                print(f"buscaTarefasDeHoje: err - {err}")
                db.session.rollback()
                return None

