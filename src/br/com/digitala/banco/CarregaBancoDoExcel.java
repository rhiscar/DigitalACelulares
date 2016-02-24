package br.com.digitala.banco;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class CarregaBancoDoExcel {

	static private Map<String, Integer> categorias = new HashMap<String, Integer>();
	static private CategoriaHome catSQL = null;
	static private ProdutoHome prodSQL = null;
	
	private CarregaBancoDoExcel() {
		
	}
	
	public static void carregaExcel(String path) {
		catSQL = new CategoriaHome();
		categorias.put("SEM CATEGORIA",catSQL.merge(new Categoria("SEM CATEGORIA","")).getIdCategoria());
		
		FileInputStream fis = null;
		System.out.println("Iniciando processo de leitura do arquivo excel");
		try {
			fis = new FileInputStream(path);
			Workbook p = new HSSFWorkbook(fis);
			Sheet aba = p.getSheetAt(0);
			List<Produto> listaProdutos = new ArrayList<Produto>();
			for (int i = 1; i < 1528; i++) {
				listaProdutos.add(geraProdutoDeLinhaExcel(aba.getRow(i)));
			}

			System.out.println("Criando os produtos no banco");
			prodSQL = new ProdutoHome();
			for (Produto pt : listaProdutos) {
				if (pt.getValorAtacado() != null){
					prodSQL.merge(pt);
				}
			}
			System.out.println("Produtos criados com sucesso!");
			
			p.close();
		} catch (Exception exp) {
			exp.printStackTrace();
		} finally {
			try {
				fis.close();
			} catch (Exception exp){}
		}
		System.out.println("Finalizando processo de leitura do arquivo excel");
	}
	
	public static Produto geraProdutoDeLinhaExcel(Row linha) {
		Produto prod = new Produto();
		if (linha.getCell(0) != null)
			prod.setNome(linha.getCell(0).getStringCellValue());
		
		if (linha.getCell(1) != null)
			prod.setCodigo(linha.getCell(1).getStringCellValue());
		
		if (linha.getCell(2) != null)
			prod.setMarca(linha.getCell(2).getStringCellValue());
		
		if (linha.getCell(3) != null)
			prod.setModelo(CarregaBancoDoExcel.pegaValorStringCelula(linha.getCell(3)));
		
		if (linha.getCell(4) != null) {
			prod.setValorUnitario(new Double(linha.getCell(4).getNumericCellValue()).floatValue());
			prod.setValorAtacado(prod.getValorUnitario());
		}
		
		if (linha.getCell(5) != null && !"".equals(linha.getCell(5).getStringCellValue())) {
			Integer catCod = null;
			if (categorias.get(linha.getCell(5).getStringCellValue()) == null) {
				Categoria cat = new Categoria(linha.getCell(5).getStringCellValue(), "");
				cat = catSQL.merge(cat);
				catCod = cat.getIdCategoria();
				categorias.put(cat.getNome(), cat.getIdCategoria());
			} else {
				catCod = categorias.get(linha.getCell(5).getStringCellValue());
			}
			prod.setIdCategoria(catCod.intValue());
		} else {
			prod.setIdCategoria(1);
		}
		
		return prod;
	}
	
	public static String pegaValorStringCelula(Cell cel) {
		if ( cel.getCellType() == Cell.CELL_TYPE_STRING ) {
			return cel.getStringCellValue();
		} else if ( cel.getCellType() == Cell.CELL_TYPE_NUMERIC ) {
			return cel.getNumericCellValue() + "";
		}
		
		return null;
	}
	
	public static void main(String[] args) {
		CarregaBancoDoExcel.carregaExcel("C:/Users/Rhiscar/Downloads/produtos_tabela_atualizada.xls");
	}
}