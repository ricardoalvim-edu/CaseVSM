<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>  
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>  
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Endereco"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	String id = request.getParameter("cliente");
	ClienteCrud cc = new ClienteCrud();
	Cliente c = cc.byId(Integer.parseInt(id));	
	EnderecoCrud ec = new EnderecoCrud();	
	u.setClienteBean(c);
	c.getEnderecos().remove(u);
	c.getEnderecos().add(u);
	
	cc.merge(c);
	response.sendRedirect("enderecos.jsp?cliente="+u.getClienteBean().getId());  
%>  