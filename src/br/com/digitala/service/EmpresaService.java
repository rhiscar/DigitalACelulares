package br.com.digitala.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Empresa;

@Path("/servicoEmpresa")
public class EmpresaService extends BasicService<Empresa> {
	
	@Override
	protected String executaInsercao(Empresa dto) {
		Empresa ret = new Empresa();
		
		ret.setIdEmpresa(1);
		ret.setNome(dto.getNome());
		ret.setEndereco(dto.getEndereco());

		String r = gson.toJson(ret); 
		
		System.out.println("Retorno de empresa criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Empresa dto) {
		Empresa ret = new Empresa();
		
		ret.setIdEmpresa(1);
		ret.setNome(dto.getNome());
		ret.setEndereco(dto.getEndereco());

		String r = gson.toJson(ret);
		
		System.out.println("Retorno de empresa removida: " + r);
		
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Empresa ret = new Empresa();
		
		ret.setIdEmpresa(pk);
		ret.setNome("Empresa " + pk);
		ret.setEndereco("Usuario da empresa " + pk);
		
		String r = gson.toJson(ret);
		
		System.out.println("Retorno de busca de empresa: " + r);
		
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		List<Empresa> lista = new ArrayList<Empresa>();
		for (Integer i = 0; i < 10; i++) {
			Empresa c = new Empresa();
			
			c.setIdEmpresa(i);
			c.setNome("Nome empresa " +  texto + " "  + i);
			c.setEndereco("Nome descricao " +  texto + " "  + i);
			
			lista.add(c);
		}
		
		String r = gson.toJson(lista);
		
		System.out.println("Retorno de lista de empresa: " + r);
		
		return r;
	}
}