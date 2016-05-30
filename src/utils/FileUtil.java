/**
 * @author hdfg159
 * @date 下午4:53:14
 */
package utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {
	public static boolean copySingleFile(File sourceFile, File destFile) {
		if (destFile.exists()) {
			destFile.delete();
		}
		boolean copyOK = true;
		BufferedInputStream inputStream = null;
		BufferedOutputStream outputStream = null;
		try {
			inputStream = new BufferedInputStream(new FileInputStream(
					sourceFile));
			outputStream = new BufferedOutputStream(new FileOutputStream(
					destFile));
			byte[] buffer = new byte[1024 * 5];
			int len;
			while ((len = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, len);
			}
		} catch (FileNotFoundException e) {
			copyOK = false;
			e.printStackTrace();
		} catch (IOException e) {
			copyOK = false;
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				copyOK = false;
				e.printStackTrace();
			}
		}
		return copyOK;
	}

	public static String getFileSuffix(String fileName) {
		String suffix = "";
		int offset = fileName.lastIndexOf(".");
		if (offset >= 0) {
			suffix = fileName.substring(offset + 1);
		}
		return suffix.toLowerCase();
	}
}
