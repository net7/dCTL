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
 <xsl:key name="groupByDiv" match="*" use="str:split(@rend, '◊')[2]" />
 <xsl:key name="groupByContext" match="*"
  use="concat(str:split(@rend, '◊')[1], '◊', str:split(@rend, '◊')[2], '◊', str:split(@rend, '◊')[3])" />
 <xsl:template match="/">
  <div class="widget">
   <!--  <div class="widget_head"> Trovati <xsl:value-of select="count(*/*)" /> risultati... </div>
-->
   <div class="widget_body">
    <ul class="collapsible">
     <xsl:for-each
      select="/*/*[count(. | key('groupByDiv', str:split(@rend, $distinctSep)[2])[1]) = 1]">
      <li>
       <xsl:variable name="key1" select="str:split(@rend, $distinctSep)[2]" />
       <a class="collapsible_handle2" title="{$tooltip_toggle}"><xsl:value-of select="$key1"
         />&#160;</a>
       <ul class="collapsible_body">
        <xsl:for-each
         select="/*/*[count(. | key('groupByContext', concat(str:split(@rend, $distinctSep)[2], $distinctSep, str:split(@rend, $distinctSep)[3]))[1]) = 1][str:split(@rend, $distinctSep)[2] = $key1]">
         <li class="widget_box">
          <xsl:variable name="key3" select="str:split(@rend, $distinctSep)[3]" />
          <xsl:variable name="doc" select="str:split(@ref, $distinctSep)[1]" />
          <xsl:variable name="block" select="str:split(@ref, $distinctSep)[2]" />
          <xsl:variable name="at" select="str:split(@ref, $distinctSep)[3]" />
          <xsl:variable name="high" select="str:split(@ref, $distinctSep)[4]" />
          <xsl:variable name="link">$().mastro('display', '<xsl:value-of select="$doc"
             />','','','<xsl:value-of select="$block" />','<xsl:value-of select="$at"
             />','<xsl:value-of select="$high" />');</xsl:variable>
          <div class="widget_index">
           <xsl:value-of select="position()" />
          </div>
          <xsl:if test=".//tei:figure/tei:graphic">
           <div class="widget_image">
            <xsl:apply-templates select=".//tei:figure" mode="widget_box" />
           </div>
          </xsl:if>
          <!--          <div class="widget_icon">
            <xsl:value-of select="str:split(@ref, $distinctSep)[5]" />
            <xsl:if test="str:split(@ref, $distinctSep)[6]">
             <xsl:text> , </xsl:text>
             <xsl:value-of select="str:split(@ref, $distinctSep)[6]" />
            </xsl:if>
           </div>
 -->
          <div class="widget_text">
           <div class="widget_title">
            <a href="javascript:void(0)" onclick="{$link}" title="{$tooltip_goto}">
             <xsl:choose>
              <xsl:when test="normalize-space(./*/dctl:desc) != ''">
               <xsl:call-template name="formatRetrieveData">
                <xsl:with-param name="data" select="./*/dctl:desc" />
               </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
               <xsl:call-template name="formatRetrieveData">
                <xsl:with-param name="data" select=".//dctl:desc" />
               </xsl:call-template>
              </xsl:otherwise>
             </xsl:choose>
            </a>
           </div>
           <!--            <xsl:value-of select="$key3" />
  -->
          </div>
         </li>
        </xsl:for-each>
       </ul>
      </li>
     </xsl:for-each>
    </ul>
   </div>
  </div>
 </xsl:template>
 <!-- - - - - - - - - - - - - - - - -->
</xsl:stylesheet>
