<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="delivery.xml" -->
<!DOCTYPE xsl:stylesheet  [
    <!ENTITY nbsp   "&#160;">
    <!ENTITY copy   "&#169;">
    <!ENTITY reg    "&#174;">
    <!ENTITY trade  "&#8482;">
    <!ENTITY mdash  "&#8212;">
    <!ENTITY ldquo  "&#8220;">
    <!ENTITY rdquo  "&#8221;"> 
    <!ENTITY pound  "&#163;">
    <!ENTITY yen    "&#165;">
    <!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-

system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Delivery Summary</title>
    </head>
    <body>
    <h2 style="margin: 25px 0px -20px 30px; color: #003399;">Delivery Summary</h2>
    <table style="margin: 25px; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align:left; font-size:12px; 

border-collapse:collapse">
      <thead>
        <tr>
          <th width="165" height="30" scope="col" style="background: #b9c9fe url('left.png') left -1px no-repeat; color: #003399; 

padding: 8px;">Type</th>
          <th width="209"  scope="col" style="background: #b9c9fe; color: #003399; padding: 8px;">% of Attempted to Deliver</th>
          <th width="90" scope="col" style="background: #b9c9fe url('right.png') right -1px no-repeat; padding: 8px; color: 

#003399;">Total</th>
        </tr>
      </thead>
      <tfoot>
      </tfoot>
      <tbody>
        <xsl:for-each select="DELIVERY/SUMMARY">
          <tr>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="TITLE"/></td>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="ATTEMPTED"/></td>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="TOTAL"/></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    <h2 style="margin: 25px 0px -20px 30px; color: #003399;">Activity Summary</h2>
    <table style="margin: 25px; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align:left; font-size:12px; 

border-collapse:collapse">
      <thead>
        <tr>
          <th width="165" height="30" scope="col" style="background: #b9c9fe url('left.png') left -1px no-repeat; color: #003399; 

padding: 8px;">Type</th>
          <th width="209"  scope="col" style="background: #b9c9fe; color: #003399; padding: 8px;">% of Successfully Delivered</th>
          <th width="90" scope="col" style="background: #b9c9fe url('right.png') right -1px no-repeat; padding: 8px; color: 

#003399;">Total</th>
        </tr>
      </thead>
      <tfoot>
      </tfoot>
      <tbody>
         <xsl:for-each select="document('activity.xml')/ACTIVITY/SUMMARY">
          <tr>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="TITLE"/></td>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="ATTEMPTED"/></td>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="TOTAL"/></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
        <h2 style="margin: 25px 0px -20px 30px; color: #003399;">Click Through Report</h2>
    <table style="margin: 25px; font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif; text-align:left; font-size:12px; 

border-collapse:collapse">
      <thead>
        <tr>
          <th width="165" height="30" scope="col" style="background: #b9c9fe url('left.png') left -1px no-repeat; color: #003399; 

padding: 8px;">Type</th>
          <th width="209"  scope="col" style="background: #b9c9fe; color: #003399; padding: 8px;">% of Successfully Delivered</th>
          <th width="90" scope="col" style="background: #b9c9fe url('right.png') right -1px no-repeat; padding: 8px; color: 

#003399;">Total</th>
        </tr>
      </thead>
      <tfoot>
      </tfoot>
      <tbody>
         <xsl:for-each select="document('click_through.xml')/ACTIVITY/SUMMARY">
          <tr>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="URL"/></td>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="UNIQUE"/></td>
            <td style="background: #e8edff; color: #003399; padding: 8px; border-top: 1px solid #fff;"><xsl:value-of 

select="TOTAL"/></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>