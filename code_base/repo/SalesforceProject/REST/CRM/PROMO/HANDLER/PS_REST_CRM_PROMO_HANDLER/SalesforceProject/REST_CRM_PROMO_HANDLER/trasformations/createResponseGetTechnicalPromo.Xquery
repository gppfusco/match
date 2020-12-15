<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../../MDW_CDM/ApplicationObjects/SALESFORCE/Rest_PromoHandler/PromoHandler.xsd" ::)
declare namespace ns1="http://www.skytv.it/mdw/data";
(:: import schema at "../../../MDW_CDM/EnterpriseServices/SalesforceProject/Rest_PromoHandler/xsd/XSD_CRM_PROMO_HANDLER.xsd" ::)

declare variable $OutputSF as element() (:: schema-element(responseGetTechnicalPromoSF) ::) external;

declare function local:func($OutputSF as element() (:: schema-element(responseGetTechnicalPromoSF) ::)) as element() (:: schema-element(ns1:responseGetTechnicalPromo) ::) {
    <ns1:responseGetTechnicalPromo>
        <ns1:mdwResultCode>{fn:data($OutputSF/resultCode)}</ns1:mdwResultCode>
        <ns1:mdwResultDescription>{fn:data($OutputSF/resultDescription)}</ns1:mdwResultDescription>
        {
            if ($OutputSF/listOfPromotions)
            then <ns1:promoTechList>
                {
                    for $listOfPromotions in $OutputSF/listOfPromotions
                    return 
                    <ns1:promoTech>
                        <ns1:promoTechId>{fn:data($listOfPromotions/idPromoTecn)}</ns1:promoTechId>
                        <ns1:promoTechCode>{fn:data($listOfPromotions/codePromoTecn)}</ns1:promoTechCode>
                        <ns1:promoTechDescription>{fn:data($listOfPromotions/descrPromoTecn)}</ns1:promoTechDescription>
                        <ns1:promoTechName>{fn:data($listOfPromotions/namePromoTecn)}</ns1:promoTechName></ns1:promoTech>
                }</ns1:promoTechList>
            else ()
        }

    </ns1:responseGetTechnicalPromo>
};

local:func($OutputSF)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../../MDW_CDM/ApplicationObjects/SALESFORCE/Rest_PromoHandler/PromoHandler.xsd">
            <con:schema ref="MDW_CDM/ApplicationObjects/SALESFORCE/Rest_PromoHandler/PromoHandler"/>
        </con:importSchema>
        <con:importSchema location="../../../MDW_CDM/EnterpriseServices/SalesforceProject/Rest_PromoHandler/xsd/XSD_CRM_PROMO_HANDLER.xsd">
            <con:schema ref="MDW_CDM/EnterpriseServices/SalesforceProject/Rest_PromoHandler/xsd/XSD_CRM_PROMO_HANDLER"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>