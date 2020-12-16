<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.skytv.it/mdw/data";
(:: import schema at "../../MDW_CDM/EnterpriseObjects/CommonEntities/errorInfos.xsd" ::)

declare variable $faultCode as xs:string external;
declare variable $httpResponseCode as xs:string external;
declare variable $faultDescription as xs:string external;

declare function local:func($faultCode as xs:string, 
                            $httpResponseCode as xs:string,
                            $faultDescription as xs:string) 
                            as element() (:: schema-element(ns1:errorInfos) ::) {
    <ns1:errorInfos>
        <ns1:httpResponseCode>{fn:data($httpResponseCode)}</ns1:httpResponseCode>
        <ns1:faultCode>{fn:data($faultCode)}</ns1:faultCode>
        <ns1:faultDescription>{fn:data($faultDescription)}</ns1:faultDescription>
    </ns1:errorInfos>
};

local:func($faultCode, $httpResponseCode, $faultDescription)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../MDW_CDM/EnterpriseObjects/CommonEntities/errorInfos.xsd">
            <con:schema ref="MDW_CDM/EnterpriseObjects/CommonEntities/errorInfos"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>