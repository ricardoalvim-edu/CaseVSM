package br.com.vsm.casecrud.crud;

import br.com.vsm.casecrud.crud.FacadeCrud;
import br.com.vsm.casecrud.entities.Cliente;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class ClienteCrud extends FacadeCrud<Cliente>{
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
