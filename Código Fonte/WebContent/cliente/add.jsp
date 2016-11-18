<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Cliente"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	ClienteCrud cc = new ClienteCrud();
	cc.persist(u);
	
	response.sendRedirect("clientes.jsp");  
%>
