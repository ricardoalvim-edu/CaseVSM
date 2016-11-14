<!DOCTYPE html>
<html>
<head>
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar endereço</title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<article>
		<h1>Adicionar endereco</h1>
		<%
			String id = request.getParameter("cliente");
			ClienteCrud cc = new ClienteCrud();
			Cliente c = cc.byId(Integer.parseInt(id));
		%>
		<form action="add.jsp" method="post">
			<table>
				<input type="hidden" name="cliente" value="<%=c.getId()%>" />
				<tr>
					<td>DDD:</td>
					<td><input type="text" name="ddd" /></td>
				</tr>
				<tr>
					<td>Número:</td>
					<td><input type="text" name="numero" /></td>
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
