
!********************************************************************************
ckXML                                       CLASS, TYPE, MODULE('ckXML.clw'),LINK('ckXML.clw')   
!********************************************************************************

!Equates

!NodeObj                                     STRING(20)
!ChildObj                                    STRING(20) 


!********************************************************************************
!Properties
!********************************************************************************
XMLContainer                                 LONG,NAME('CtrlFeq')

Cdata                                        Long  
Content                                      ANY
ContentInt                                   Long
DebugLogFilePath                             String(1024)
DocType                                      String(1024)
EmitBom                                      Long
EmitXmlDecl                                  Long 
Encoding                                     String(1024)
LastErrorHtml                                String(1024) !Read-only
LastErrorText                                String(1024) !Read-only
LastErrorXml                                 String(1024) !Read-only
NumAttributes                                Long         !Read-only
NumChildren                                  Long         !Read-only
SortCaseInsensitive                          Long
Standalone                                   Long
Tag                                          String(1024)
TreeId                                       Long         !Read-only
VerboseLogging                               Long  
Version                                      String(12)   !Read-only

!************************************************************************************************
!METHODS
!************************************************************************************************
Construct                                    PROCEDURE()
Destruct                                     PROCEDURE()
Init                                         PROCEDURE(LONG pControl)
Kill                                         PROCEDURE()
Test                                         PROCEDURE(<STRING pText>)
AssignContainer                              PROCEDURE(SIGNED pControl,<BYTE pDebug>)   

!Chilkat xml Methods ***********************************
AccumulateTagContent                         PROCEDURE(STRING pTAG,STRING pSkipTags),STRING
AddAttribute                                 PROCEDURE(STRING pAttribute,STRING pValue,<STRING pNodeObject>),LONG,PROC
AddAttributeInt                              PROCEDURE(STRING pAttribute,LONG pValue,<STRING pNodeObject>),LONG,PROC
AddChildTree                                 PROCEDURE(STRING pTreeObject,<STRING pNodeObject>),LONG,PROC
AddOrUpdateAttribute                         PROCEDURE(STRING pAttribute,STRING pValue)
AddOrUpdateAttributeI                        PROCEDURE(STRING pAttribute,STRING pValue)
AddStyleSheet                                PROCEDURE(STRING pStyleSheet)
AddToAttribute                               PROCEDURE(STRING pAttribute,LONG pValue)
AddToChildContent                            PROCEDURE(STRING pAttribute,LONG pValue,<STRING pNodeObject>)
AddToContent                                 PROCEDURE(LONG pValue,<STRING pNodeObject>)
AppendToContent                              PROCEDURE(LONG pValue,<STRING pNodeObject>),LONG
BEncodeContent                               PROCEDURE(STRING pAttribute,STRING PData,<STRING pNodeObject>),LONG
ChildContentMatches                          PROCEDURE(STRING pAttribute,STRING pPattern, LONG pCase,<STRING pNodeObject>),LONG
ChilkatPath                                  PROCEDURE(STRING pPath),STRING
ClearXML                                     PROCEDURE(<STRING pNodeObject>)
ContentMatches                               PROCEDURE(STRING pPattern,LONG pCase,<STRING pNodeObject>),LONG
Copy                                         PROCEDURE(STRING pCopyFromNode,<STRING pCallingNodeObject>)
CopyRef                                      PROCEDURE(STRING pCopyFromNode,<STRING pCallingNodeObject>) 
DecodeContent                                PROCEDURE()
DecodeEntities                               PROCEDURE(STRING pAttribute),STRING
DecryptContent                               PROCEDURE(STRING pPassword,<STRING pNodeObject>)
EncryptContent                               PROCEDURE(STRING pPassword,<STRING pNodeObject>),LONG,PROC
ExtractChildByIndex                          PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
ExtractChildByName                           PROCEDURE(STRING pTag,STRING pAttribute,STRING pValue,<STRING pNodeObject>),STRING
FindChild                                    PROCEDURE(STRING pTag,<STRING pNodeObject>),STRING
FindChild2                                   PROCEDURE(STRING pTag,<STRING pNodeObject>),LONG,PROC
FindNextRecord                               PROCEDURE(STRING pTag,STRING pPattern,<STRING pNodeObject>),STRING
FindOrAddNewChild                            PROCEDURE(STRING pTag,<STRING pNodeObject>),STRING
FirstChild                                   PROCEDURE(<STRING pNodeObject>),STRING
FirstChild2                                  PROCEDURE(<STRING pNodeObject>),LONG,PROC
GetAttrValue                                 PROCEDURE(STRING pAttribute,<STRING pNodeObject>),STRING
GetAttrValueInt                              PROCEDURE(STRING pAttribute,<STRING pNodeObject>),LONG,PROC
GetAttributeName                             PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
GetAttributeValue                            PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
GetAttributeValueInt                         PROCEDURE(LONG pIndex,<STRING pNodeObject>),LONG
GetBinaryContent                             PROCEDURE(LONG pUnzipFlag, LONG pDecryptFlag, STRING pPassword),STRING
GetChild                                     PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
GetChild2                                    PROCEDURE(LONG pIndex,<STRING pNodeObject>),LONG,PROC
GetChildBoolValue                            PROCEDURE(STRING pTAG,<STRING pNodeObject>),LONG 
GetChildContent                              PROCEDURE(STRING pTAG,<STRING pNodeObject>),STRING
GetChildContentByIndex                       PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
GetChildExact                                PROCEDURE(STRING pTag,STRING pContent,<STRING pNodeObject>),STRING
GetChildIntValue                             PROCEDURE(STRING pTag,<STRING pNodeObject>),LONG 
GetChildTag                                  PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
GetChildTagByIndex                           PROCEDURE(LONG pIndex,<STRING pNodeObject>),STRING
GetChildWithAttr                             PROCEDURE(STRING pTag,STRING pAttribute,STRING pValue,<STRING pNodeObject>),STRING
GetChildWithContent                          PROCEDURE(STRING pContent,<STRING pNodeObject>),STRING
GetChildWithTag                              PROCEDURE(STRING pTag,<STRING pNodeObject>),STRING
GetNthChildWithTag                           PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>),STRING
GetNthChildWithTag2                          PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>),LONG
GetParent                                    PROCEDURE(<STRING pNodeObject>),STRING
GetParent2                                   PROCEDURE(<STRING pNodeObject>),LONG,PROC
GetRoot                                      PROCEDURE(),STRING,PROC
GetRoot2                                     PROCEDURE()
GetSelf                                      PROCEDURE(),STRING
GetXml                                       PROCEDURE(),STRING

HasAttrWithValue                             PROCEDURE(STRING pAttribute,STRING pValue,<STRING pNodeObject>),LONG
HasAttribute                                 PROCEDURE(STRING pAttribute,<STRING pNodeObject>),LONG
HasChildWithContent                          PROCEDURE(STRING pContent,<STRING pNodeObject>),LONG
HasChildWithTag                              PROCEDURE(STRING pTag,<STRING pNodeObject>),LONG
HasChildWithTagAndContent                    PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>),LONG
InsertChildTreeAfter                         PROCEDURE(LONG pIndex,STRING pTreeObject,<STRING pNodeObject>)
InsertChildTreeBefore                        PROCEDURE(LONG pIndex,STRING pTreeObject,<STRING pNodeObject>)
LastChild                                    PROCEDURE(<STRING pNodeObject>),STRING  
LastChild2                                   PROCEDURE(<STRING pNodeObject>),LONG

LoadXml                                      PROCEDURE(STRING pXMLString),LONG,PROC
LoadXml2                                     PROCEDURE(STRING pXMLString,LONG pAutoTrim),LONG
LoadXmlFile                                  PROCEDURE(STRING pFileName),LONG
LoadXmlFile2                                 PROCEDURE(STRING pFileName,LONG pAutoTrim),LONG
NewChild                                     PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>),STRING
NewChild2                                    PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)
NewChildAfter                                PROCEDURE(LONG pIndex,STRING pTag,STRING pContent,<STRING pNodeObject>),STRING
NewChildBefore                               PROCEDURE(LONG pIndex,STRING pTag,STRING pContent,<STRING pNodeObject>),STRING
NewChildInt2                                 PROCEDURE(STRING pTag,LONG pValue,<STRING pNodeObject>)
NextSibling                                  PROCEDURE(<STRING pNodeObject>),STRING
NextSibling2                                 PROCEDURE(<STRING pNodeObject>),LONG
NumChildrenHavingTag                         PROCEDURE(STRING pTag,<STRING pNodeObject>),LONG
PreviousSibling                              PROCEDURE(<STRING pNodeObject>),STRING
PreviousSibling2                             PROCEDURE(<STRING pNodeObject>),LONG
QEncodeContent                               PROCEDURE(STRING pCharset,STRING pInData,<STRING pNodeObject>),LONG
RemoveAllAttributes                          PROCEDURE(<STRING pNodeObject>),LONG
RemoveAllChildren                            PROCEDURE(<STRING pNodeObject>)
RemoveAttribute                              PROCEDURE(STRING pAttribute,<STRING pNodeObject>),LONG
RemoveChild                                  PROCEDURE(STRING pTag,<STRING pNodeObject>)
RemoveChildByIndex                           PROCEDURE(LONG pIndex,<STRING pNodeObject>)
RemoveChildWithContent                       PROCEDURE(STRING pContent,<STRING pNodeObject>)
RemoveFromTree                               PROCEDURE(<STRING pNodeObject>)
SaveBinaryContent                            PROCEDURE(STRING pFileName,LONG pUnzipFlag,LONG pDecryptFlag,STRING pPassword,<STRING pNodeObject>),LONG

SaveXml                                      PROCEDURE(STRING pFileName),LONG,PROC
SearchAllForContent                          PROCEDURE(STRING pAfterPtrObject,STRING pContentPattern),STRING
SearchAllForContent2                         PROCEDURE(STRING pAfterPtrObject,STRING pContentPattern),LONG
SearchForAttribute                           PROCEDURE(STRING pAfterPtrObject,STRING pTag,STRING pAttribute,STRING pValuePattern),STRING
SearchForAttribute2                          PROCEDURE(STRING pAfterPtrObject,STRING pTag,STRING pAttribute,STRING pValuePattern),LONG 
SearchForContent                             PROCEDURE(STRING pAfterPtrObject,STRING pTag,STRING pContentPattern),STRING
SearchForContent2                            PROCEDURE(STRING pAfterPtrObject,STRING pTag,STRING pContentPattern),LONG
SearchForTag                                 PROCEDURE(STRING pafterPtrObject,STRING pTag),STRING
SearchForTag2                                PROCEDURE(STRING pafterPtrObject,STRING pTag),LONG

SetBinaryContent                             PROCEDURE(STRING pInData,LONG PZipflag,LONG pEncryptFlag,STRING pPassword,<STRING pNodeObject>),LONG
SetBinaryContentFromFile                     PROCEDURE(STRING pFileName,LONG PZipflag,LONG pEncryptFlag,STRING pPassword,<STRING pNodeObject>),LONG

SortByAttribute                              PROCEDURE(STRING pAttribute,LONG pAscending,<STRING pNodeObject>)
SortByAttributeInt                           PROCEDURE(STRING pAttribute,LONG pAscending,<STRING pNodeObject>)
SortByContent                                PROCEDURE(STRING pAscending,<STRING pNodeObject>)
SortByTag                                    PROCEDURE(LONG pAscending,<STRING pNodeObject>)
SortRecordsByAttribute                       PROCEDURE(STRING pSorttag,STRING pAttribute,LONG pAscending,<STRING pNodeObject>) 
SortRecordsByContent                         PROCEDURE(STRING pSorttag,LONG pAscending,<STRING pNodeObject>)
SortRecordsByContentInt                      PROCEDURE(STRING pSorttag,LONG pAscending,<STRING pNodeObject>)

SwapNode                                     PROCEDURE(STRING pSwapNodeObject,<STRING pNodeObject>),LONG
SwapTree                                     PROCEDURE(STRING pTree,<STRING pNodeObject>),LONG

TagContent                                   PROCEDURE(STRING pTag,<STRING pNodeObject>),STRING 
TagEquals                                    PROCEDURE(STRING pTag,<STRING pNodeObject>),LONG

UnzipContent                                 PROCEDURE(<STRING pNodeObject>),LONG,PROC
UnzipTree                                    PROCEDURE(<STRING pNodeObject>),LONG,PROC

UpdateAttribute                              PROCEDURE(STRING pAttribute,STRING pValue,<STRING pNodeObject>),LONG,PROC
UpdateAttributeInt                           PROCEDURE(STRING pAttribute,STRING pValue,<STRING pNodeObject>),LONG
UpdateChildContent                           PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)
UpdateChildContentInt                        PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)

ZipContent                                   PROCEDURE(<STRING pNodeObject>),LONG
ZipTree                                      PROCEDURE(<STRING pNodeObject>),LONG,PROC
!************************************************************
!Property Setters & Getters
!************************************************************
GetCdata                                     PROCEDURE(<STRING pObject>),LONG  
SetCdata                                     PROCEDURE(LONG,<STRING pObject>)  
GetContent                                   PROCEDURE(<STRING pObject>),STRING
SetContent                                   PROCEDURE(STRING,<STRING pObject>)
GetContentInt                                PROCEDURE(<STRING pObject>),LONG
SetContentInt                                PROCEDURE(LONG,<STRING pObject>)
GetDebugLogFilePath                          PROCEDURE(),STRING
SetDebugLogFilePath                          PROCEDURE(STRING)
GetDocType                                   PROCEDURE(),STRING
SetDocType                                   PROCEDURE(STRING,<STRING pNodeObject>)
GetEmitBom                                   PROCEDURE(),LONG
SetEmitBom                                   PROCEDURE(LONG)
GetEmitXmlDecl                               PROCEDURE(),LONG
SetEmitXmlDecl                               PROCEDURE(LONG) 
GetEncoding                                  PROCEDURE(),STRING
SetEncoding                                  PROCEDURE(STRING)
GetLastErrorHtml                             PROCEDURE(<STRING pObject>),STRING     !Read-only
GetLastErrorText                             PROCEDURE(<STRING pObject>),STRING     !Read-only
GetLastErrorXml                              PROCEDURE(<STRING pObject>),STRING     !Read-only
GetNumAttributes                             PROCEDURE(<STRING pObject>),LONG       !Read-only
GetNumChildren                               PROCEDURE(<STRING pObject>),LONG       !Read-only
GetSortCaseInsensitive                       PROCEDURE(),LONG
SetSortCaseInsensitive                       PROCEDURE(LONG)
GetStandalone                                PROCEDURE(),LONG
SetStandalone                                PROCEDURE(LONG)
GetTag                                       PROCEDURE(<STRING pObject>),STRING
SetTag                                       PROCEDURE(STRING pTag,<STRING pObject>)
GetTreeId                                    PROCEDURE(<STRING pTreeObject>),LONG   !Read-only
GetVerboseLogging                            PROCEDURE(),LONG  
SetVerboseLogging                            PROCEDURE(LONG)  
GetVersion                                   PROCEDURE(),STRING                     !Read-only
                                            END
                                            
                                            
                                            
                                     
