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
            

            out.print("<h1>Transações - Conta: " + conta + "</h1>");
            
            out.print("<table border=\"1\">");
            out.print("<tr>");
            out.print("<td>DATA</td>");
            out.print("<td>TRANSAÇÃO</td>");
            out.print("<td>VALOR</td>");
            out.print("</tr>");
            
            
            ContasDAO db = ContasDAO.getInstance();
            List<Conta> contas = db.getContas(conta);
            double total = 0.00;
            for(Conta a:contas){
                //conversão de datas
                String data = a.getData();
                DateFormat formatUS = new SimpleDateFormat("yyyy-MM-dd"); 
                Date dataUS = (Date)formatUS.parse(data);
                SimpleDateFormat formatBR = new SimpleDateFormat("dd/MM/yyyy");
                String dataBR = formatBR.format(dataUS);
                
                int tipoTransacao = a.getTipoTransacao();
                double valor = a.getValor();
                
                out.print("<tr>");
                out.print("<td>");
                out.print(dataBR);
                out.print("</td>");
                out.print("<td>");
                
                if(tipoTransacao == 0){
                    out.print("Crédito (+)");
                   total = total + valor;
               }else{
                    out.print("Débito (-)");
                    total = total - valor;
                }
                
                out.print("</td>");
                out.print("<td>");
                out.print(valor);
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table>");
            out.print("<h2>Saldo: " + total + "</h2>");
        %>
        
        <br><br><br>
        
        <h2>Nova Transação:</h2>
        <form method="post" action="novaTransacao.jsp">
            Conta <input type="text" name="conta"><br>
            Tipo Transação <select id="tipoTransacao" name="tipoTransacao">
                <option value=""></option>
                <option value="0">Crédito</option>
                <option value="1">Débito</option>
            </select><br>
            Valor <input type="text" name="valor"><br>
            <input type="submit" value="Gravar">
            
        </form>
        
    </body>
</html>
