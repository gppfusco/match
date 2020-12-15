<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://impl.ejb3.partner.eai.salesforce.sky.it/";
(:: import schema at "../../../MDW_CDM/ApplicationObjects/SALESFORCE/ejb_mdw/xsd1.xsd" ::)
declare namespace ns1="http://www.skytv.it/mdw/data";
(:: import schema at "../../../MDW_CDM/EnterpriseServices/SalesforceProject/Rest_PromoHandler/xsd/XSD_CRM_PROMO_HANDLER.xsd" ::)

declare namespace dat = "http://mdw.it/data";
 
declare variable $tid as xs:string external;
declare variable $contextPath as xs:string external;
declare variable $InputXML as element() (:: schema-element(ns1:requestGetTechnicalPromo) ::) external;

declare function local:func($tid as xs:string, 
                            $contextPath as xs:string, 
                            $InputXML as element() (:: schema-element(ns1:requestGetTechnicalPromo) ::)) 
                            as element() (:: schema-element(ns2:execute_rest) ::) {
    <ns2:execute_rest>
        <dat:uri>{concat($contextPath,'?','codPromo=',$InputXML/*:promoCode/text(),'&#38;promoId=',$InputXML/*:promoId/text())}</dat:uri>
        <dat:modeHttp>GET</dat:modeHttp>
        <dat:dataType>XML</dat:dataType>
        <dat:rootName>responseGetTechnicalPromoSF</dat:rootName>
        <dat:isCustomService>true</dat:isCustomService>
        <dat:TID>{$tid}</dat:TID>
    </ns2:execute_rest>
};

local:func($tid, $contextPath, $InputXML)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../../MDW_CDM/ApplicationObjects/SALESFORCE/ejb_mdw/xsd1.xsd">
            <con:schema ref="MDW_CDM/ApplicationObjects/SALESFORCE/ejb_mdw/xsd1"/>
        </con:importSchema>
        <con:importSchema location="../../../MDW_CDM/EnterpriseServices/SalesforceProject/Rest_PromoHandler/xsd/XSD_CRM_PROMO_HANDLER.xsd">
            <con:schema ref="MDW_CDM/EnterpriseServices/SalesforceProject/Rest_PromoHandler/xsd/XSD_CRM_PROMO_HANDLER"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>