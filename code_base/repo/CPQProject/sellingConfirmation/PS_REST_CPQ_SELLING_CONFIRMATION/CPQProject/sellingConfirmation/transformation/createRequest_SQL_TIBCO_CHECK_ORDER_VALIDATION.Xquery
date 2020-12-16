<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.skytv.it/mdw/data";
(:: import schema at "../../../MDW_CDM/EnterpriseServices/CPQProject/SellingConfirmation/xsd/XSD_CPQ_SELLING_CONFIRMATION.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION";
(:: import schema at "../../Resources/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION_sp.xsd" ::)

declare variable $srcWs as element() (:: schema-element(ns1:requestSellingConfirmation) ::) external;

declare function local:createRequest($srcWs as element() (:: schema-element(ns1:requestSellingConfirmation) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:APPLICATIONORIGIN>{fn:data($srcWs/ns1:order/ns1:subscriptionChannel)}</ns2:APPLICATIONORIGIN>
        <ns2:ORDERNUMBER>{if(fn:contains(fn:data($srcWs/ns1:order/ns1:reason), "TV") or fn:contains(fn:data($srcWs/ns1:order/ns1:reason), "NETFLIX")) then(fn:data($srcWs/ns1:orderNumber)) else()}</ns2:ORDERNUMBER>
        <ns2:ORDERTYPE>{fn:data($srcWs/ns1:order/ns1:type)}</ns2:ORDERTYPE>
        <ns2:ORDERSUBTYPE>{fn:data($srcWs/ns1:order/ns1:subtype)}</ns2:ORDERSUBTYPE>
        <ns2:ORDERNUMBERBB>{if(fn:contains(fn:data($srcWs/ns1:order/ns1:reason), "BB")) then(fn:data($srcWs/ns1:orderNumber)) else()}</ns2:ORDERNUMBERBB>
    </ns2:InputParameters>
};

local:createRequest($srcWs)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../../MDW_CDM/EnterpriseServices/CPQProject/SellingConfirmation/xsd/XSD_CPQ_SELLING_CONFIRMATION.xsd">
            <con:schema ref="MDW_CDM/EnterpriseServices/CPQProject/SellingConfirmation/xsd/XSD_CPQ_SELLING_CONFIRMATION"/>
        </con:importSchema>
        <con:importSchema location="../../Resources/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION_sp.xsd">
            <con:schema ref="CPQProject/Resources/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION_sp"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>