<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.bea.com/wli/sb/context";
(:: import schema at "../../MDW_CDM/EnterpriseObjects/CommonEntities/ValidateDynamic.xsd" ::)

declare variable $namespace as xs:string external;
declare variable $localname_type as xs:string external;
declare variable $schema as xs:string external;

declare function local:func($namespace as xs:string, 
                            $localname_type as xs:string, 
                            $schema as xs:string) 
                            as element() (:: schema-element(ns1:validate) ::) {
<validate xmlns="http://www.bea.com/wli/sb/context">     
<schema>{$schema}</schema>
      <schemaElement>
        <namespaceURI>{$namespace}</namespaceURI>
         <localname>{$localname_type}</localname>
     </schemaElement>
</validate>
};

local:func($namespace, $localname_type, $schema)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../MDW_CDM/EnterpriseObjects/CommonEntities/ValidateDynamic.xsd">
            <con:schema ref="MDW_CDM/EnterpriseObjects/CommonEntities/ValidateDynamic"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>