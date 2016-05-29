<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  
  <xsl:output doctype-public="-//OASIS//DTD DITA Reference//EN"
    doctype-system="reference.dtd"/>
  
  <xsl:strip-space elements="*"/>
  
  <xsl:param name="output-dir.url"/>
  
  <xsl:template match="/">
    <xsl:call-template name="all"/>
    <xsl:call-template name="separate"/>
  </xsl:template>
  
  <xsl:template name="all">
    <xsl:comment> Generated from plugin source, do not edit! </xsl:comment>
    <reference id="all-extension-points">
      <title id="title" outputclass="generated">All DITA-OT extension points</title>
      <titlealts>
        <navtitle>All extension points</navtitle>
      </titlealts>
      <shortdesc id="shortdesc">The pre-defined extension points can be used to extend the functionality of the
        DITA-OT.</shortdesc>
        <refbody>
          <section>
            <parml>
              <xsl:apply-templates select="//extension-point">
                <xsl:sort select="@name"/>
              </xsl:apply-templates>
            </parml>
          </section>
        </refbody>
    </reference>
  </xsl:template>
  
  <xsl:template name="separate">
    <!--xsl:for-each select="//transtype/param"-->
    <xsl:for-each select="//plugin">
      <xsl:variable name="id" select="@id"/>
      <xsl:message>Writing <xsl:value-of select="$output-dir.url"/>extension-point-<xsl:value-of select="$id"/>.dita</xsl:message>
      <xsl:result-document href="{$output-dir.url}/extension-point-{$id}.dita"
        doctype-public="-//OASIS//DTD DITA Reference//EN"
        doctype-system="reference.dtd">
        <xsl:comment> Generated from plugin source, do not edit! </xsl:comment>
        <reference id="{$id}-extension-points">
          <title outputclass="generated">
            <xsl:value-of select="@id"/>
            <xsl:text> extension points</xsl:text>
          </title>
          <titlealts>
            <navtitle>
              <xsl:value-of select="@desc"/>
            </navtitle>
          </titlealts>
          <shortdesc id="shortdesc"/>
          <refbody>
            <section>
              <parml>
                <xsl:apply-templates select="extension-point">
                  <xsl:sort select="@id"/>
                </xsl:apply-templates>                  
              </parml>
            </section>
          </refbody>
        </reference>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  
  <!--xsl:template match="transtype" mode="inherit" as="element(param)*">
    <xsl:sequence select="param"/>
    <xsl:variable name="extends" as="xs:string?">
      <xsl:choose>
        <xsl:when test="@name = 'base'"/>
        <xsl:when test="@extends">
          <xsl:value-of select="@extends"/>
        </xsl:when>
        <xsl:otherwise>base</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="exists($extends)">
      <xsl:apply-templates select="//transtype[tokenize(@name, '\s+') = $extends]" mode="inherit"/>
    </xsl:if>
  </xsl:template-->
  
  <xsl:template match="extension-point">
    <plentry id="{@id}">
      <xsl:if test="@deprecated = 'true'">
        <xsl:attribute name="importance">deprecated</xsl:attribute>
      </xsl:if>
      <xsl:if test="@required = 'true'">
        <xsl:attribute name="importance">required</xsl:attribute>
      </xsl:if>
      <pt>
        <parmname>
          <xsl:value-of select="@id"/>
        </parmname>
      </pt>
      <pd id="{@id}.desc">
        <xsl:value-of select="@name"/>
      </pd>
    </plentry>
  </xsl:template>
  
</xsl:stylesheet>
