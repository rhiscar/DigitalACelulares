package br.com.digitala.service;

import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.OrdemServico;
import br.com.digitala.banco.OrdemServicoHome;

@Path("/servicoOrdemServico")
public class OrdemServicoService extends BasicService<OrdemServico> {
	
	
	OrdemServicoHome sql = new OrdemServicoHome();
	
	@Override
	protected String executaInsercao(OrdemServico dto) {
		sql.attachClean(dto);
		String r = gson.toJson(dto); 
		System.out.println("Retorno de ordemServico criada: " + r);
		return r;
	}

	@Override
	protected String executaRemove(Integer id) {
		OrdemServico ret = sql.findById(id);
		sql.delete(ret);
		String r = gson.toJson(ret);
		System.out.println("Retorno de ordemServico removida: " + r);
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		OrdemServico ret = sql.findById(pk);
		String r = gson.toJson(ret);
		System.out.println("Retorno de busca de ordemServico: " + r);
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		OrdemServico c = new OrdemServico();
		c.setIdStatus(texto != null ? Integer.parseInt(texto) : null);
		List<OrdemServico> lista = sql.findByExample(c);
		String r = gson.toJson(lista);
		System.out.println("Retorno de lista de ordemServico: " + r);
		return r;
	}
}