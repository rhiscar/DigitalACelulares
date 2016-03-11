<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html ng-app="digitala"> <!--<![endif]-->
    <body>
        <%@include  file="/includes/header.jsp" %>
        <%@include  file="/includes/header_menu.jsp" %>
        <%@include  file="/includes/menu_principal_admin.jsp" %>

        <script>
          var digitala = angular.module('digitala', []);
        
	        //PRODUTO SERVICE
	        digitala.service('produtoService', function($http, $q){
	        	
	        	this.listaProdutos = function(){
	        		var def = $q.defer();
	        		$http({
	        			url:'rest/'+servicoAtual+'/pesquisa/*',
	              method: 'GET'
	        		}).then(
	        				  function success(response){
	        					  def.resolve(response.data);
	        				  },
	        				  function error(response){
	        					  console.log("ERROR: "+response.data);
	        				  }
	        		);
	        		
	        		return def.promise;
	        	}
	        });
	        
	        //CATEGORIA SERVICE
	       digitala.service('categoriaService', function($http, $q){
	    	   
	    	    this.listaCategorias = function(){
	    	    	var def = $q.defer();
	    	    	$http({
	    	    		url: 'rest/servicoCategoria/pesquisa/*',
	    	    		method:'GET'
	    	    		
	    	    	}).then(
	    	    			  function success(response){
	    	    				  
	    	    				  def.resolve(response.data);
	    	    				  
	    	    			  }, 
	    	    			  function error(response){
	    	    				  
	    	    				  console.log('ERROR:'+response.data);
	    	    				  
	    	    			  }	
	    	    	);
	    	    	return def.promise;
	    	    	
	    	    }
	       });
	        
	        //PRODUTO CONTROLLER
	        digitala.controller('produtoController', function($scope, produtoService){

	        	$scope.listaProdutos = function (){
	        		
	        	  produtoService.listaProdutos().then(
	        		 function(response){
	        			
	        			 $scope.produtos = response;
	        		 }	  
	        	  );
	        	 
	        	}//fim da funcao listaProdutos
	        	
            $scope.currentPage = 0;
            $scope.pageSize = 10;
            $scope.numberOfPages=function(){
                return Math.ceil($scope.produtos.length/$scope.pageSize);                
            }
	        	
	        	$scope.editProduct = function (dados) {
	        		
	                limpaErrosFormulario();
	                $("#idProduto").val(dados.idProduto);
	                $("#nomeProduto").val(dados.nome);
	                $("#categoriaProduto").val(dados.idCategoria);
	                $("#descProduto").val(dados.descricao);
	                $("#marcaProduto").val(dados.marca);
	                $("#modeloProduto").val(dados.modelo);
	                $("#valorUnitario").val(dados.valorUnitario);
	                $("#valorAtacado").val(dados.valorAtacado);
	                $("#destaque").val(dados.destaque);
	                $("#fotoProduto").attr("src", "images/produtos/bigProduto"+dados.idProduto+".jpg");
	                $("#nomeProduto").focus();
	              };
	
	               $scope.listaProdutos();
	        	  
	        });
	        
	        //CATEGORIA CONTROLLER
	        digitala.controller('categoriaController', function($scope,categoriaService){
	        	
	        	$scope.listaCategorias = function(){
	              categoriaService.listaCategorias().then(
	            		  function(response){
	            			  $scope.categorias = response;
	            		  }	  
	              );
	             }
	        	
	            $scope.listaCategorias();
	        });
          
          digitala.filter('startFrom', function() {
              return function(input, start) {
                  start = +start; //parse to int
                  return input.slice(start);
              }
          });
        </script>
        
        <!-- Page actual content -->


        <!-- Items list -->
        <div class="row" ng-controller="produtoController">
          <div class="col-md-6 col-sm-6 centered">
            <div class="space-sep40"></div>
            <h5>Listagem de produtos <input ng-model="filtro" ></h5>
            <br/>
            
            <table id="listaProdutos" class="table hover">
              <thead>
                <tr>
                  <th width="20px"><div onclick="novoItem()" class="icon-file-add" data-toggle="modal" data-target="#divDadosProduto">&nbsp;</div></th>
                  <th width="20px">&nbsp;</th>
                  <th width="50%">Nome</th>
                  <th>Valor Unitário</th>
                  <th>Valor Atacado</th>
                </tr>
              </thead>
              <tbody>
                <tr ng-show="!produtos.length">
                  <td>&nbsp;</td>
                  <td colspan="4">Carregando dados...</td>
                </tr>
                <tr ng-repeat="produto in produtos | filter:filtro | startFrom:currentPage*pageSize | limitTo:pageSize"">
	                <td><div ng-click="editProduct(produto);" class="icon-edit-modify-streamline" data-toggle="modal" data-target="#divDadosProduto">&nbsp;</div></td>
	                <td><div ng-click="removerRegistro('{{produto.idProduto}}')" class="icon-delete-garbage-streamline">&nbsp;</div></td>
	                <td>{{produto.nome}}</td>
	                <td>{{produto.valorUnitario}}</td>
	                <td>{{produto.valorAtacado}}</td>
                </tr>
                <tr>
                <td>&nbsp;</td>
                <td colspan="4">
                      <button class="" ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">
									        Anterior
									    </button>
									    {{currentPage+1}}/{{numberOfPages()}}
									    <button class="" ng-disabled="currentPage >= produtos.length/pageSize - 1" ng-click="currentPage=currentPage+1">
									        Próxima
									    </button>
                </td>
                </tr>
              </tbody>
             </table>
           </div>
         </div>
        <!-- end Items List -->


        <!-- Item editing -->
      <!-- Modal -->
<div class="modal fade" id="divDadosProduto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
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
                     <div class="col-sm-9" ng-controller="categoriaController">
                         <select class="form-control" id="categoriaProduto" name="categoriaProduto">
                            <option ng-repeat="c in categorias" value="{{c.idCategoria}}">{{ c.nome }} </option>
                         </select>
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
                 <div id="divDestaque" class="form-group">
                     <label for="valorProduto" class="col-sm-3 control-label">Destaque</label>
                     <div class="col-sm-9">
                         <select class="form-control" id="destaque" name="destaque">
                          <option value="S">Sim</option>
                          <option value="N">Não</option>
                         </select>
                         
                     </div>
                 </div>
             </form>
            <form class="form-horizontal" role="form" target="_blank" action="rest/servicoProduto/uploadImagemProduto/" id="frmFotoProduto" name="frmFotoProduto" method="post" enctype="multipart/form-data">
                 <div class="form-group">
                     <div class="col-sm-offset-3 col-sm-9">
                         <button type="button" id="btnCriaProduto" onclick="enviaFormulario()" class="btn btn-block btn-primary">Salvar Produto</button>
                     </div>
                 </div>
                 <div id="divFoto" class="form-group">
                     <label for="fotoProduto" class="col-sm-3 control-label">Foto</label>
                     <div class="col-sm-9">
	                     <a href="#" class="thumbnail">
										     <img id="fotoProduto" src="images/no-image.jpg" alt="Teste">
										   </a>
									   </div>
									   <label for="fotoProduto" class="col-sm-3 control-label">Arquivo upload</label>
                     <div class="col-sm-9">
                         <input type="file" class="form-control" id="fotoProduto" name="fotoProduto" placeholder="Foto"/>
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
            var json = {"idProduto":$("#idProduto").val(),"nome":$("#nomeProduto").val(),"descricao":$("#descProduto").val(),"marca":$("#marcaProduto").val(),"modelo":$("#modeloProduto").val(),"idCategoria":$("#categoriaProduto").val(),"valorUnitario":$("#valorUnitario").val(),"valorAtacado":$("#valorAtacado").val(),"destaque":$("#destaque").val()}
            $.ajax({
              url: 'rest/'+servicoAtual+'/insere',
              type: 'POST',
              data: JSON.stringify(json),
              dataType: 'json',
              contentType: 'application/json',
              success: function(dados) {
            	  $("#frmFotoProduto").attr('action', 'rest/servicoProduto/uploadImagemProduto/' + $("#idProduto").val());
                $("#frmFotoProduto").submit();
                window.setTimeout('location.reload()', 100);
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
              if (cad.descricao != undefined) {
            	  obj += "<td>"+cad.descricao+"</td>";
              } else {
            	  obj += "<td>&nbsp;</td>";
              }
              obj += "<td>"+cad.valorUnitario+"</td>";
              obj += "<td>"+cad.valorAtacado+"</td>";
              obj += "</tr>";
            });
            corpoListagem.append(obj);
          }
          
          function carregaFormulario(dados) {
            limpaErrosFormulario();
            alert('em desuso');
            $("#idProduto").val(dados.idProduto);
            $("#nomeProduto").val(dados.nome);
            $("#categoriaProduto").val(dados.idCategoria);
            $("#descProduto").val(dados.descricao);
            $("#marcaProduto").val(dados.marca);
            $("#modeloProduto").val(dados.modelo);
            $("#valorUnitario").val(dados.valorUnitario);
            $("#valorAtacado").val(dados.valorAtacado);
            $("#fotoProduto").attr("src", "images/produtos/bigProduto"+dados.idProduto+".jpg");
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
        	  var retListaProdutos = null;
	          $.ajax({
	              url: 'rest/'+servicoAtual+'/pesquisa/*',
	              type: 'GET',
	              //data: JSON.stringify(formulario),
	              //dataType: 'json',
	              contentType: 'application/json',
	              success: function(data) {
	                //carregaListagem(data);
	                retListaProdutos = data;
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
	          return retListaProdutos;
          }
        </script>
    </body>
</html>
