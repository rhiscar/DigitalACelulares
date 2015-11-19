package br.com.digitala.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Cliente;

@Path("/servicoCliente")
public class ClienteService extends BasicService<Cliente> {
	
	@Override
	protected String executaInsercao(Cliente dto) {
		Cliente ret = new Cliente();
		
		ret.setIdCliente(1);
		ret.setNome(dto.getNome());
		ret.setUsuario(dto.getUsuario());

		String r = gson.toJson(ret); 
		
		System.out.println("Retorno de cliente criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Cliente dto) {
		Cliente ret = new Cliente();
		
		ret.setIdCliente(1);
		ret.setNome(dto.getNome());
		ret.setUsuario(dto.getUsuario());

		String r = gson.toJson(ret);
		
		System.out.println("Retorno de cliente removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Cliente ret = new Cliente();
		
		ret.setIdCliente(pk);
		ret.setNome("Cliente " + pk);
		ret.setUsuario("Usuario da cliente " + pk);
		
		String r = gson.toJson(ret);
		
		System.out.println("Retorno de busca de cliente: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<Cliente> lista = new ArrayList<Cliente>();
		for (Integer i = 0; i < 10; i++) {
			Cliente c = new Cliente();
			
			c.setIdCliente(i);
			c.setNome("Nome cliente " + texto + " " + i);
			c.setUsuario("Nome descricao " + texto + " " + i);
			c.setEmail("email cliente " + texto + " " + i);
			c.setTelefone("telefone cliente " + texto + " " + i);
			
			lista.add(c);
		}
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de cliente: " + r);
		
		return r;
	}
}