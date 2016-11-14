<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Telefone</title>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
	<%@page import="br.com.vsm.casecrud.crud.TelefoneCrud"%>
	<%@page import="br.com.vsm.casecrud.entities.Telefone"%>
	<jsp:include page="../header.jsp"></jsp:include>
	<%
		String id = request.getParameter("id");		
	
		TelefoneCrud ec = new TelefoneCrud();
		Telefone e = ec.byId(Integer.parseInt(id));				
	%>
	<article>
	<h1>Editar telefone</h1>
	<form action="edit.jsp" method="post">
	<table>
		<input type="hidden" name="id" value="<%=e.getId() %>"/>  
		<input type="hidden" name="cliente" value="<%=e.getClienteBean().getId()%>"/>  
		<tr>
			<td>DDD:</td>
			<td><input type="text" name="logradouro" value="<%=e.getDdd() %>"/></td>
		</tr>
		<tr>
			<td>Número:</td>
			<td><input type="text" name="complemento" value="<%=e.getNumero()%>"/></td>
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
