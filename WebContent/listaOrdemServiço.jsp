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
		        <h5>Listagem de ordem serviço</h5>
		        <table id="listaOrdemServicos" class="table hover">
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
<div class="modal fade" id="divDadosOrdemServico" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
             <form class="form-horizontal" role="form" id="frmDadosOrdemServico" onsubmit="return validaFormulario(this)">
                 <div id="divNome" class="form-group">
                     <label for="name" class="col-sm-3 control-label">Nome</label>
                     <div class="col-sm-9"> 
                         <input type="hidden" name="idOrdemServico" id="idClinnte"/>
                         <input type="text" class="form-control" id="nomeOrdemServico" name="nomeOrdemServico" placeholder="Nome"/>
                     </div>
                 </div>
                 <div id="divCPF" class="form-group">
                     <label for="email" class="col-sm-3 control-label">CPF</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="cpfOrdemServico" name="cpfOrdemServico" placeholder="CPF"/>
                     </div>
                 </div>
                 <div id="divFone" class="form-group">
                     <label for="email" class="col-sm-3 control-label">Telefone</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="telefoneOrdemServico" name="telefoneOrdemServico" placeholder="telefone"/>
                     </div>
                 </div>
                 <div id="divMail" class="form-group">
                     <label for="email" class="col-sm-3 control-label">E-mail</label>
                     <div class="col-sm-9">
                         <input type="email" class="form-control" id="emailOrdemServico" name="emailOrdemServico" placeholder="E-mail" />
                     </div>
                 </div>
                 <div id="divUsuario" class="form-group">
                     <label for="email" class="col-sm-3 control-label">Usuário</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="usuarioOrdemServico" name="usuarioOrdemServico" placeholder="usuario" />
                     </div>
                 </div>
                 <div id="divSenha" class="form-group">
                     <label for="password" class="col-sm-3 control-label">Senha</label>
                     <div class="col-sm-9">
                         <input type="password" class="form-control" id="senhaOrdemServico" name="senhaOrdemServico" placeholder="Senha" />
                     </div>
                 </div>
                 <div id="divConfSenha" class="form-group">
                     <label for="rptpassword" class="col-sm-3 control-label">Confirma Senha</label>
                     <div class="col-sm-9">
                         <input type="password" class="form-control" id="confirmaSenhaOrdemServico" name="confirmaSenhaOrdemServico" placeholder="Confirma Senha">
                     </div>
                 </div>
                 <div class="form-group">
                     <div class="col-sm-offset-3 col-sm-9">
                         <button type="submit" id="btnCriaOrdemServico" class="btn btn-block btn-primary">Salvar OrdemServico</button>
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
          var servicoAtual = "servicoOrdemServico"; 
        
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
        	  var json = {"idOrdemServico":$("#idOrdemServico").val(),"nome":$("#nomeOrdemServico").val(),"cpf":$("#cpfOrdemServico").val(),"telefone":$("#telefoneOrdemServico").val(), "email":$("#emailOrdemServico").val(),"usuario":$("#usuarioOrdemServico").val(), "senha":$("#senhaOrdemServico").val()}
        	  
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
        	  
        	  if ($("#nomeOrdemServico").val() == "") {
        		  $("#divNome").addClass("has-error");
        		  formValido = false;
        	  }
            if ($("#cpfOrdemServico").val() == "") {
            	$("#divCPF").addClass("has-error");
            	formValido = false;
            }
            if ($("#telefoneOrdemServico").val() == "") {
            	$("#divFone").addClass("has-error");
            	formValido = false;
            }
            if ($("#emailOrdemServico").val() == "") {
            	$("#divMail").addClass("has-error");
            	formValido = false;
            }
            if ($("#usuarioOrdemServico").val() == "") {
            	$("#divUsuario").addClass("has-error");
            	formValido = false;
            }
            if ($("#senhaOrdemServico").val() == "") {
            	$("#divSenha").addClass("has-error");
            	formValido = false;
            } else if ($("#senhaOrdemServico").val() != $("#confirmaSenhaOrdemServico").val()) {
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
          
	        function carregaListagem(listaOrdemServicos) {
	        	var corpoListagem = $('#listaOrdemServicos tbody');
	        	corpoListagem.empty();
	        	var obj = ""; 
	        	$.each(listaOrdemServicos, function(index,userName) {
        	    
        	    obj += "<tr>";
        	    obj += "<td><div onclick=\"editarRegistro('" + userName.idOrdemServico + "')\" class=\"icon-edit-modify-streamline\" data-toggle=\"modal\" data-target=\"#divDadosOrdemServico\">&nbsp;</div></td>";
        	    obj += "<td><div onclick=\"removerRegistro('" + userName.idOrdemServico + "')\" class=\"icon-delete-garbage-streamline\" data-toggle=\"modal\" data-target=\"#divDadosOrdemServico\">&nbsp;</div></td>";
        	    obj += "<td>"+userName.nome+"</td>";
							obj += "<td>"+userName.email+"</td>";
        	    obj += "<td>"+userName.telefone+"</td>";
        	    obj += "</tr>";
     	    	});
	        	corpoListagem.append(obj);
	        }
	        
	        function carregaFormulario(dados) {
	        	limpaErrosFormulario();
	        	$("#idOrdemServico").val(dados.idOrdemServico);
	        	$("#nomeOrdemServico").val(dados.nome);
	        	$("#cpfOrdemServico").val(dados.cpf);
	        	$("#telefoneOrdemServico").val(dados.telefone);
	        	$("#emailOrdemServico").val(dados.email);
	        	$("#usuarioOrdemServico").val(dados.usuario);
	        	$("#senhaOrdemServico").val(dados.senha);
	        	$("#confirmaSenhaOrdemServico").val(dados.senha);
	        	$("#nomeOrdemServico").focus();
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
