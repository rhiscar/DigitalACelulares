package br.com.digitala.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Produto;

@Path("/servicoProduto")
public class ProdutoService extends BasicService<Produto> {
	
	@Override
	protected String executaInsercao(Produto dto) {
		Produto ret = new Produto();
		
		ret.setIdProduto(1);
		ret.setNome(dto.getNome());
		ret.setDescricao(dto.getDescricao());

		String r = gson.toJson(ret); 
		
		System.out.println("Retorno de produto criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Produto dto) {
		Produto ret = new Produto();
		
		ret.setIdProduto(1);
		ret.setNome(dto.getNome());
		ret.setDescricao(dto.getDescricao());

		String r = gson.toJson(ret);
		
		System.out.println("Retorno de produto removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Produto ret = new Produto();
		
		ret.setIdProduto(pk);
		ret.setNome("Produto " + pk);
		ret.setDescricao("Descricao da produto " + pk);
		
		String r = gson.toJson(ret);
		
		System.out.println("Retorno de busca de produto: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<Produto> lista = new ArrayList<Produto>();
		for (Integer i = 0; i < 10; i++) {
			Produto c = new Produto();
			
			c.setIdProduto(i);
			c.setNome("Nome produto " + i);
			c.setDescricao("Nome descricao " +  texto + " "  + i);
			
			lista.add(c);
		}
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de produto: " + r);
		
		return r;
	}
}