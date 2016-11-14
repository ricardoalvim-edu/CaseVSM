<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>

<title>Lista de Clientes - VSM FrontFarma</title>
</head>
<body>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
	<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
	<%@page import="java.util.List"%>
	<jsp:include page="../header.jsp"></jsp:include>
	<article>
		<h1>Lista de Clientes</h1>
	
		<%
			ClienteCrud cc = new ClienteCrud();
			List<Cliente> list = cc.getAll();
			request.setAttribute("list",list);
		%>
	
		<table border="1" width="90%" class="table table-striped table-hover ">
			<tr>
				<th>Nome</th>
				<th>CPF</th>
				<th>Endereços</th>
				<th>Telefone</th>
				<th>Editar</th>
				<th>Deletar</th>
			</tr>
			<c:forEach items="${list}" var="u">
				<tr>
					<td>${u.getNome()}</td>
					<td>${u.getCpf()}</td>
					<td><a href="../endereco/enderecos.jsp?cliente=${u.getId()}">Enderecos</a></td>
					<td><a href="../telefone/telefones.jsp?cliente=${u.getId()}">Telefones</a></td>
					<td><a href="editform.jsp?id=${u.getId()}">Editar</a></td>
					<td><a href="delete.jsp?id=${u.getId()}">Deletar</a></td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<a href="addform.jsp">Adicionar novo cliente</a>
	</article>		
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
