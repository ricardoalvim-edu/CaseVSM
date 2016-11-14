<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar endereço</title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>
	<%@page import="br.com.vsm.casecrud.entities.Endereco"%>

	<%
		String id = request.getParameter("id");

		EnderecoCrud ec = new EnderecoCrud();
		Endereco e = ec.byId(Integer.parseInt(id));
	%>
	<article>
		<h1>Editar endereço</h1>
		<form action="edit.jsp" method="post">
			<table>
				<input type="hidden" name="id" value="<%=e.getId()%>" />
				<input type="hidden" name="cliente"
					value="<%=e.getClienteBean().getId()%>" />
				<tr>
					<td>Logradouro:</td>
					<td><input type="text" name="logradouro"
						value="<%=e.getLogradouro()%>" /></td>
				</tr>
				<tr>
					<td>Complemento:</td>
					<td><input type="text" name="complemento"
						value="<%=e.getComplemento()%>" /></td>
				</tr>
				<tr>
					<td>Numero:</td>
					<td><input type="text" name="numero"
						value="<%=e.getNumero()%>" /></td>
				</tr>
				<tr>
					<td>Cidade:</td>
					<td><input type="text" name="cidade"
						value="<%=e.getCidade()%>" /></td>
				</tr>
				<tr>
					<td>Estado:</td>
					<td><input type="text" name="estado"
						value="<%=e.getEstado()%>" /></td>
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
