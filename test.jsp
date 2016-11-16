<%-- 
    Document   : test
    Created on : Nov 11, 2016, 8:30:57 AM
    Author     : Fatec
--%>

<%@page import="br.com.fatecpg.quiz.Quiz"%>
<%@page import="br.com.fatecpg.quiz.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Quiz - Teste</title>
    </head>
    <body>
        <h1>WebQuiz</h1>
        <h2>Teste</h2>
        <hr>
        <form action="index.jsp">
            <%ArrayList<Question> test = Quiz.getTest(); %>
            <% for (Question q : Quiz.getTest()) {%>
            <h3><%=q.getQuestion()%></h3>
            <input type="radio" name="<%= test.indexOf(q)%>"
                   value="<%= q.getAlternative()[0]%>"/>
            <%= q.getAlternative()[0]%>
            <input type="radio" name="<%= test.indexOf(q)%>"
                   value="<%= q.getAlternative()[1]%>"/>
            <%= q.getAlternative()[1]%>
            <input type="radio" name="<%= test.indexOf(q)%>"
                   value="<%= q.getAlternative()[2]%>"/>
            <%= q.getAlternative()[2]%>
            <hr>
            <%}%>
            <input type="submit" name="user-test" value="Confirmar">
        </form>
    </body>
</html>
