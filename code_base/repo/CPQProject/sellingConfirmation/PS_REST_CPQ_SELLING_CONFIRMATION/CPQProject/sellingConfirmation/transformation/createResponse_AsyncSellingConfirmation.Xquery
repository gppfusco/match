<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.skytv.it/mdw/data";
(:: import schema at "../../../MDW_CDM/EnterpriseServices/CPQProject/SellingConfirmation/xsd/XSD_CPQ_SELLING_CONFIRMATION.xsd" ::)

declare variable $esito as xs:string external;
declare variable $descrizioneEsito as xs:string external;
declare variable $tid as xs:string external;
declare variable $rootNodeName as xs:string external;

declare function local:func($esito as xs:string, 
                                            $descrizioneEsito as xs:string, 
                                            $tid as xs:string, 
                                            $rootNodeName as xs:string) as element() (:: schema-element(ns1:responseSellingConfirmation) ::) {
    <ns1:responseSellingConfirmation>
        <ns1:resultCode>{$esito}</ns1:resultCode>
        <ns1:resultDescription>{$descrizioneEsito}</ns1:resultDescription>
        <ns1:transactionId>{$tid}</ns1:transactionId>
        {if($rootNodeName = '') then '' else ''}
    </ns1:responseSellingConfirmation>
};

local:func($esito, $descrizioneEsito, $tid, $rootNodeName)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../../MDW_CDM/EnterpriseServices/CPQProject/SellingConfirmation/xsd/XSD_CPQ_SELLING_CONFIRMATION.xsd">
            <con:schema ref="MDW_CDM/EnterpriseServices/CPQProject/SellingConfirmation/xsd/XSD_CPQ_SELLING_CONFIRMATION"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>