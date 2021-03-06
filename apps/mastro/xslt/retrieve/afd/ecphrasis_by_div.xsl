<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
 xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:dctl="http://www.ctl.sns.it/ns/1.0"
 xmlns:php="http://php.net/xsl" xmlns:exslt="http://exslt.org/common"
 xmlns:dyn="http://exslt.org/dynamic" xmlns:str="http://exslt.org/strings"
 extension-element-prefixes="tei dctl php exslt dyn str">
 <!-- - - - - - - - - - - - - - - - -->
 <xsl:import href="../../mastro.xsl" />
 <!-- - - - - - - - - - - - - - - - -->
 <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="yes" />
 <xsl:strip-space elements="*" />
 <!-- - - - - - - - - - - - - - - - -->
 <xsl:variable name="length" select="80" />
 <!-- - - - - - - - - - - - - - - - -->
 <!-- ROOT :: SPECIFIC FOR PACKAGE  -->
 <!-- - - - - - - - - - - - - - - - -->
 <xsl:template match="/">
  <div class="widget">
   <!--  <div class="widget_head">
    <xsl:value-of
     select="php:function('dctl_putRefs', string(*/*/@rend), $distinctSep, string($doc), $where, 2)"
     />
   </div>
-->
   <div class="widget_body">
    <ul>
     <xsl:for-each select="*/*">
      <li class="widget_box">
       <xsl:variable name="key3" select="str:split(@rend, $distinctSep)[3]" />
       <xsl:variable name="doc" select="str:split(@ref, $distinctSep)[1]" />
       <xsl:variable name="block" select="str:split(@ref, $distinctSep)[2]" />
       <xsl:variable name="at" select="str:split(@ref, $distinctSep)[3]" />
       <xsl:variable name="high" select="str:split(@ref, $distinctSep)[4]" />
       <xsl:variable name="label" select="''" />
       <xsl:variable name="terms" select="'_high_'" />
       <xsl:variable name="link">$().mastro('display', '<xsl:value-of select="$doc"
          />','','','<xsl:value-of select="$block" />','<xsl:value-of select="$at"
          />','<xsl:value-of select="$high" />','<xsl:value-of select="$label" />','<xsl:value-of
         select="$terms" />');</xsl:variable>
       <div class="widget_index">
        <xsl:value-of select="position()" />
       </div>
       <!--       <div class="widget_image">
         <xsl:apply-templates select=".//tei:figure" mode="widget_box" />
         </div>
 -->
       <!--     <div class="widget_icon" />
  -->
       <div class="widget_text">
        <div class="widget_title">
         <a href="javascript:void(0);" title="{$tooltip_goto}" onclick="{$link}">
          <!--         <xsl:value-of select="substring-after(str:split(@rend, $distinctSep)[2], 'Canto ')" />
          -->
          <xsl:choose>
           <xsl:when test="substring-before(@rend, $distinctSep) != ''">
            <xsl:value-of select="str:split(@rend, $distinctSep)[1]" />
            <xsl:text>, </xsl:text>
            <xsl:value-of select="str:split(@rend, $distinctSep)[2]" />
            <xsl:text>, </xsl:text>
            <xsl:value-of select="str:split(@rend, $distinctSep)[3]" />
           </xsl:when>
           <xsl:otherwise>
            <xsl:value-of select="@rend" />
           </xsl:otherwise>
          </xsl:choose>&#160;</a>
        </div>
        <div class="widget_detail">
         <a href="javascript:void(0);" title="{$tooltip_goto}" onclick="{$link}">
          <xsl:call-template name="formatRetrieveData">
           <xsl:with-param name="data" select="." />
          </xsl:call-template>
         </a>
        </div>
       </div>
      </li>
     </xsl:for-each>
    </ul>
   </div>
  </div>
 </xsl:template>
 <!-- - - - - - - - - - - - - - - - -->
</xsl:stylesheet>
