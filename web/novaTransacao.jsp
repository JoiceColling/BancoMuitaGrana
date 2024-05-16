<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.feevale.contas.Conta" %>
<%@page import="br.feevale.contas.ContasDAO" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.ParseException" %>
<%@page import="java.text.DateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int conta = Integer.parseInt(request.getParameter("conta"));
            int tipoTransacao = Integer.parseInt(request.getParameter("tipoTransacao"));
            Double valor = Double.parseDouble(request.getParameter("valor").replace(',', '.'));
            
            ContasDAO db = ContasDAO.getInstance();
            Conta a = new Conta();
            a.setConta(conta);
            a.setTipoTransacao(tipoTransacao);
            a.setValor(valor);
                
            db.addConta(a);
            
            response.sendRedirect("transacoes.jsp" + "?conta=" + conta);
        %>
    </body>
</html>
