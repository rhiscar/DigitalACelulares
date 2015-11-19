package br.com.digitala.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Categoria;
import br.com.digitala.banco.CategoriaHome;

@Path("/servicoCategoria")
public class CategoriaService extends BasicService<Categoria> {
	
	@Override
	protected String executaInsercao(Categoria dto) {
		Categoria ret = new Categoria();
		
		ret.setIdCategoria(dto.getIdCategoria());
		ret.setNome(dto.getNome());
		ret.setDescricao(dto.getDescricao());

		String r = gson.toJson(ret); 
		
		System.out.println("Retorno de categoria criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Categoria dto) {
		Categoria ret = new Categoria();
		
		ret.setIdCategoria(dto.getIdCategoria());
		ret.setNome(dto.getNome());
		ret.setDescricao(dto.getDescricao());

		String r = gson.toJson(ret);
		
		System.out.println("Retorno de categoria removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Categoria ret = new Categoria();
		
		ret.setIdCategoria(pk);
		ret.setNome("Categoria " + pk);
		ret.setDescricao("Descricao da categoria " + pk);
		
		String r = gson.toJson(ret);
		
		System.out.println("Retorno de busca de categoria: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<Categoria> lista = new ArrayList<Categoria>();
		/*
		for (Integer i = 0; i < 10; i++) {
			Categoria c = new Categoria();
			
			c.setIdCategoria(i);
			c.setNome("Nome categoria " +  texto + " "  + i);
			c.setDescricao("Nome descricao " +  texto + " "  + i);
			
			lista.add(c);
		}
		*/
		CategoriaHome catSQL = new CategoriaHome();
		Categoria crit = new Categoria();
		crit.setNome(texto);
		
		lista = catSQL.findByExample(crit);
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de categoria: " + r);
		
		return r;
	}
}