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
            <h5>Listagem de empresas</h5>
            <table id="listaEmpresas" class="table hover">
              <thead>
                <tr>
                  <th width="20px">&nbsp;</th>
                  <th width="20px">&nbsp;</th>
                  <th>Nome</th>
                  <th>E-mail</th>
                  <th>Telefone</th>
                  <th>Contato</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Item #</td>
                  <td>Description</td>
                </tr>
              </tbody>
             </table>
           </div>
         </div>
        <!-- end Items List -->


        <!-- Item editing -->
      <!-- Modal -->
<div class="modal fade" id="divDadosEmpresa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Empresa</h4>
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
             <form class="form-horizontal" role="form" id="frmDadosEmpresa" onsubmit="return validaFormulario(this)">
                 <div id="divNome" class="form-group">
                     <label for="name" class="col-sm-3 control-label">Nome</label>
                     <div class="col-sm-9">
                         <input type="hidden" nome="idEmpresa" id="idEmpresa"/>
                         <input type="text" class="form-control" id="nomeEmpresa" name="nomeEmpresa" placeholder="Nome"/>
                     </div>
                 </div>
                 <div id="divMail" class="form-group">
                     <label class="col-sm-3 control-label">E-mail</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="mailEmpresa" name="mailEmpresa" placeholder="E-mail"/>
                     </div>
                 </div>
                 <div id="divFone" class="form-group">
                     <label class="col-sm-3 control-label">Telefone</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="foneEmpresa" name="foneEmpresa" placeholder="Telefone"/>
                     </div>
                 </div>
                 <div id="divContato" class="form-group">
                     <label class="col-sm-3 control-label">Contato</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="contatoEmpresa" name="contatoEmpresa" placeholder="Contato"/>
                     </div>
                 </div>
                 <div id="divCNPJ" class="form-group">
                     <label class="col-sm-3 control-label">CNPJ</label>
                     <div class="col-sm-9">
                         <input type="text" class="form-control" id="cnpjEmpresa" name="cnpjEmpresa" placeholder="CNPJ"/>
                     </div>
                 </div>
                 <div id="divEndereco" class="form-group">
                     <label class="col-sm-3 control-label">Endereço</label>
                     <div class="col-sm-9">
                         <textarea class="form-control" id="enderecoEmpresa" name="enderecoEmpresa" placeholder="Endereço"></textarea>
                     </div>
                 </div>
                 <div class="form-group">
                     <div class="col-sm-offset-3 col-sm-9">
                         <button type="submit" id="btnCriaEmpresa" class="btn btn-block btn-primary">Salvar Empresa</button>
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
          var servicoAtual = "servicoEmpresa"; 
        
          function limpaErrosFormulario() {
            $("#divNome").removeClass("has-error");
            $("#divDescricao").removeClass("has-error");
            $("#mensagemErro").hide();
          }
          
          function enviaFormulario() {
            var json = {"idEmpresa":$("#idEmpresa").val(),"nome":$("#nomeEmpresa").val(),"cnpj":$("#cnpjEmpresa").val(),"email":$("#mailEmpresa").val(),"telefone":$("#foneEmpresa").val(),"contato":$("#contatoEmpresa").val(),"endereco":$("#enderecoEmpresa").val()}
            
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
            
            if ($("#nomeEmpresa").val() == "") {
              $("#divNome").addClass("has-error");
              formValido = false;
            }
            if ($("#cnpjEmpresa").val() == "") {
              $("#divCNPJ").addClass("has-error");
              formValido = false;
            }
            if ($("#mailEmpresa").val() == "") {
              $("#divMail").addClass("has-error");
              formValido = false;
            }
            if ($("#foneEmpresa").val() == "") {
              $("#divFone").addClass("has-error");
              formValido = false;
            }
            if ($("#contatoEmpresa").val() == "") {
              $("#divContato").addClass("has-error");
              formValido = false;
            }
            if ($("#enderecoEmpresa").val() == "") {
              $("#divEndereco").addClass("has-error");
              formValido = false;
            }
            if (!formValido) {
              $("#mensagemErro").show();
            } else {
              enviaFormulario();
            }
            
            return formValido;
          }
          
          function carregaListagem(listaEmpresas) {
            var corpoListagem = $('#listaEmpresas tbody');
            corpoListagem.empty();
            var obj = ""; 
            $.each(listaEmpresas, function(index,cad) {
              
              obj += "<tr>";
              obj += "<td><div onclick=\"editarRegistro('" + cad.idEmpresa + "')\" class=\"icon-edit-modify-streamline\" data-toggle=\"modal\" data-target=\"#divDadosEmpresa\">&nbsp;</div></td>";
              obj += "<td><div onclick=\"removerRegistro('" + cad.idEmpresa + "')\" class=\"icon-delete-garbage-streamline\" data-toggle=\"modal\" data-target=\"#divDadosEmpresa\">&nbsp;</div></td>";
              obj += "<td>"+cad.nome+"</td>";
              obj += "<td>"+cad.email+"</td>";
              obj += "<td>"+cad.telefone+"</td>";
              obj += "<td>"+cad.contato+"</td>";
              obj += "</tr>";
            });
            corpoListagem.append(obj);
          }
          
          function carregaFormulario(dados) {
            limpaErrosFormulario();
            alert(dados.idEmpresa);
            $("#idEmpresa").val(dados.idEmpresa);
            $("#nomeEmpresa").val(dados.nome);
            $("#cnpjEmpresa").val(dados.cnpj);
            $("#mailEmpresa").val(dados.email);
            $("#foneEmpresa").val(dados.telefone);
            $("#contatoEmpresa").val(dados.contato);
            $("#enderecoEmpresa").val(dados.endereco);
            $("#nomeEmpresa").focus();
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
