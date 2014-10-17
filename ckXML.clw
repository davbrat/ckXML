   MEMBER()
   MAP
   END
   
INCLUDE('ckXML.inc'),ONCE

!***********************************************************************************************************************
ckXML.AssignContainer                              PROCEDURE(SIGNED pControl,<BYTE pDebug>)       !LONG     ! TESTED -                                                   
!***********************************************************************************************************************

    CODE
    SELF.XMLContainer = pControl         

!***********************************************************************************************************************
ckXML.Construct                                    PROCEDURE()
!***********************************************************************************************************************

    CODE    
    
!***********************************************************************************************************************
ckXML.Destruct                                     PROCEDURE()
!***********************************************************************************************************************

    CODE    
    
!***********************************************************************************************************************
ckXML.Init                                         PROCEDURE(LONG pControl)
!***********************************************************************************************************************

    CODE    
    SELF.AssignContainer(pControl)   
    
!***********************************************************************************************************************
ckXML.Kill                                         PROCEDURE()
!***********************************************************************************************************************

    CODE    
    
!***********************************************************************************************************************
ckXML.Test                                         PROCEDURE(<STRING pText>)                               !  TESTED -  
!***********************************************************************************************************************

    CODE    
    BEEP(BEEP:SystemAsterisk)
    IF pText
       MESSAGE(' The XML ' & CLIP(pText) & ' Object is alive:' & '<09>', ' We are here!',ICON:Exclamation)  
    ELSE
       MESSAGE(' This.XML Object class is alive:'              & '<09>', ' We are here!',ICON:ASTERISK)
    END    
    RETURN    
    
    
!***********************************************************************************************************************
ckXML.AccumulateTagContent                         PROCEDURE(STRING pTAG,STRING pSkipTags)          !STRING ! TESTED -  
!***********************************************************************************************************************
!Accumulates the content of all nodes having a specific tag into a single result STRING. 
!SkipTags specifies a set of tags whose are to be avoided. The skipTags are formatted as a STRING of tags delimited by 
!vertical bar characters. All nodes in sub-trees rooted with a tag appearing in skipTags are not included in the result.
!RETURNs Nothing on failure
    
    CODE    
    RETURN SELF.XMLContainer{'AccumulateTagContent("'& pTAG &'","' & pSkipTags & '")'} 
    
!***********************************************************************************************************************
ckXML.AddAttribute                                 PROCEDURE(STRING pAttribute,STRING pValue,<STRING pNodeObject>) !LONG        ! TESTED - 
!***********************************************************************************************************************
!Adds an attribute to the calling node in the XML document. RETURNs True for success, and False for failure.
!RETURNs 1 for success, 0 for failure.

    CODE  
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.AddAttribute("' & CLIP(pAttribute) &'","'& pValue &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.AddAttribute("' & CLIP(pAttribute) &'","'& pValue &'")'}
    END 
         
    
    
    
!***********************************************************************************************************************
ckXML.AddAttributeInt                              PROCEDURE(STRING pAttribute,LONG pValue,<STRING pNodeObject>)!,LONG           ! TESTED - 
!***********************************************************************************************************************
!ByVal name As STRING, ByVal value As LONG) As LONG
!Adds an integer attribute to a node.
!RETURNs 1 for success, 0 for failure.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.AddAttributeInt("' & CLIP(pAttribute) &'","'& pValue &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.AddAttributeInt("' & CLIP(pAttribute) &'","'& pValue &'")'}
    END 
    
    
!***********************************************************************************************************************
ckXML.AddChildTree                                 PROCEDURE(STRING pTreeObject,<STRING pNodeObject>)!LONG                       ! TESTED -
!***********************************************************************************************************************
!(ByVal tree As ChilkatXml) As Long
!Adds an entire subtree as a child. If the child was a subtree within another Xml document then the subtree is effectively 
!transferred from one XML document to another.
!Returns 1 for success, 0 for failure.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.AddChildTree('& CLIP(pTreeObject) &')'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.AddChildTree('& CLIP(pTreeObject) &')'} 
    END 
    
!***********************************************************************************************************************
ckXML.AddOrUpdateAttribute                         PROCEDURE(STRING pAttribute, STRING pValue)               ! TESTED -
!***********************************************************************************************************************
!Adds an attribute to an XML node. If an attribute having the specified name already exists, the value is updated.

    CODE    
    SELF.XMLContainer{'AddOrUpdateAttribute("'& CLIP(pAttribute) &'","' & pValue &'")'}
    
!***********************************************************************************************************************
ckXML.AddOrUpdateAttributeI                        PROCEDURE(STRING pAttribute, STRING pValue)               ! TESTED -
!***********************************************************************************************************************
!Adds an integer attribute to an XML node. If an attribute having the specified name already exists, the value is updated.

    CODE    
    SELF.XMLContainer{'AddorUpdateAttributeI("' & CLIP(pAttribute) &'","' & pValue &'")'}   
    
!***********************************************************************************************************************
ckXML.AddStyleSheet                                PROCEDURE(STRING pStyleSheet)                             ! TESTED -
!***********************************************************************************************************************
!(ByVal styleSheet As STRING)
!Adds a style sheet declaration to the XML document. The styleSheet should be a STRING such as:
!<?xml-stylesheet href="mystyle.css" title="Compact" type="text/css"?>

    CODE    
    SELF.XMLContainer{'AddStyleSheet("' & CLIP(pStyleSheet) & '")'}

!***********************************************************************************************************************
ckXML.AddToAttribute                               PROCEDURE(STRING pAttribute, LONG pValue)                 ! TESTED -
!***********************************************************************************************************************
!(ByVal name As STRING, ByVal amount As LONG)
!Adds an integer amount to an integer attribute's value. If the attribute does not yet exist, this method behaves the same as AddOrUpdateAttributeI.

    CODE    
    SELF.XMLContainer{'AddToAttribute("' & CLIP(pAttribute) &'","' & pValue &'")'}    
    
!***********************************************************************************************************************
ckXML.AddToChildContent                            PROCEDURE(STRING pAttribute, LONG pValue,<STRING pNodeObject>)                 ! TESTED -
!***********************************************************************************************************************
!Adds an integer value to the content of a child node.

    CODE    
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.AddToChildContent("' & CLIP(pAttribute) &'","' & pValue &'")'} 
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.AddToChildContent("' & CLIP(pAttribute) &'","' & pValue &'")'} 
    END     
    
!***********************************************************************************************************************
ckXML.AddToContent                                 PROCEDURE(LONG pValue,<STRING pNodeObject>)              ! TESTED -
!***********************************************************************************************************************
!Adds an integer amount to the node's content.

    CODE    
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.AddToContent("' & pValue &'")'} 
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.AddToContent("' & pValue &'")'} 
    END 
    
!***********************************************************************************************************************
ckXML.AppendToContent                              PROCEDURE(LONG pValue,<STRING pNodeObject>)!LONG                               ! TESTED -
!***********************************************************************************************************************
!ByVal str As STRING) As LONG
!Appends text to the content of an XML node
!RETURNs 1 for success, 0 for failure.

    CODE     
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.AppendToContent("' & pValue &'")'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.AppendToContent("' & pValue &'")'}
    END     
        
!***********************************************************************************************************************
ckXML.BEncodeContent                               PROCEDURE(STRING pAttribute, STRING PData,<STRING pNodeObject>) ! TESTED -      ! This needs to be looked at don't know what it does.
!***********************************************************************************************************************
!(ByVal charset As STRING, ByVal inData As Variant) As LONG
!Sets the node's content with 8bit data that is in a specified multibyte character encoding such as utf-8, shift-jis, big5, etc. The data is first B-encoded and the content is set to be the B-encoded STRING. For example, if called with "Big5"for the charset, you would get a STRING that looks something like this: "=?Big5?B?pHCtsw==?=". The data is Base64-encoded and stored between the last pair of "?" delimiters. Use the DecodeContent method to retrieve the byte data from a B encoded STRING.
!RETURNs 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.BEncodeContent("' & pAttribute &'","' & pData &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.BEncodeContent("' & pAttribute &'","' & pData &'")'}
    END      
    
!***********************************************************************************************************************
ckXML.ChildContentMatches                          PROCEDURE(STRING pAttribute, STRING pPattern, LONG pCase,<STRING pNodeObject>) ! TESTED -      ! This does not work either...
!***********************************************************************************************************************
!(ByVal tag As STRING, ByVal pattern As STRING, ByVal caseSensitive As LONG) As LONG
!RETURN true if a child having a specific tag contains content that matches a wildcarded pattern.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.ChildContentMatches("' & CLIP(pAttribute) &'","' & CLIP(pPattern) &'","' & pCase &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.ChildContentMatches("' & CLIP(pAttribute) &'","' & CLIP(pPattern) &'","' & pCase &'")'}
    END     
    
!***********************************************************************************************************************
ckXML.ChilkatPath                                  PROCEDURE(STRING pPath)                                   ! TESTED - 
!***********************************************************************************************************************
!Follows a series of commands to navigate through an XML document to RETURN a piece of data or update the caller's reference to a new XML document node.
!Note: This method not related to the XPath (XML Path) standard in any way.
!The pathCmd is formatted as a series of commands separated by vertical bar characters, and terminated with a 
!RETURN-command:command|command|command|...|RETURNCommand

    CODE    
    RETURN SELF.XMLContainer{'ChilkatPath("' & pPath &'")'}
    
!***********************************************************************************************************************
ckXML.ClearXML                                      PROCEDURE(<STRING pNodeObject>)                                               ! TESTED - 
!***********************************************************************************************************************
!Removes all children, attributes, and content from the XML node. Resets the tag name to "unnamed".

    CODE    
    SELF.XMLContainer{'Clear'}   
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.Clear'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.Clear'}
    END  
    
!***********************************************************************************************************************
ckXML.ContentMatches                               PROCEDURE(STRING pPattern, LONG pCase,<STRING pNodeObject>)! TESTED -          !This does not work either
!***********************************************************************************************************************
!(ByVal pattern As STRING, ByVal caseSensitive As LONG) As LONG
!RETURN true if the node's content matches a wildcarded pattern.

    CODE     
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.ContentMatches("' & CLIP(pPattern) &'","' & pCase &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.ContentMatches("' & CLIP(pPattern) &'","' & pCase &'")'}
    END  

!***********************************************************************************************************************
ckXML.Copy                                         PROCEDURE(STRING pCopyFromNode,<STRING pCallingNodeObject>) ! TESTED -       !Don't know how to prototype this.
!***********************************************************************************************************************
!(ByVal node As ChilkatXml)
!Copies the tag, content, and attributes to the calling node.

    CODE    
    IF pCallingNodeObject <> ''
       SELF.XMLContainer{ pCallingNodeObject & '.Copy('& pCopyFromNode &')'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.Copy('& pCopyFromNode &')'}
    END      
      
!***********************************************************************************************************************
ckXML.CopyRef                                      PROCEDURE(STRING pCopyFromNode,<STRING pCallingNodeObject>)                           ! TESTED -       !Don't know how to prototype this either.
!***********************************************************************************************************************
!(ByVal copyFromNode As ChilkatXml)
!Discards the caller's current internal reference and copies the internal reference from copyFromNode. 
!Effectively updates the caller node to point to the same node in the XML document as copyFromNode.

    CODE        
    IF pCallingNodeObject <> ''
       SELF.XMLContainer{ pCallingNodeObject & '.CopyRef('& pCopyFromNode &')'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.CopyRef('& pCopyFromNode &')'}
    END      
    
!***********************************************************************************************************************
ckXML.DecodeContent                                PROCEDURE()                                               ! TESTED - 
!***********************************************************************************************************************
!As Variant
!Decodes a node's Q or B-encoded content STRING and RETURNs the byte data.
!RETURNs a zero-length byte array (as a Variant) on failure.
!An empty array will have a UBound of -1 meaning 0 elements.

    CODE    
    
!***********************************************************************************************************************
ckXML.DecodeEntities                               PROCEDURE(STRING pAttribute)                              ! TESTED - 
!***********************************************************************************************************************
!(ByVal str As STRING) As STRING
!Utility method to decode HTML entities. It accepts a STRING containing (potentially) HTML entities and RETURNs a STRING 
!with the entities decoded.
!RETURNs Nothing on failure

    CODE    
    RETURN SELF.XMLContainer{'DecodeEntities("' & CLIP(pAttribute) & '")'}

!***********************************************************************************************************************
ckXML.DecryptContent                               PROCEDURE(STRING pPassword,<STRING pNodeObject>)         ! TESTED - 
!***********************************************************************************************************************
!(ByVal password As STRING) As LONG
!Decrypts the content of an XML node that was previously 128-bit AES encrypted with the EncryptContent method.
!RETURNs 1 for success, 0 for failure.

    CODE    
    SELF.XMLContainer{'DecryptContent("' & CLIP(pPassword) &'")'}

!***********************************************************************************************************************
ckXML.EncryptContent                               PROCEDURE(STRING pPassword,<STRING pNodeObject>)          ! TESTED - 
!***********************************************************************************************************************
!Encrypts the content of the calling XML node using 128-bit CBC AES encryption. 
!The base64-encoded encrypted content replaces the original content.
!RETURNs 1 for success, 0 for failure.

    CODE    
    RETURN SELF.XMLContainer{'EncryptContent("' & CLIP(pPassword) &'")'}

!***********************************************************************************************************************
ckXML.ExtractChildByIndex                          PROCEDURE(LONG pIndex,<STRING pNodeObject>) !STRING       ! TESTED - 
!***********************************************************************************************************************
!Removes and RETURNs the Nth child of an XML node. The first child is at index 0.
ChildObject        STRING(20),AUTO

    CODE    
    RETURN SELF.XMLContainer{'ExtractChildByIndex("' & CLIP(pIndex) &'")'}
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.ExtractChildByIndex("' & CLIP(pIndex) &'")'}
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.ExtractChildByIndex("' & CLIP(pIndex) &'")'}
    END     
    RETURN ChildObject
    
!***********************************************************************************************************************
ckXML.ExtractChildByName                           PROCEDURE(STRING pTag, STRING pAttribute, STRING pValue,<STRING pNodeObject>)! ! TESTED -         !not working correctly
!***********************************************************************************************************************
!(ByVal tag As STRING, ByVal attrName As STRING, ByVal attrValue As STRING) As ChilkatXml
!Removes and RETURNs the first child node having a tag equal to the tagName. The attributeName and attrValue may be empty 
!or NULL, in which case the first child matching the tag is removed and RETURNed. If attributeName is specified, then the 
!first child having a tag equal to tagName, and an attribute with attributeName is RETURNed. If attrValue is also specified, 
!then only a child having a tag equal to tagName, and an attribute named attributeName, with a value equal to attrValue is RETURNed.

ChildObject        STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.ExtractChildByName("' & CLIP(pTag) &'","' & CLIP(pAttribute) &'","' & pValue &'")'}
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.ExtractChildByName("' & CLIP(pTag) &'","' & CLIP(pAttribute) &'","' & pValue &'")'}
    END    
    RETURN ChildObject
    
!***********************************************************************************************************************
ckXML.FindChild                                    PROCEDURE(STRING pTag,<STRING pNodeObject>)                                    ! TESTED -        !not working correctly
!***********************************************************************************************************************
!(ByVal tag As STRING) As ChilkatXml
!RETURNs the child having a specified tag.
    
ChildObject        STRING(20),AUTO
    
    CODE    
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.FindChild("' & CLIP(pTag) &'")'}
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.FindChild("' & CLIP(pTag) &'")'}
    END  
    RETURN ChildObject
       
!***********************************************************************************************************************
ckXML.FindChild2                                   PROCEDURE(STRING pTag,<STRING pNodeObject>)               ! TESTED -         !not working correctly
!***********************************************************************************************************************
!(ByVal tag As STRING) As LONG
!Updates the Xml object's internal reference to point to a child with a specified tag.
!RETURNs 1 for success, 0 for failure.
    
    CODE     
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.FindChild2("' & CLIP(pTag) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.FindChild2("' & CLIP(pTag) &'")'}
    END
    
!***********************************************************************************************************************
ckXML.FindNextRecord                               PROCEDURE(STRING pTag, STRING pPattern,<STRING pNodeObject>)                    ! TESTED -         !not quite working
!***********************************************************************************************************************
!(ByVal tag As STRING, ByVal contentPattern As STRING) As ChilkatXml
!RETURNs the next record node where the child with a specific tag matches a wildcarded pattern. 
!This method makes it easy to iterate over high-level records.

NextRecordObject   STRING(20),AUTO

    CODE  
    IF pNodeObject <> ''
       NextRecordObject = SELF.XMLContainer{ pNodeObject & '.FindNextRecord("' & CLIP(pTag) &'","' & CLIP(pPattern) &'")'}
    ELSE
       NextRecordObject = SELF.XMLContainer{SELF.GetSelf() & '.FindNextRecord("' & CLIP(pTag) &'","' & CLIP(pPattern) &'")'}
    END  
    RETURN NextRecordObject
    
!***********************************************************************************************************************
ckXML.FindOrAddNewChild                            PROCEDURE(STRING pTag,<STRING pNodeObject>)                                    ! TESTED -         !adds ok, but does not seem to find stuff..
!***********************************************************************************************************************
!(ByVal tag As STRING) As ChilkatXml
!First searches for a child having a tag equal to tagName, and if found, RETURNs it. 
!Otherwise creates a new child, sets the tag equal to tagName, and initializes the Content to empty.

NewChildObject     STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       NewChildObject = SELF.XMLContainer{ pNodeObject & '.FindOrAddNewChild("' & CLIP(pTag) &'")'}
    ELSE
       NewChildObject = SELF.XMLContainer{SELF.GetSelf() & '.FindOrAddNewChild("' & CLIP(pTag) &'")'}
    END  
    RETURN NewChildObject
    
    
!***********************************************************************************************************************
ckXML.FirstChild                                   PROCEDURE(<STRING pNodeObject>)                                               ! TESTED -         !seems to work, but not not quite working
!***********************************************************************************************************************
!As ChilkatXml
!RETURNs the first child. A program can step through the children by calling FirstChild, and then NextSibling repeatedly.

FirstChildObject   STRING(20),AUTO
    
    CODE   
    IF pNodeObject <> ''
       FirstChildObject = SELF.XMLContainer{ pNodeObject & '.FirstChild'}
    ELSE
       FirstChildObject = SELF.XMLContainer{SELF.GetSelf() & '.FirstChild'}
    END  
    RETURN FirstChildObject
    
!***********************************************************************************************************************
ckXML.FirstChild2                                  PROCEDURE(<STRING pNodeObject>)                                               ! TESTED -        !seems to work, but not not quite working
!***********************************************************************************************************************
!As LONG
!Updates the internal reference of the caller to point to its first child.
!RETURNs 1 for success, 0 for failure.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.FirstChild2'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.FirstChild2'}
    END  
    
!***********************************************************************************************************************
ckXML.GetAttrValue                                 PROCEDURE(STRING pAttribute,<STRING pNodeObject>)                              ! TESTED -      !seems to work, but not not quite working
!***********************************************************************************************************************
!(ByVal name As STRING) As STRING
!Find and RETURN the value of an attribute having a specified name.
!RETURNs Nothing on failure
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetAttrValue("' & CLIP(pAttribute) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetAttrValue("' & CLIP(pAttribute) &'")'}
    END      
    
!***********************************************************************************************************************
ckXML.GetAttrValueInt                              PROCEDURE(STRING pAttribute,<STRING pNodeObject>)                              ! TESTED -     !seems to work, but not not quite working
!***********************************************************************************************************************
!(ByVal name As STRING) As LONG
!RETURNs an attribute as an integer.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetAttrValueInt("' & CLIP(pAttribute) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetAttrValueInt("' & CLIP(pAttribute) &'")'}
    END
       
!***********************************************************************************************************************
ckXML.GetAttributeName                             PROCEDURE(LONG pIndex,<STRING pNodeObject>)!STRING                           ! TESTED -      !seems to work, but not not quite working
!***********************************************************************************************************************
!(ByVal index As LONG) As STRING
!RETURNs the name of the Nth attribute of an XML node. The first attribute is at index 0.
!RETURNs Nothing on failure
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetAttributeName(' & pIndex &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetAttributeName(' & pIndex &')'}
    END


    
!***********************************************************************************************************************
ckXML.GetAttributeValue                            PROCEDURE(LONG pIndex,<STRING pNodeObject>)                                  ! TESTED -      !seems to work, but not not quite working
!***********************************************************************************************************************
!(ByVal index As LONG) As STRING
!RETURNs the value of the Nth attribute of an XML node. The first attribute is at index 0.
!RETURNs Nothing on failure
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetAttributeValue(' & pIndex &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetAttributeValue(' & pIndex &')'}
    END
    
!***********************************************************************************************************************
ckXML.GetAttributeValueInt                         PROCEDURE(LONG pIndex,<STRING pNodeObject>)                                    ! TESTED - 
!***********************************************************************************************************************
!(ByVal index As LONG) As LONG
!RETURNs an attribute as an integer.

    CODE     
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetAttributeValueInt(' & pIndex &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetAttributeValueInt(' & pIndex &')'}
    END
    
!***********************************************************************************************************************
ckXML.GetBinaryContent                             PROCEDURE(LONG pUnzipFlag, LONG pDecryptFlag, STRING pPassword) ! TESTED - 
!***********************************************************************************************************************
!(ByVal unzipFlag As LONG, ByVal decryptFlag As LONG, ByVal password As STRING) As Variant
!RETURNs binary content of an XML node as a byte array. The content may have been Zip compressed, AES encrypted, or both. 
!Unzip compression and AES decryption flags should be set appropriately.
!RETURNs a zero-length byte array (as a Variant) on failure.
!An empty array will have a UBound of -1 meaning 0 elements.

    CODE    
    RETURN SELF.XMLContainer{'GetBinaryContent('& pUnzipFlag &','& pDecryptFlag &',"'& CLIP(pPassword)&'")'}   
    
!***********************************************************************************************************************
ckXML.GetChild                                     PROCEDURE(LONG pIndex,<pNodeObject>)!STRING                             ! TESTED - 
!***********************************************************************************************************************
!ByVal index As Long) As ChilkatXml
!Returns the Nth child of an XML node

ChildObject        STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.GetChild('& pIndex &')'}
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.GetChild('& pIndex &')'}
    END
    RETURN ChildObject   


    
!***********************************************************************************************************************
ckXML.GetChild2                                    PROCEDURE(LONG pIndex,<STRING pNodeObject>)!LONG                               ! TESTED -  
!***********************************************************************************************************************
!ByVal index As Long) As Long
!Updates the calling object's internal reference to the Nth child node.
!Returns 1 for success, 0 for failure 

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChild2('& pIndex &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChild2('& pIndex &')'}
    END
    
!***********************************************************************************************************************
ckXML.GetChildBoolValue                            PROCEDURE(STRING pTAG,<STRING pNodeObject>)!LONG                               ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String) As Long
!Returns 0 if the node's content is "0", otherwise returns 1 if the node contains a non-zero integer.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChildBoolValue("'& CLIP(pTAG) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChildBoolValue("'& CLIP(pTAG) &'")'}
    END       
    
    
!***********************************************************************************************************************
ckXML.GetChildContent                              PROCEDURE(STRING pTAG,<STRING pNodeObject>)!STRING                             ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String) As String
!Returns the content of a child having a specified tag.
!Returns Nothing on failure
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChildContent("'& CLIP(pTAG) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChildContent("'& CLIP(pTAG) &'")'}
    END
       
       
!***********************************************************************************************************************
ckXML.GetChildContentByIndex                       PROCEDURE(LONG pIndex,<STRING pNodeObject>)! String                            ! TESTED - 
!***********************************************************************************************************************
!ByVal index As Long) As String
!Returns the content of the Nth child node.
!Returns Nothing on failure

    CODE 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChildContentByIndex('& pIndex &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChildContentByIndex('& pIndex &'")'}
    END      
    
!***********************************************************************************************************************
ckXML.GetChildExact                                PROCEDURE(STRING pTag,STRING pContent,<STRING pNodeObject>)!STRING             ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal content As String) As ChilkatXml
!Returns the child having the exact tag and content.
 
ChildObject        STRING(20),AUTO

    CODE        
    IF pNodeObject <> ''
       ChildObject =  SELF.XMLContainer{ pNodeObject & '.GetChildExact("'& pTag &'","'& pContent &'")'}
    ELSE
       ChildObject =  SELF.XMLContainer{SELF.GetSelf() & '.GetChildExact("'& pTag &'","'& pContent &'")'}
    END  
    RETURN ChildObject
    
!***********************************************************************************************************************
ckXML.GetChildIntValue                             PROCEDURE(STRING pTag,<STRING pNodeObject>)!LONG                ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String) As Long
!Returns the child integer content for a given tag.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChildIntValue("'& pTag &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChildIntValue("'& pTag &'")'}
    END       
    
    
    
!***********************************************************************************************************************
ckXML.GetChildTag                                  PROCEDURE(LONG pIndex,<STRING pNodeObject>)! String             ! TESTED - 
!***********************************************************************************************************************
!ByVal index As Long) As String
!Returns the tag name of the Nth child node.
!Returns Nothing on failure
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChildTag('& pIndex &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChildTag('& pIndex &')'}
    END       
    
!I DON"T THINK THE CHILKAT DOCS ARE CORRECT ON THIS ONE 
!SAME PARAMS AS THE NEXT METHOD!!!!    
    
    
!***********************************************************************************************************************
ckXML.GetChildTagByIndex                           PROCEDURE(LONG pIndex,<STRING pNodeObject>)! String                            ! TESTED - 
!***********************************************************************************************************************
!ByVal index As Long) As String
!Returns the tag name of the Nth child node.
!Returns Nothing on failure

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetChildTagByIndex('& pIndex &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetChildTagByIndex('& pIndex &')'}
    END          
    
!***********************************************************************************************************************
ckXML.GetChildWithAttr                             PROCEDURE(STRING pTag,STRING pAttribute,STRING pValue,<STRING pNodeObject>)!STRING ! TESTED -                                                ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal attrName As String, ByVal attrValue As String) As ChilkatXml
!Finds and returns the XML child node having both a given tag and an attribute with a given name and value.
    
ChildObject        STRING(20),AUTO
    
    CODE    
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.GetChildWithAttr("'& CLIP(pTag) &'","'& CLIP(pAttribute) &'","'& pValue &'")'} 
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.GetChildWithAttr("'& CLIP(pTag) &'","'& CLIP(pAttribute) &'","'& pValue &'")'} 
    END 
    RETURN ChildObject
 
!***********************************************************************************************************************
ckXML.GetChildWithContent                          PROCEDURE(STRING pContent,<STRING pNodeObject>)!STRING                         ! TESTED - 
!***********************************************************************************************************************
!ByVal content As String) As ChilkatXml
!Returns the first child found having the exact content specified.

ChildObject        STRING(20),AUTO
    
    CODE 
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.GetChildWithContent("'& pContent &'")'}
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.GetChildWithContent("'& pContent &'")'} 
    END 
    RETURN ChildObject

    
!***********************************************************************************************************************
ckXML.GetChildWithTag                              PROCEDURE(STRING pTag,<STRING pNodeObject>)!STRING                             ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String) As ChilkatXml
!Returns the Xml child object having a tag matching tagName.
    
ChildObject        STRING(20),AUTO

    CODE 
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.GetChildWithTag("'& pTag &'")'} 
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.GetChildWithTag("'& pTag &'")'}  
    END 
    RETURN ChildObject     
    
!***********************************************************************************************************************
ckXML.GetNthChildWithTag                           PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)!STRING               ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal n As Long) As ChilkatXml
!Returns the Nth child having a tag that matches exactly with the tagName. 
!Use the NumChildrenHavingTag method to determine how many children have a particular tag.

ChildObject        STRING(20),AUTO

    CODE 
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.GetNthChildWithTag("'& CLIP(pTag) &'","'& pValue &'")'} 
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.GetNthChildWithTag("'& CLIP(pTag) &'","'& pValue &'")'} 
    END 
    RETURN ChildObject 
    
!***********************************************************************************************************************
ckXML.GetNthChildWithTag2                          PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)!LONG                 ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal n As Long) As Long
!Updates the calling object's internal reference to the Nth child node having a specific tag.    
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetNthChildWithTag2("'& CLIP(pTag) &'","'& pValue &'")'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetNthChildWithTag2("'& CLIP(pTag) &'","'& pValue &'")'} 
    END 
     
 
 
!***********************************************************************************************************************
ckXML.GetParent                                    PROCEDURE(<STRING pNodeObject>)!STRING                                        ! TESTED - 
!***********************************************************************************************************************
!As ChilkatXml
!Returns the parent of this XML node, or NULL if the node is the root of the tree.

ParentObject        STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       ParentObject = SELF.XMLContainer{ pNodeObject & '.GetParent'} 
    ELSE
       ParentObject = SELF.XMLContainer{SELF.GetSelf() & '.GetParent'} 
    END 
    RETURN ParentObject 
    
!***********************************************************************************************************************
ckXML.GetParent2                                   PROCEDURE(<STRING pNodeObject>)!LONG                      ! TESTED - 
!***********************************************************************************************************************
!As Long
!Updates the internal reference of the caller to its parent.   
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.GetParent2'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.GetParent2'} 
    END 
    
!***********************************************************************************************************************
ckXML.GetRoot                                      PROCEDURE()!STRING                     ! TESTED - 
!***********************************************************************************************************************
!As ChilkatXml
!RETURNs the root node of the XML document

RootNodeObject     STRING(20),AUTO 
    
    CODE    
!    IF pNodeObject <> ''
!       RootNodeObject = SELF.XMLContainer{ pNodeObject & '.GetRoot'} 
!    ELSE
       RootNodeObject = SELF.XMLContainer{'GetRoot'} 
!    END    
    RETURN RootNodeObject
    
!***********************************************************************************************************************
ckXML.GetRoot2                                     PROCEDURE()                           ! TESTED - 
!***********************************************************************************************************************
!Updates the internal reference of the caller to the document root.

    CODE
!    IF pNodeObject <> ''
!       SELF.XMLContainer{ pNodeObject & '.GetRoot2'} 
!    ELSE
       SELF.XMLContainer{'GetRoot2'} 
!    END    

!***********************************************************************************************************************
ckXML.GetSelf                                      PROCEDURE()!STRING                                       ! TESTED - 
!***********************************************************************************************************************
!As ChilkatXml
!Returns a new XML object instance that references the same XML node.

SelfObject         STRING(20),AUTO
    
    CODE        
    SelfObject = SELF.XMLContainer{'GetSelf'} 
    RETURN SelfObject
       
!***********************************************************************************************************************
ckXML.GetXml                                       PROCEDURE()         !STRING                               ! TESTED -    
!***********************************************************************************************************************

    CODE    
    RETURN SELF.XMLContainer{'GetXml'}    
    
    
!***********************************************************************************************************************    
!*********************************************************************************************************************** 
!*********************************************************************************************************************** 
!*********************************************************************************************************************** 
!*********************************************************************************************************************** 
!*********************************************************************************************************************** 
    
    
!***********************************************************************************************************************
ckXML.HasAttrWithValue                             PROCEDURE(STRING pAttribute,STRING pValue,<STRING pNodeObject>)!LONG  ! TESTED - 
!***********************************************************************************************************************
!ByVal name As String, ByVal value As String) As Long
!Returns true if the node contains attribute with the name and value.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.HasAttrWithValue("'& CLIP(pAttribute) &'","'& pValue &'")'} 
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.HasAttrWithValue("'& CLIP(pAttribute) &'","'& pValue &'")'} 
    END       
    
!***********************************************************************************************************************
ckXML.HasAttribute                                 PROCEDURE(STRING pAttribute,<STRING pNodeObject>)!LONG   ! TESTED - 
!***********************************************************************************************************************
!ByVal name As String) As Long
!Returns true if the node contains an attribute with the specified name.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.HasAttribute("'& CLIP(pAttribute) &'")'} 
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.HasAttribute("'& CLIP(pAttribute) &'")'} 
    END       
        
!***********************************************************************************************************************
ckXML.HasChildWithContent                          PROCEDURE(STRING pContent,<STRING pNodeObject>)!LONG    ! TESTED - 
!***********************************************************************************************************************
!ByVal content As String) As Long
!Returns true if the node has a direct child node containing the exact content string specified.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.HasChildWithContent("'& CLIP(pContent) &'")'}
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.HasChildWithContent("'& CLIP(pContent) &'")'}
    END 
        
!***********************************************************************************************************************
ckXML.HasChildWithTag                              PROCEDURE(STRING pTag,<STRING pNodeObject>)!LONG          ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String) As Long
!Returns true (1 for ActiveX) if the node has a direct child with a given tag.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.HasChildWithTag("'& CLIP(pTag) &'")'} 
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.HasChildWithTag("'& CLIP(pTag) &'")'} 
    END    
   
   
!***********************************************************************************************************************
ckXML.HasChildWithTagAndContent                    PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)!LONG  ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal content As String) As Long
!Returns true if the node contains a direct child having the exact tag and content specified.
    
    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.HasChildWithTagAndContent("'& CLIP(pTag) &'","'& pValue &'")'} 
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.HasChildWithTagAndContent("'& CLIP(pTag) &'","'& pValue &'")'} 
    END 

     
!***********************************************************************************************************************
ckXML.InsertChildTreeAfter                         PROCEDURE(LONG pIndex, STRING pTreeObject,<STRING pNodeObject> )                ! TESTED - 
!***********************************************************************************************************************
!ByVal index As Long, ByVal tree As ChilkatXml)
!Adds an entire subtree as a child. If the child was a subtree within another Xml document then the subtree is effectively 
!transferred from one XML document to another. The child tree is inserted in a position after the Nth child (of the calling node).
    
    CODE    
!   SELF.XMLContainer{'InsertChildTreeAfter('& pIndex & ','& clip(pTreeObject) &')'} 
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.InsertChildTreeAfter('& pIndex & ','& clip(pTreeObject) &')'}  
    ELSE
       SELF.XMLContainer{ SELF.GetSelf() & '.InsertChildTreeAfter('& pIndex & ','& clip(pTreeObject) &')'} 
    END 
    
!***********************************************************************************************************************
ckXML.InsertChildTreeBefore                        PROCEDURE(LONG pIndex, STRING pTreeObject,<STRING pNodeObject>)                ! TESTED - 
!***********************************************************************************************************************
!ByVal index As Long, ByVal tree As ChilkatXml)
!Adds an entire subtree as a child. If the child was a subtree within another Xml document then the subtree is effectively 
!transferred from one XML document to another. The child tree is inserted in a position before the Nth child (of the calling node).
    
    CODE    
!   SELF.XMLContainer{'InsertChildTreeBefore('& pIndex & ','& clip(pTreeObject) &')'} 
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.InsertChildTreeBefore('& pIndex & ','& clip(pTreeObject) &')'}   
    ELSE
       SELF.XMLContainer{ SELF.GetSelf() & '.InsertChildTreeBefore('& pIndex & ','& clip(pTreeObject) &')'} 
    END 
    
!***********************************************************************************************************************
ckXML.LastChild                                    PROCEDURE(<STRING pNodeObject>)!STRING                                        ! TESTED - 
!***********************************************************************************************************************
!As ChilkatXml
!Returns the last Xml child node. A node's children can be enumerated by calling LastChild and then repeatedly calling 
!PreviousSibling, until a NULL is returned.

ChildObject        STRING(20),AUTO

    CODE     
!    ChildObject = SELF.XMLContainer{'LastChild'} 
!    RETURN ChildObject    
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.LastChild'}  
    ELSE
       ChildObject = SELF.XMLContainer{ SELF.GetSelf() & '.LastChild'} 
    END 
    RETURN ChildObject   
    
!***********************************************************************************************************************
ckXML.LastChild2                                   PROCEDURE(<STRING pNodeObject>)!LONG                                          ! TESTED - 
!***********************************************************************************************************************
!As Long
!Updates the internal reference of the caller to its last child.
!Returns 1 for success, 0 for failure.

    CODE    
!    RETURN SELF.XMLContainer{'LastChild2'} 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.LastChild2'}  
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.LastChild2'} 
    END     
 
!***********************************************************************************************************************
ckXML.LoadXml                                      PROCEDURE(STRING pXMLString)!LONG                         ! TESTED - 
!***********************************************************************************************************************
!Loads an XML document from a memory buffer and RETURNs 1 if successful. 
!The contents of the calling node are replaced with the root node of the XML document loaded.
!RETURNs 1 for success, 0 for failure.
    
    CODE       
    RETURN SELF.XMLContainer{'LoadXML('& pXMLString &')'}
    
    
!***********************************************************************************************************************
ckXML.LoadXml2                                     PROCEDURE(STRING pXMLString,LONG pAutoTrim)!LONG          ! TESTED - 
!***********************************************************************************************************************
!ByVal xmlData As String, ByVal autoTrim As Long) As Long
!Same as LoadXml, but an additional argument controls whether or not leading/trailing whitespace is auto-trimmed from each 
!node's content.
!Returns 1 for success, 0 for failure.
    
    CODE    
    RETURN SELF.XMLContainer{'LoadXml2('& pXMLString &','& pAutoTrim &')'}
    
!***********************************************************************************************************************
ckXML.LoadXmlFile                                  PROCEDURE(STRING pFileName)  !LONG                        ! TESTED - 
!***********************************************************************************************************************
!Loads an XML document from a memory buffer and RETURNs 1 if successful. The contents of the calling node are replaced with 
!the root node of the XML document loaded.  
!RETURNs 1 for success, 0 for failure.

    CODE    
    RETURN SELF.XMLContainer{'LoadXml("' & pFileName & '")'}
    
    
!***********************************************************************************************************************
ckXML.LoadXmlFile2                                 PROCEDURE(STRING pFileName,LONG pAutoTrim)!LONG           ! TESTED - 
!***********************************************************************************************************************
!ByVal fileName As String, ByVal autoTrim As Long) As Long
!Same as LoadXmlFile, but an additional argument controls whether or not leading/trailing whitespace is auto-trimmed from 
!each node's content.
!Returns 1 for success, 0 for failure.
    
    CODE 
    RETURN SELF.XMLContainer{'LoadXmlFile2("'& CLIP(pFileName) &'",'& pAutoTrim &')'}
    
!***********************************************************************************************************************
ckXML.NewChild                                     PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>)!STRING               ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal content As String) As ChilkatXml
!Creates a new child having tag and content. The new child is created even if a child with a tag equal to tagName already 
!exists. (Use FindOrAddNewChild to prevent creating children having the same tags.)

ChildObject        STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.NewChild("'& CLIP(pTag) &'","'& pValue &'")'} 
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.NewChild("'& CLIP(pTag) &'","'& pValue &'")'} 
    END 
    RETURN ChildObject  
    
!***********************************************************************************************************************
ckXML.NewChild2                                    PROCEDURE(STRING pTag,STRING pValue,<STRING pNodeObject>) ! TESTED - 
!***********************************************************************************************************************
!ByVal tag As String, ByVal content As String)
!Creates a new child but does not return the node that is created.

ChildObject        STRING(20),AUTO

    CODE    
!    SELF.XMLContainer{'NewChild2("'& CLIP(pTag) &'","'& pValue &'")'} 
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.NewChild2("'& CLIP(pTag) &'","'& pValue &'")'} 
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.NewChild2("'& CLIP(pTag) &'","'& pValue &'")'} 
    END 
        
!***********************************************************************************************************************
ckXML.NewChildAfter                                PROCEDURE(LONG pIndex, STRING pTag, STRING pContent,<STRING pNodeObject>)!STRING    ! TESTED - 
!***********************************************************************************************************************
!(ByVal index As Long, ByVal tag As String, ByVal content As String) As ChilkatXml
!Inserts a new child in a position after the Nth child node.

    CODE    
!    RETURN SELF.XMLContainer{'NewChildAfter("'& CLIP(pIndex) &'","'& CLIP(pTag) &'","'& pContent &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.NewChildAfter("'& CLIP(pIndex) &'","'& CLIP(pTag) &'","'& pContent &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.NewChildAfter("'& CLIP(pIndex) &'","'& CLIP(pTag) &'","'& pContent &'")'}
    END 
       
!***********************************************************************************************************************
ckXML.NewChildBefore                               PROCEDURE(LONG pIndex, STRING pTag, STRING pContent,<STRING pNodeObject>)!STRING  ! TESTED - 
!***********************************************************************************************************************
!(ByVal index As Long, ByVal tag As String, ByVal content As String) As ChilkatXml
!Inserts a new child in a position before the Nth child node.

ChildObject        STRING(20),AUTO
    CODE    
!    RETURN SELF.XMLContainer{'NewChildBefore("'& CLIP(pIndex) &'","'& CLIP(pTag) &'","'& pContent &'")'}
    IF pNodeObject <> ''
       ChildObject = SELF.XMLContainer{ pNodeObject & '.NewChildBefore("'& CLIP(pIndex) &'","'& CLIP(pTag) &'","'& pContent &'")'}
    ELSE
       ChildObject = SELF.XMLContainer{SELF.GetSelf() & '.NewChildBefore("'& CLIP(pIndex) &'","'& CLIP(pTag) &'","'& pContent &'")'}
    END
    RETURN ChildObject      
    
!***********************************************************************************************************************
ckXML.NewChildInt2                                 PROCEDURE(STRING pTag, LONG pValue,<STRING pNodeObject>)                       ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String, ByVal value As Long)
!Inserts a new child having an integer for content.

    CODE    
!    SELF.XMLContainer{'NewChildInt2("'& CLIP(pTag) &'","'& pValue &'")'} 
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.NewChildInt2("'& CLIP(pTag) &'","'& pValue &'")'} 
     ELSE
      SELF.XMLContainer{SELF.GetSelf() & '.NewChildInt2("'& CLIP(pTag) &'","'& pValue &'")'} 
    END
    
!***********************************************************************************************************************
ckXML.NextSibling                                  PROCEDURE(<STRING pNodeObject>) !STRING                         ! TESTED - 
!***********************************************************************************************************************
!As ChilkatXml
!Returns the nodes next sibling, or NULL if there are no more.

SiblingObject        STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       SiblingObject = SELF.XMLContainer{ pNodeObject & '.NextSibling'} 
    ELSE
       SiblingObject = SELF.XMLContainer{SELF.GetSelf() & '.NextSibling'} 
    END 
    RETURN SiblingObject   
    
!***********************************************************************************************************************
ckXML.NextSibling2                                 PROCEDURE(<STRING pNodeObject>) !LONG                                           ! TESTED - 
!***********************************************************************************************************************
!As Long
!Updates the internal reference of the caller to its next sibling.
!Returns 1 for success, 0 for failure.

    CODE    
!   RETURN SELF.XMLContainer{'NextSibling2'} 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.NextSibling2'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.NextSibling2'} 
    END  
 
!***********************************************************************************************************************
ckXML.NumChildrenHavingTag                         PROCEDURE(STRING pTag,<STRING pNodeObject>) !LONG                               ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String) As Long
!Returns the number of children having a specific tag name.

    CODE    
!    RETURN SELF.XMLContainer{'NumChildrenHavingTag("'& pTag &'")'} 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.NumChildrenHavingTag("'& pTag &'")'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.NumChildrenHavingTag("'& pTag &'")'} 
    END         
    
!***********************************************************************************************************************
ckXML.PreviousSibling                              PROCEDURE(<STRING pNodeObject>) !STRING                                        ! TESTED - 
!***********************************************************************************************************************
!As ChilkatXml
!Returns the Xml object that is the node's previous sibling, or NULL if there are no more.

SiblingObject        STRING(20),AUTO

    CODE    
    IF pNodeObject <> ''
       SiblingObject = SELF.XMLContainer{ pNodeObject & '.PreviousSibling'} 
    ELSE
       SiblingObject = SELF.XMLContainer{SELF.GetSelf() & '.PreviousSibling'} 
    END 
    RETURN SiblingObject   
    
!***********************************************************************************************************************
ckXML.PreviousSibling2                             PROCEDURE(<STRING pNodeObject>) !LONG                                         ! TESTED - 
!***********************************************************************************************************************
!As Long
!Updates the internal reference of the caller to its previous sibling.
! Returns 1 for success, 0 for failure.

    CODE    
!   RETURN SELF.XMLContainer{'PreviousSibling2'} 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.PreviousSibling2'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.PreviousSibling2'} 
    END      
    
!***********************************************************************************************************************
ckXML.QEncodeContent                               PROCEDURE(STRING pCharset, STRING pInData,<STRING pNodeObject>) !LONG          ! TESTED - 
!***********************************************************************************************************************
!(ByVal charset As String, ByVal inData As Variant) As Long
!Sets the node's content with 8bit data that is in a specified multibyte character encoding such as utf-8, 
!shift-jis, big5, etc. The data is first Q-encoded and the content is set to be the Q-encoded string. 
!For example, if called with "gb2312"for the charset, you would get a string that looks something 
!like this: "=?gb2312?Q?=C5=B5=BB=F9?=". Character that are not 7bit are represented as "=XX" 
!where XX is the hexidecimal value of the byte. Use the DecodeContent method to retrieve the byte data 
!from a Q encoded string.
!Returns 1 for success, 0 for failure.

    CODE    
!    RETURN SELF.XMLContainer{'QEncodeContent("'& CLIP(pCharset) &'","'& pInData &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.QEncodeContent("'& CLIP(pCharset) &'","'& pInData &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.QEncodeContent("'& CLIP(pCharset) &'","'& pInData &'")'} 
    END 
     
!***********************************************************************************************************************
ckXML.RemoveAllAttributes                          PROCEDURE(<STRING pNodeObject>)  !LONG                                             ! TESTED - 
!***********************************************************************************************************************
!As Long
!Removes all attributes from an XML node. Should always return True.
!Returns 1 for success, 0 for failure.

    CODE    
!   RETURN SELF.XMLContainer{'RemoveAllAttributes'} 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.RemoveAllAttributes'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.RemoveAllAttributes'} 
    END    
    
!***********************************************************************************************************************
ckXML.RemoveAllChildren                            PROCEDURE(<STRING pNodeObject>)                                               ! TESTED - 
!***********************************************************************************************************************
!Removes all children from the calling node.

    CODE    
!   SELF.XMLContainer{'RemoveAllChildren'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.RemoveAllChildren'} 
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.RemoveAllChildren'} 
    END
       
!***********************************************************************************************************************
ckXML.RemoveAttribute                              PROCEDURE(STRING pAttribute,<STRING pNodeObject>)!LONG                           ! TESTED - 
!***********************************************************************************************************************
!(ByVal name As String) As Long
!Removes an attribute by name from and XML node.
!Returns 1 for success, 0 for failure.

    CODE    
!   RETURN SELF.XMLContainer{'RemoveAttribute("'& pAttribute &'")'} 
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.RemoveAttribute("'& pAttribute &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.RemoveAttribute("'& pAttribute &'")'}
    END
    
!***********************************************************************************************************************
ckXML.RemoveChild                                  PROCEDURE(STRING pTag,<STRING pNodeObject>)                                     ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String)
!Removes all direct children with a given tag.

    CODE    
!   SELF.XMLContainer{'RemoveChild("'& pTag &'")'} 
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.RemoveChild("'& pTag &'")'} 
    ELSE 
       SELF.XMLContainer{SELF.GetSelf() & '.RemoveChild("'& pTag &'")'} 
    END
    
!***********************************************************************************************************************
ckXML.RemoveChildByIndex                           PROCEDURE(LONG pIndex,<STRING pNodeObject>)                                     ! TESTED - 
!***********************************************************************************************************************
!(ByVal index As Long)
!Removes the Nth child from the calling node.
    
    CODE    
    SELF.XMLContainer{'RemoveChildByIndex("'& pIndex &'")'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.RemoveChildByIndex("'& pIndex &'")'}
    ELSE 
       SELF.XMLContainer{SELF.GetSelf() & '.RemoveChildByIndex("'& pIndex &'")'}
    END
       
!***********************************************************************************************************************
ckXML.RemoveChildWithContent                       PROCEDURE(STRING pContent,<STRING pNodeObject>)                                 ! TESTED - 
!***********************************************************************************************************************
!(ByVal content As String)
!Removes all children having the exact content specified.
 
    CODE    
!   SELF.XMLContainer{'RemoveChildWithContent("'& pContent &'")'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.RemoveChildWithContent("'& pContent &'")'}
    ELSE 
       SELF.XMLContainer{SELF.GetSelf() & '.RemoveChildWithContent("'& pContent &'")'}
    END    
    
!***********************************************************************************************************************
ckXML.RemoveFromTree                               PROCEDURE(<STRING pNodeObject>)                                               ! TESTED - 
!***********************************************************************************************************************
!Removes the calling object and its sub-tree from the XML document making it the root of its own tree.

    CODE    
!   SELF.XMLContainer{'RemoveFromTree'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.RemoveFromTree'}
    ELSE 
       SELF.XMLContainer{SELF.GetSelf() & '.RemoveFromTree'}
    END
       
!***********************************************************************************************************************
ckXML.SaveBinaryContent                            PROCEDURE(STRING pFileName, LONG pUnzipFlag, LONG pDecryptFlag, STRING pPassword,<STRING pNodeObject>) !LONG ! TESTED - 
!***********************************************************************************************************************
!(ByVal filename As String, ByVal unzipFlag As Long, ByVal decryptFlag As Long, ByVal password As String) As Long
!Saves a node's binary content to a file.
!Returns 1 for success, 0 for failure.

    CODE    
!   RETURN SELF.XMLContainer{'SaveBinaryContent("'& CLIP(pFileName) &'","'& CLIP(pUnzipFlag) &'","'& pDecryptFlag & '","'& pPassword &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.SaveBinaryContent("'& CLIP(pFileName) &'","'& CLIP(pUnzipFlag) &'","'& pDecryptFlag & '","'& pPassword &'")'}
    ELSE 
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.SaveBinaryContent("'& CLIP(pFileName) &'","'& CLIP(pUnzipFlag) &'","'& pDecryptFlag & '","'& pPassword &'")'}
    END    
    
!***********************************************************************************************************************
ckXML.SaveXml                                      PROCEDURE(STRING pFileName) !LONG                         ! TESTED - 
!***********************************************************************************************************************

    CODE    
    RETURN SELF.XMLContainer{'SaveXML("'& CLIP(pFileName)&'")'}   
    
!***********************************************************************************************************************
ckXML.SearchAllForContent                          PROCEDURE(STRING pAfterPtrObject, STRING pContentPattern)!STRING  ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal contentPattern As String) As ChilkatXml
!Returns the first node having content matching the contentPattern. The contentPattern is a case-sensitive string that 
!may contain any number of '*'s, each representing 0 or more occurances of any character. The search is breadth-first 
!over the sub-tree rooted at the caller. A match is returned only after the search has traversed past the node indicated 
!by afterPtr. To find the 1st occurance, set afterPtr equal to Nothing. (For the ActiveX implementation, the afterPtr should 
!never be Nothing. A reference to the caller's node should be passed instead.)
!
!To iterate over matching nodes, the returned node can be passed in afterPtr for the next call to SearchAllForContent, until 
!the method returns Nothing.

NodeObject         STRING(20),AUTO

    CODE    
    NodeObject = SELF.XMLContainer{'SearchAllForContent('& CLIP(pAfterPtrObject) &',"' & pContentPattern &'")'}
    RETURN NodeObject
    
!***********************************************************************************************************************
ckXML.SearchAllForContent2                         PROCEDURE(STRING pAfterPtrObject, STRING pContentPattern)!LONG ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal contentPattern As String) As Long
!Same as SearchAllForContent except the internal reference of the caller is updated to point to the search result (instead of 
!returning a new object).
!Returns 1 for success, 0 for failure.
    
    CODE    
    RETURN SELF.XMLContainer{'SearchAllForContent2('& clip(pAfterPtrObject) &',"' & pContentPattern &'")'}
        
!***********************************************************************************************************************
ckXML.SearchForAttribute                           PROCEDURE(STRING pAfterPtrObject, STRING pTag,STRING pAttribute, STRING pValuePattern)!STRING   ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal tag As String, ByVal attr As String, ByVal valuePattern As String) As ChilkatXml
!Returns the first node having a tag equal to tag, an attribute named attr, whose value matches valuePattern. The valuePattern 
!is a case-sensitive string that may contain any number of '*'s, each representing 0 or more occurances of any character. 
!The search is breadth-first over the sub-tree rooted at the caller. A match is returned only after the search has traversed 
!past the node indicated by afterPtr. To find the 1st occurance, set afterPtr equal to Nothing. (For the ActiveX implementation, 
!the afterPtr should never be Nothing. A reference to the caller's node should be passed instead.)
!
!To iterate over matching nodes, the returned node can be passed in afterPtr for the next call to SearchForAttribute, until the 
!method returns Nothing.

NodeObject         STRING(20),AUTO

    CODE    
    NodeObject = SELF.XMLContainer{'SearchForAttribute('& clip(pAfterPtrObject) &',"' & CLIP(pTag) &'","' & CLIP(pAttribute) &'","' & pValuePattern &'")'}
    RETURN NodeObject    
    
!***********************************************************************************************************************
ckXML.SearchForAttribute2                          PROCEDURE(STRING pAfterPtrObject, STRING pTag,STRING pAttribute, STRING pValuePattern)!LONG ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal tag As String, ByVal attr As String, ByVal valuePattern As String) As Long
!Same as SearchForAttribute except the internal reference of the caller is updated to point to the search result (instead 
!of returning a new object).
!Returns 1 for success, 0 for failure.

    CODE    
    RETURN SELF.XMLContainer{'SearchForAttribute('& CLIP(pAfterPtrObject) &',"' & CLIP(pTag) &'","' & CLIP(pAttribute) &'","' & pValuePattern &'")'}
    
!***********************************************************************************************************************
ckXML.SearchForContent                             PROCEDURE(STRING pAfterPtrObject, STRING pTag, STRING pContentPattern)!STRING ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal tag As String, ByVal contentPattern As String) As ChilkatXml
!Returns the first node having a tag equal to tag, whose content matches contentPattern. The contentPattern is a case-sensitive 
!string that may contain any number of '*'s, each representing 0 or more occurances of any character. The search is breadth-first 
!over the sub-tree rooted at the caller. A match is returned only after the search has traversed past the node indicated by afterPtr. 
!To find the 1st occurance, set afterPtr equal to Nothing. (For the ActiveX implementation, the afterPtr should never be Nothing. 
!A reference to the caller's node should be passed instead.)
!    
!To iterate over matching nodes, the returned node can be passed in afterPtr for the next call to SearchForContent, until the method 
!returns Nothing.

NodeObject         STRING(20),AUTO

    CODE    
    NodeObject = SELF.XMLContainer{'SearchForContent('& CLIP(pAfterPtrObject) &',"' & CLIP(pTag) &'","' & pContentPattern &'")'}
    RETURN NodeObject   
   
    
!***********************************************************************************************************************
ckXML.SearchForContent2                            PROCEDURE(STRING pAfterPtrObject, STRING pTag, STRING pContentPattern)!LONG ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal tag As String, ByVal contentPattern As String) As Long
!Same as SearchForContent except the internal reference of the caller is updated to point to the search result (instead 
!of returning a new object).
!Returns 1 for success, 0 for failure.

    CODE    
    RETURN SELF.XMLContainer{'SearchForContent2('& CLIP(pAfterPtrObject) &',"' & CLIP(pTag) &'","' & pContentPattern &'")'}
    
!***********************************************************************************************************************
ckXML.SearchForTag                                 PROCEDURE(STRING pAfterPtrObject, STRING pTag)!STRING     ! TESTED - 
!***********************************************************************************************************************
!(ByVal afterPtr As ChilkatXml, ByVal tag As STRING) As ChilkatXml
!RETURNs the first node having a tag equal to tag. The search is breadth-first over the sub-tree rooted at the caller. 
!A match is RETURNed only after the search has traversed past the node indicated by afterPtr. To find the 1st occurance, 
!set afterPtr equal to Nothing. 
!(For the ActiveX implementation, the afterPtr should never be Nothing. A reference to the caller's node should be passed instead.)
!To iterate over matching nodes, the RETURNed node can be passed in afterPtr for the next call to SearchForTag, until the 
!method RETURNs Nothing.
   
NodeObject         STRING(20),AUTO
  
    CODE 
    NodeObject = SELF.XMLContainer{'SearchForTag(' & CLIP(pAfterPtrObject) & ',"' & CLIP(pTag) &'")'}
    RETURN NodeObject

!***********************************************************************************************************************
ckXML.SearchForTag2                                PROCEDURE(STRING pAfterPtrObject, STRING pTag)!LONG       ! TESTED - 
!***********************************************************************************************************************
!ByVal afterPtr As ChilkatXml, ByVal tag As String) As Long
!Same as SearchForTag except the internal reference of the caller is updated to point to the search result (instead of 
!returning a new object).
!Returns 1 for success, 0 for failure.
    
    CODE    
    RETURN SELF.XMLContainer{'SearchForTag2(' & CLIP(pAfterPtrObject) & ',"' & CLIP(pTag) &'")'}
      
!***********************************************************************************************************************
ckXML.SetBinaryContent                             PROCEDURE(STRING pInData, LONG PZipflag, LONG pEncryptFlag, STRING pPassword,<STRING pNodeObject>)  !LONG  ! TESTED - 
!***********************************************************************************************************************
!(ByVal inData As Variant, ByVal zipFlag As Long, ByVal encryptFlag As Long, ByVal password As String) As Long
!Sets the node's content to a block of binary data with optional Zip compression and/or AES encryption. 
!The binary data is automatically converted to base64 format whenever XML text is generated. If the zipFlag is True, 
!the data is first compressed. If the encryptFlag is True, the data is AES encrypted using the 
!Rijndael 128-bit symmetric-encryption algorithm.
!Returns 1 for success, 0 for failure.

    CODE    
 !  RETURN SELF.XMLContainer{'SetBinaryContent('& CLIP(pInData) &',"' & CLIP(PZipflag) &'","' & CLIP(pEncryptFlag) &'","' & pPassword &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.SetBinaryContent('& CLIP(pInData) &',"' & CLIP(PZipflag) &'","' & CLIP(pEncryptFlag) &'","' & pPassword &'")'}
    ELSE 
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.SetBinaryContent('& CLIP(pInData) &',"' & CLIP(PZipflag) &'","' & CLIP(pEncryptFlag) &'","' & pPassword &'")'}
    END    
     
!***********************************************************************************************************************
ckXML.SetBinaryContentFromFile                     PROCEDURE(STRING pFileName, LONG PZipflag, LONG pEncryptFlag, STRING pPassword,<STRING pNodeObject>) !LONG ! TESTED - 
!***********************************************************************************************************************
!(ByVal filename As String, ByVal zipFlag As Long, ByVal encryptFlag As Long, ByVal password As String) As Long
!Sets the node's content with binary (or text) data from a file. The file contents can be Zip compressed and/or 
!encrypted, and the result is base-64 encoded.
!Returns 1 for success, 0 for failure.

    CODE    
!   RETURN SELF.XMLContainer{'SetBinaryContent('& CLIP(pFileName) &',"' & CLIP(PZipflag) &'","' & CLIP(pEncryptFlag) &'","' & pPassword &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.SetBinaryContent('& CLIP(pFileName) &',"' & CLIP(PZipflag) &'","' & CLIP(pEncryptFlag) &'","' & pPassword &'")'}
    ELSE 
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.SetBinaryContent('& CLIP(pFileName) &',"' & CLIP(PZipflag) &'","' & CLIP(pEncryptFlag) &'","' & pPassword &'")'}
    END   
  
!***********************************************************************************************************************
ckXML.SortByAttribute                              PROCEDURE(STRING pAttribute, LONG pAscending,<STRING pNodeObject>)              ! TESTED - 
!***********************************************************************************************************************
!(ByVal attrName As String, ByVal ascending As Long)
!Sorts the direct child nodes by the value of a specified attribute.

    CODE    
!   SELF.XMLContainer{'SortByAttribute(' & CLIP(pAttribute) & ',"' & CLIP(pAscending) &'")'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortByAttribute(' & CLIP(pAttribute) & ',"' & CLIP(pAscending) &'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortByAttribute(' & CLIP(pAttribute) & ',"' & CLIP(pAscending) &'")'}
    END  
    
!***********************************************************************************************************************
ckXML.SortByAttributeInt                           PROCEDURE(STRING pAttribute, LONG pAscending,<STRING pNodeObject>)                                               ! TESTED - 
!***********************************************************************************************************************
!(ByVal attrName As String, ByVal ascending As Long)
!Sorts the direct child nodes by the value of a specified attribute interpreted as an integer (not lexicographically as strings).

    CODE    
!   SELF.XMLContainer{'SortByAttributeInt(' & CLIP(pAttribute) & ',"' & CLIP(pAscending) &'")'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortByAttributeInt(' & CLIP(pAttribute) & ',"' & CLIP(pAscending) &'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortByAttributeInt(' & CLIP(pAttribute) & ',"' & CLIP(pAscending) &'")'}
    END    
    
!***********************************************************************************************************************
ckXML.SortByContent                                PROCEDURE(STRING pAscending,<STRING pNodeObject>)        ! TESTED - 
!***********************************************************************************************************************
!(ByVal ascending As Long)
!Sorts the direct child nodes by content.

    CODE
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortByContent("'& CLIP(pAscending)&'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortByContent("'& CLIP(pAscending)&'")'}
    END
    
!***********************************************************************************************************************
ckXML.SortByTag                                    PROCEDURE(LONG pAscending,<STRING pNodeObject>)           ! TESTED -  
!***********************************************************************************************************************
!(ByVal ascending As Long)
!Sorts the direct child nodes by tag.

    CODE    
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortByTag("'& CLIP(pAscending)&'")'} 
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortByTag("'& CLIP(pAscending)&'")'} 
    END    
       
!***********************************************************************************************************************
ckXML.SortRecordsByAttribute                       PROCEDURE(STRING pSorttag, STRING pAttribute, LONG pAscending,<STRING pNodeObject>)                                               ! TESTED - 
!***********************************************************************************************************************
!(ByVal sortTag As String, ByVal attrName As String, ByVal ascending As Long)
!Sorts the direct child nodes by the content of an attribute in the grandchild nodes.

    CODE    
    SELF.XMLContainer{'SortRecordsByAttribute('& CLIP(pSorttag) &',"' & CLIP(pAttribute) &'","' & pAscending &'")'}
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortRecordsByAttribute('& CLIP(pSorttag) &',"' & CLIP(pAttribute) &'","' & pAscending &'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortRecordsByAttribute('& CLIP(pSorttag) &',"' & CLIP(pAttribute) &'","' & pAscending &'")'}
    END   
    
!***********************************************************************************************************************
ckXML.SortRecordsByContent                         PROCEDURE(STRING pSorttag, LONG pAscending,<STRING pNodeObject>)  ! TESTED - 
!***********************************************************************************************************************
!(ByVal sortTag As String, ByVal ascending As Long)
!Sorts the direct child nodes by the content of the grandchild nodes.

    CODE    
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortRecordsByContent(' & CLIP(pSorttag) & ',"' & CLIP(pAscending) &'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortRecordsByContent(' & CLIP(pSorttag) & ',"' & CLIP(pAscending) &'")'}
    END     
    
!***********************************************************************************************************************
ckXML.SortRecordsByContentInt                      PROCEDURE(STRING pSorttag, LONG pAscending,<STRING pNodeObject>)                                               ! TESTED -  
!***********************************************************************************************************************
!(ByVal sortTag As String, ByVal ascending As Long)
!Sorts the direct child nodes by the content of the grandchild nodes. For sorting purposes, the content is interpreted 
!as an integer (not lexicographically as for strings).

    CODE    
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.SortRecordsByContentInt(' & CLIP(pSorttag) & ',' & pAscending &')'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.SortRecordsByContentInt(' & CLIP(pSorttag) & ',' & pAscending &')'}
    END     

!***********************************************************************************************************************
ckXML.SwapNode                                     PROCEDURE(STRING pSwapNodeObject, <STRING pNodeObject>) !LONG                        ! TESTED -   
!***********************************************************************************************************************
!(ByVal node As ChilkatXml) As Long
!Swaps another node's tag, content, and attributes with this one.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.SwapNode('& pSwapNodeObject &')'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.SwapNode('& pSwapNodeObject &')'} 
    END     
      
!***********************************************************************************************************************
ckXML.SwapTree                                     PROCEDURE(STRING pTree,<STRING pNodeObject>) !LONG                              ! TESTED - 
!***********************************************************************************************************************
!(ByVal tree As ChilkatXml) As Long
!Swaps another node's tag, content, attributes, and children with this one.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.SwapTree('& pTree &')'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.SwapTree('& pTree &')'}
    END         
    
!***********************************************************************************************************************
ckXML.TagContent                                   PROCEDURE(STRING pTag,<STRING pNodeObject>)!STRING                             ! TESTED - 
!***********************************************************************************************************************
!ByVal tagName As String) As String
!Returns the content of the 1st node found in the sub-tree rooted at the caller that has a given tag. (Note: The search 
!for the node having tag ARG is not limited to the direct children of the caller.)
!Returns Nothing on failure
    
    CODE    
!   RETURN SELF.XMLContainer{'TagContent("'& CLIP(pTag) &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.TagContent("'& CLIP(pTag) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.TagContent("'& CLIP(pTag) &'")'}
    END
       
!***********************************************************************************************************************
ckXML.TagEquals                                    PROCEDURE(STRING pTag,<STRING pNodeObject>) !LONG                               ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String) As Long
!Returns 1 if the node's tag equals the specified string.

    CODE    
!   RETURN SELF.XMLContainer{'TagEquals("'& CLIP(pTag) &'")'}
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.TagEquals("'& CLIP(pTag) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.TagEquals("'& CLIP(pTag) &'")'}
    END
    
!***********************************************************************************************************************
ckXML.UnzipContent                                 PROCEDURE(<STRING pNodeObject>) !LONG                                          ! TESTED - 
!***********************************************************************************************************************
!() As Long
!Unzip the content of the XML node replacing it's content with the decompressed data.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.UnzipContent'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.UnzipContent'}
    END    
    
!***********************************************************************************************************************
ckXML.UnzipTree                                    PROCEDURE(<STRING pNodeObject>) !LONG                                          ! TESTED - 
!***********************************************************************************************************************
!As Long
!Unzips and recreates the XML node and the entire subtree, restoring it to the state before it was zip compressed.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
      RETURN SELF.XMLContainer{ pNodeObject & '.UnzipTree'}
    ELSE
      RETURN SELF.XMLContainer{SELF.GetSelf() & '.UnzipTree'}
    END     
    
!***********************************************************************************************************************
ckXML.UpdateAttribute                              PROCEDURE(STRING pAttribute, STRING pValue,<STRING pNodeObject>) !LONG         ! TESTED - 
!***********************************************************************************************************************
!(ByVal attrName As String, ByVal attrValue As String) As Long
!Adds an attribute to the node if it doesn't already exist. Otherwise it updates the existing attribute with the new value.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.UpdateAttribute(' & CLIP(pAttribute) & ',"' & CLIP(pValue) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.UpdateAttribute(' & CLIP(pAttribute) & ',"' & CLIP(pValue) &'")'}
    END     
    
!***********************************************************************************************************************
ckXML.UpdateAttributeInt                           PROCEDURE(STRING pAttribute, STRING pValue,<STRING pNodeObject>) !LONG         ! TESTED -   
!***********************************************************************************************************************
!(ByVal attrName As String, ByVal value As Long) As Long
!Updates an attribute value. (Call UpdateAttribute if the attribute value is a string.)
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.UpdateAttributeInt(' & CLIP(pAttribute) & ',"' & CLIP(pValue) &'")'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.UpdateAttributeInt(' & CLIP(pAttribute) & ',"' & CLIP(pValue) &'")'}
    END       
       
!***********************************************************************************************************************
ckXML.UpdateChildContent                           PROCEDURE(STRING pTag, STRING pValue,<STRING pNodeObject>)                       ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String, ByVal value As String)
!Replaces the content of a child node.

    CODE    
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.UpdateChildContent(' & CLIP(pTag) & ',"' & CLIP(pValue) &'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.UpdateChildContent(' & CLIP(pTag) & ',"' & CLIP(pValue) &'")'}
    END
       
!***********************************************************************************************************************
ckXML.UpdateChildContentInt                        PROCEDURE(STRING pTag, STRING pValue,<STRING pNodeObject>)                       ! TESTED - 
!***********************************************************************************************************************
!(ByVal tag As String, ByVal value As Long)
!Replaces the content of a child node where the content is an integer.

    CODE    
    IF pNodeObject <> ''
        SELF.XMLContainer{ pNodeObject & '.UpdateChildContentInt(' & CLIP(pTag) & ',"' & CLIP(pValue) &'")'}
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.UpdateChildContentInt(' & CLIP(pTag) & ',"' & CLIP(pValue) &'")'}
    END
       
!***********************************************************************************************************************
ckXML.ZipContent                                   PROCEDURE(<STRING pNodeObject>)  !LONG                                         ! TESTED - 
!***********************************************************************************************************************
!() As Long
!Applies Zip compression to the content of an XML node and replaces the content with base64-encoded compressed data.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.ZipContent'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.ZipContent'}
    END
       
!***********************************************************************************************************************
ckXML.ZipTree                                      PROCEDURE(<STRING pNodeObject>) !LONG                                          ! TESTED - 
!***********************************************************************************************************************
!() As Long
!Zip compresses the content and entire subtree rooted at the calling XML node and replaces the current content with 
!base64-encoded Zip compressed data. The node and subtree can be restored by calling UnzipTree. Note that the node 
!name and attributes are unaffected.
!Returns 1 for success, 0 for failure.

    CODE    
    IF pNodeObject <> ''
       RETURN SELF.XMLContainer{ pNodeObject & '.ZipTree'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.ZipTree'}
    END
       
!***********************************************************************************************************************
ckXML.GetCdata                                     PROCEDURE(<STRING pObject>)!LONG                          ! TESTED -    
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       RETURN SELF.XMLContainer{pObject & '.Cdata'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.Cdata'}
    END 
    
!***********************************************************************************************************************
ckXML.SetCdata                                     PROCEDURE(LONG pCdata,<STRING pObject>) !True/False       ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       SELF.XMLContainer{pObject & '.Cdata'} = pCdata
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.Cdata'} = pCdata
    END         

!***********************************************************************************************************************
ckXML.GetContent                                   PROCEDURE(<STRING pObject>)!STRING                        ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       RETURN SELF.XMLContainer{pObject & '.Content'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.Content'}   
    END    
    
!***********************************************************************************************************************
ckXML.SetContent                                   PROCEDURE(STRING pContent,<STRING pObject>)                                ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       SELF.XMLContainer{pObject & '.Content'} = pContent
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.Content'} = pContent
    END        

!***********************************************************************************************************************
ckXML.GetContentInt                                PROCEDURE(<STRING pObject>)!LONG                                          ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       RETURN SELF.XMLContainer{pObject & '.ContentInt'} 
    ELSE
       RETURN SELF.XMLContainer{ SELF.GetSelf() & '.ContentInt'}   !SELF.ContentInt 
    END   
    
!***********************************************************************************************************************
ckXML.SetContentInt                                PROCEDURE(LONG pContentInt,<STRING pObject>)                               ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       SELF.XMLContainer{pObject & '.ContentInt'} = pContentInt
    ELSE       
       SELF.XMLContainer{SELF.GetSelf() & '.ContentInt'} = pContentInt
    END    
    
!***********************************************************************************************************************
ckXML.GetDebugLogFilePath                          PROCEDURE()!STRING                                        ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.DebugLogFilePath  

!***********************************************************************************************************************
ckXML.SetDebugLogFilePath                          PROCEDURE(STRING pDebugLogFilePath)                       ! TESTED - 
!***********************************************************************************************************************

    CODE
!   SELF.DebugLogFilePath = '"' & clip(pDebugLogFilePath) &'"' 
    SELF.XMLContainer{'DebugLogFilePath'} = '"' & clip(pDebugLogFilePath) &'"' 
 
!***********************************************************************************************************************
ckXML.GetDocType                                   PROCEDURE()!STRING                                        ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.DocType  

!***********************************************************************************************************************
ckXML.SetDocType                                   PROCEDURE(STRING pDocType,<STRING pNodeObject>)                 ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pNodeObject <> ''
       SELF.XMLContainer{ pNodeObject & '.DocType'} = pDocType 
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.DocType'} = pDocType 
    END  
    
!***********************************************************************************************************************
ckXML.GetEmitBom                                   PROCEDURE()!LONG                                          ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.EmitBom  
   
!***********************************************************************************************************************
ckXML.SetEmitBom                                   PROCEDURE(LONG pEmitBom)                                 ! TESTED - 
!***********************************************************************************************************************

    CODE
    SELF.EmitBom = pEmitBom   
   
!***********************************************************************************************************************
ckXML.GetEmitXmlDecl                               PROCEDURE()!LONG                                          ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.EmitXmlDecl   

!***********************************************************************************************************************
ckXML.SetEmitXmlDecl                               PROCEDURE(LONG pEmitXmlDecl)                              ! TESTED - 
!***********************************************************************************************************************

    CODE
    SELF.EmitXmlDecl = pEmitXmlDecl

!***********************************************************************************************************************
ckXML.GetEncoding                                  PROCEDURE()!STRING                                        ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.Encoding   
    
!***********************************************************************************************************************
ckXML.SetEncoding                                  PROCEDURE(STRING pEncoding)                               ! TESTED -  
!***********************************************************************************************************************

    CODE
    SELF.Encoding =  pEncoding
   
!***********************************************************************************************************************
ckXML.GetLastErrorHtml                             PROCEDURE(<STRING pObject>)!STRING   !Read-only           ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.XMLContainer{SELF.GetSelf() & '.LastErrorHtml'}  !RETURN SELF.LastErrorHtml  

!***********************************************************************************************************************
ckXML.GetLastErrorText                             PROCEDURE(<STRING pObject>)!STRING   !Read-only           ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.XMLContainer{SELF.GetSelf() & '.LastErrorText'}  !RETURN SELF.LastErrorText  
  
!***********************************************************************************************************************
ckXML.GetLastErrorXml                              PROCEDURE(<STRING pObject>)!STRING   !Read-only           ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.XMLContainer{SELF.GetSelf() & '.LastErrorXml'} !RETURN SELF.LastErrorXml  

!***********************************************************************************************************************
ckXML.GetNumAttributes                             PROCEDURE(<STRING pObject>)!LONG     !Read-only           ! TESTED -  
!***********************************************************************************************************************

    CODE  
    IF pObject <> ''
       RETURN SELF.XMLContainer{pObject & '.NumAttributes'} 
    ELSE       
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.NumAttributes'} 
    END    
 
!***********************************************************************************************************************
ckXML.GetNumChildren                               PROCEDURE(<STRING pObject>)!LONG     !Read-only           ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       RETURN SELF.XMLContainer{pObject & '.NumChildren'} 
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.NumChildren'} 
    END   

!***********************************************************************************************************************
ckXML.GetSortCaseInsensitive                       PROCEDURE()!LONG                                          ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.SortCaseInsensitive  

!***********************************************************************************************************************
ckXML.SetSortCaseInsensitive                       PROCEDURE(LONG pSortCaseInsensitive)                      ! TESTED - 
!***********************************************************************************************************************

    CODE
    SELF.SortCaseInsensitive = pSortCaseInsensitive 
 
!***********************************************************************************************************************
ckXML.GetStandalone                                PROCEDURE()!LONG                                          ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.Standalone   

!***********************************************************************************************************************
ckXML.SetStandalone                                PROCEDURE(LONG pStandalone)                               ! TESTED -   
!***********************************************************************************************************************

    CODE
    SELF.Standalone = pStandalone

!***********************************************************************************************************************
ckXML.GetTag                                       PROCEDURE(<STRING pObject>)!STRING                        ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       RETURN SELF.XMLContainer{pObject & '.Tag '}
    ELSE       
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.Tag '}
    END
    
!***********************************************************************************************************************
ckXML.SetTag                                       PROCEDURE(STRING pTag,<STRING pObject>)!STRING            ! TESTED - 
!***********************************************************************************************************************

    CODE
    IF pObject <> ''
       SELF.XMLContainer{pObject & '.Tag'} = pTag
    ELSE
       SELF.XMLContainer{SELF.GetSelf() & '.Tag'} = pTag
    END
    
!***********************************************************************************************************************
ckXML.GetTreeId                                    PROCEDURE(<STRING pTreeObject>)!LONG      !Read-only      ! TESTED - 
!***********************************************************************************************************************

    CODE  
    IF pTreeObject <> ''
       RETURN SELF.XMLContainer{pTreeObject & '.TreeID'}
    ELSE
       RETURN SELF.XMLContainer{SELF.GetSelf() & '.TreeID'}
    END
        
!***********************************************************************************************************************
ckXML.GetVerboseLogging                            PROCEDURE()!LONG                                          ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.VerboseLogging  

!***********************************************************************************************************************
ckXML.SetVerboseLogging                            PROCEDURE(LONG pVerboseLogging)                           ! TESTED - 
!***********************************************************************************************************************

    CODE
    SELF.VerboseLogging = pVerboseLogging

!***********************************************************************************************************************
ckXML.GetVersion                                   PROCEDURE()!STRING   !Read-only                           ! TESTED - 
!***********************************************************************************************************************

    CODE
    RETURN SELF.Version                                              
                                            
                                         






!
!Using a dummy hidden window to host the xml class
!
!
!Window WINDOW(' '),AT(,,72,29),GRAY,TOOLBOX
!        OLE,AT(2,13,68,14),USE(?XMLContainer)
!        END
!    END
!
!   OPEN(Window)
!   0{PROP:Hide}= TRUE
!   ACCEPT
!    CASE EVENT() 
!       OF Event:OpenWindow
!          Init(?XMLContainer)
!          Validate()
!          POST(EVENT:CloseWindow())
!
!       OF EVENT:CloseWindow
!          Kill()
!          
!    END
!   END 
   