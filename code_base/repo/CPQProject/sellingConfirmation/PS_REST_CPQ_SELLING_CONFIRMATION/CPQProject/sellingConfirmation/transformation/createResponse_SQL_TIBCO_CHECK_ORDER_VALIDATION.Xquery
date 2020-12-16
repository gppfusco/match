<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION";
(:: import schema at "../../Resources/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION_sp.xsd" ::)

declare variable $BSOut as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:createResponse($BSOut as element() (:: schema-element(ns1:OutputParameters) ::)) as element(){
    <root>
      <result>{if(upper-case(fn:data($BSOut/ns1:RESULT)) = 'OK' ) then '0' else '-1' }</result>
      <description>{fn:data($BSOut/ns1:RESULTDESCRIPTION)}</description>
    </root>
};

local:createResponse($BSOut)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../Resources/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION_sp.xsd">
            <con:schema ref="CPQProject/Resources/BS_SQL_TIBCO_CHECK_ORDER_VALIDATION_sp"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>