<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs xhtml"
    version="2.0">

    <xsl:output
        method="text"
        exclude-result-prefixes="xhtml"
    />

    <xsl:variable name="NL" select="'&#x0a;'"/>


    <xsl:template match="/xhtml:html">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="xhtml:body">
        <xsl:apply-templates select="xhtml:div[@class='mainbox']/xhtml:div[@class='box']/xhtml:div[@class='text']/*"/>
    </xsl:template>

    <!-- content -->
    <xsl:template match="xhtml:h2|xhtml:h3">
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:value-of select="$NL"/>
    </xsl:template>
    <xsl:template match="xhtml:div[normalize-space(.) != '']">
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:value-of select="$NL"/>
    </xsl:template>

<!--
    <xsl:template match="xhtml:br">
        <xsl:value-of select="$NL"/>
    </xsl:template>
    <xsl:template match="xhtml:p">
        <xsl:value-of select="."/>
        <xsl:value-of select="$NL"/>
    </xsl:template>
-->

    <!-- default null template -->
    <xsl:template match="@* | node()"/>

</xsl:stylesheet>
