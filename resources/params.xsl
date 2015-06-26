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
    <xsl:comment>Generated from plugin source, do not edit</xsl:comment>
    <reference id="parameters">
      <title>Ant parameters</title>
      <reference id="all">
        <title>All Ant parameters</title>
        <refbody>
          <section>
            <parml>
              <xsl:for-each select="//transtype/param">
                <xsl:sort select="@name"/>
                <!--xsl:variable name="props" as="xs:string*">
                  <xsl:variable name="params" as="element(param)*">
                    <xsl:apply-templates select=".." mode="inherit"/>
                  </xsl:variable>
                  <xsl:for-each select="$params/../@name">
                    <xsl:sequence select="tokenize(., '\s+')"/>  
                  </xsl:for-each>
                </xsl:variable-->
                <xsl:apply-templates select=".">
                  <!--xsl:with-param name="props" select="string-join(distinct-values($props), ' ')"/-->
                </xsl:apply-templates>
              </xsl:for-each>
            </parml>
          </section>
        </refbody>
      </reference>
      <xsl:apply-templates/>
    </reference>
  </xsl:template>
  
  <xsl:template match="transtype">
    <xsl:variable name="id" select="tokenize(@name, '\s+')[1]"/>
    <xsl:message>Writing <xsl:value-of select="$output-dir.url"/>/ant-parameters-<xsl:value-of select="$id"/>-transformation.dita</xsl:message>
    <xsl:result-document href="{$output-dir.url}/ant-parameters-{$id}-transformation.dita"
                         doctype-public="-//OASIS//DTD DITA Reference//EN"
                         doctype-system="reference.dtd">
      <xsl:comment>Generated from plugin source, do not edit</xsl:comment>
      <reference id="ant-parameters-{$id}-transformation">
        <title>
          <xsl:text>Ant parameters: </xsl:text>
          <xsl:value-of select="@desc"/>
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
              <xsl:variable name="params" as="element(param)*">
                <xsl:sequence select="param"/>
                <!--xsl:apply-templates select="." mode="inherit"/-->
              </xsl:variable>
              <xsl:apply-templates select="$params">
                <xsl:sort select="@name"/>
              </xsl:apply-templates>
            </parml>
          </section>
        </refbody>
      </reference>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template match="transtype" mode="inherit" as="element(param)*">
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
  </xsl:template>

  <xsl:template match="param">
    <xsl:param name="props" select="tokenize(../@name, '\s+')" as="xs:string*"/>
    <plentry id="{@name}">
      <xsl:if test="not($props = 'base')">
        <!--xsl:attribute name="props" select="concat('transtype(', string-join($props, ' '), ')')"/-->
        <xsl:attribute name="props" select="string-join($props, ' ')"/>
      </xsl:if>
      <xsl:if test="@deprecated = 'true'">
        <xsl:attribute name="importance">deprecated</xsl:attribute>
      </xsl:if>
      <xsl:if test="@required = 'true'">
        <xsl:attribute name="importance">required</xsl:attribute>
      </xsl:if>
      <pt>
        <parmname>
          <xsl:value-of select="@name"/>
        </parmname>
      </pt>
      <pd id="{@name}.desc">
        <xsl:value-of select="@desc"/>
        <xsl:choose>
          <xsl:when test="@type = 'enum' and val/@desc">
            <xsl:text> The following values are supported:</xsl:text>
            <ul>
              <xsl:for-each select="val">
                <li>
                  <option>
                    <xsl:value-of select="."/>
                  </option>
                  <xsl:if test="@default = 'true'">
                    <xsl:text> (default)</xsl:text>
                  </xsl:if>
                  <xsl:text> – </xsl:text>
                  <xsl:value-of select="@desc"/>
                </li>
              </xsl:for-each>
            </ul>
          </xsl:when>
          <xsl:when test="@type = 'enum' and val">
            <xsl:text> The allowed values are </xsl:text>
            <xsl:choose>
              <xsl:when test="count(val) gt 2">
                <xsl:for-each select="val">
                  <xsl:if test="position() ne 1">, </xsl:if>
                  <xsl:if test="position() eq last()">and </xsl:if>
                  <option>
                    <xsl:value-of select="."/>
                  </option>
                </xsl:for-each>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="val">
                  <xsl:if test="position() ne 1"> and </xsl:if>
                  <option>
                    <xsl:value-of select="."/>
                  </option>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="val[@default = 'true']">
              <xsl:text>; the default value is </xsl:text>
              <option>
                <xsl:value-of select="val[@default = 'true']"/>
              </option>
            </xsl:if>
            <xsl:text>.</xsl:text>
          </xsl:when>
        </xsl:choose>
      </pd>
    </plentry>
    
  </xsl:template>
</xsl:stylesheet>
