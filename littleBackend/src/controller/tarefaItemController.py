from fastapi import APIRouter

from src.models.tarefaItemModel import TarefaItem

TAG = "Tarefa Item"
PREFIX = "/tarefaItem"
tarefaItemRouter = APIRouter(prefix=PREFIX, tags=[TAG])
