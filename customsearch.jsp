    <!-- SearchBlox Software, Inc. -->
    <!-- CustomSearch Functionality HTML -->
    <!-- CustomSearch START -->
    <FORM name="search" action="servlet/SearchServlet" method="POST">

            <!-- Encoding of the Search Page -->
            <input type="hidden" name="fe" value="euc-kr" />

            <!-- Specify the sort option to be used -->
            <!-- Valid sort options are
            date         - sort results by date
            relevance    - sort results by relevance
            alpha        - sort results alphabetically
            -->
            <input type="hidden" name="sort" value="" />

            <!-- Specify the collections to be used
            Multiple collections can be specified as:
            <input type="hidden" name="col" value="1" />
            <input type="hidden" name="col" value="2" />
            -->
            <input type="hidden" name="col" value="" />

            <!-- Specify the XSL to be used to display search results
            Setting this value to "xml" displays search results as XML
            Note: This option is not available in the SearchBlox FREE Edition
            -->

            <input type="hidden" name="xsl" value="" />

            <TABLE border="1">
                <TR>
                    <TD>
                        <TABLE border="0">
                            <TR colspan="2">
                                <TD>
                                    <DIV style="color: #72A4D2; font-family: Verdana; font-weight: bold; font-size: 12px;"> CustomSearch
                                    </DIV>
                                </TD>
                            </TR>
                            <TR align="left">
                                <TD valign="center">
                                    <INPUT type="Text" value="" name="query" STYLE="color: #FFFFFF; font-family: Verdana; font-weight: bold; font-size: 12px; background-color: #72A4D2;" size="17" >
                                </TD>
                                <TD>
                                    <INPUT onclick="JavaScript: document.forms['search'].submit()" type="image" src="http://www.searchblox.com/images/searchicon.jpg" border="0">
                                </TD>
                            </TR>
                        </TABLE>
                    </TD>
                </TR>
            </TABLE>
    </FORM>
    <!-- CustomSearch END -->
