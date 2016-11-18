<%@page import="br.com.vsm.casecrud.crud.TelefoneCrud"%>
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Telefone"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	
	String id = request.getParameter("cliente");
	ClienteCrud cc = new ClienteCrud();
	Cliente c = cc.byId(Integer.parseInt(id));
	c.getTelefones().add(u);
	u.setClienteBean(c);	
	TelefoneCrud ec = new TelefoneCrud();
	ec.persist(u);
	cc.merge(c);
	response.sendRedirect("telefones.jsp?cliente="+id); 		
%>

