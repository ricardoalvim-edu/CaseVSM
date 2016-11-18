<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>  
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Endereco"%>  
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Endereco"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	String id = request.getParameter("id");		
	
	ClienteCrud ec = new ClienteCrud();
	Cliente e = ec.byId(Integer.parseInt(id));	
	ec.remove(e);
	
	response.sendRedirect("clientes.jsp");
%>  