package br.com.digitala.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class DigitalAUtils {

	private static final String ENV_VARIABLE_DIGITALA_IMAGES = "DIGITALA_IMAGENS";
	
	private DigitalAUtils() {
		
	}
	
	/***
	 * Util method to return a full file extension from a file name
	 * along with the dot
	 * 
	 * param photo.png return .png
	 * 
	 * @param fName
	 * @return string with file ext plus dot
	 */
	public static String getFileExtFromName(String fName) {
		String ret = null;
		
		if (fName != null && fName.length() > 0) {
			int pos = fName.lastIndexOf(".");
			if (pos >= 0) {
				ret = fName.substring(pos);
			}
		}
		
		return ret;
	}

	public static String getImagesFolder() {
		return System.getenv(ENV_VARIABLE_DIGITALA_IMAGES);
	}
	
	/***
	 * Save uploaded file to new location
	 * @param uploadedInputStream
	 * @param uploadedFileLocation
	 */
	public static void writeToFile(InputStream uploadedInputStream, String uploadedFileLocation) {
		OutputStream out = null;
		try {
			 out = new FileOutputStream(new File(uploadedFileLocation));
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
		} finally {
			try {
				if (out != null) {
					out.flush();
					out.close();
				}
			} catch (Exception exp) {}
		}

	}

}
