package lunasoft;

public class Const
{
    public static final String PARAM_KLYUVDII_PARTITION_ID = "klyuvdiiPartitionId";
    public static final String PARAM_KLYUVDII_FILE_NAME = "klyuvdiiFileName";

    // Идентификаторы пунктов меню.
    public static final String MENU_ITEMS[][] = new String[][] {
        { "Main", "main.jsp" },
        { "Programs", "programs.jsp" },
        { "Emulators", "emulators.jsp" },
        { "Saves", "saves.jsp" },
        { "Books", "books.jsp" },
        { "Videos", "videos.jsp" },
        { "Links", "links.jsp" },
        { "Klyuvdii", "klyuvdii.jsp" },
        { "Contacts", "contacts.jsp" },
    };

    public static final int KLYUVDII_MENU_ID_TEXTS = 0;
    public static final int KLYUVDII_MENU_ID_PROSES = 1;

    // Идентификаторы пунктов меню клювдий.
    public static final String KLYUVDII_ITEMS[][] = new String[][] {
        { "Стихи", "texts" },
        { "Проза", "proses" },
    };
} 