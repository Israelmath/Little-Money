from fastapi import APIRouter, HTTPException, status

from src.models.usuarioModel import Usuario
from src.models.usuarioSchema import UsuarioRequest, UsuarioResponse
from src.repository.usuarioRepository import UsuarioRepository

TAG = "Usuario"
PREFIX = "/usuario"
usuarioRouter = APIRouter(prefix=PREFIX, tags=[TAG])

@usuarioRouter.post('/', status_code=status.HTTP_201_CREATED)
def insereUsuario(usuarioEnviado: UsuarioRequest) -> UsuarioResponse:
    """
    Insere um usuário
    """
    novoUsuario: Usuario = Usuario(**usuarioEnviado.model_dump())

    usuarioRepository: UsuarioRepository = UsuarioRepository()
    novoSalvo = usuarioRepository.insereNovoUsuario(novoUsuario)
    if novoSalvo is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Não foi possível inserir o usuario"
        )

    return UsuarioResponse(**novoSalvo.to_dict())

@usuarioRouter.get('/{usuarioId}', status_code=status.HTTP_201_CREATED)
def buscaUsuario(usuarioId: int) -> UsuarioResponse:
    """
    Busca um usuário, dado usuarioId
    """
    usuarioRepository: UsuarioRepository = UsuarioRepository()
    usuarioBuscado: Usuario = usuarioRepository.buscaUsuario(usuarioId)
    if usuarioBuscado is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Usuário não encontrado"
        )

    return UsuarioResponse(**usuarioBuscado.to_dict())
