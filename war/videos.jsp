<%@page import="lunasoft.TxtFileBlock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="lunasoft.TxtFile" %>
<%@ page import="lunasoft.TxtFileBlock" %>
<%@ page import="lunasoft.TxtParser" %>

<jsp:include page="include_top.jsp" />

<%
	TxtFile txtFile;
	TxtFile txtFile2;
	TxtFileBlock txtFileBlock;
	TxtFileBlock txtFileBlock2;
	int blockCount;
	int blockCount2;
	int blockCountWithousSection;
%>

        <table width="100%" border="0" cellpadding="0" cellspacing="10">
        <tbody>
            <tr>
                <td>
                    <h3>Videos.</h3>
                    <h4>Last update 04.11.2012.</h4>
                    Links will open in new window.

<%
	txtFile = TxtParser.parseTxt(request, "/txt/drum_covers.txt");
	blockCount = txtFile.blocks.size();
	blockCountWithousSection = txtFile.getBlockCountWithousSECTION(0);
%>
                    <br><br>
                    <h4>Drum covers (<%= blockCountWithousSection %> rows).</h4>
                    <table width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
                    <thead>
                        <tr bgcolor="#dddddd">
                            <td>
                                Description
                            </td>

                            <td>
                                No drum kit
                            </td>

                            <td>
                                Medeli DD505(D)
                            </td>

                            <td>
                                Alesis DM10 studio + Medeli DD505(D)
                            </td>
                        </tr>
                    </thead>

                    <tbody>
<%
	for (int i = 0; i < blockCount; i++)
	{
		txtFileBlock = (TxtFileBlock) txtFile.blocks.elementAt(i);
		String description = (String) txtFileBlock.data.elementAt(0);
		String label1 = (String) txtFileBlock.data.elementAt(1);
		String link1 = (String) txtFileBlock.data.elementAt(2);
		String label2 = (String) txtFileBlock.data.elementAt(3);
		String link2 = (String) txtFileBlock.data.elementAt(4);
		String label3 = (String) txtFileBlock.data.elementAt(5);
		String link3 = (String) txtFileBlock.data.elementAt(6);

		String section = "SECTION";
		if (description.startsWith(section))
		{
%>
                        <tr bgcolor="#eeeeee">
                            <td colspan="4">
                                <center><%= description.substring(section.length()).trim() %></center>
                            </td>
                        </tr>
<%
		}
		else
		{
%>
                        <tr>
                            <td>
                                <%= description %>
                            </td>

                            <td>
<%
			if (link1.length() == 0)
			{
%>
                                <%= label1 %>
<%
			}
			else
			{
%>
                                <a href="<%= link1 %>" target="_blank"><%= label1 %></a>
<%
			}
%>
                            </td>

                            <td>
<%
			if (link2.length() == 0)
			{
%>
                                <%= label2 %>
<%
			}
			else
			{
%>
                                <a href="<%= link2 %>" target="_blank"><%= label2 %></a>
<%
			}
%>
                            </td>

                            <td>
<%
			if (link3.length() == 0)
			{
%>
                                <%= label3 %>
<%
			}
			else
			{
%>
                                <a href="<%= link3 %>" target="_blank"><%= label3 %></a>
<%
			}
%>
                            </td>
                        </tr>
<%
		}
	}
%>
                    </tbody>
                    </table>

<%
	txtFile = TxtParser.parseTxt(request, "/txt/game_videos.txt");
	blockCount = txtFile.blocks.size();
	blockCountWithousSection = txtFile.getBlockCountWithousSECTION(0);
%>
                    <br><br>
                    <h4>Game videos (<%= blockCountWithousSection %> rows).</h4>
                    <table width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
                    <thead>
                        <tr bgcolor="#dddddd">
                            <td>
                                Description
                            </td>

                            <td>
                                URL
                            </td>
                        </tr>
                    </thead>

                    <tbody>
<%
	for (int i = 0; i < blockCount; i++)
	{
		txtFileBlock = (TxtFileBlock) txtFile.blocks.elementAt(i);
		String description = (String) txtFileBlock.data.elementAt(0);
		String label = (String) txtFileBlock.data.elementAt(1);
		String link = (String) txtFileBlock.data.elementAt(2);

		String section = "SECTION";
		if (description.startsWith(section))
		{
%>
                        <tr bgcolor="#eeeeee">
                            <td colspan="2">
                                <center><%= description.substring(section.length()).trim() %></center>
                            </td>
                        </tr>
<%
		}
		else
		{
%>
                        <tr>
                            <td>
                                <%= description %>
                            </td>

                            <td>
<%
			if (link.length() == 0)
			{
%>
                                <%= label %>
<%
			}
			else
			{
%>
                                <a href="<%= link %>" target="_blank"><%= label %></a>
<%
			}
%>
                            </td>
                        </tr>
<%
		}
	}
%>
                    </tbody>
                    </table>

<%
	txtFile = TxtParser.parseTxt(request, "/txt/other_videos.txt");
	blockCount = txtFile.blocks.size();
	blockCountWithousSection = txtFile.getBlockCountWithousSECTION(0);
%>
                    <br><br>
                    <h4>Other videos (<%= blockCountWithousSection %> rows).</h4>
                    <table width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
                    <thead>
                        <tr bgcolor="#dddddd">
                            <td>
                                Description
                            </td>

                            <td>
                                URL
                            </td>
                        </tr>
                    </thead>

                    <tbody>
<%
	for (int i = 0; i < blockCount; i++)
	{
		txtFileBlock = (TxtFileBlock) txtFile.blocks.elementAt(i);
		String description = (String) txtFileBlock.data.elementAt(0);
		String label = (String) txtFileBlock.data.elementAt(1);
		String link = (String) txtFileBlock.data.elementAt(2);

		String section = "SECTION";
		if (description.startsWith(section))
		{
%>
                        <tr bgcolor="#eeeeee">
                            <td colspan="2">
                                <center><%= description.substring(section.length()).trim() %></center>
                            </td>
                        </tr>
<%
		}
		else
		{
%>
                        <tr>
                            <td>
                                <%= description %>
                            </td>

                            <td>
<%
			if (link.length() == 0)
			{
%>
                                <%= label %>
<%
			}
			else
			{
%>
                                <a href="<%= link %>" target="_blank"><%= label %></a>
<%
			}
%>
                            </td>
                        </tr>
<%
		}
	}
%>
                    </tbody>
                    </table>

<%
	txtFile = TxtParser.parseTxt(request, "/txt/favorites.txt");
	txtFile2 = TxtParser.parseTxt(request, "/txt/favorites.txt");
	txtFile2.sort(0);
	blockCount = txtFile.blocks.size();
	blockCountWithousSection = txtFile.getBlockCountWithousSECTION(0);
%>
                    <br><br>
                    <h4>Favorites (<%= blockCountWithousSection %> rows).</h4>
                    Left column in chronological order. First video - earlier, last video - later.
                    <br>
					Right column in alphabetical order. The same links.
                    <br><br>
					<table width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="0">
					<thead>
						<tr bgcolor="#dddddd">
							<td>
								Description (Chronological)
							</td>

							<td>
								URL
							</td>

							<td align="center">
								#
							</td>

							<td>
								Description (Alphabetical)
							</td>

							<td>
								URL
							</td>
						</tr>
					</thead>

					<tbody>
<%
	for (int i = 0; i < blockCount; i++)
	{
		txtFileBlock = (TxtFileBlock) txtFile.blocks.elementAt(i);
		String description = (String) txtFileBlock.data.elementAt(0);
		String label = "link";
		String link = (String) txtFileBlock.data.elementAt(1);

		txtFileBlock2 = (TxtFileBlock) txtFile2.blocks.elementAt(i);
		String description2 = (String) txtFileBlock2.data.elementAt(0);
		String label2 = "link";
		String link2 = (String) txtFileBlock2.data.elementAt(1);

		{
%>
						<tr>
							<td>
								<%= description %>
							</td>

							<td>
<%
			if (link.length() == 0)
			{
%>
								<%= label %>
<%
			}
			else
			{
%>
								<a href="<%= link %>" target="_blank"><%= label %></a>
<%
			}
%>
							</td>

							<td align="right">
								<%= (i + 1) %>
							</td>

							<td>
								<%= description2 %>
							</td>

							<td>
<%
			if (link.length() == 0)
			{
%>
								<%= label2 %>
<%
			}
			else
			{
%>
								<a href="<%= link2 %>" target="_blank"><%= label2 %></a>
<%
			}
%>
							</td>
						</tr>
<%
		}
	}
%>
					</tbody>
					</table>



				</td>
			</tr>
		</tbody>
		</table>

<jsp:include page="include_bottom.jsp" />
