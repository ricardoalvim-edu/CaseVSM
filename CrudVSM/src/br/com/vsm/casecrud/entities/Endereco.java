package br.com.vsm.casecrud.entities;

import java.io.Serializable;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * The persistent class for the endereco database table.
 * 
 */
@Entity
@Table(name="endereco")
@XmlRootElement
@NamedQueries({
	@NamedQuery(name="Endereco.findAll", query="SELECT e FROM Endereco e"),
	@NamedQuery(name="Endereco.findById", query="SELECT e FROM Endereco e WHERE e.id = :id"),
	@NamedQuery(name="Endereco.findByCliente", query="SELECT e FROM Endereco e WHERE e.clienteBean.id = :cliente")
})
public class Endereco implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=45)
	private String cidade;

	@Column(nullable=false, length=45)
	private String complemento;

	@Column(nullable=false, length=2)
	private String estado;

	@Column(nullable=false, length=45)
	private String logradouro;

	@Column(nullable=false, length=45)
	private String numero;

	//bi-directional many-to-one association to Cliente
	@ManyToOne
	@JoinColumn(name="cliente", nullable=false, insertable=true, updatable=true)
	private Cliente clienteBean;

	public Endereco() {
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

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getComplemento() {
		return this.complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getLogradouro() {
		return this.logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
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