package br.com.vsm.casecrud.crud;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import br.com.vsm.casecrud.entities.Cliente;
import br.com.vsm.casecrud.entities.Endereco;

public class EnderecoCrud extends AbstractCrud<Endereco>{
	private EntityManager em;
    private static final String PU = "CaseVSMPU";

    public EnderecoCrud() {
        super(Endereco.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        if (em == null) {
            em = Persistence.createEntityManagerFactory(PU).createEntityManager();
        }
        return em;
    }
    
    public List<Endereco> byCliente(Integer id) {
        try {
            return (List<Endereco>) getEntityManager().createNamedQuery("Endereco.findByCliente").setParameter("cliente", id).getResultList();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
