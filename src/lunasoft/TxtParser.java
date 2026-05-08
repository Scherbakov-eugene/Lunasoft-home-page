package lunasoft;

import java.io.FileInputStream;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

/**
 * Парсит текстовый файл в объект TxtData.
 * Первая строка файла хранит длину набора N данных.
 * Следующие N строк хранят название полей.
 * Следующие блоки по N строк хранят данные.
 * Если первый символ "#", то строка считается комментарием и пропускается.
 */
public class TxtParser
{
	private static final String FILE_ENCODING = "UTF-8";

	public static TxtFile parseTxt(HttpServletRequest request, String filename)
	{
		TxtFile txtData = new TxtFile();

		try
		{
			FileInputStream fis = new FileInputStream(request.getRealPath(filename));
			int fileSize = fis.available();
			byte bytes[] = new byte[fileSize];
			// Читаем содержимое файла.
			fis.read(bytes);
			fis.close();

			// Разбиваем массив байтов на строки.
			Vector lines = new Vector();
			// Вектор для хранения байтов строки.
			Vector lineBytes = new Vector();

			// Пробегаем по всем байтам файла.
			int i = 0;
			while (i < fileSize)
			{
				// Если признак переноса строки.
				if (bytes[i] == 13 && i + 1 < fileSize && bytes[i + 1] == 10)
				{
					i++;
					i++;

                    // Преобразуем вектор объектов Byte в массив byte[].
                    byte bytesFromVector[] = new byte[lineBytes.size()];
                    for (int j = 0; j < lineBytes.size(); j++)
                    {
                    	bytesFromVector[j] = ((Byte) lineBytes.get(j)).byteValue();
                    }

                    // Создаём текст из набора байтов с нужной кодировкой.
                    String text = new String(bytesFromVector, "UTF-8");
                    // Сохраняем текст в массив строк.
                    lines.add(text);
                    // Переинициализируем вектор для хранения строки.
                    lineBytes = new Vector();
				}
				else
				{
                    // Переписываем байты файла в строку.
                    lineBytes.add(new Byte(bytes[i]));
    				i++;
				}
			}

            String line;
			int lineIndex = -1;
			int lineCount = lines.size();

			for (int k = 0; k < lineCount; k++)
			{
				line = (String) lines.elementAt(k);

				// End of file.
				if (line == null)
				{
					break;
				}

				// Comment.
				if (line.startsWith("#"))
				{
					continue;
				}

				// Итерируем номер строки (комментарии не считаются).
				lineIndex++;

				// Первая строка - размер набора данных.
				if (lineIndex == 0)
				{
					txtData.blockSize = Integer.parseInt(line);
				}
				// Названия полей.
				else if (lineIndex > 0 && lineIndex <= txtData.blockSize)
				{
					txtData.names.add(line);
				}
				// Данные.
				else if (lineIndex > txtData.blockSize)
				{
					// Создаём первый блок.
					if (txtData.blocks.size() == 0)
					{
						txtData.blocks.add(new TxtFileBlock());
					}

					// Извлекаем последний блок.
					TxtFileBlock lastBlock = (TxtFileBlock) txtData.blocks.lastElement();

					// Если последний блок заполнен, то создаём следующий.
					if (lastBlock.data.size() == txtData.blockSize)
					{
						txtData.blocks.add(new TxtFileBlock());
						lastBlock = (TxtFileBlock) txtData.blocks.lastElement();
					}

					// Добавляем строку в последний блок.
					lastBlock.data.add(line);
				}
			}
		}
		catch (Exception e)
		{
			txtData = null;
			e.printStackTrace();
		}

		return txtData;
	}
}
