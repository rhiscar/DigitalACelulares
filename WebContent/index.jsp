<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" ng-app="digitala"> <!--<![endif]-->
    <body>
        <%@include  file="/includes/header.jsp" %>
        <%@include  file="/includes/header_menu.jsp" %>
        <%@include  file="/includes/menu_principal.jsp" %>
        
        <script>
        var digitala = angular.module('digitala', []);
        
      //PRODUTO SERVICE
        digitala.service('produtoService', function($http, $q){
          
          this.listaProdutos = function(){
            var def = $q.defer();
            $http({
              url:'rest/servicoProduto/destaques',
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
      
      //PRODUTO CONTROLLER
        digitala.controller('produtoController', function($scope, produtoService){

          $scope.listaProdutos = function (){
            
            produtoService.listaProdutos().then(
             function(response){
              
               $scope.produtos = response;
             }    
            );
           
          }//fim da funcao listaProdutos

           $scope.listaProdutos();
            
        });
      
        </script>
        
        <!-- Page actual content -->
        
        <%@include  file="/includes/destaques.jsp" %>
        
        
        <div class="content-wrapper hide-until-loading">
          <div id="produtosDestaque" ng-controller="produtoController">
            <table>
              <tr><th>Produtos em destaque hoje</th></tr>
              <tr ng-repeat="produto in produtos">
                <td>
                  <table>
                    <tr><td><img width="60px" height="60px" id="fotoProduto" src="images/produtos/bigProduto{{produto.idProduto}}.jpg" alt="{{produto.nome}}"></td></tr>
                    <tr><td>{{produto.nome}} por apenas R$ {{produto.valorAtacado}}</td></tr>
                  </table>
                </td>
              </tr>
            </table>
          </div>
        </div>
        
        <!-- Page actual content -->
        
        <%@include file="/includes/footer_js.jsp"%>

    </body>
</html>
