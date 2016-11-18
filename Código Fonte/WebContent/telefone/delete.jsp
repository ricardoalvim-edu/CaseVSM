<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>  
<%@page import="br.com.vsm.casecrud.crud.TelefoneCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Telefone"%>  
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>  
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Telefone"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	String id = request.getParameter("id");		
	
	TelefoneCrud ec = new TelefoneCrud();
	Telefone e = ec.byId(Integer.parseInt(id));	
	e.getClienteBean().getEnderecos().remove(e); 
	ec.remove(e);	     
	
	response.sendRedirect("telefones.jsp?cliente="+e.getClienteBean().getId());
%>  