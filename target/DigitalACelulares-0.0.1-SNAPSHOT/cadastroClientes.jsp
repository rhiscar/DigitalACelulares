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
        <%@include  file="/includes/menu_principal_admin.jsp" %>
        <!-- initiates crude code -->
        <div>
        
        <div class="top-title-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="page-info">
                                    <h1 class="h1-page-title">Clientes</h1>


                                    <!-- BreadCrumb -->
                                    <div class="breadcrumb-container">
                                        <ol class="breadcrumbs">
                                            <li class="active">Cadastro de Clientes</li>
                                        </ol>
                                    </div>
                                    <!-- BreadCrumb -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--.top wrapper end -->

            <div class="loading-container">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>


            <div class="content-wrapper hide-until-loading"><div class="body-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 animated" data-animtype="flipInY"
                                 data-animrepeat="0"
                                 data-speed="1s"
                                 data-delay="0.5s">
                                <h2 class="h2-section-title">Cadastro</h2>

                                <div class="i-section-title">
                                    <i class="icon-users-outline">

                                    </i>
                                </div>

                                <div class="space-sep20"></div>
                            </div>            
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6 centered">
                                <div class="classic-form">
                                    <form class="form-horizontal" role="form" novalidate>
                                        <div class="form-group">
                                            <label for="name" class="col-sm-3 control-label">Nome</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="name" placeholder="Name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-3 control-label">CPF</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="cpf" name="cpf" placeholder="CPF">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-3 control-label">Telefone</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="telefone" name="telefone" placeholder="telefone">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-3 control-label">E-mail</label>
                                            <div class="col-sm-9">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-3 control-label">Usuário</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="usuario">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-3 control-label">Senha</label>
                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" id="password" name="password" placeholder="Senha">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="rptpassword" class="col-sm-3 control-label">Confirma Senha</label>
                                            <div class="col-sm-9">
                                                <input type="password" class="form-control" id="rptpassword" placeholder="Confirma Senha">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-block btn-primary">Cria Cliente</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--.content-wrapper end -->
        </div>
        <!-- finilize crude code -->
        <%@include file="/includes/footer_js.jsp"%>
        
        <script>
          var servicoAtual = "servicoCliente";
        
	        function GetURLParameter(sParam) {
	            var sPageURL = window.location.search.substring(1);
	            var sURLVariables = sPageURL.split('&');
	            for (var i = 0; i < sURLVariables.length; i++) {
	                var sParameterName = sURLVariables[i].split('=');
	                if (sParameterName[0] == sParam) {
	                    return sParameterName[1];
	                }
	            }
	            return null;
	        }
	        
	        function carregaFormulario(dados) {
	        	alert(dados.nome);
	        }

	        var id = GetURLParameter("id");
        
	        if (id != null && id != "") {
		        $.ajax({
		            url: 'rest/'+servicoAtual+'/busca/id/'+id,
		            type: 'GET',
		            //data: JSON.stringify(formulario),
		            //dataType: 'json',
		            contentType: 'application/json',
		            success: function(data) {
		              carregaFormulario(data);
		            }
		        });
	        } else {
	        	window.location.replace("listaClientes.jsp")
	        }
        </script>
    </body>
</html>
