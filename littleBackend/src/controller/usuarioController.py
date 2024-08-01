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

    advogadoRepository: UsuarioRepository = UsuarioRepository()
    novoSalvo = advogadoRepository.insereNovoUsuario(novoUsuario)
    if novoSalvo is None:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Não foi possível inserir o usuario"
        )

    return UsuarioResponse(**novoSalvo.to_dict())
