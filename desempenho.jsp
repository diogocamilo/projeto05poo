<%-- 
    Document   : desempenho
    Created on : 14/11/2016, 02:35:49
    Author     : diogo
--%>

<%@page import="br.com.fatecpg.quiz.Hash"%>
<%@page import="br.com.fatecpg.quiz.Quiz"%>
<%@page import="br.com.fatecpg.quiz.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%

    if (request.getParameter("user-test") != null || 1 == 1) {
        String[] answers = {
            request.getParameter("0"),
            request.getParameter("1"),
            request.getParameter("2"),
            request.getParameter("3"),
            request.getParameter("4"),
            request.getParameter("5"),
            request.getParameter("6"),
            request.getParameter("7"),
            request.getParameter("8"),
            request.getParameter("9")
        };
        Quiz.validateTest(answers);
        Hash.example.replace(session.getAttribute("Usuario").toString(), new String[]{Quiz.getLastGrade()+"", Quiz.getGradesAverage()+"", Quiz.gradeSum+"", Quiz.testsCount+""});
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

        <link rel="stylesheet" href="assets/css/main.css" />
        <title>JSP Page</title>
    </head>
    <body>
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
            <section id="main" class="wrapper"  style="padding: 8em;">     
                <h2 style="text-align: center;">Última Nota</h2>
                <p style="text-align: center;"><%= Hash.example.get(session.getAttribute("Usuario"))[0] + "%"%></p>
                <h1 class="major"></h1>
                <h2 style="text-align: center;">Média</h2>
                <p style="text-align: center;"><%= Hash.example.get(session.getAttribute("Usuario"))[1] + "%"%></p>
                <h1 class="major"></h1>
                <div class="12u(medium)" style="margin: 15px;">
                    <ul class="actions vertical">
                        <li><a href="inicio.html" class="button fit">Voltar ao início da Página</a></li>
                    </ul>
                </div>
            </section>
        </div>
        <!--footer id="footer" class="wrapper style1-alt">
            <div class="inner">
                <ul class="menu">
                    <li>&copy; Untitled. All rights reserved.</li>
                    <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                </ul>
            </div>
        </footer-->
    </body>
</html>
