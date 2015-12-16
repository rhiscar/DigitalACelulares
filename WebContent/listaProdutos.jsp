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
            <h5>Listagem de produtos </h5>
            <table id="listaProdutos" class="table hover">
              <thead>
                <tr>
                  <th width="20px"><div onclick="novoItem()" class="icon-file-add" data-toggle="modal" data-target="#divDadosProduto">&nbsp;</div></th>
                  <th width="20px">&nbsp;</th>
                  <th>Nome</th>
                  <th>Descricao</th>
                  <th>Valor Unitário</th>
                  <th>Valor Atacado</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>&nbsp;</td>
                  <td colspan="5">Carregando dados...</td>
                </tr>
              </tbody>
             </table>
           </div>
         </div>
        <!-- end Items List -->


        <!-- Item editing -->
      <!-- Modal -->
<div class="modal fade" id="divDadosProduto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Produto</h4>
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
             <form class="form-horizontal" role="form" id="frmDadosProduto" onsubmit="return validaFormulario(this); return false;">
                 <div id="divCategoria" class="form-group">
                     <label for="nomeProduto" class="col-sm-3 control-label">Categoria</label>
                     <div class="col-sm-9">
                         <select class="form-control" id="categoriaProduto" name="categoriaProduto"></select>
                     </div>
                 </div>
                 <div id="divNome" class="form-group">
                     <label for="nomeProduto" class="col-sm-3 control-label">Nome</label>
                     <div class="col-sm-9">
                         <input type="hidden" nome="idProduto" id="idProduto"/>
                         <input type="text" class="form-control" id="nomeProduto" name="nomeProduto" placeholder="Nome"/>
                     </div>
                 </div>
                 <div id="divDescricao" class="form-group">
                     <label for="descProduto" class="col-sm-3 control-label">Descrição</label>
                     <div class="col-sm-9">
                         <textArea class="form-control" id="descProduto" name="descProduto" placeholder="Descricao"></textArea>
                     </div>
                 </div>
                 <div id="divMarca" class="form-group">
                     <label for="marcaProduto" class="col-sm-3 control-label">Marca</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="marcaProduto" name="marcaProduto" placeholder="Marca"/>
                     </div>
                 </div>
                 <div id="divModelo" class="form-group">
                     <label for="modeloProduto" class="col-sm-3 control-label">Modelo</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="modeloProduto" name="modeloProduto" placeholder="Modelo"/>
                     </div>
                 </div>
                 <div id="divValorUnitario" class="form-group">
                     <label for="valorUnitario" class="col-sm-3 control-label">Valor Unitário</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="valorUnitario" name="valorUnitario" placeholder="Valor"/>
                     </div>
                 </div>
                 <div id="divValorAtacado" class="form-group">
                     <label for="valorProduto" class="col-sm-3 control-label">Valor Atacado</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="valorAtacado" name="valorAtacado" placeholder="Valor"/>
                     </div>
                 </div>

                 <div class="form-group">
                     <div class="col-sm-offset-3 col-sm-9">
                         <button type="button" id="btnCriaProduto" onclick="enviaFormulario()" class="btn btn-block btn-primary">Salvar Produto</button>
                     </div>
                 </div>
                 <div id="divFoto" class="form-group">
                     <label for="fotoProduto" class="col-sm-3 control-label">Foto</label>
                     <div class="col-sm-9">
                       <form action="rest/servicoProduto/uploadImagemProduto" id="frmFotoProduto" method="post" enctype="multipart/form-data">
                         <input type="file" class="form-control" id="fotoProduto" name="fotoProduto" placeholder="Foto"/>
                       </form>
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
          var servicoAtual = "servicoProduto"; 
        
          function limpaErrosFormulario() {
            $("#divNome").removeClass("has-error");
            $("#divDescricao").removeClass("has-error");
            $("#mensagemErro").hide();
          }
          
          function enviaFormulario() {
            var json = {"idProduto":$("#idProduto").val(),"nome":$("#nomeProduto").val(),"descricao":$("#descProduto").val(),"marca":$("#marcaProduto").val(),"modelo":$("#modeloProduto").val(),"idCategoria":$("#categoriaProduto").val(),"valorUnitario":$("#valorUnitario").val(),"valorAtacado":$("#valorAtacado").val()}
            $.ajax({
              url: 'rest/'+servicoAtual+'/insere',
              type: 'POST',
              data: JSON.stringify(json),
              dataType: 'json',
              contentType: 'application/json',
              success: function(dados) {
            	  $("frmFotoProduto").action = "rest/servicoProduto/uploadImagemProduto/" + $("#idProduto").val();
                $("frmFotoProduto").submit();
                alert("Mudou!");
            	 // history.reload();
              }
            });
            
            return false;
          }
          
          function novoItem() {
        	  limpaErrosFormulario();
          }
          
          function validaFormulario(formulario) {
            var formValido = true;
            
            limpaErrosFormulario();
            
            if ($("#nomeProduto").val() == "") {
              $("#divNome").addClass("has-error");
              formValido = false;
            }
            if ($("#descProduto").val() == "") {
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
          
          function carregaListagem(listaProdutos) {
            var corpoListagem = $('#listaProdutos tbody');
            corpoListagem.empty();
            var obj = ""; 
            $.each(listaProdutos, function(index,cad) {
              
              obj += "<tr>";
              obj += "<td><div onclick=\"editarRegistro('" + cad.idProduto + "')\" class=\"icon-edit-modify-streamline\" data-toggle=\"modal\" data-target=\"#divDadosProduto\">&nbsp;</div></td>";
              obj += "<td><div onclick=\"removerRegistro('" + cad.idProduto + "')\" class=\"icon-delete-garbage-streamline\">&nbsp;</div></td>";
              obj += "<td>"+cad.nome+"</td>";
              obj += "<td>"+cad.descricao+"</td>";
              obj += "<td>"+cad.valorUnitario+"</td>";
              obj += "<td>"+cad.valorAtacado+"</td>";
              obj += "</tr>";
            });
            corpoListagem.append(obj);
          }
          
          function carregaFormulario(dados) {
            limpaErrosFormulario();
            //(dados.idProduto);
            $("#idProduto").val(dados.idProduto);
            $("#nomeProduto").val(dados.nome);
            $("#descProduto").val(dados.descricao);
            $("#marcaProduto").val(dados.marca);
            $("#modeloProduto").val(dados.modelo);
            $("#valorUnitario").val(dados.valorUnitario);
            $("#valorAtacado").val(dados.valorAtacado);
            $("#nomeProduto").focus();
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
          
          function carregaListaCategorias(listaCategorias) {
        	  $.each(listaCategorias, function(index,cat) {
        	  	$("#categoriaProduto").append('<option value="' + cat.idCategoria + '">' + cat.nome + '</option>');
        	  });
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
	          $.ajax({
	              url: 'rest/servicoCategoria/pesquisa/*',
	              type: 'GET',
	              //data: JSON.stringify(formulario),
	              //dataType: 'json',
	              contentType: 'application/json',
	              success: function(listaCategorias) {
	                carregaListaCategorias(listaCategorias);
	              }
	          });
          }

          buscaDados();
        </script>
    </body>
</html>
