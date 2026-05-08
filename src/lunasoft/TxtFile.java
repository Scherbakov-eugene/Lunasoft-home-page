package lunasoft;

import java.util.Vector;

/**
 * Хранит цикличный набор данных [data1, data2, data3, data1, data2, data3, ...].
 * Длина names определяет длину набора данных. В приведённом примере равна 3.
 * Names хранит названия полей.
 */
public class TxtFile
{
	public int blockSize;
	public Vector names = new Vector();
	/** Набор TxtFileBlock объектов. */
	public Vector blocks = new Vector();

	public TxtFile()
	{
	}

	public void sort(int fieldIndex)
	{
		int blockCount = blocks.size();

		for (int i = 0; i < blockCount - 1; i++)
		{
			String minString = (String) ((TxtFileBlock) blocks.elementAt(i)).data.elementAt(fieldIndex);
			int minIndex = i;

			// Ищем минимальную строку.
			for (int j = i + 1; j < blockCount; j++)
			{
				String curString = (String) ((TxtFileBlock) blocks.elementAt(j)).data.elementAt(fieldIndex);

				if (minString.compareTo(curString) > 0)
				{
					minString = curString;
					minIndex = j;
				}
			}

			// Меняем местами i и minIndex блоки.
			TxtFileBlock blockI = (TxtFileBlock) blocks.elementAt(i);
			TxtFileBlock blockMin = (TxtFileBlock) blocks.elementAt(minIndex);
			blocks.setElementAt(blockMin, i);
			blocks.setElementAt(blockI, minIndex);
		}
	}

	/**
	 * Возвращает число блоков без учёта SECTION блоков, который по сути не являются данными.
	 * @return
	 */
	public int getBlockCountWithousSECTION(int descriptionIndex)
	{
		int blocksCountWithousSECTION = 0;

		int blockCount = blocks.size();
		for (int i = 0; i < blockCount; i++)
		{
			TxtFileBlock txtFileBlock = (TxtFileBlock) blocks.elementAt(i);
			String description = (String) txtFileBlock.data.elementAt(descriptionIndex);
			String section = "SECTION";
			if (!description.startsWith(section))
			{
				blocksCountWithousSECTION++;
			}
		}

		return blocksCountWithousSECTION;
	}
}
