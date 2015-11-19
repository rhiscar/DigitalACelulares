package br.com.digitala.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.digitala.banco.Categoria;
import br.com.digitala.banco.CategoriaHome;
import br.com.digitala.banco.Cliente;
import br.com.digitala.banco.ClienteHome;
import br.com.digitala.banco.Empresa;
import br.com.digitala.banco.EmpresaHome;
import br.com.digitala.banco.ItemsPedido;
import br.com.digitala.banco.ItemsPedidoHome;
import br.com.digitala.banco.ItemsPedidoId;
import br.com.digitala.banco.OrdemServico;
import br.com.digitala.banco.OrdemServicoHome;
import br.com.digitala.banco.Pedido;
import br.com.digitala.banco.PedidoHome;
import br.com.digitala.banco.Produto;
import br.com.digitala.banco.ProdutoHome;
import br.com.digitala.banco.Servico;
import br.com.digitala.banco.ServicoHome;

import com.google.gson.GsonBuilder;

@Path("/servico")
public class DigitalACelularesService {

	
	public DigitalACelularesService() {}
	
	@POST
	@Path("/insereCategoria")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insereCategoria(Categoria c) throws Exception {
//		CategoriaHome catHome = new CategoriaHome();
//		catHome.attachClean(c);
//		catHome = null;
		Categoria ret = new Categoria();
		
		ret.setIdCategoria(1);
		ret.setNome(c.getNome());
		ret.setDescricao(c.getDescricao());

		String r = new GsonBuilder().create().toJson(ret); 
		
		System.out.println("Retorno de categoria criada: " + r);
		
		return r;
	}

	@POST
	@Path("/removeCategoria")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void removeCategoria(Categoria cat) throws Exception {
		CategoriaHome catHome = new CategoriaHome();
		catHome.delete(cat);
		catHome = null;
	}
	
	@POST
	@Path("/buscaCategorias")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Categoria> buscaCategorias(Categoria cat) throws Exception {
		CategoriaHome catHome = new CategoriaHome();
		return catHome.findByExample(cat);
	}
	
	@POST
	@Path("/insereCliente")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insereCliente(Cliente cli) throws Exception {
		ClienteHome cliHome = new ClienteHome();
		cliHome.attachClean(cli);
		cliHome = null;
		
		return null;
	}
	
	@POST
	@Path("/removeCliente")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void removeCliente(Cliente cli) throws Exception {
		ClienteHome cliHome = new ClienteHome();
		cliHome.delete(cli);
		cliHome = null;
	}
	
	@POST
	@Path("/buscaClientes")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Cliente> buscaClientes(Cliente cli) throws Exception {
		ClienteHome cliHome = new ClienteHome();
		return cliHome.findByExample(cli);
	}
	
	@POST
	@Path("/insereEmpresa")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void insereEmpresa(Empresa emp) throws Exception {
		EmpresaHome empHome = new EmpresaHome();
		empHome.attachClean(emp);
		empHome = null;
	}
	
	@POST
	@Path("/removeEmpresa")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void removeEmpresa(Empresa emp) throws Exception {
		EmpresaHome empHome = new EmpresaHome();
		empHome.delete(emp);
		empHome = null;
	}
	
	
	@POST
	@Path("/buscaEmpresas")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Empresa> buscaEmpresas(Empresa emp) throws Exception {
		EmpresaHome empHome = new EmpresaHome();
		return empHome.findByExample(emp);
	}
	
	
	@POST
	@Path("/insereOrdemServico")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void insereOrdemServico(OrdemServico os) throws Exception {
		OrdemServicoHome osHome = new OrdemServicoHome();
		osHome.attachClean(os);
		osHome = null;
	}
	
	@POST
	@Path("/removeOrdemServico")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public void removeOrdemServico(OrdemServico os) throws Exception {
		OrdemServicoHome osHome = new OrdemServicoHome();
		osHome.delete(os);
		osHome = null;
	}
	
	@POST
	@Path("/buscaOrdensServico")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<OrdemServico> buscaOrdensServico(OrdemServico os) throws Exception {
		OrdemServicoHome osHome = new OrdemServicoHome();
		return osHome.findByExample(os);
	}
	
	public void inserePedido(Pedido ped) throws Exception {
		PedidoHome pedHome = new PedidoHome();
		pedHome.attachClean(ped);
		pedHome = null;

		if (ped.getItemsPedido() != null && ped.getItemsPedido().size() >0) {
			ItemsPedidoHome itemHome = new ItemsPedidoHome();
			for (ItemsPedido itemPed : ped.getItemsPedido()) {
				ItemsPedidoId pk = new ItemsPedidoId();
				pk.setIdPedido(ped.getId().getIdpedido());
				itemPed.setId(pk);
				itemHome.attachClean(itemPed);
			}
			itemHome = null;
		}
	}
	
	public void removePedido(Pedido ped) throws Exception {
		if (ped.getItemsPedido() != null && ped.getItemsPedido().size() >0) {
			ItemsPedidoHome itemHome = new ItemsPedidoHome();
			for (ItemsPedido itemPed : ped.getItemsPedido()) {
				itemHome.delete(itemPed);
			}
			itemHome = null;
		}
		
		PedidoHome pedHome = new PedidoHome();
		pedHome.delete(ped);
		pedHome = null;

	}
	
	public List<Pedido> buscaPedidos(Pedido ped) throws Exception {
		PedidoHome pedHome = new PedidoHome();
		List<Pedido> pedidos = pedHome.findByExample(ped);
		
		ItemsPedidoHome itemHome = new ItemsPedidoHome();
		for (Pedido pedido : pedidos) {
			ItemsPedidoId pk = new ItemsPedidoId();
			pk.setIdProduto(pedido.getId().getIdpedido());
			ItemsPedido itemPedido = new ItemsPedido();
			itemPedido.setId(pk);
			pedido.setItemsPedido(itemHome.findByExample(itemPedido));
		}
		
		return pedidos;
	}
	
	public void insereProduto(Produto pro) throws Exception {
		ProdutoHome proHome = new ProdutoHome();
		proHome.attachClean(pro);
		proHome = null;
	}
	
	public void removeProduto(Produto pro) throws Exception {
		ProdutoHome proHome = new ProdutoHome();
		proHome.delete(pro);
		proHome = null;
	}
	
	public List<Produto> buscaProdutos(Produto pro) throws Exception {
		ProdutoHome proHome = new ProdutoHome();
		return proHome.findByExample(pro);
	}
	
	public void insereServico(Servico ser) throws Exception {
		ServicoHome serHome = new ServicoHome();
		serHome.attachClean(ser);
		serHome = null;
	}
	
	public void removeServico(Servico ser) throws Exception {
		ServicoHome serHome = new ServicoHome();
		serHome.delete(ser);
		serHome = null;
	}
	
	public List<Servico> buscaServicos(Servico ser) throws Exception {
		ServicoHome serHome = new ServicoHome();
		return serHome.findByExample(ser);
	}
}
