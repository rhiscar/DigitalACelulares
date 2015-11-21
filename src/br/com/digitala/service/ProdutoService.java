package br.com.digitala.service;

import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Produto;
import br.com.digitala.banco.ProdutoHome;

@Path("/servicoProduto")
public class ProdutoService extends BasicService<Produto> {
	
	ProdutoHome sql = new ProdutoHome();
	
	@Override
	protected String executaInsercao(Produto dto) {
		sql.attachClean(dto);
		String r = gson.toJson(dto); 
		System.out.println("Retorno de produto criada: " + r);
		return r;
	}

	@Override
	protected String executaRemove(Integer id) {
		Produto ret = sql.findById(id);
		sql.delete(ret);
		String r = gson.toJson(ret);
		System.out.println("Retorno de produto removida: " + r);
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Produto ret = sql.findById(pk);
		String r = gson.toJson(ret);
		System.out.println("Retorno de busca de produto: " + r);
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		Produto c = new Produto();
		c.setNome(texto);
		List<Produto> lista = sql.findByExample(c);
		String r = gson.toJson(lista);
		System.out.println("Retorno de lista de produto: " + r);
		return r;
	}
}