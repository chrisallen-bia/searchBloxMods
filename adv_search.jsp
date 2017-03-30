<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.searchblox.admin.view.CollectionView,
                 com.searchblox.index.CollectionManager,
                 java.util.ArrayList" %>
<% ArrayList view = CollectionManager.getInstance().getCollectionView();%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Indian Affairs Advanced Search</title>
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
   <script language="Javascript">
        function placeFocus() {
            if (document.forms.length > 0) {
                var field = document.forms[0];
                for (i = 0; i < field.length; i++) {
                  if ((field.elementsi.type!==undefined)&&((field.elementsi.type === 
                  "text") || (field.elementsi.type === "textarea") || 
                  (field.elementsi.type.toString().charAt(0) === "s"))) {
                        document.forms[0].elements[i].focus();
                        break;
                    }
                }
            }
        }
        placeFocus();
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
    
    <link href="results.css" rel="stylesheet" type="text/css"/>
    <!--[if gte IE 5]>
    <link href="styles-ie.css" rel="stylesheet" type="text/css">
    <![endif]-->
    
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
<body>
<div class="container">

        <div class="top-bar">
      <i class="logo-searchblox"></i>
      <ul id="icon-nav">


        <li style="width:100px"><a href="search.jsp" style="width: 100px; padding: 5px; display: block;">Basic Search</a></li>
      </ul>
    </div>

            <div class="row"></div>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div id="contentarea" class="panel panel-default">
                <div>
                  
                  <div class="panel-heading clearfix">
                            <i class="icon-search"></i>
                            <h3 class="panel-title">Advanced Search</h3>
                        </div>
            <div class="panel-body">
                 <form action="servlet/SearchServlet" method="get" name="s" class="form-horizontal">
                  <input type="hidden" name="fe" value="utf-8">
                  <input type="hidden" name="st" value="adv">   
                  <div class="divider-bottom">
                    <table border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr >
                        <td align="center">
                            <% for (int i = 0; i < view.size(); i++) {
                                CollectionView cView = (CollectionView) view.get(i);
                             %>
                             <input type="checkbox" name="col" value="<%=cView.getCollectionID()%>"
                                       checked><%=cView.getCollectionName()%>
                             <%}%>
                        </td>
                      </tr>
                    </table>
                  </div>
                  <fieldset>
                    
                    <!-- <div class="form-group">
                      <label class="control-label col-sm-2">
                        <strong>Find Results</strong>
                      </label>
                    </div> -->
                    
                    <div class="form-group"></div>
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        With all the words
                      </label>
                      <div class="col-sm-5">
                        <input size=25 name=q_all class="form-control"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        With the exact phrase
                      </label>
                      <div class="col-sm-5">
                        <input size=25 name=q_phr class="form-control"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        With at least one of the words
                      </label>
                      <div class="col-sm-5">
                        <input size=25 name=q_low class="form-control"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        Without the words
                      </label>
                      <div class="col-sm-5">
                        <input size=25 name=q_not class="form-control"/>
                      </div>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label class="control-label col-sm-2">
                        Language
                      </label>
                    </div> -->
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        Documents in
                      </label>
                      <div class="col-sm-5">
                        <select name=language class="form-control">
                            <option value="" selected>any language</option>
                            <option value="ar">Arabic</option>
                            <option value="bn">Bengali</option>
                            <option value="zhcn">Chinese(Simplified)</option>
                            <option value="zhtw">Chinese(Traditional)</option>
                            <option value="cs">Czech</option>
                            <option value="da">Danish</option>
                            <option value="nl">Dutch</option>
                            <option value="en">English</option>
                            <option value="et">Estonian</option>
                            <option value="fi">Finnish</option>
                            <option value="fr">French</option>
                            <option value="de">German</option>
                            <option value="el">Greek</option>
                            <option value="gu">Gujarati</option>
                            <option value="iw">Hebrew</option>
                            <option value="hi">Hindi</option>
                            <option value="hu">Hungarian</option>
                            <option value="it">Italian</option>
                            <option value="ja">Japanese</option>
                            <option value="kn">Kannada</option>
                            <option value="kr">Korean</option>
                            <option value="lv">Latvian</option>
                            <option value="lt">Lithuanian</option>
                            <option value="mal">Malayalam</option>
                            <option value="no">Norwegian</option>
                            <option value="pl">Polish</option>
                            <option value="pt">Portuguese</option>
                            <option value="ro">Romanian</option>
                            <option value="ru">Russian</option>
                            <option value="sk">Slovak</option>
                            <option value="sl">Slovenian</option>
                            <option value="es">Spanish</option>
                            <option value="sv">Swedish</option>
                            <option value="ta">Tamil</option>
                            <option value="te">Telugu</option>
                            <option value="th">Thai</option>
                            <option value="tr">Turkish</option>
                            </select>
                      </div>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label class="control-label col-sm-2">
                        File Format
                      </label>
                    </div> -->
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        Documents of format
                      </label>
                      <div class="col-sm-5">
                        <select name=contenttype class="form-control">
                            <option value="" selected>any format</option>
                            <option value="pdf">Adobe Acrobat PDF (.pdf)</option>
                            <option value="word">Word (.doc)</option>
                            <option value="excel">Excel (.xls)</option>
                            <option value="ppt">PowerPoint (.ppt)</option>
                            <option value="rtf">Rich Text Format (.rtf)</option>
                            <option value="text">Text (.txt)</option>
                          </select>
                      </div>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label class="control-label col-sm-2">
                        Date
                      </label>
                    </div> -->
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        Documents updated
                      </label>
                      <div class="col-sm-5">
                        <select name="startdate" class="form-control">
                                <option value="0" selected>anytime</option>
                                <option value="3">past 3 months</option>
                                <option value="6">past 6 months</option>
                                <option value="12">past year</option>
                            </select>
                      </div>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label class="control-label col-sm-2">
                        Occurrences
                      </label>
                    </div> -->
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        Documents with terms in
                      </label>
                      <div class="col-sm-5">
                        <select name="oc" class="form-control">
                                <option value=all selected>anywhere in the document</option>
                                <option value=title>in the title</option>
                                <option value=content>in the content</option>
                                <option value=keywords>in the keywords</option>
                                <option value=description>in the description</option>
                                <option value=url>in the URL</option>
                          </select>
                      </div>
                    </div>
                    
                    <!-- <div class="form-group">
                      <label class="control-label col-sm-2">
                        Results
                      </label>
                    </div> -->
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2">
                        No. of results per page
                      </label>
                      <div class="col-sm-5">
                        <select name=pagesize class="form-control">
                                <option value=10 selected>10 results</option>
                                <option value=20>20 results</option>
                                <option value=30>30 results</option>
                                <option value=50>50 results</option>
                                <option value=100>100 results</option>
                            </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="control-label col-sm-2"></label>
                      <div class="col-sm-2">
                        <a href="javascript: document.forms.s.submit();" class="btn btn-primary btn-block">Search</a>
                      </div>
                    </div>
                  
                  </fieldset>
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
        <span class="copyright"style="visibility:hidden;">Copyright &copy;
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
<iframe id="shim" style="DISPLAY: none;" src="shim.html" frameborder="0" scrolling="No"></iframe>

</body>
</html>
