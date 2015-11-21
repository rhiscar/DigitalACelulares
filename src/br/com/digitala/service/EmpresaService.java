package br.com.digitala.service;

import java.util.List;

import javax.ws.rs.Path;

import br.com.digitala.banco.Empresa;
import br.com.digitala.banco.EmpresaHome;

@Path("/servicoEmpresa")
public class EmpresaService extends BasicService<Empresa> {
	
	EmpresaHome sql = new EmpresaHome();
	
	@Override
	protected String executaInsercao(Empresa dto) {
		sql.attachClean(dto);

		String r = gson.toJson(dto); 
		
		System.out.println("Retorno de empresa criada: " + r);
		
		return r;
	}

	@Override
	protected String executaRemove(Integer id) {
		Empresa ret = sql.findById(id);
		sql.delete(ret);
		String r = gson.toJson(ret);
		System.out.println("Retorno de empresa removida: " + r);
		return r;
	}

	@Override
	protected String executaBusca(Integer pk) {
		Empresa ret = sql.findById(pk);
		String r = gson.toJson(ret);
		System.out.println("Retorno de busca de empresa: " + r);
		return r;
	}

	@Override
	protected String executaPesquisa(String texto) {
		Empresa c = new Empresa();
		c.setNome(texto);
		List<Empresa> lista = sql.findByExample(c);
		String r = gson.toJson(lista);
		System.out.println("Retorno de lista de empresa: " + r);
		return r;
	}
}