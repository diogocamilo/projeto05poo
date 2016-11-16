<%-- 
    Document   : loginUsuario
    Created on : 15/11/2016, 21:11:28
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.quiz.Hash"%>
<%@page import="br.com.fatecpg.quiz.Usuario"%>
<% session.setAttribute("Usuario", null); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Autenticação de Usuário</title>
        <meta charset="utf-8" />
        <style>
        </style>
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
                    <li><a href="inicio.html">Voltar</a></li>
                </ul>
            </nav>
        </header>

        <div id="wrapper">
            <section>
                <div class="ab_center" style="margin-top: 10%; margin-right: 15%; margin-left: 15%; float: center;">
                    <h2 style="text-align: center;">Insira o seu nome de usuário</h2>
                    <form method="post" action="#">
                        <div class="row uniform">
                            <div class="12u">
                                <input type="text" name="login" id="name" value="" placeholder="Escreva seu nome" />
                            </div>
                            <div class="6u 12u$(xsmall)">
                                <label id="mensagemErro" style="color: rgba(255, 255, 255, 0.35) !important; "></label>
                                <ul class="actions">
                                    <li><input type="submit" name="submit" value="Logar" class="special" style="align: center;" /></li>                                    
                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
                <%
                    Usuario user = new Usuario();
                    Hash h = new Hash();
                    user.setNome(request.getParameter("login"));
                    if(request.getParameter("submit") != null)
                    if (h.login(user)) {
                        session.setAttribute("Usuario", user.getNome());
                %>
                <script>
                    document.getElementById('mensagemErro').innerHTML = 'Olá <%=session.getAttribute("Usuario")%>! <a href="questao.jsp">Clique aqui para iniciar o teste.</a>';
                </script>
                <% } else {%>
                <script>
                    document.getElementById('mensagemErro').innerHTML = 'Usuário inexistente! <a href="inicio.html">Voltar a página inicial.</a>';
                </script>
                <% }%>
            </section>
        </div>
    </body>
</html>
