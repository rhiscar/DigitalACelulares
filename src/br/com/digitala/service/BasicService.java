package br.com.digitala.service;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public abstract class BasicService<T> {

	protected Gson gson = new GsonBuilder().create();
	
	@POST
	@Path("/insere")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insere(T dto) throws Exception {
		return executaInsercao(dto);
	}
	
	protected abstract String executaInsercao(T dto);
	
	@DELETE
	@Path("/remove")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String remove(T dto) throws Exception {
		return executaRemove(dto);
	}
	
	protected abstract String executaRemove(T dto);
	
	@GET
	@Path("/busca/id/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public String busca(@PathParam("id") Integer id) throws Exception {
		return executaBusca(id);
	}
	
	protected abstract String executaBusca(Integer id);
	
	
	@GET
	@Path("/pesquisa/{texto}")
	@Produces(MediaType.APPLICATION_JSON)
	public String pesquisa(@PathParam("texto") String t) throws Exception {
		return executaPesquisa(t);
	}
	
	protected abstract String executaPesquisa(String t);
}