<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="com.searchblox.admin.view.CollectionView,
                 com.searchblox.index.CollectionManager,
                 java.util.ArrayList" %>
<% ArrayList view = CollectionManager.getInstance().getCollectionView();%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title> Indian Affairs Search</title>
    <link href="results.css" rel="stylesheet" type="text/css"/>
    <!--[if gte IE 5]>
    <link href="styles-ie.css" rel="stylesheet" type="text/css">
    <![endif]-->
    <script language="JavaScript" type="text/javascript" src="scripts/prototype.js"></script>
    <script language="JavaScript" type="text/javascript" src="scripts/scriptaculous.js"></script>
    <script language="JavaScript" type="text/javascript" src="scripts/scripts.js"></script>
    <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-7941540-4', 'auto');
    ga('send', 'pageview');
    </script>    
    
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
                <link rel="shortcut icon" href="https://iiamabqzucmw02p.ia.doi.net:16200/cs/groups/webteam/documents/site_assets/idc-000121.ico" />
    
</head>
<body onload="placeFocus()">
<div class="container">

        <div class="top-bar">
            <i class="logo-searchblox"></i>
            <ul id="icon-nav">

            
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
                                <% for (int i = 0; i < view.size(); i++) {
                                    CollectionView cView = (CollectionView) view.get(i);
                                %>
                                <input type="checkbox" name="col" value="<%=cView.getCollectionID()%>"
                                       checked><%=cView.getCollectionName()%>
                                <%}%>

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
                <span class="copyright"style="visibility:hidden;" >Copyright &copy;
                    2015 SearchBlox
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
