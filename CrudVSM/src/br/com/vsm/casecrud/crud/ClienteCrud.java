package br.com.vsm.casecrud.crud;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import br.com.vsm.casecrud.entities.Cliente;


public class ClienteCrud extends AbstractCrud<Cliente>{
	private EntityManager em;
    private static final String PU = "CaseVSMPU";

    public ClienteCrud() {
        super(Cliente.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        if (em == null) {
            em = Persistence.createEntityManagerFactory(PU).createEntityManager();
        }
        return em;
    }
    
    

}
