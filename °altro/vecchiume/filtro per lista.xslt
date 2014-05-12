<!--xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  xmlns:my="http://example.com/my"
  exclude-result-prefixes="saxon my"

  version="2.0">



	
<xsl:output name="my:ser" method="xml" omit-xml-declaration="yes"/>
	<xsl:template match="/pubblicazione">
		<pubblicazione>
			<img_copertina><xsl:copy-of select="img_copertina"/></img_copertina>
			
			<titolo><b><xsl:copy-of select="titolo"/></b></titolo>
			<sottotitolo><xsl:copy-of select="sottotitolo"/></sottotitolo>
			<elenco_autori><xsl:copy-of select="elenco_autori"/></elenco_autori>
			
			
		</pubblicazione>
		
	</xsl:template>
	<!--
	<xsl:template match="presentazione">
		<presentazione><xsl:apply-templates/></presentazione>
	</xsl:template>

	<xsl:template match="indice">
		<sottotitolo_impaginato>Contenuti<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
		<indice><xsl:apply-templates/></indice>
	</xsl:template>

	<xsl:template match="autori">
		<xsl:choose>
			<xsl:when test="count(./autore) = 1">
				<sottotitolo_impaginato>Autore<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
			</xsl:when>
			<xsl:otherwise>
				<sottotitolo_impaginato>Autori<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates select="autore"/>
		<xsl:apply-templates select="autori_note"/>
	</xsl:template>

	<xsl:template match="autore">
		<autore><autore_nome><xsl:value-of select="autore_nome"/>. </autore_nome>
		<autore_affiliazione><xsl:value-of select="autore_affiliazione"/></autore_affiliazione>
		<xsl:text>&#xa;</xsl:text></autore>
	</xsl:template>

	<xsl:template match="autori_note">
		<xsl:if test=".!=''">
			  <autore><xsl:apply-templates/></autore>
		</xsl:if>
	</xsl:template>

	<xsl:template match="destinatari">
		<sottotitolo_impaginato>Destinatari<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
		<destinatari><xsl:apply-templates/></destinatari>
	</xsl:template>

	<xsl:template match="sponsor">
		<xsl:choose>
			<xsl:when test=".!='' and contains(.,', ')">
				<sottotitolo_impaginato>Versioni sponsorizzate<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
				<sponsor><xsl:apply-templates/><xsl:text>&#xa;</xsl:text></sponsor>    
			</xsl:when>
			<xsl:when test=".!='' and not(contains(.,', '))">
				<sottotitolo_impaginato>Versione sponsorizzata<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
				<sponsor><xsl:apply-templates/><xsl:text>&#xa;</xsl:text></sponsor>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>  
	</xsl:template>

	<xsl:template match="titoli_alternativi">
		<xsl:if test=".!=''">
			<sottotitolo_impaginato>Titoli tratti da questo libro<xsl:text>&#xa;</xsl:text></sottotitolo_impaginato>
			<titoli_alternativi><xsl:apply-templates/></titoli_alternativi>
		</xsl:if>
	</xsl:template>

	<xsl:template match="recensioni">
		<xsl:if test=".!=''">
		  <filetto><xsl:text>&#xa;</xsl:text></filetto>
		  <recensioni><xsl:apply-templates/></recensioni>
		</xsl:if>
	</xsl:template>

	<xsl:template match="p">
		<p>
			<xsl:apply-templates/><xsl:text>&#xa;</xsl:text>
		</p>
	</xsl:template>

	<xsl:template match="elenco">
		<elenco>
		   <xsl:for-each select="node()">
			  <xsl:if test="local-name(.)='li'">
				  <li><xsl:for-each select="node()">
					<xsl:choose>
					  <xsl:when test="local-name(.)='grassetto'">
						<grassetto><xsl:value-of select="."/></grassetto>
					  </xsl:when>
					  <xsl:when test="local-name(.)='corsivo'">
					   <corsivo><xsl:value-of select="."/></corsivo>
					  </xsl:when>
					  <xsl:otherwise>
						<xsl:value-of select="."/>
					  </xsl:otherwise>
					</xsl:choose>
				  </xsl:for-each></li><xsl:text>&#xa;</xsl:text>
				</xsl:if>
				<xsl:if test="local-name(.)='elenco2'">
				  <elenco2>
					<xsl:for-each select="li">
					  <li><xsl:for-each select="node()">
						<xsl:choose>
						  <xsl:when test="local-name(.)='grassetto'">
							<grassetto><xsl:value-of select="."/></grassetto>
						  </xsl:when>
						  <xsl:when test="local-name(.)='corsivo'">
							<corsivo><xsl:value-of select="."/></corsivo>
						  </xsl:when>
						  <xsl:otherwise>
							<xsl:value-of select="."/>
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:for-each></li><xsl:text>&#xa;</xsl:text>
					</xsl:for-each>
				  </elenco2>
				</xsl:if>
			  </xsl:for-each>
			</elenco>
	</xsl:template>

	<xsl:template match="grassetto">
		<grassetto><xsl:apply-templates/></grassetto>
	</xsl:template>

	<xsl:template match="corsivo">
		<corsivo><xsl:apply-templates/></corsivo>
	</xsl:template>
	
	
	-->

</xsl:stylesheet>