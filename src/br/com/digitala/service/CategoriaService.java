package br.com.digitala.service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;

import br.com.digitala.banco.Categoria;
import br.com.digitala.banco.CategoriaHome;
import br.com.digitala.utils.DigitalAUtils;

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

	@POST
	@Path("/uploadImagemCategoria/{id}")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	public String uploadImagemProduto(
			@PathParam("id") Integer id,
			@FormDataParam("fotoCategoria") InputStream uploadedInputStream,
			@FormDataParam("fotoCategoria") FormDataContentDisposition fileDetail) {

		System.out.println("Entrou no código para salvar a foto do produto");
		
		String uploadedFileLocation = "d://digitala/categorias/bigCategoria"+id+DigitalAUtils.getFileExtFromName(fileDetail.getFileName()); //+ fileDetail.getFileName();

		// save it
		DigitalAUtils.writeToFile(uploadedInputStream, uploadedFileLocation);

		String output = "File uploaded to : " + uploadedFileLocation;
		
		System.out.println(output);

		return "Arquivo salvo com sucesso!";

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