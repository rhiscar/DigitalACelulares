<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
    <body>
        <%@include  file="/includes/header.jsp" %>
        <%@include  file="/includes/header_menu.jsp" %>
        <%@include  file="/includes/menu_principal.jsp" %>
        
        <!-- Page actual content -->
        
        <%@include  file="/includes/destaques.jsp" %>
        
        <div class="content-wrapper hide-until-loading">
          <div id="produtosDestaque"></div>
        </div>
        
        <!-- Page actual content -->
        
        <%@include file="/includes/footer_js.jsp"%>
        <script>
        var listagemProdutos = "";
        listagemProdutos = listagemProdutos + "<h3>olá mundo</h3>";
        $("#produtosDestaque").html(listagemProdutos);
        </script>
    </body>
</html>
