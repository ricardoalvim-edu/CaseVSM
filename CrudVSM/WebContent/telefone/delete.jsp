<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>  
<%@page import="br.com.vsm.casecrud.crud.TelefoneCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Telefone"%>  
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Endereco"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	String id = request.getParameter("id");		
	
	TelefoneCrud ec = new TelefoneCrud();
	Telefone e = ec.byId(Integer.parseInt(id));	
	Integer cliente = e.getClienteBean().getId();
	ec.remove(e);
	
	response.sendRedirect("telefones.jsp?cliente="+cliente);
%>  