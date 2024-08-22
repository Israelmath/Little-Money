from typing import List

from fastapi import APIRouter, HTTPException, status

from src.models.contaModel import Conta
from src.models.contaSchema import ContaRequest, ContaResponse
from src.repository.contaRepository import ContaRepository

TAG = "Conta"
PREFIX = "/conta"
contaRouter = APIRouter(prefix=PREFIX, tags=[TAG])


@contaRouter.get('/minhaConta/{usuarioId}/', response_model=ContaResponse, status_code=200)
def minhaConta(usuarioId: int) -> ContaResponse:
    """
    Retorna conta do usuário atual
    """
    usuarioRep: ContaRepository = ContaRepository()
    contaUsuario: Conta = usuarioRep.selectMinhaConta(usuarioId)

    if contaUsuario is None:
        raise HTTPException(status_code=417, detail='Nenhum usuário foi encontrado')

    return contaUsuario

@contaRouter.post('/', status_code=status.HTTP_201_CREATED)
def insereNovaConta(dadosNovaConta: ContaRequest) -> ContaResponse:
    """
    Insere uma nova conta, de um usuário já cadastrado
    """
    novaContaACadastrar: Conta = Conta(**dadosNovaConta.model_dump())

    contaRep: ContaRepository = ContaRepository()
    contaSalva = contaRep.criaNovaConta(novaContaACadastrar)
    if contaSalva is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Não foi possível inserir o usuario"
        )

    return ContaResponse(**contaSalva.to_dict())
