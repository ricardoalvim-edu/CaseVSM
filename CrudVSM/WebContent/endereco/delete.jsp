<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>  
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Endereco"%>  
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Endereco"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	String id = request.getParameter("id");		
	
	EnderecoCrud ec = new EnderecoCrud();
	Endereco e = ec.byId(Integer.parseInt(id));	
	Integer cliente = e.getClienteBean().getId();
	ec.remove(e);
	
	response.sendRedirect("enderecos.jsp?cliente="+cliente);
%>  