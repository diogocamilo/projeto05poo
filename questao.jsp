<%-- 
    Document   : questao
    Created on : 14/11/2016, 01:54:26
    Author     : diogo
--%>
<%@page import="br.com.fatecpg.quiz.Quiz"%>
<%@page import="br.com.fatecpg.quiz.Hash"%>
<%@page import="br.com.fatecpg.quiz.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<!--
        Hyperspace by HTML5 UP
        html5up.net | @ajlkn
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%
    if (session.getAttribute("Usuario") == null) {
        response.sendRedirect("loginUsuario.jsp");
    }
    else{
        String ultNota = Hash.example.get(session.getAttribute("Usuario"))[0];
        String media = Hash.example.get(session.getAttribute("Usuario"))[1];
        String media = Hash.example.get(session.getAttribute("Usuario"))[1];
        String media = Hash.example.get(session.getAttribute("Usuario"))[1];
        Quiz.lastGrade = Double.parseDouble(ultNota);
        Quiz.gradeSum = Double.parseDouble(media);
    }
%>
<html>
    <head>
        <title>Área de Questões</title>
        <meta charset="ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>
        <!-- Header -->
        <header id="header">
            <b>IT QUIZ</b>
            <nav>
                <ul>                    
                    <li><a><%="Conectado como <b>" + session.getAttribute("Usuario") + "</b>"%></a></li>
                    <li><a href="questao.jsp">Sair</a></li>
                </ul>
            </nav>
        </header>
        <!-- Wrapper -->

        <div id="wrapper">
            <section id="main" class="wrapper">
                <div class="inner">
                    <form action="desempenho.jsp" method="POST" style="margin-top: 10px;">
                        <%
                            ArrayList<Question> test = Quiz.getTest();
                            int i = 0;
                        %>
                        <% for (Question q : Quiz.getTest()) {%>
                        <h3 class="major">Questão <%= test.indexOf(q) + 1%> - <%=q.getQuestion()%> </h3>
                        <div>
                            <div class="12u(small)">
                                <input type="radio"  id="demo-priority-low<%=i%>" name="<%= test.indexOf(q)%>"
                                       value="<%= q.getAlternative()[0]%>">
                                <label for="demo-priority-low<%=i++%>"><%= q.getAlternative()[0]%></label>
                            </div><br>
                            <div class="12u(small)">
                                <input type="radio" id="demo-priority-normal<%=i%>" name="<%= test.indexOf(q)%>"
                                       value="<%= q.getAlternative()[1]%>">
                                <label for="demo-priority-normal<%=i++%>"><%= q.getAlternative()[1]%></label>
                            </div><br>
                            <div class="2u(small)">
                                <input type="radio" id="demo-priority-high<%=i%>" name="<%= test.indexOf(q)%>"
                                       value="<%= q.getAlternative()[2]%>">
                                <label for="demo-priority-high<%=i++%>"><%= q.getAlternative()[2]%></label>
                            </div><br>	
                            <h1 class="major"></h1>
                            <%}%>
                            <ul class="actions">
                                <li><input type="submit" name="user-test"></li>
                            </ul>
                            <br>					
                        </div>
                    </form>
                </div>
            </section>
        </div>

        <!-- Footer -->
        <footer id="footer" class="wrapper style1-alt">
            <div class="inner">
                <ul class="menu">
                    <li>Desenvolvido por Diogo Camilo e Fernando Elói.</li>
                    <li><b>FATEC PRAIA GRANDE</b></li>
                </ul>
            </div>
        </footer>
        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
