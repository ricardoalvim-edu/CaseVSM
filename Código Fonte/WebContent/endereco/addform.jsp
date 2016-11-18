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
	
	<%
		String id = request.getParameter("cliente");
		ClienteCrud cc = new ClienteCrud();
		Cliente c = cc.byId(Integer.parseInt(id));
	%>
	
	<article>
	<h1>Adicionar endereco</h1>
	<form action="add.jsp" method="post">
	<table>
		<input type="hidden" name="cliente" value="<%=c.getId() %>"/>  	
		<tr>
			<td>Logradouro:</td>
			<td><input type="text" name="logradouro" class="form-control" /></td>
		</tr>
		<tr>
			<td>Complemento:</td>
			<td><input type="text" name="complemento" class="form-control"/></td>
		</tr>
		<tr>
			<td>Numero:</td>
			<td><input type="text" name="numero" class="form-control" /></td>
		</tr>
		<tr>
			<td>Cidade:</td>
			<td><input type="text" name="cidade" class="form-control"/></td>
		</tr>
		<tr>
			<td>Estado:</td>
			<td>
			<select class="form-control" name="estado">
				<option value="AC">AC</option>
				<option value="AL">AL</option>
				<option value="AP">AP</option>
				<option value="AM">AM</option>
				<option value="BA">BA</option>
				<option value="CE">CE</option>
				<option value="DF">DF</option>
				<option value="ES">ES</option>
				<option value="GO">GO</option>
				<option value="MA">MA</option>
				<option value="MT">MT</option>
				<option value="MS">MS</option>
				<option value="MG">MG</option>
				<option value="PA">PA</option>
				<option value="PB">PB</option>
				<option value="PR">PR</option>
				<option value="PE">PE</option>
				<option value="PI">PI</option>
				<option value="RJ">RJ</option>
				<option value="RN">RN</option>
				<option value="RS">RS</option>
				<option value="RO">RO</option>
				<option value="RR">RR</option>
				<option value="SC">SC</option>
				<option value="SP">SP</option>
				<option value="SE">SE</option>
				<option value="TO">TO</option>
			</select>
			
		</tr>
		<tr>
			<td colspan="2">			
			<input class="btn btn-default" type="submit" value="Salvar" /></td>
		</tr>
	</table>
</form>
</article>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
