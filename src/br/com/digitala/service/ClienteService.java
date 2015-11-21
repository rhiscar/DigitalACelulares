package br.com.digitala.service;

import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Cliente;
import br.com.digitala.banco.ClienteHome;

@Path("/servicoCliente")
public class ClienteService extends BasicService<Cliente> {
	
	
	ClienteHome sql = new  ClienteHome();
	
	@Override
	protected String executaInsercao(Cliente dto) {
		sql.attachClean(dto);
		String r = gson.toJson(dto); 
		System.out.println("Retorno de cliente criada: " + r);
		return r;
	}

	@Override
	protected String executaRemove(Integer id) {
		Cliente ret = sql.findById(id);
		sql.delete(ret);
		String r = gson.toJson(ret);
		System.out.println("Retorno de cliente removida: " + r);
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Cliente ret = sql.findById(pk);
		String r = gson.toJson(ret);
		System.out.println("Retorno de busca de cliente: " + r);
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		Cliente c = new Cliente();
		c.setNome(texto);
		List<Cliente> lista = sql.findByExample(c);
		String r = gson.toJson(lista);
		System.out.println("Retorno de lista de cliente: " + r);
		return r;
	}
}