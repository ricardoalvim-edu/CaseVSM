<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Endereços</title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
	<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>
	<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
	<%@page import="br.com.vsm.casecrud.entities.Endereco"%>
	<%@page import="java.util.List"%>
	
	<jsp:include page="../header.jsp"></jsp:include>
	<%
		Integer id = Integer.parseInt(request.getParameter("cliente"));
		ClienteCrud cc = new ClienteCrud();
		Cliente c = cc.byId(id);
		EnderecoCrud tc = new EnderecoCrud();
		List<Endereco> list = tc.byCliente(id);
		request.setAttribute("list", list);
	%>
	<article>
		<h1>Lista de Endereços - <%=c.getNome()%></h1>

		<table border="1" width="90%" class="table table-striped table-hover ">
			<tr>
				<th>Logradouro</th>
				<th>Numero</th>
				<th>Complemento</th>
				<th>Cidade</th>
				<th>Estado</th>
				<th>Editar</th>
				<th>Deletar</th>
			</tr>
			<c:forEach items="${list}" var="e">
				<tr>
					<td>${e.getLogradouro()}</td>
					<td>${e.getNumero()}</td>
					<td>${e.getComplemento()}</td>
					<td>${e.getCidade()}</td>
					<td>${e.getEstado()}</td>
					<td><a href="editform.jsp?id=${e.getId()}">Editar</a></td>
					<td><a href="delete.jsp?id=${e.getId()}">Deletar</a></td>
				</tr>
			</c:forEach>
		</table>
		<a class="btn btn-default" href="addform.jsp?cliente=<%=c.getId()%>">Adicionar novo
		endereco</a>
	</article>
	<br />
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
