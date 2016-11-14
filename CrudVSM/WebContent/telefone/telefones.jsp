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
	<%@page import="br.com.vsm.casecrud.crud.TelefoneCrud"%>
	<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
	<%@page import="br.com.vsm.casecrud.entities.Telefone"%>
	<%@page import="java.util.List"%>
	
	<jsp:include page="../header.jsp"></jsp:include>
	<article>
		<%
			String id = request.getParameter("cliente");
			ClienteCrud cc = new ClienteCrud();
			Cliente c = cc.byId(Integer.parseInt(id));
			
			TelefoneCrud ec = new TelefoneCrud();
			List<Telefone> list = ec.byCliente(Integer.parseInt(id));
			request.setAttribute("list", list);
		%>

		<h1>
			Lista de Telefone - <%=c.getNome()%></h1>


		<table border="1" width="90%" class="table table-striped table-hover ">
			<tr>
				<th>DDD</th>
				<th>Número</th>

				<th>Editar</th>
				<th>Deletar</th>
			</tr>
			<c:forEach items="${list}" var="e">
				<tr>
					<td>${e.getDdd()}</td>
					<td>${e.getNumero()}</td>
					<td><a href="editform.jsp?id=${e.getId()}">Editar</a></td>
					<td><a href="delete.jsp?id=${e.getId()}">Deletar</a></td>
				</tr>
			</c:forEach>
		</table>
		<br /> <a class="btn btn-default" href="addform.jsp?cliente=<%=c.getId()%>">Adicionar
			novo telefone</a>
	</article>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
