package br.com.vsm.casecrud.crud;
/*
 * CASE DE TESTES DA VSM INFORM�TICA
 * @author Ricardo Alvim
 * @description Classe de persist�ncia gen�rica
 */
import java.util.List;
import javax.persistence.EntityManager;

public abstract class FacadeCrud<T> {
	//Objeto da classe refer�ncia
    private Class<T> entityClass;

    //construtor que recebe a tipagem da mesma
    public FacadeCrud(Class<T> entityClass) {
        this.entityClass = entityClass;
    }
    
    //m�todo abstrato para obter o EM na implementa��o
    protected abstract EntityManager getEntityManager();

    //salvar e persistir o objeto
    public void persist(T entity) {
    	try{
    		getEntityManager().getTransaction().begin();
            getEntityManager().persist(entity);
            getEntityManager().getTransaction().commit();
    	}catch(Exception ex){
    		System.out.println("A persist�ncia de " + entity.getClass().getSimpleName() + " falhou! Rollback em a��o.");
    	}        
    }

    public void merge(T entity) {
    	try{
    		getEntityManager().getTransaction().begin();
            getEntityManager().merge(entity);
            getEntityManager().getTransaction().commit();
    	}catch(Exception ex){
    		System.out.println("A persist�ncia de " + entity.getClass().getSimpleName() + " falhou! Rollback em a��o.");
    	}                
    }

    public void remove(T entity) {
    	try{
    		getEntityManager().getTransaction().begin();
            getEntityManager().remove(getEntityManager().merge(entity));
            getEntityManager().getTransaction().commit();
    	}
    	catch(Exception ex){
    		System.out.println("A persist�ncia de " + entity.getClass().getSimpleName() + " falhou! Rollback em a��o.");
    	}            
    }

    //encontrar por objeto
    public T find(Object id) {
        return getEntityManager().find(entityClass, id);
    }
    
    //encontrar por identificador
    public T byId(Integer id) {
        try {
            return (T) getEntityManager().createNamedQuery(this.entityClass.getSimpleName().toString() +".findById").setParameter("id", id).getSingleResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    //obter todos entity
    public List<T> getAll() {
        try{
	        return getEntityManager().createNamedQuery(this.entityClass.getSimpleName().toString() +".findAll").getResultList();
        }catch(Exception e){
        	getEntityManager().getTransaction().rollback();
            System.out.println(e.getMessage());
        }
        return null;
    }
}
