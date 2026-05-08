package lunasoft;

import java.io.File;
import java.io.FileInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.http.HttpServletRequest;

public class ZipUtils
{
    public static void addFile(File file, ZipOutputStream zip, HttpServletRequest request) throws Exception
    {
        // Извлекаем путь до клювдий.
        String path = request.getRealPath("/klyuvdii/");
        // Открываем искомый файл.
        FileInputStream fis = new FileInputStream(file);
        // Обрезаем путь до клювдий, оставляя только хвост пути.
        String entryName = file.getPath().substring(path.length() + 1);
        // Создаём новую запись в zip файле.
        zip.putNextEntry(new ZipEntry(entryName));

        // Помещаем содержимое файла в zip.
        int c;
        while ((c = fis.read()) != -1)
        {
            zip.write(c);
        }
        zip.closeEntry();
        fis.close();
    }

    public static void addDir(File dir, ZipOutputStream zip, HttpServletRequest request) throws Exception
    {
        File files[] = dir.listFiles();

        for (int i = 0; i < files.length; i++)
        {
            File file = files[i];
            
            if (file.isFile())
            {
                addFile(file, zip, request);
            }
            else if (file.isDirectory())
            {
                addDir(file, zip, request);
            }
        }
    }
}