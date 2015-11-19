package br.com.digitala.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Pedido;
import br.com.digitala.banco.PedidoId;

@Path("/servicoPedido")
public class PedidoService extends BasicService<Pedido> {
	
	@Override
	protected String executaInsercao(Pedido dto) {
		Pedido ret = new Pedido();
		
		ret.setId(dto.getId());
		ret.setDataPedido(dto.getDataPedido());
		ret.setObservacoes(dto.getObservacoes());

		String r = gson.toJson(ret); 
		
		System.out.println("Retorno de pedido criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Pedido dto) {
		Pedido ret = new Pedido();
		
		ret.setId(dto.getId());
		ret.setDataPedido(dto.getDataPedido());
		ret.setObservacoes(dto.getObservacoes());

		String r = gson.toJson(ret);
		
		System.out.println("Retorno de pedido removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Pedido ret = new Pedido();
		
		ret.setId(new PedidoId(1,1));
		ret.setDataPedido(new Date());
		ret.setObservacoes("Descricao da pedido " + pk);
		
		String r = gson.toJson(ret);
		
		System.out.println("Retorno de busca de pedido: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<Pedido> lista = new ArrayList<Pedido>();
		for (Integer i = 0; i < 10; i++) {
			Pedido c = new Pedido();
			
			c.setId(new PedidoId(1,1));
			c.setDataPedido(new Date());
			c.setObservacoes("Nome descricao " +  texto + " " + i);
			
			lista.add(c);
		}
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de pedido: " + r);
		
		return r;
	}
}