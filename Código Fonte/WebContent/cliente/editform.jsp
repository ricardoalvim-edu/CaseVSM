<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../head.jsp"></jsp:include>
<title>Editar endereço</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
	<%@page import="br.com.vsm.casecrud.entities.Cliente"%>


	<%
		String id = request.getParameter("id");
		ClienteCrud cc = new ClienteCrud();
		Cliente c = cc.byId(Integer.parseInt(id));
	%>
	<article>
		<h1>Editar cliente</h1>
		<form action="edit.jsp" method="post">
			<table>
				<input type="hidden" name="id" value="<%=c.getId()%>" />
				<tr>
					<td>Nome:</td>
					<td><input type="text" name="nome" value="<%=c.getNome()%>" /></td>
				</tr>
				<tr>
					<td>CPF:</td>
					<td><input type="text" name="cpf" value="<%=c.getCpf()%>" /></td>
				</tr>
				<tr>
					<td colspan="2"><input class="btn btn-default" type="submit" value="Salvar" /></td>
				</tr>
			</table>
		</form>
	</article>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
