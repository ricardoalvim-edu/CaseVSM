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
	<h1>Adicionar endereco</h1>
	<%
		String id = request.getParameter("cliente");
		ClienteCrud cc = new ClienteCrud();
		Cliente c = cc.byId(Integer.parseInt(id));
	%>
	
	<article>
	<form action="add.jsp" method="post">
	<table>
		<input type="hidden" name="cliente" value="<%=c.getId() %>"/>  	
		<tr>
			<td>Logradouro:</td>
			<td><input type="text" name="logradouro" /></td>
		</tr>
		<tr>
			<td>Complemento:</td>
			<td><input type="text" name="complemento" /></td>
		</tr>
		<tr>
			<td>Numero:</td>
			<td><input type="text" name="numero" /></td>
		</tr>
		<tr>
			<td>Cidade:</td>
			<td><input type="text" name="cidade" /></td>
		</tr>
		<tr>
			<td>Estado:</td>
			<td><input type="text" name="estado" /></td>
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
