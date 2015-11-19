package br.com.digitala.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.OrdemServico;

@Path("/servicoOrdemServico")
public class OrdemServicoService extends BasicService<OrdemServico> {
	
	@Override
	protected String executaInsercao(OrdemServico dto) {
		OrdemServico ret = new OrdemServico();
		
		ret.setIdOrdemServico(1);
		ret.setIdStatus(dto.getIdStatus());
		ret.setObservacoes(dto.getObservacoes());

		String r = gson.toJson(ret); 
		
		System.out.println("Retorno de ordemServico criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(OrdemServico dto) {
		OrdemServico ret = new OrdemServico();
		
		ret.setIdOrdemServico(1);
		ret.setIdStatus(dto.getIdStatus());
		ret.setObservacoes(dto.getObservacoes());

		String r = gson.toJson(ret);
		
		System.out.println("Retorno de ordemServico removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		OrdemServico ret = new OrdemServico();
		
		ret.setIdOrdemServico(pk);
		ret.setIdStatus(1);
		ret.setObservacoes("Observação da ordemServico " + pk);
		
		String r = gson.toJson(ret);
		
		System.out.println("Retorno de busca de ordemServico: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<OrdemServico> lista = new ArrayList<OrdemServico>();
		for (Integer i = 0; i < 10; i++) {
			OrdemServico c = new OrdemServico();
			
			c.setIdOrdemServico(i);
			c.setIdStatus(1);
			c.setObservacoes("Observação da ordem de Serviço "  +  texto + " " + i);
			
			lista.add(c);
		}
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de ordemServico: " + r);
		
		return r;
	}
}