<%@page import="br.com.vsm.casecrud.crud.EnderecoCrud"%>
<%@page import="br.com.vsm.casecrud.crud.ClienteCrud"%>
<%@page import="br.com.vsm.casecrud.entities.Cliente"%>
<jsp:useBean id="u" class="br.com.vsm.casecrud.entities.Endereco"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
	
	String id = request.getParameter("cliente");
	ClienteCrud cc = new ClienteCrud();
	Cliente c = cc.byId(Integer.parseInt(id));
	u.setClienteBean(c);
	
	EnderecoCrud ec = new EnderecoCrud();
	ec.merge(u);
	response.sendRedirect("enderecos.jsp?cliente="+id); 		
%>

