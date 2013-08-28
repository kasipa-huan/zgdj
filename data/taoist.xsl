<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:ct="http://http://www.taoist.org.cn"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs xhtml ct"
    version="2.0">

    <xsl:output
        method="text"
        exclude-result-prefixes="xhtml ct"
    />

    <xsl:variable name="NL" select="'&#x0a;'"/>

<!-- metadata example -->
<table align="center" border="0" cellpadding="0" cellspacing="0" width="1005">
  <tr><!-- row 1 -->
    <td>
      <div class="c11">您现在的位置是：<!-- Your present position is: --><a href="webfront_frontPage.cgi">首页<!-- Home --></a>
        <a href="webfront_showDirList.cgi?dircode=1260000000000000000&amp;targetPage=Fdjxy">《中国道教》杂志<!-- "Chinese Taoist" magazine --></a>
        <a href="webfront_showDirList.cgi?dircode=1260100000000000000&amp;targetPage=Fdjxy2"><!-- Daoist Society Journal (1962-1986) --></a>
        <a href="webfront_showList.cgi?dircode=1260104000000000000&amp;perPageNum=15&amp;targetPage=Fdjxy3">第4期（1964年10月）<!-- No. 4 (October 1964) --></a>
      </div>
    </td>
  </tr>
</table>
<!-- content example -->
<table border="0" height="600" cellpadding="0" cellspacing="0" width="1007" class="c18" align="center">
<!-- fwtable fwsrc="未命名" fwbase="sr.jpg" fwstyle="Dreamweaver" fwdocid = "1344182167" fwnested="1" -->
  <tr><!-- row 1 -->
    <td align="right" valign="top"><!--标题开始--><!-- Title start -->
      <div class="c12">道教知識類編初集 (二續)<!-- Taoist knowledge class series beginning sets (two cont'd) --></div>
      <!-- 副标题 --><!-- Subtitle -->
      <div class="c13"></div>
      <!--标题结束--><!-- Title end -->
      <div class="c14">
        <a name="1" id="1"></a> <img name="sr_r3_c1" src="images/sr_r3_c1.gif" width="293" height="32" border="0" id="sr_r3_c1" alt="" />
      </div>
      <!--图片--><!-- Picture -->
      <!--图片结束--><!-- Picture end -->
      <!-- 作者 --><!-- Author -->
      <div class="c15"></div>
      <div class="c17"><!-- 显示内容 --><!-- Display content -->
        <p class="unnamed1 c16">本會研究室 ...<!-- We will research ... --></p>
        <!-- ... -->
      </div>
      <div class="c17"><!-- 附件 --><!-- Attachment -->
      </div>
    </td>
  </tr>
</table>

    <xsl:template match="/xhtml:html">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="xhtml:body">
        <xsl:apply-templates/>
    </xsl:template>

    <!--
        metadata
    -->

    <!-- translate 
        第4期（1964年10月）
        to common form
        2012年第3期
    -->
    <xsl:key name="nr-issue" match="ct:li" use="@value"/>
    <ct:ol>
        <ct:li value="第1">1962年第1期</ct:li>
        <ct:li value="第2">1963年第1期</ct:li>
        <ct:li value="第3">1963年第2期</ct:li>
        <ct:li value="第4">1964年第1期</ct:li>
        <ct:li value="第5">1980年第1期</ct:li>
        <ct:li value="第6">1980年第2期</ct:li>
        <ct:li value="第7">1981年第1期</ct:li>
        <ct:li value="第8">1981年第2期</ct:li>
        <ct:li value="第9">1982年第1期</ct:li>
        <ct:li value="第10">1982年第2期</ct:li>
        <ct:li value="第11">1983年第1期</ct:li>
        <ct:li value="第12">1983年第2期</ct:li>
        <ct:li value="第13">1984年第1期</ct:li>
        <ct:li value="第14">1984年第2期</ct:li>
        <ct:li value="第15">1984年第3期</ct:li>
        <ct:li value="第16">1985年第1期</ct:li>
        <ct:li value="第17">1985年第2期</ct:li>
        <ct:li value="第18">1986年第1期</ct:li>
        <ct:li value="第19">1986年第2期</ct:li>
        <ct:li value="第20">1986年第3期</ct:li>
    </ct:ol>
    <xsl:variable name="twenty" select="document('')/*/ct:ol"/>
    <xsl:template match="ct:ol">
        <xsl:param name="nr"/>
        <xsl:value-of select="key('nr-issue', $nr)/text()"/>
    </xsl:template>

    <!-- pick issue -->
    <!--
    <xsl:template match="xhtml:table[@align='center' and @width='1005'][xhtml:tr/xhtml:td/xhtml:div/xhtml:a[ends-with(@href, 'Fdjxy2')]]">
        <xsl:variable name="issue-zh">
            <xsl:value-of select="xhtml:tr/xhtml:td/xhtml:div/xhtml:a[position() = last()]"/>
        </xsl:variable>
        <xsl:variable name="issue">
            <xsl:choose>
                <xsl:when test="starts-with($issue-zh, '第')">
                    <xsl:apply-templates select="$twenty">
                        <xsl:with-param name="nr" select="substring-before($issue-zh, '期')"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$issue-zh"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <p>
            <xsl:value-of select="translate($issue, '年第期', ',')"/>
        </p>
    </xsl:template>
    -->

    <!-- content -->
    <xsl:template match="xhtml:table[@height='600' and @width='1007']">
        <xsl:apply-templates/>        
    </xsl:template>
    <xsl:template match="xhtml:tr">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="xhtml:td">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="xhtml:div">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="xhtml:a | xhtml:em | xhtml:span | xhtml:strong">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="xhtml:br">
        <xsl:value-of select="$NL"/>
    </xsl:template>
    <xsl:template match="xhtml:p">
        <xsl:value-of select="."/>
        <xsl:value-of select="$NL"/>
    </xsl:template>

    <!-- default null template -->
    <xsl:template match="@* | node()"/>

</xsl:stylesheet>
