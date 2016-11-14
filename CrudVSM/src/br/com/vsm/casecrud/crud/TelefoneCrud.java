package br.com.vsm.casecrud.crud;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import br.com.vsm.casecrud.entities.Endereco;
import br.com.vsm.casecrud.entities.Telefone;

public class TelefoneCrud extends AbstractCrud<Telefone>{
	private EntityManager em;
    private static final String PU = "CaseVSMPU";

    public TelefoneCrud() {
        super(Telefone.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        if (em == null) {
            em = Persistence.createEntityManagerFactory(PU).createEntityManager();
        }
        return em;
    }
    
    public List<Telefone> byCliente(Integer id) {
        try {
            return (List<Telefone>) getEntityManager().createNamedQuery("Telefone.findByCliente").setParameter("cliente", id).getResultList();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
