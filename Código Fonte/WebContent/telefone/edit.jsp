<%@page import="br.com.vsm.casecrud.crud.TelefoneCrud"%>  
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>  
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>  
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Telefone"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	String id = request.getParameter("cliente");
	ClienteCrud cc = new ClienteCrud();
	Cliente c = cc.byId(Integer.parseInt(id));	
	TelefoneCrud ec = new TelefoneCrud();	
	u.setClienteBean(c);
	c.getTelefones().remove(u);
	c.getTelefones().add(u);
	
	cc.merge(c);
	response.sendRedirect("telefones.jsp?cliente="+u.getClienteBean().getId());  
%>  