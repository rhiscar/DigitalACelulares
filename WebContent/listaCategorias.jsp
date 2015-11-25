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
            <h5>Listagem de categorias </h5>
            <table id="listaCategorias" class="table hover">
              <thead>
                <tr>
                  <th width="20px"><div onclick="novoItem()" class="icon-file-add" data-toggle="modal" data-target="#divDadosCategoria">&nbsp;</div></th>
                  <th width="20px">&nbsp;</th>
                  <th>Nome</th>
                  <th>Descricao</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>&nbsp;</td>
                  <td>Carregando dados...</td>
                </tr>
              </tbody>
             </table>
           </div>
         </div>
        <!-- end Items List -->


        <!-- Item editing -->
      <!-- Modal -->
<div class="modal fade" id="divDadosCategoria" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Categoria</h4>
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
             <form class="form-horizontal" role="form" id="frmDadosCategoria" onsubmit="return validaFormulario(this)">
                 <div id="divNome" class="form-group">
                     <label for="nomeCategoria" class="col-sm-3 control-label">Nome</label>
                     <div class="col-sm-9">
                         <input type="hidden" nome="idCategoria" id="idCategoria"/>
                         <input type="text" class="form-control" id="nomeCategoria" name="nomeCategoria" placeholder="Nome"/>
                     </div>
                 </div>
                 <div id="divDescricao" class="form-group">
                     <label for="descCategoria" class="col-sm-3 control-label">Descrição</label>
                     <div class="col-sm-9">
                         <textArea class="form-control" id="descCategoria" name="descCategoria" placeholder="Descricao"></textArea>
                     </div>
                 </div>
                 <div id="divFoto" class="form-group">
                     <label for="fotoCategoria" class="col-sm-3 control-label">Foto</label>
                     <div class="col-sm-9">
                         <input type="file" class="form-control" id="fotoCategoria" name="fotoCategoria" placeholder="Foto"/>
                     </div>
                 </div>
                 <div class="form-group">
                     <div class="col-sm-offset-3 col-sm-9">
                         <button type="submit" id="btnCriaCategoria" class="btn btn-block btn-primary">Salvar Categoria</button>
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
          var servicoAtual = "servicoCategoria"; 
        
          function limpaErrosFormulario() {
            $("#divNome").removeClass("has-error");
            $("#divDescricao").removeClass("has-error");
            $("#mensagemErro").hide();
          }
          
          function enviaFormulario() {
            var json = {"idCategoria":$("#idCategoria").val(),"nome":$("#nomeCategoria").val(),"descricao":$("#descCategoria").val()}
            
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
          
          function novoItem() {
        	  limpaErrosFormulario();
          }
          
          function validaFormulario(formulario) {
            var formValido = true;
            
            limpaErrosFormulario();
            
            if ($("#nomeCategoria").val() == "") {
              $("#divNome").addClass("has-error");
              formValido = false;
            }
            if ($("#descCategoria").val() == "") {
              $("#divDescricao").addClass("has-error");
              formValido = false;
            }
            
            if (!formValido) {
              $("#mensagemErro").show();
            } else {
              enviaFormulario();
            }
            
            return formValido;
          }
          
          function carregaListagem(listaCategorias) {
            var corpoListagem = $('#listaCategorias tbody');
            corpoListagem.empty();
            var obj = ""; 
            $.each(listaCategorias, function(index,cad) {
              
              obj += "<tr>";
              obj += "<td><div onclick=\"editarRegistro('" + cad.idCategoria + "')\" class=\"icon-edit-modify-streamline\" data-toggle=\"modal\" data-target=\"#divDadosCategoria\">&nbsp;</div></td>";
              obj += "<td><div onclick=\"removerRegistro('" + cad.idCategoria + "')\" class=\"icon-delete-garbage-streamline\">&nbsp;</div></td>";
              obj += "<td>"+cad.nome+"</td>";
              obj += "<td>"+cad.descricao+"</td>";
              obj += "</tr>";
            });
            corpoListagem.append(obj);
          }
          
          function carregaFormulario(dados) {
            limpaErrosFormulario();
            //(dados.idCategoria);
            $("#idCategoria").val(dados.idCategoria);
            $("#nomeCategoria").val(dados.nome);
            $("#descCategoria").val(dados.descricao);
            $("#nomeCategoria").focus();
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
        	  if (confirm ("Confirma remoção do registro?")) {
	        	  $.ajax({
	                  url: 'rest/'+servicoAtual+'/remove/'+id,
	                  type: 'DELETE',
	                  //data: JSON.stringify(formulario),
	                  //dataType: 'json',
	                  contentType: 'application/json',
	                  success: function(dados) {
	                	  buscaDados();
	                  }
	                });
      		  }
          }
          
          function buscaDados(){
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
          }
          
          buscaDados();

        </script>
    </body>
</html>
