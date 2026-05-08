<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lunasoft.Const" %>

<LINK href="lunasoft.css" type=text/css rel=stylesheet>

<html>
    <head>
        <META http-equiv=Content-Type content="text/html; charset=UTF-8">
        <title>LunaSoft</title>
    </head>

    <script language="javascript">
    	function swap(id)
    	{
    		var text = document.getElementById("text" + id);
    		var img = document.getElementById("img" + id);

    		if (text.style.display == "block")
    		{
    			text.style.display = "none";
    			img.src = "images/plus.png";
    		}
    		else
        	{
    			text.style.display = "block";
    			img.src = "images/minus.png";
        	}
    	}

    	function invokeMenu(menuId)
    	{
    		var menuFrame = top.frames[1];
    		menuFrame.loadContent(menuId);
    	}
    </script>

    <body>
    	<!-- LOGO -->
    	<table>
    		<tr>
    			<td>
    				<table border="0" cellpadding="0" cellspacing="0">
    					<tr>
    						<td width="20" height="20" bgcolor="white"></td>
    						<td width="7" bgcolor="white"></td>
    						<td width="3" bgcolor="blue"></td>
    						<td width="7" bgcolor="white"></td>
    						<td width="20" bgcolor="white"></td>
    					</tr>

    					<tr>
    						<td width="20" height="7" bgcolor="white"></td>
    						<td width="7" bgcolor="blue"></td>
    						<td width="3" bgcolor="white"></td>
    						<td width="7" bgcolor="blue"></td>
    						<td width="20" bgcolor="white"></td>
    					</tr>

    					<tr>
    						<td width="20" height="3" bgcolor="blue"></td>
    						<td width="7" bgcolor="white"></td>
    						<td width="3" bgcolor="white"></td>
    						<td width="7" bgcolor="white"></td>
    						<td width="20" bgcolor="blue"></td>
    					</tr>

    					<tr>
    						<td width="20" height="7" bgcolor="white"></td>
    						<td width="7" bgcolor="blue"></td>
    						<td width="3" bgcolor="white"></td>
    						<td width="7" bgcolor="blue"></td>
    						<td width="20" bgcolor="white"></td>
    					</tr>

    					<tr>
    						<td width="20" height="20" bgcolor="white"></td>
    						<td width="7" bgcolor="white"></td>
    						<td width="3" bgcolor="blue"></td>
    						<td width="7" bgcolor="white"></td>
    						<td width="20" bgcolor="white"></td>
    					</tr>
    				</table>
    			</td>

    			<td>
    				<font size="6" color="blue">LunaSoft</font>
    			</td>
    		</tr>
    	</table>

    	<hr size="2" color="black">

    	<table width="100%" border="0" cellpadding="0" cellspacing="10">
    	<tbody>
    		<tr>
    			<td width="150px" valign="top">
    				<table width="100%" border="0" cellpadding="0" cellspacing="10">
    				<tbody>
    					<tr>
    						<td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="2">
                                <tbody>

                                	<%
                                		// Пробегаем по всем пунктам меню.
                                		for (int i = 0; i < Const.MENU_ITEMS.length; i++)
                                		{
                                	%>

                                	<tr>
                                		<td id="<%= Const.MENU_ITEMS[i][1] %>"
                                		class="<%= request.getRequestURI().equals("/" + Const.MENU_ITEMS[i][1]) ? "buttonOn" : "buttonOff" %>">
                                			<a title="" href="<%= Const.MENU_ITEMS[i][1] %>"><%= Const.MENU_ITEMS[i][0] %></a>
                                        </td>
                                    </tr>

                                    <%
                                		}
                                	%>

                                </tbody>
                                </table>
                            </td>
                        </tr>

                        <tr>
                        	<td>
                        		<!-- HotLog -->
                        		<script type="text/javascript" language="javascript">
                        		hotlog_js="1.0";
                        		hotlog_r=""+Math.random()+"&s=540351&im=202&r="+escape(document.referrer)+"&pg="+
                        		escape(window.location.href);
                        		document.cookie="hotlog=1; path=/"; hotlog_r+="&c="+(document.cookie?"Y":"N");
                        		</script>
                        		<script type="text/javascript" language="javascript1.1">
                        		hotlog_js="1.1";hotlog_r+="&j="+(navigator.javaEnabled()?"Y":"N")
                        		</script>
                        		<script type="text/javascript" language="javascript1.2">
                        		hotlog_js="1.2";
                        		hotlog_r+="&wh="+screen.width+'x'+screen.height+"&px="+
                        		(((navigator.appName.substring(0,3)=="Mic"))?
                        		screen.colorDepth:screen.pixelDepth)</script>
                        		<script type="text/javascript" language="javascript1.3">hotlog_js="1.3"</script>
                        		<script type="text/javascript" language="javascript">hotlog_r+="&js="+hotlog_js;
                        		document.write("<a href='http://click.hotlog.ru/?540351' target='_top'><img "+
                        		" src='http://hit27.hotlog.ru/cgi-bin/hotlog/count?"+
                        		hotlog_r+"&' border=0 width=88 height=100 alt=HotLog><\/a>")
                        		</script>
                        		<noscript>
                        		<a href="http://click.hotlog.ru/?540351" target="_top">
                        		<img src="http://hit27.hotlog.ru/cgi-bin/hotlog/count?s=540351&amp;im=202" border="0" 
                        		width="88" height="100" alt="HotLog"></a>
                        		</noscript>
                        		<!-- /HotLog -->
                        	</td>
                        </tr>

                        <tr>
                        	<td>
                        		<a title="Flag counter" href="http://www.webseomasters.com">
                        		<script type="text/javascript">
                        		var id = "RewersXP";
                        		</script>
                        		<script language="JavaScript" type="text/javascript" src="http://www.webseomasters.com/rwebstatistics.js"></script>
                        		<noscript><img alt="Web Statistics" src="http://www.webseomasters.com/web-stats/stats.php?id=RewersXP"></noscript></a>
                        	</td>
                        </tr>
                    </tbody>
                    </table>
                </td>

                <td width="*" valign="top">
