package br.com.digitala.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Categoria;
import br.com.digitala.banco.CategoriaHome;

@Path("/servicoCategoria")
public class CategoriaService extends BasicService<Categoria> {

	CategoriaHome catSQL = new CategoriaHome();
	
	@Override
	protected String executaInsercao(Categoria dto) {
		catSQL.merge(dto);
		
		String r = gson.toJson(dto); 
		System.out.println("Retorno de categoria criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Integer id) {
		System.out.println("entrando no executaremove");
		Categoria dto = catSQL.findById(id);
		catSQL.delete(dto);
		String r = gson.toJson(dto);
		System.out.println("Retorno de categoria removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Categoria ret = catSQL.findById(pk);
		
		String r = gson.toJson(ret);
		System.out.println("Retorno de busca de categoria: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<Categoria> lista = new ArrayList<Categoria>();
		Categoria crit = new Categoria();
		crit.setNome(texto);
		
		lista = catSQL.findByExample(crit);
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de categoria: " + r);
		return r;
	}
}