package br.com.qintess.repositories;

import br.com.qintess.repositories.interfaces.IFuncionarioRepository;
import br.com.qintess.entities.Funcionario;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class FuncionarioRepository implements IFuncionarioRepository {

    @PersistenceContext
    private EntityManager em;

    @Override
    public void salvar(Funcionario funcionario) {
        em.persist(funcionario);
    }

    @Override
    public List<Funcionario> listarPorCargo(long cargoId) {
        return em.createQuery("SELECT f FROM Funcionario f WHERE f.cargo.id = :cargoId", Funcionario.class)
                .setParameter("cargoId", cargoId)
                .getResultList();
    }

    @Override
    public Funcionario listarPorCargoIdEFuncionarioId(long cargoId, long funcionarioId) {
        return em.createQuery("select f from Funcionario f where f.cargo.id = :cargoId and f.id = :funcionarioId", Funcionario.class)
                .setParameter("cargoId", cargoId)
                .setParameter("funcionarioId", funcionarioId)
                .getSingleResult();
    }

    @Override
    public void atualizar(Funcionario funcionario) {
        em.merge(funcionario);
    }

    @Override
    public void excluir(long funcionarioId) {
        em.remove(em.getReference(Funcionario.class, funcionarioId));
    }
}
