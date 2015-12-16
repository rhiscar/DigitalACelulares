package br.com.digitala.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.ws.Response;

import br.com.digitala.banco.Produto;
import br.com.digitala.banco.ProdutoHome;

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
		
		String uploadedFileLocation = "d://digitala/produtos/" + fileDetail.getFileName();

		// save it
		writeToFile(uploadedInputStream, uploadedFileLocation);

		String output = "File uploaded to : " + uploadedFileLocation;

		
		
		return null;

	}

	// save uploaded file to new location
	private void writeToFile(InputStream uploadedInputStream, String uploadedFileLocation) {

		try {
			OutputStream out = new FileOutputStream(new File(uploadedFileLocation));
			int read = 0;
			byte[] bytes = new byte[1024];

			out = new FileOutputStream(new File(uploadedFileLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {

			e.printStackTrace();
		}

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