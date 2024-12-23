package utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;

public class FileSearcher {
    public static String obtainFileName(HttpServletRequest request, String uploadDir) throws ServletException, IOException {
        for (Part part : request.getParts()) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                return StringUtils.join(uploadDir,fileName );
            }
        }
        return null;
    }

    public static String searchFile(String directoryPath, String fileName) {
        File directory = new File(directoryPath);

        // Verificar que la ruta sea un directorio válido
        if (!directory.isDirectory()) {
            System.out.println("La ruta proporcionada no es un directorio válido.");
            return null;
        }

        // Listar todos los archivos y subdirectorios
        File[] files = directory.listFiles();

        if (files != null) {
            for (File file : files) {
                // Verificar si es un archivo con el nombre buscado
                if (file.isFile() && file.getName().equals(fileName)) {
                    return file.getAbsolutePath();
                }

                // Si es un subdirectorio, buscar recursivamente
                if (file.isDirectory()) {
                    String result = searchFile(file.getAbsolutePath(), fileName);
                    if (result != null) {
                        return result;
                    }
                }
            }
        }

        // Si no se encuentra el archivo
        return null;
    }


}
