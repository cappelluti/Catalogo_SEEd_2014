<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/pubblicazione">
		<pubblicazione>
			<xsl:copy-of select="img_copertina"/>
			<xsl:copy-of select="titolo"/>
			<xsl:copy-of select="sottotitolo"/>
			<xsl:copy-of select="titolo_ing"/>
			<xsl:copy-of select="sottotitolo_ing"/>
			<xsl:copy-of select="elenco_autori"/>
			<xsl:copy-of select="id_web"/>
			<xsl:copy-of select="formato"/>
			<xsl:copy-of select="n_pagine"/>
			<xsl:copy-of select="data_pubblicazione"/>
			<xsl:copy-of select="data_pubblicazione_ing"/>
			<xsl:copy-of select="ISBN"/>
			<xsl:copy-of select="ISBN_ebook"/>
			<xsl:copy-of select="costo"/>
			<xsl:copy-of select="costo_ebook"/>
			<xsl:copy-of select="note"/>
			<xsl:copy-of select="note_ing"/>			
			<xsl:copy-of select="presentazione"/>
			<xsl:copy-of select="presentazione_ing"/>			
			<xsl:copy-of select="destinatari"/>
			<xsl:copy-of select="destinatari_ing"/>			
			<xsl:copy-of select="indice"/>	
			<xsl:copy-of select="autori"/>		
		</pubblicazione>
	</xsl:template>
</xsl:stylesheet>