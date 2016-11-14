package br.com.vsm.casecrud.entities;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


@Entity
@Table(name="cliente")
@NamedQueries({
	@NamedQuery(name="Cliente.findAll", query="SELECT c FROM Cliente c"),
	@NamedQuery(name="Cliente.findById", query="SELECT c FROM Cliente c WHERE c.id = :id")
})
public class Cliente implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(nullable=false, length=11)
	private String cpf;

	@Column(length=45)
	private String nome;

	//bi-directional many-to-one association to Endereco
	@OneToMany(mappedBy="clienteBean", cascade = CascadeType.ALL, targetEntity = Endereco.class, fetch = FetchType.LAZY)
	private List<Endereco> enderecos;

	//bi-directional many-to-one association to Telefone
	@OneToMany(mappedBy="clienteBean", cascade = CascadeType.ALL, targetEntity = Telefone.class, fetch = FetchType.LAZY)
	private List<Telefone> telefones;

	public Cliente() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Endereco> getEnderecos() {
		return this.enderecos;
	}

	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	public Endereco addEndereco(Endereco endereco) {
		getEnderecos().add(endereco);
		endereco.setClienteBean(this);

		return endereco;
	}

	public Endereco removeEndereco(Endereco endereco) {
		getEnderecos().remove(endereco);
		endereco.setClienteBean(null);

		return endereco;
	}

	public List<Telefone> getTelefones() {
		return this.telefones;
	}

	public void setTelefones(List<Telefone> telefones) {
		this.telefones = telefones;
	}

	public Telefone addTelefone(Telefone telefone) {
		getTelefones().add(telefone);
		telefone.setClienteBean(this);

		return telefone;
	}

	public Telefone removeTelefone(Telefone telefone) {
		getTelefones().remove(telefone);
		telefone.setClienteBean(null);

		return telefone;
	}

}