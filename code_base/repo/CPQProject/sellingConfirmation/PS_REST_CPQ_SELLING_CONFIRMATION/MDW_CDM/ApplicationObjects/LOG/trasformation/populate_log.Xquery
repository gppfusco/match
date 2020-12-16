<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.skytv.it/mdw/internal";
(:: import schema at "../xsd/logmessage.xsd" ::)

declare namespace skyfunc = "http://www.sky.it/mdw/osb";


declare variable $timeStamp as xs:string external;
declare variable $tid as xs:string external;
declare variable $severity as xs:string external;
declare variable $pipeline as xs:string external;
declare variable $proxy as xs:string external;
declare variable $sourceSystem as xs:string external;
declare variable $clientRequestID as xs:string external;
declare variable $targetSystem as xs:string external;
declare variable $error_code as xs:string external;
declare variable $description as xs:string external;
declare variable $businessID as xs:string external;
declare variable $header_http as element() external;
declare variable $payLoad as element() external;
declare variable $soapHeader as element() external;
declare variable $executionTime as xs:string external;


declare function local:func($timeStamp as xs:string,$tid as xs:string,$severity as xs:string,
$pipeline as xs:string,$proxy as xs:string,$sourceSystem as xs:string,$clientRequestID as xs:string,
$targetSystem as xs:string,$error_code as xs:string,
$description as xs:string,$businessID as xs:string, $header_http as element(),$payLoad as element(),$soapHeader as element(), $executionTime as xs:string ) 
as element() (:: schema-element(ns1:LogInstance) ::) 
{

 let $maxLengthForLog:= 1048576
 let $payloadString:= fn-bea:serialize($payLoad)
 let $payloadLength := fn:string-length($payloadString)
 let $soapHeaderString:= fn-bea:serialize($soapHeader)
 let $soapHeaderLength := fn:string-length($soapHeaderString)
 
return
    <ns1:LogInstance>
        <ns1:timeStamp>{fn:data($timeStamp)}</ns1:timeStamp> 
        <ns1:tid>{fn:data($tid)}</ns1:tid>
        <ns1:severity>{fn:data($severity)}</ns1:severity>
        <ns1:pipeline>{fn:data($pipeline)}</ns1:pipeline>
        <ns1:proxy>{local:substring-after-last(fn:concat('$',fn:data($proxy)), '$')}</ns1:proxy>
        <ns1:sourceSystem>{fn:data($sourceSystem)}</ns1:sourceSystem>
        <ns1:clientRequestID>{fn:data($clientRequestID)}</ns1:clientRequestID>
        <ns1:targetSystem>{fn:data($targetSystem)}</ns1:targetSystem>
        <ns1:executionTime>{fn:data($executionTime)}</ns1:executionTime>
        <ns1:description>{fn:data($description)}</ns1:description>
        <ns1:error_code>{fn:data($error_code)}</ns1:error_code>
        <ns1:header_http>{$header_http}</ns1:header_http>
        <ns1:hostname>{skyfunc:getHostname()}</ns1:hostname>
        {  
        if(xs:integer($payloadLength)>xs:integer($maxLengthForLog))
          then
        <ns1:payLoad>
                {fn:substring($payloadString,0,xs:integer($maxLengthForLog))}
         </ns1:payLoad>
        else
         <ns1:payLoad>{$payLoad}</ns1:payLoad>
        }
        
         {  
        if(xs:integer($soapHeaderLength)>xs:integer($maxLengthForLog))
        then
          <ns1:soapHeader>{fn:substring($soapHeaderString,0,xs:integer($maxLengthForLog))}</ns1:soapHeader>
        else
       <ns1:soapHeader>{$soapHeader}</ns1:soapHeader>
        }
    </ns1:LogInstance>
    
};

declare function local:substring-after-last
  ( $arg as xs:string? ,
    $delim as xs:string )  as xs:string {

   replace ($arg,concat('^.*',local:escape-for-regex($delim)),'')
 } ;
 
declare function local:escape-for-regex
  ( $arg as xs:string? )  as xs:string {

   replace($arg,
           '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))','\\$1')
 } ;

local:func($timeStamp,
$tid,
$severity,
$pipeline,
$proxy,
$sourceSystem,
$clientRequestID,
$targetSystem,
$error_code,
$description,
$businessID,
$header_http,
$payLoad,
$soapHeader, $executionTime)]]></con:xquery>
    <con:dependencies>
        <con:importSchema location="../xsd/logmessage.xsd">
            <con:schema ref="MDW_CDM/ApplicationObjects/LOG/xsd/logmessage"/>
        </con:importSchema>
    </con:dependencies>
</con:xqueryEntry>