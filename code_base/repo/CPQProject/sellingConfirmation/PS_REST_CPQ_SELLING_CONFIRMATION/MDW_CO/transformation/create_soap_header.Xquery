<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.skytv.it/mdw/data";
(:: import schema at "../../MDW_CDM/EnterpriseObjects/CommonEntities/SoapHeaderSKY.xsd" ::)

declare variable $systemSender as xs:string external;
declare variable $systemTarget as xs:string external;
declare variable $transactionID as xs:string external;
declare variable $messageID as xs:string external;
declare variable $internalTransactionID as xs:string external;
declare variable $timeStamp as xs:string external;
declare variable $StatusCode as xs:string external;
declare variable $StatusMessage as xs:string external;

declare function local:createSoapHeader($systemSender as xs:string, 
                                        $systemTarget as xs:string, 
                                        $transactionID as xs:string, 
                                        $messageID as xs:string, 
                                        $internalTransactionID as xs:string, 
                                        $timeStamp as xs:string, 
                                        $StatusCode as xs:string, 
                                        $StatusMessage as xs:string) 
                                        as element() (:: schema-element(ns1:Header) ::) {
    <ns1:Header>
        <ns1:systemSender>{fn:data($systemSender)}</ns1:systemSender>
        <ns1:systemTarget>{fn:data($systemTarget)}</ns1:systemTarget>
        <ns1:transactionID>{fn:data($transactionID)}</ns1:transactionID>
        <ns1:messageID>{fn:data($messageID)}</ns1:messageID>
        <ns1:internalTransactionID>{fn:data($internalTransactionID)}</ns1:internalTransactionID>
        <ns1:timeStamp>{fn:data($timeStamp)}</ns1:timeStamp>
        {
           if ($StatusCode != '0' ) then
                <ns1:ResponseNotification>
                    <ns1:StatusCode>{fn:data($StatusCode)}</ns1:StatusCode>
                    <ns1:Message>{fn:data($StatusMessage)}</ns1:Message>
                </ns1:ResponseNotification>
            else ()
        }
    </ns1:Header>
};

local:createSoapHeader($systemSender, $systemTarget, $transactionID, $messageID, $internalTransactionID, $timeStamp, $StatusCode, $StatusMessage)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../../MDW_CDM/EnterpriseObjects/CommonEntities/SoapHeaderSKY.xsd">
            <con:schema ref="MDW_CDM/EnterpriseObjects/CommonEntities/SoapHeaderSKY"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>