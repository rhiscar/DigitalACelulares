package br.com.digitala.service;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.digitala.banco.Produto;
import br.com.digitala.banco.ProdutoHome;
import br.com.digitala.utils.DigitalAUtils;

import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;

@Path("/servicoProduto")
public class ProdutoService extends BasicService<Produto> {

	ProdutoHome sql = new ProdutoHome();

	@Override
	protected String executaInsercao(Produto dto) {
		System.out.println("Produto a ser criada: " + dto);
		sql.merge(dto);
		String r = gson.toJson(dto);
		System.out.println("Retorno de produto criada: " + r);
		return r;
	}

	@POST
	@Path("/uploadImagemProduto/{id}")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.APPLICATION_JSON)
	public String uploadImagemProduto(
			@PathParam("id") Integer id,
			@FormDataParam("fotoProduto") InputStream uploadedInputStream,
			@FormDataParam("fotoProduto") FormDataContentDisposition fileDetail) {

		System.out.println("Entrou no código para salvar a foto do produto");
		
		
		try {
			System.out.println("CAMINHO SERVIDOR: " + DigitalAUtils.getImagesFolder());
			File folderConfirmation = new File(DigitalAUtils.getImagesFolder()+"/produtos");
			if (!folderConfirmation.exists()) {
				folderConfirmation.mkdir();
				folderConfirmation = null;
			}
		} catch (Exception exp) {
			exp.printStackTrace();
		}
		
		String uploadedFileLocation = DigitalAUtils.getImagesFolder()+"/produtos/bigProduto"+id+DigitalAUtils.getFileExtFromName(fileDetail.getFileName()); //+ fileDetail.getFileName();

		// save it
		DigitalAUtils.writeToFile(uploadedInputStream, uploadedFileLocation);

		String output = "File uploaded to : " + uploadedFileLocation;

		System.out.println(output);
		
		return "Arquivo salvo com sucesso!";

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