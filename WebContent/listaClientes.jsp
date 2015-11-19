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
        
        <!-- Page actual content -->


        <!-- Items list -->
        <div class="row">
	        <div class="col-md-6 col-sm-6 centered">
		        <div class="space-sep40"></div>
		        <h5>Listagem de clientes</h5>
		        <table id="listaClientes" class="table hover">
			        <thead>
			          <tr>
                  <th width="20px">&nbsp;</th>
                  <th width="20px">&nbsp;</th>
			            <th>Nome</th>
			            <th>E-mail</th>
			            <th>Telefone</th>
			          </tr>
			        </thead>
			        <tbody>
			          <tr>
			            <td>Item #</td>
			            <td>Description</td>
			            <td>Price</td>
			          </tr>
			        </tbody>
		         </table>
	         </div>
         </div>
        <!-- end Items List -->


        <!-- Item editing -->
      <!-- Modal -->
<div class="modal fade" id="divDadosCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Cadastro</h4>
      </div>
      <div class="modal-body">

	       <div class="col-md-12 col-sm-12 animated" data-animtype="flipInY"
	            data-animrepeat="0"
	            data-speed="1s"
	            data-delay="1s">
	           <div class="i-section-title">
	               <i class="icon-users-outline"></i>
	           </div>
	           <div class="space-sep20"></div>
	       </div>
	       
	       <div id="mensagemErro" class="bs-example bs-example-standalone" data-example-id="dismissible-alert-js" style="display:none">
	         <div class="alert alert-danger alert-dismissible fade in" role="alert">
	          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <strong>Preencher campos obrigatórios!</strong> <br/>Verificar campos em destaque para preenchimento!
	         </div>
	       </div>
	       
         <div class="classic-form">
             <form class="form-horizontal" role="form" id="frmDadosCliente" onsubmit="return validaFormulario(this)">
                 <div id="divNome" class="form-group">
                     <label for="name" class="col-sm-3 control-label">Nome</label>
                     <div class="col-sm-9"> 
                         <input type="hidden" name="idCliente" id="idClinnte"/>
                         <input type="text" class="form-control" id="nomeCliente" name="nomeCliente" placeholder="Nome"/>
                     </div>
                 </div>
                 <div id="divCPF" class="form-group">
                     <label for="email" class="col-sm-3 control-label">CPF</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="cpfCliente" name="cpfCliente" placeholder="CPF"/>
                     </div>
                 </div>
                 <div id="divFone" class="form-group">
                     <label for="email" class="col-sm-3 control-label">Telefone</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="telefoneCliente" name="telefoneCliente" placeholder="telefone"/>
                     </div>
                 </div>
                 <div id="divMail" class="form-group">
                     <label for="email" class="col-sm-3 control-label">E-mail</label>
                     <div class="col-sm-9">
                         <input type="email" class="form-control" id="emailCliente" name="emailCliente" placeholder="E-mail" />
                     </div>
                 </div>
                 <div id="divUsuario" class="form-group">
                     <label for="email" class="col-sm-3 control-label">Usuário</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="usuarioCliente" name="usuarioCliente" placeholder="usuario" />
                     </div>
                 </div>
                 <div id="divSenha" class="form-group">
                     <label for="password" class="col-sm-3 control-label">Senha</label>
                     <div class="col-sm-9">
                         <input type="password" class="form-control" id="senhaCliente" name="senhaCliente" placeholder="Senha" />
                     </div>
                 </div>
                 <div id="divConfSenha" class="form-group">
                     <label for="rptpassword" class="col-sm-3 control-label">Confirma Senha</label>
                     <div class="col-sm-9">
                         <input type="password" class="form-control" id="confirmaSenhaCliente" name="confirmaSenhaCliente" placeholder="Confirma Senha">
                     </div>
                 </div>
                 <div class="form-group">
                     <div class="col-sm-offset-3 col-sm-9">
                         <button type="submit" id="btnCriaCliente" class="btn btn-block btn-primary">Salvar Cliente</button>
                     </div>
                 </div>
             </form>
         </div>
<!--.content-wrapper end -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>
        <!-- end Item editing --> 

        <!-- Page actual content -->
        
        <%@include file="/includes/footer_js.jsp"%>
        
        <script>
          var servicoAtual = "servicoCliente"; 
        
          function limpaErrosFormulario() {
        	  $("#divNome").removeClass("has-error");
            $("#divCPF").removeClass("has-error");
            $("#divFone").removeClass("has-error");
            $("#divMail").removeClass("has-error");
            $("#divUsuario").removeClass("has-error");
            $("#divSenha").removeClass("has-error");
            $("#divConfSenha").removeClass("has-error");
            $("#mensagemErro").hide();
          }
          
          function enviaFormulario() {
        	  var json = {"idCliente":$("#idCliente").val(),"nome":$("#nomeCliente").val(),"cpf":$("#cpfCliente").val(),"telefone":$("#telefoneCliente").val(), "email":$("#emailCliente").val(),"usuario":$("#usuarioCliente").val(), "senha":$("#senhaCliente").val()}
        	  
            $.ajax({
              url: 'rest/'+servicoAtual+'/insere',
              type: 'POST',
              data: JSON.stringify(json),
              dataType: 'json',
              contentType: 'application/json',
              success: function(dados) {
                history.reload();
              }
            });
          }
          
          function validaFormulario(formulario) {
        	  var formValido = true;
        	  
        	  limpaErrosFormulario();
        	  
        	  if ($("#nomeCliente").val() == "") {
        		  $("#divNome").addClass("has-error");
        		  formValido = false;
        	  }
            if ($("#cpfCliente").val() == "") {
            	$("#divCPF").addClass("has-error");
            	formValido = false;
            }
            if ($("#telefoneCliente").val() == "") {
            	$("#divFone").addClass("has-error");
            	formValido = false;
            }
            if ($("#emailCliente").val() == "") {
            	$("#divMail").addClass("has-error");
            	formValido = false;
            }
            if ($("#usuarioCliente").val() == "") {
            	$("#divUsuario").addClass("has-error");
            	formValido = false;
            }
            if ($("#senhaCliente").val() == "") {
            	$("#divSenha").addClass("has-error");
            	formValido = false;
            } else if ($("#senhaCliente").val() != $("#confirmaSenhaCliente").val()) {
            	$("#divSenha").addClass("has-error");
            	$("#divConfSenha").addClass("has-error");
            	formValido = false;
            }
            
            if (!formValido) {
            	$("#mensagemErro").show();
            } else {
            	enviaFormulario();
            }
            
            return formValido;
          }
          
	        function carregaListagem(listaClientes) {
	        	var corpoListagem = $('#listaClientes tbody');
	        	corpoListagem.empty();
	        	var obj = ""; 
	        	$.each(listaClientes, function(index,userName) {
        	    
        	    obj += "<tr>";
        	    obj += "<td><div onclick=\"editarRegistro('" + userName.idCliente + "')\" class=\"icon-edit-modify-streamline\" data-toggle=\"modal\" data-target=\"#divDadosCliente\">&nbsp;</div></td>";
        	    obj += "<td><div onclick=\"removerRegistro('" + userName.idCliente + "')\" class=\"icon-delete-garbage-streamline\" data-toggle=\"modal\" data-target=\"#divDadosCliente\">&nbsp;</div></td>";
        	    obj += "<td>"+userName.nome+"</td>";
							obj += "<td>"+userName.email+"</td>";
        	    obj += "<td>"+userName.telefone+"</td>";
        	    obj += "</tr>";
     	    	});
	        	corpoListagem.append(obj);
	        }
	        
	        function carregaFormulario(dados) {
	        	limpaErrosFormulario();
	        	$("#idCliente").val(dados.idCliente);
	        	$("#nomeCliente").val(dados.nome);
	        	$("#cpfCliente").val(dados.cpf);
	        	$("#telefoneCliente").val(dados.telefone);
	        	$("#emailCliente").val(dados.email);
	        	$("#usuarioCliente").val(dados.usuario);
	        	$("#senhaCliente").val(dados.senha);
	        	$("#confirmaSenhaCliente").val(dados.senha);
	        	$("#nomeCliente").focus();
	        }
	        
	        function editarRegistro(id) {
	        	$.ajax({
	            url: 'rest/'+servicoAtual+'/busca/id/'+id,
	            type: 'GET',
	            //data: JSON.stringify(formulario),
	            //dataType: 'json',
	            contentType: 'application/json',
	            success: function(dados) {
	              carregaFormulario(dados);
	            }
            });
	        }
	        
	        function removerRegistro(id) {
	        	alert("Removendo o registro " + id);
	        }
	        
	        $.ajax({
	            url: 'rest/'+servicoAtual+'/pesquisa/*',
	            type: 'GET',
	            //data: JSON.stringify(formulario),
	            //dataType: 'json',
	            contentType: 'application/json',
	            success: function(data) {
	            	carregaListagem(data);
	            }
	        });

        </script>
    </body>
</html>
