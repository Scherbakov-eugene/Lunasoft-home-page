<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lunasoft.Const" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Vector" %>

<jsp:include page="include_top.jsp" />

        <table width="100%" border="0" cellpadding="0" cellspacing="10">
        <tbody>
            <tr>
                <td>
                    <table width="100%" height="100%" border=0 cellpadding="0" cellspacing="0" style="table-layout: fixed">
                    <tr>
                        <td width="205" align="left"></td>
                        <td width="*"></td>
                        <td width="385" align="right"></td>
                    </tr>
            
                    <tr>
                        <td height="130" background="images/klyuvdii_title_left.jpg">
                        </td>
            
                        <td background="images/klyuvdii_title_fill.jpg">
                        </td>
            
                        <td background="images/klyuvdii_title_right.jpg">
                        </td>
                    </tr>
                    </table>

                    <%
                        // Извлекаем выбранный раздел клювдий.
                        int klyuvdiiPartitionId = -1;
                        try
                        {
                            klyuvdiiPartitionId = Integer.parseInt(request.getParameter(Const.PARAM_KLYUVDII_PARTITION_ID));
                        }
                        catch (Exception e)
                        {
                        }

                        // Извлекаем выбранный файл клювдий.
                        String klyuvdiiFileNameParam = request.getParameter(Const.PARAM_KLYUVDII_FILE_NAME);
                        String klyuvdiiFileName = URLDecoder.decode(klyuvdiiFileNameParam == null ? "" : klyuvdiiFileNameParam, "UTF-8");

                        // Если раздел клювдий не выбран.
                        if (klyuvdiiPartitionId < 0 || klyuvdiiPartitionId >= Const.KLYUVDII_ITEMS.length)
                        {
                            // Выдаём список разделов клювдий.
                    %>
                            <P align=justify>Привет всем посетителям нашего сайта! 

                            <P align=justify>Если вы зашли сюда специально, то мы вам сочувствуем :), если 
                            случайно - не спешите выходить, не прочитав данное послание. Сразу хочется 
                            предупредить: это НЕ фан-сайт мультсериала "Утиные истории" и вообще, проект 
                            "Клювдии" никак с ним не связан. Клювдии - это БРЕДОВЫЕ стихи. Почему мы их так 
                            назвали не спрашивайте - мы и сами не знаем, однако, что есть, то есть, и наши 
                            стихи называются именно так. Принцип написания Клювдий достаточно прост: данные 
                            произведения искусства пишутся двумя людьми через строчку по-очереди. Не спешите 
                            писать гневные письма – мы знаем, что не мы это придумали. У Клювдий есть ещё 
                            одна отличительная особенность: они пишутся экспромтом, без усилий придать 
                            какую-либо cмысловую нагрузку. Главное, чтобы получалось весело, ведь, как гласит 
                            пословица, чем хуже, тем смешнее. В конце каждого стиха есть список непонятных 
                            слов, если таковые имеются. 

                            <P align=justify>Но это ещё не всё! Проект предусматривает ваше непосредственное 
                            участие. Иными словами: люди, присылайте свои Клювдии на <A 
                            href="mailto:klyuvdii@mail.ru">klyuvdii@mail.ru</A> и ваши творения не останутся 
                            незамеченными.

                            <P align=justify><b>Комментарии:</b>
                            <br>Местами в стихах попадается пошлость и прочая ерунда. Чаще - в более ранних.
                            <br>Клювдии бывают не только в стихах, но и в прозе.

                            <P align=justify>Среди авторов: Reboot, Relook, TSE, Fire_Damage, Insomnia, Marakoris, Rewers.

                            <P align=justify>В заключение хочется сказать: не судите слишком строго, ведь 
                            каждый сходит с ума по-своему :)

                            <p align=justify><b>Содержание:</b>
                    <%
                            // Пробегаем по всем пунктам.
                            for (int i = 0; i < Const.KLYUVDII_ITEMS.length; i++)
                            {
                    %>
                                <br>
                                <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= i %>">
                                    <%= Const.KLYUVDII_ITEMS[i][0] %>
                                </a>
                    <%
                            }
                    %>
                                <p align=justify>
                                <a href="servlets/KlyuvdiiDownloadAll">Скачать всё в одном архиве.</a>
                    <%
                        }
                        // Если раздел клювдий выбран.
                        else
                        {
                            // Если файл клювдий не выбран.
                            if (klyuvdiiFileName == null || klyuvdiiFileName.length() == 0)
                            {
                    %>
                                <p align=justify>
                                <a href="klyuvdii.jsp">
                                    Назад
                                </a>

                                <p align=justify><b>Клювдии / <%= Const.KLYUVDII_ITEMS[klyuvdiiPartitionId][0] %>:</b>
                                <br>
                                <br>
                    <%
                                // Получаем список клювдий в выбранном разделе.
                                File dir = new File(request.getRealPath("/klyuvdii/" + Const.KLYUVDII_ITEMS[klyuvdiiPartitionId][1]));

                                File[] files = null;

                                // Если файл существует и является каталогом.
                                if (dir.exists() && dir.isDirectory())
                                {
                                    FileFilter filter = new FileFilter()
                                    {
                                        public boolean accept(File file)
                                        {
                                            return file.isFile();
                                        }
                                    };

                                    // Выбираем все файлы данного каталога.
                                    files = dir.listFiles(filter);
                                    // Выполняем сортировку.
                                    Arrays.sort(files);
                                }

                                // Выводим список просканированных клювдий.
                                for (int i = 0; i < files.length; i++)
                                {
                                    String name;
                                    int index = files[i].getName().toLowerCase().indexOf(".txt");
                                    if (index == -1)
                                    {
                                        index = files[i].getName().toLowerCase().indexOf(".htm");
                                    }
    
                                    if (index != -1)
                                    {
                                        name = files[i].getName().substring(0, index);
                                    }
                                    else
                                    {
                                        name = files[i].getName();
                                    }
    
                                    name = "Клювдия " + name;
                    %>
                                    <%=(i > 0 && i < files.length) ? "<br>" : ""%>
                                    <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>&<%= Const.PARAM_KLYUVDII_FILE_NAME %>=<%= URLEncoder.encode(files[i].getName()) %>">
                                        <%=name%>
                                    </a>
                    <%
                                }
                            }
                            // Если файл клювдий выбран.
                            else
                            {
                                int fileIndex = -1;
                                File files[] = null;

                                try
                                {
                                    // Открываем каталог с клювдиями выбранного раздела.
                                    File dir = new File(request.getRealPath("/klyuvdii/" + Const.KLYUVDII_ITEMS[klyuvdiiPartitionId][1]));

                                    // Если файл существует и является каталогом.
                                    if (dir.exists() && dir.isDirectory())
                                    {
                                        FileFilter filter = new FileFilter()
                                        {
                                            public boolean accept(File file)
                                            {
                                                return file.isFile();
                                            }
                                        };

                                        // Выбираем все файлы данного каталога.
                                        files = dir.listFiles(filter);
                                        // Выполняем сортировку.
                                        Arrays.sort(files);
                                    }

                                    // Ищем указанный файл клювдий в каталоге.
                                    if (klyuvdiiFileName != null)
                                    {
                                        for (int i = 0; i < files.length; i++)
                                        {
                                            if (files[i].getName().equals(klyuvdiiFileName))
                                            {
                                                // Запоминаем индекс файла.
                                                fileIndex = i;
                                                break;
                                            }
                                        }
                                    }

                                    // Если файл найден.
                                    if (fileIndex != -1)
                                    {
                            %>
                                        <table border="0" cellpadding="0" cellspacing="0" style="font-size:16pt;">
                                            <tr>
                                                <td width="100" align="center">
                            <%
                                                    // Если файл не первый.
                                                    if (fileIndex > 0)
                                                    {
                                                        String targetFileName = files[fileIndex - 1].getName();
                            %>
                                                        <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>&<%= Const.PARAM_KLYUVDII_FILE_NAME %>=<%= URLEncoder.encode(targetFileName, "UTF-8") %>">
                                                            Предыдущий
                                                        </a>
                            <%
                                                    }
                            %>
                                                </td>

                                                <td width="100" align="center">
                                                    <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>">
                                                        Назад
                                                    </a>
                                                </td>
                            
                                                <td width="100" align="center">
                            <%
                                                    // Если файл не последний
                                                    if (fileIndex < files.length - 1)
                                                    {
                                                        String targetFileName = files[fileIndex + 1].getName();
                            %>
                                                        <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>&<%= Const.PARAM_KLYUVDII_FILE_NAME %>=<%= URLEncoder.encode(targetFileName, "UTF-8") %>">
                                                            Следующий
                                                        </a>
                            <%
                                                    }
                            %>
                                                </td>
                                            </tr>
                                        </table>

                                        <font size="3">
                            
                                        <h1>
                            <%
                                                String name = "";
                                                boolean typeHtm;
                                                int indexTxt = klyuvdiiFileName.toLowerCase().indexOf(".txt");
                                                int indexHtm = klyuvdiiFileName.toLowerCase().indexOf(".htm");
                                    
                                                if (indexTxt != -1)
                                                {
                                                    name = klyuvdiiFileName.substring(0, indexTxt);
                                                    typeHtm = false;
                                                }
                                                else if (indexHtm != -1)
                                                {
                                                    name = klyuvdiiFileName.substring(0, indexHtm);
                                                    typeHtm = true;
                                                }
                                                else
                                                {
                            %>
                                                    Запрашиваемый файл не найден
                            <%
                                                    return;
                                                }
                            %>
                                        Клювдии / <%= Const.KLYUVDII_ITEMS[klyuvdiiPartitionId][0] %> / <%= name %>
                                        </h1>
                            <%
                                        File file = new File(request.getRealPath("/klyuvdii/" + Const.KLYUVDII_ITEMS[klyuvdiiPartitionId][1] + "/" + klyuvdiiFileName));

                                        // Если файл существует и не является каталогом.
                                        if (file.exists() && !file.isDirectory())
                                        {
                                            // Открываем входной поток файла.
                                            FileInputStream stream = new FileInputStream(file);
                                            int size = stream.available();
                                            byte b[] = new byte[size];
                                            // Читаем содержимое файла.
                                            stream.read(b);

                                            // Вектор для хранения строки.
                                            Vector line = new Vector();
                                            String br = "<br>\n";

                                            // Пробегаем по всем байтам файла.
                                            for (int i = 0; i < size; i++)
                                            {
                                                // Если признак переноса строки.
                                                if (b[i] == 10 || b[i] == 13)
                                                {
                                                    line.add(new Byte(br.getBytes()[0]));
                                                    line.add(new Byte(br.getBytes()[1]));
                                                    line.add(new Byte(br.getBytes()[2]));
                                                    line.add(new Byte(br.getBytes()[3]));
                                                    line.add(new Byte(br.getBytes()[4]));
                                                    
                                                    i++;
                                                }
                                                else
                                                {
                                                    // Переписываем байты файла в строку.
                                                    line.add(new Byte(b[i]));
                                                }
                                            }

                                            // Преобразуем вектор объектов Byte в массив byte[].
                                            byte bytes[] = new byte[line.size()];
                                            for (int i = 0; i < line.size(); i++)
                                            {
                                                bytes[i] = ((Byte)line.get(i)).byteValue();
                                            }

                                            // Кодировка по-умолчанию.
                                            String encoding = "windows-1251";
                                            if (indexTxt != -1)
                                            {
                                                encoding = "windows-1251";
                                            }
                                            else if (indexHtm != -1)
                                            {
                                                encoding = "UTF-8";
                                            }

                                            // Создаём текст из набора байтов с нужной кодировкой.
                                            String text = new String(bytes, encoding);

                                            if (indexHtm != -1)
                                            {
                                                text = text.replaceAll("<img src=\"", "<img src=\"" + "klyuvdii/" + Const.KLYUVDII_ITEMS[klyuvdiiPartitionId][1] + "/");
                                                text = text.substring(text.indexOf("<p style"), text.indexOf("</body>"));
                                            }
                            %>
                                                <%=text%>
                            <%
                                        }
                            %>
                                        </font>
                            
                                        <br>
                                        <br>
                                        <table border="0" cellpadding="0" cellspacing="0" style="font-size:16pt;">
                                            <tr>
                                                <td width="100" align="center">
                            <%
                                                    // Если файл не первый.
                                                    if (fileIndex > 0)
                                                    {
                                                        String targetFileName = files[fileIndex - 1].getName();
                            %>
                                                        <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>&<%= Const.PARAM_KLYUVDII_FILE_NAME %>=<%= URLEncoder.encode(targetFileName, "UTF-8") %>">
                                                            Предыдущий
                                                        </a>
                            <%
                                                    }
                            %>
                                                </td>

                                                <td width="100" align="center">
                                                    <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>">
                                                        Назад
                                                    </a>
                                                </td>
                            
                                                <td width="100" align="center">
                            <%
                                                    // Если файл не последний
                                                    if (fileIndex < files.length - 1)
                                                    {
                                                        String targetFileName = files[fileIndex + 1].getName();
                            %>
                                                        <a href="klyuvdii.jsp?<%= Const.PARAM_KLYUVDII_PARTITION_ID %>=<%= klyuvdiiPartitionId %>&<%= Const.PARAM_KLYUVDII_FILE_NAME %>=<%= URLEncoder.encode(targetFileName, "UTF-8") %>">
                                                            Следующий
                                                        </a>
                            <%
                                                    }
                            %>
                                                </td>
                                            </tr>
                                        </table>
                            <%
                                    }
                                    else
                                    {
                            %>
                                        <h1>Запрашиваемый файл не найден</h1>
                            <%
                                    }
                                }
                                catch (Exception e)
                                {
                                    e.printStackTrace();
                                }
                            }
                        }
                    %>
                </td>
            </tr>
        </tbody>
        </table>

<jsp:include page="include_bottom.jsp" />
