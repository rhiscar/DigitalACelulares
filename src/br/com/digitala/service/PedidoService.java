package br.com.digitala.service;

import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Pedido;
import br.com.digitala.banco.PedidoHome;
import br.com.digitala.banco.PedidoId;

@Path("/servicoPedido")
public class PedidoService extends BasicService<Pedido> {
	
	PedidoHome sql = new PedidoHome();
	
	@Override
	protected String executaInsercao(Pedido dto) {
		sql.attachClean(dto);
		String r = gson.toJson(dto); 
		System.out.println("Retorno de pedido criada: " + r);
		return r;
	}

	@Override
	protected String executaRemove(Integer id) {
		PedidoId pi = new PedidoId();
		pi.setIdpedido(id);
		Pedido ret = sql.findById(pi);
		sql.delete(ret);
		String r = gson.toJson(ret);
		System.out.println("Retorno de pedido removida: " + r);
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		PedidoId pi = new PedidoId();
		pi.setIdpedido(pk);
		Pedido ret = sql.findById(pi);
		String r = gson.toJson(ret);
		System.out.println("Retorno de busca de pedido: " + r);
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		Pedido c = new Pedido();
		c.setIdStatus(texto != null ? Integer.parseInt(texto) : null);
		List<Pedido> lista = sql.findByExample(c);
		String r = gson.toJson(lista);
		System.out.println("Retorno de lista de pedido: " + r);
		return r;
	}
}