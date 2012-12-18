<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;"><!-- no-break space = non-breaking space,
                              U+00A0 ISOnum -->
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"
                doctype-public="-//W3C//DTD HTML 4.01//EN"
                doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

  <xsl:variable name="checkURLs" select="false"/>
  <xsl:variable name="previous_url">http://jibbering.com/faq/</xsl:variable>
  <xsl:variable name="previous_maintainer">Garrett Smith</xsl:variable>
  <xsl:variable name="previous_maintainer_website">http://personx.tumblr.com/</xsl:variable>  
  
  <xsl:variable name="maintainer">Thomas 'PointedEars' Lahn</xsl:variable>
  <xsl:variable name="maintainer_email"><![CDATA[cl&#106;&#115;&#64;&#80;o&#105;n&#116;&#101;d&#69;a&#114;s.&#100;&#101;]]></xsl:variable>
  <xsl:variable name="maintainer_website">http://PointedEars.de/</xsl:variable>
  
  <xsl:variable name="version" select="/FAQ/@VERSION"/>
  <xsl:template match="/FAQ">
    <xsl:variable name="revision_length" select="string-length('$Revision: ')"/>
    <xsl:variable name="revision" select="substring(@revision, $revision_length, string-length(@revision) - $revision_length - 1)"/>
    <xsl:variable name="updated" select="@DATE"/>
        
    <html lang="en">
      <head>
        <meta http-equiv="Content-Type" content="text/html; UTF-8"/>
        <title><xsl:value-of select="TITLE"/></title>
        <meta name="DCTERMS.language" scheme="RFC1766" content="en"/>
        <meta name="DC.title" content="FAQ for comp.lang.javascript"/>
        <meta name="DCTERMS.subject"
              content="Frequently asked questions in the Usenet newsgroup comp.lang.javascript"/>
        <meta name="DC.format" content="text/html"/>
        <meta name="DC.type" content="Text"/>
        <meta name="DC.creator" content="Jim Ley"/>
        <meta name="DC.publisher" content="{$maintainer}"/>
        <meta name="DC.Publisher.Address"
              content="{$maintainer_email}"/>
        <meta name="DCTERMS.modified" content="{$updated}"/>
        <meta name="DCTERMS.audience" content="Programmers, web developers"/>
        <meta name="DC.description" content="Frequently Asked Questions about JavaScript and other ECMAScript implementations"/>
        <meta name="DC.identifier" content="http://PointedEars.de/scripts/faq/cljs/"/>
        <meta name="DC.source"
              content="http://www.ecma-international.org/publications/standards/Ecma-262.htm"/>
        <meta name="DC.source" content="news:comp.lang.javascript"/>
        <meta name="DC.source" content="https://developer.mozilla.org/en/JavaScript"/>
        <meta name="DC.source" content="http://msdn.microsoft.com/en-us/library/hbxc2t98%28VS.85%29.aspx"/>
        <meta name="DC.source" content="http://msdn.microsoft.com/en-us/library/ms533050%28VS.85%29.aspx"/>
        <meta name="DC.rights" content="copyright contributors, comp.lang.javascript"/>
        <link rel="StyleSheet" href="faq.css" type="text/css" media="screen"/>
      </head>
      <body>
        <h1><xsl:value-of select="TITLE"/></h1>
        
        <p>Revision <xsl:value-of select="$revision"/>
           by <a href="{$maintainer_website}"><xsl:value-of select="$maintainer"/></a><br/>
           Based on the <a href="{$previous_url}">comp.lang.javascript FAQ</a>, version <xsl:value-of select="$version"/>
           of <xsl:value-of select="$updated"/>
           by <a href="{$previous_maintainer_website}"><xsl:value-of select="$previous_maintainer"/></a></p>
        
        <ul style="list-style: none; margin-left: 0; padding-left: 0">
          <li><tt><xsl:value-of select="@id" /></tt></li>
          <li><tt>$Id$</tt></li>
        </ul>
        
        <div>
          <ul class="horizontal">
            <li><a
              href="http://PointedEars.de/websvn/log.php?repname=FAQs&amp;path=%2Ftrunk%2Fcljs%2F&amp;isdir=1&amp;showchanges=1"
            >Change&nbsp;log</a></li>
            <li><a
              href="http://PointedEars.de/websvn/listing.php?repname=FAQs&amp;path=%2Ftrunk%2Fcljs%2F"
              title="Subversion repository browser"
            >SVN</a></li>
          </ul>
        </div>
              
        <xsl:variable name="faq_uri">http://PointedEars.de/scripts/faq/cljs/</xsl:variable>
        <p style="clear: left; text-align: left">
          Available online at <a
            href="{$faq_uri}"
          ><xsl:value-of select="$faq_uri"/></a>
        </p>
      
        <hr/>
      
        <h2 id="toc">Table of contents</h2>
      
        <div id="nav"><a href="notes/">FAQ Notes</a></div>
                
        <xsl:apply-templates select="CONTENTS" mode="toc"/>

        <hr/>
      
        <xsl:apply-templates select="CONTENTS"/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="CONTENTS" mode="toc">
    <ul id="faqList"> 
      <xsl:apply-templates select="CONTENT" mode="toc"/>
    </ul>
  </xsl:template>
  
  <xsl:template match="CONTENTS">
    <xsl:apply-templates select="CONTENT"/>
  </xsl:template>
  
  <xsl:template match="CONTENT" mode="toc">
    <li><xsl:value-of select="position()"/>
      <xsl:text> </xsl:text>
      <a href="#{@ID}"><xsl:value-of select="@TITLE"/></a>
      
      <xsl:if test="CONTENT">
        <ul>
          <xsl:apply-templates select="CONTENT" mode="subtoc">
            <xsl:with-param name="section" select="position()" />
          </xsl:apply-templates>
        </ul>
      </xsl:if></li>
  </xsl:template>
  
  <xsl:template match="CONTENT" mode="subtoc">
    <xsl:param name="section"/>
    
    <li><xsl:value-of select="$section"/>.<xsl:value-of select="position()"/>
      <xsl:text> </xsl:text><a href="#{@ID}"><xsl:value-of select="@TITLE"/></a></li>
  </xsl:template>
  
  <xsl:template match="CONTENT">
    <div id="{@ID}" class="section">
      <xsl:element name="h2">
        <xsl:call-template name="getOldId">
          <xsl:with-param name="node" select="."/>
        </xsl:call-template>
        
        <xsl:value-of select="position()"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="@TITLE"/>
      </xsl:element>
      
      <xsl:for-each select="*">
        <xsl:choose>
          <xsl:when test="local-name(.) = 'CONTENT'">
            <xsl:apply-templates select="." mode="subsection">
              <xsl:with-param name="section" select="position()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="."/>
          </xsl:otherwise>
        </xsl:choose>        
      </xsl:for-each>
    </div>
  </xsl:template>
  
  <xsl:template name="getOldId">
    <xsl:param name="node"/>
    <xsl:if test="$node/@NUMID">
      <xsl:attribute name="id">FAQ<xsl:value-of select="$node/@NUMID"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="CONTENT" mode="subsection">
    <xsl:param name="section"/>
  
    <div id="{@ID}" class="section">
      <xsl:element name="h3">
        <xsl:call-template name="getOldId">
          <xsl:with-param name="node" select="."/>
        </xsl:call-template>
        <xsl:value-of select="$section"/>.<xsl:value-of select="position()"/>
          <xsl:text> </xsl:text><xsl:value-of select="@TITLE"/>
      </xsl:element>    
      
      <xsl:apply-templates />
    </div>
  </xsl:template>
  
  <xsl:template match="VER">
    <xsl:value-of select="$version"/>
  </xsl:template>
  
  <xsl:template match="UPDATED">
    <xsl:value-of select="$updated"/>
  </xsl:template>
  
  <xsl:template match="URL">
    <!-- TODO: Link check, see process.wsf -->
    <xsl:element name="a">
      <xsl:variable name="uri" select="text()"/>
      <xsl:attribute name="href"><xsl:value-of select="$uri"/></xsl:attribute>
      <xsl:if test="$checkURLs">
        <xsl:choose>
          <xsl:when test="starts-with($uri, 'http://')">
            <xsl:variable name="response" select="document($url)"/>
            <xsl:if test="not($response) or contains($url, 'microsoft') and contains($response, 'Page Cannot')">
              <xsl:attribute name="class">nolink</xsl:attribute>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="response" select="document(concat('http://www.google.com/search?q=cache:', $url), '/')"/>
            <xsl:choose>
              <xsl:when test="$response">
                <xsl:attribute name="class">cached</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="class">nolink</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:attribute name="class">nolink</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:value-of select="@LINKTEXT|text()"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="NEWSGROUP">
    <a href="news:{.}'"><xsl:value-of select="."/></a>
  </xsl:template>
  
  <xsl:template match="MAILTO">
    <a href="mailto:{.}'"><xsl:value-of select="."/></a>
  </xsl:template>
  
  <xsl:template match="MOREINFO">
    <ul class="linkList">
      <xsl:for-each select="*">
        <li><xsl:apply-templates select="."/></li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="CODE">
    <pre><code><xsl:apply-templates/></code></pre>
  </xsl:template>
  
  <xsl:template match="ICODE">
    <code><xsl:apply-templates /></code>
  </xsl:template>

  <xsl:template match="LIST">
    <xsl:if test="@TITLE">
      <xsl:element name="h4">
        <xsl:if test="@ID">
          <xsl:attribute name="id"><xsl:value-of select="@ID"/></xsl:attribute>
        </xsl:if>
        <xsl:value-of select="@TITLE"/>
      </xsl:element>
    </xsl:if>
 
    <xsl:variable name="type">
      <xsl:choose>
        <xsl:when test="@TYPE"><xsl:value-of select="@TYPE"/></xsl:when>
        <xsl:otherwise>ul</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
        
    <xsl:element name="{$type}">
      <xsl:if test="not(@TITLE) and @ID">
        <xsl:attribute name="id"><xsl:value-of select="@ID"/></xsl:attribute>
      </xsl:if>

      <xsl:for-each select="*">
        <xsl:apply-templates select="."/>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  
  <!-- standard copy template -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template> 
</xsl:stylesheet>