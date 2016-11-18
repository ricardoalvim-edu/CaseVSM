package br.com.vsm.casecrud.entities;

import java.io.Serializable;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * The persistent class for the telefone database table.
 * 
 */
@Entity
@Table(name="telefone")
@XmlRootElement
@NamedQuery(name="Telefone.findAll", query="SELECT t FROM Telefone t")

@NamedQueries({
	@NamedQuery(name="Telefone.findAll", query="SELECT t FROM Telefone t"),
	@NamedQuery(name="Telefone.findById", query="SELECT t FROM Telefone t WHERE t.id = :id"),
	@NamedQuery(name="Telefone.findByCliente", query="SELECT t FROM Telefone t WHERE t.clienteBean.id = :cliente")
})
public class Telefone implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@EmbeddedId
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=2)
	private String ddd;

	@Column(nullable=false, length=9)
	private String numero;

	//bi-directional many-to-one association to Cliente
	@ManyToOne
	@JoinColumn(name="cliente", nullable=false, insertable=true, updatable=true)
	private Cliente clienteBean;

	public Telefone() {
	}

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public String getDdd() {
		return this.ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getNumero() {
		return this.numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Cliente getClienteBean() {
		return this.clienteBean;
	}

	public void setClienteBean(Cliente clienteBean) {
		this.clienteBean = clienteBean;
	}

}