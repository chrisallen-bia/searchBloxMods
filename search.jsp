<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.searchblox.admin.view.CollectionView,
                 com.searchblox.index.CollectionManager,
                 java.util.ArrayList" %>
<%@ page import="java.util.Properties"%>
<% ArrayList<?> view = CollectionManager.getInstance().getCollectionView();
    Properties settings = CollectionManager.getInstance().getResultSettings();
    if(settings.getProperty("force-secured-search")!=null && settings.getProperty("force-secured-search").equals("true")) {
%>
<script type="text/javascript">
    window.location.href = "search/login_securesearch.jsp";
</script>
<%
    }
%>
<%!
    public boolean isColTicked(int mycolID, String[] cols){
        for(int i=0; i < cols.length; i++){
            if (cols[i] != null && !cols[i].trim().equals("")) {
                int collectionID = Integer.parseInt(cols[i]);
                if(mycolID == collectionID)
                    return true;
            }
        }
        return false;
    }
%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>SearchBlox Search</title>
    <link href="results.css" rel="stylesheet" type="text/css"/>
    <!--[if gte IE 5]>
    <link href="styles-ie.css" rel="stylesheet" type="text/css">
    <![endif]-->
    <script language="JavaScript" type="text/javascript" src="scripts/prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="scripts/scriptaculous.js"></script>
    <script language="JavaScript" type="text/javascript" src="scripts/scripts.js"></script>


    <style>
        #contentarea{
            margin-top: 40px;
        }
        footer {
            background : transparent;
            color : #000;
            text-align : center;
        }
    </style>

    <!-- Font Awesome CSS -->
    <link href="admin/new_Styles/fonts/font-awesome.css" rel="stylesheet"/>
    <!-- Bootstrap CSS -->
    <link href="admin/new_Styles/css/bootstrap.css" rel="stylesheet" media="screen"/>
    <!-- TableTools CSS -->
    <link href="admin/Bootstrap/tabletools/css/TableTools.css" rel="stylesheet" media="screen"/>
    <!-- Main CSS -->
    <link href="admin/new_Styles/css/main.css" rel="stylesheet" media="screen"/>
    <!-- Shortcut Icon -->
    <link rel="shortcut icon" href="http://searchblox-website.s3.amazonaws.com/favicon.ico" />

</head>
<body onload="placeFocus()">
<div class="container">

    <div class="top-bar">
        <i class="logo-searchblox"></i>
        <ul id="icon-nav">
            <li><a href="https://searchblox.atlassian.net/wiki/display/SD/SearchBlox+User%27s+Guide"><i class="icon- icon-info-sign"></i></a></li>
            <li><a href="http://www.searchblox.com"><i class="icon-envelope-alt"></i></a></li>
            <li style="width:150px"><a href="/searchblox/adv_search.jsp" style="width: 150px; padding: 5px; display: block;">Advanced Search</a></li>
        </ul>
    </div>

    <div class="row"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div id="contentarea" class="panel panel-default">
                <div>

                    <div class="panel-heading clearfix">
                        <i class="icon-search"></i>
                        <h3 class="panel-title">Basic Search</h3>
                    </div>
                    <div class="panel-body">
                        <form action="servlet/SearchServlet" name="s" class="form-horizontal">
                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="detailView">

                                <tr>
                                    <td align="center">
                                        <%if(request.getParameterValues("col") == null || request.getParameterValues("col").length == 0){ %>
                                        <% for (int i = 0; i < view.size(); i++) {
                                            CollectionView cView = (CollectionView) view.get(i);
                                        %> <input type="checkbox" name="col"
                                                  value="<%=cView.getCollectionID()%>" checked><%=cView.getCollectionName()%>
                                        <%}%> <%}else{
                                        String col[] = request.getParameterValues("col");
                                        for (int i = 0; i < view.size(); i++) {
                                            CollectionView cView = (CollectionView) view.get(i);
                                            if(isColTicked(cView.getCollectionID(), request.getParameterValues("col"))){
                                    %> <input type="checkbox" name="col"
                                              value="<%=cView.getCollectionID()%>" checked><%=cView.getCollectionName()%>
                                        <%
                                        }
                                        else{
                                        %> <input type="checkbox" name="col"
                                                  value="<%=cView.getCollectionID()%>"><%=cView.getCollectionName()%>
                                        <%
                                                    }
                                                }

                                            }
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <p>
                                            <br /> <input type="text" maxlength="128"
                                                          style="height: 30px; width: 500px;" name="query" value=""
                                                          onkeypress="doSearch1(event)">

                                        </p>
                                        <p>
                                        <div>
                                            <a href="#" class="btn btn-primary" onclick="doSearch(event)">Search</a>
                                        </div>

                                    </td>
                                </tr>

                            </table>
                        </form>
                    </div>
                    <!-- "box" closed -->

                </div>
                <!-- "contentArea" closed -->

            </div>
        </div>
    </div>

    <!-- "everythingButTheFooter" closed -->

    <footer>
        <p>
				<span class="copyright">Copyright &copy;
                    2017 SearchBlox
					Software, Inc.
				</span>

        </p>


    </footer>

</div>
<!-- "siteWrapper" closed -->

<!-- BEGIN ABSOLUTELY POSITIONED ELEMENTS (MENUS, TOOLTIPS) -->

<div id="help" style="display: none;">
    <div class="titleBar">SearchBlox Search Tips</div>
    <div class="box">

        <h2>Query Syntax</h2>

        <p>
            <b>Search for documents by typing in words</b><br/>
            java computer software
        </p>

        <p>
            <b>Search for exact phrases by using quotations</b><br/>
            "java software"
        </p>

        <p>
            <b>Use +, -, AND, OR, NOT operators when searching</b><br/>
            +java -coffee<br/>
            Java NOT Coffee<br/>
            "jakarta apache" AND "jakarta tomcat"<br/>
            "jakarta apache" OR jakarta
        </p>

        <p>
            <b>To perform a single character wildcard search use the "?" symbol.</b><br/>
            ja?a
        </p>

        <p>
            <b>To perform a multiple character wildcard search use the "*" symbol.</b><br/>
            j*a<br/>
            ja*<br/><br/>

            <b>Note: You cannot use a * or ? symbol as the first character of a search.</b>
        </p>

        <p>
            <b>To find the term java in the title only</b><br/>
            title:java
        </p>

        <p>
            <b>To find documents which are pdfs</b><br/>
            contenttype:pdf
        </p>
        <input type="button" name="Button" value="Close" onclick="togglePopup('help');"/>
    </div>
</div>

<!-- used to fade out the background when the help pop-up appears -->
<iframe id="shim" style="DISPLAY: none;" src="shim.html" frameborder="0" scrolling="no"></iframe>

</body>
</html>
