<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>  
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Cliente"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	ClienteCrud cc = new ClienteCrud();		
	cc.merge(u);
	response.sendRedirect("clientes.jsp");  
%>  