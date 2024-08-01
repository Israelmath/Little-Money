from fastapi import APIRouter

from src.models.tarefaModel import Tarefa

TAG = "Tarefa"
PREFIX = "/tarefa"
tarefaRouter = APIRouter(prefix=PREFIX, tags=[TAG])
