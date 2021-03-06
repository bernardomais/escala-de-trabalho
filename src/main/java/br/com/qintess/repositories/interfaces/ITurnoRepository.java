package br.com.qintess.repositories.interfaces;

import br.com.qintess.entities.Turno;

import java.util.List;

public interface ITurnoRepository {

    void salvar(Turno turno);
    List<Turno> listar();
    Turno listarPorId(long id);
    List<Turno> listaPorSigla(String sigla);
    List<Turno> listarPorPadraoSistema();
    List<Turno> litarPorCor(String cor);
    void atualizar(Turno turno);
    void excluir(long id);
}
