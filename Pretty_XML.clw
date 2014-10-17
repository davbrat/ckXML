
  PROGRAM

OMIT('***')
 * Created with Clarion 9.1
 * User: dbratovi
 * Date: 10/7/2014
 * Time: 5:19 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

       MAP
Add_MSG                   PROCEDURE(STRING pMessage)
       END

       INCLUDE('EQUATES.CLW'),ONCE   
       INCLUDE('ckXML.Inc'),ONCE

Success          LONG

xml              ckXML
xml2             ckXML

Node_            STRING(20)  
Node_2           STRING(20)  
Node_3           STRING(20)  
CurrentNode_     STRING(20)
Parent_          STRING(20)   
Child_           STRING(20) 
NodeIndex        LONG

Value_           STRING(124)
TAG_             STRING(124)
CONTENTS_        STRING(1024)

Results_Q        QUEUE
Msg              STRING(1024)  
                 END 
                 
LIST1:Queue      QUEUE
Name_            STRING(40),NAME('Name')          !<Name>Debra Purvis</Name>
Phone_           STRING(40),NAME('Phone')         !<Phone>5592519060</Phone>
EmailAddress_    STRING(40),NAME('EmailAddress')  !<EmailAddress>dpurvis@payrollpeople.com</EmailAddress>
Signature_       STRING(40),NAME('Signature')     !<Signature>2337265786</Signature>
DateSigned_      STRING(40),NAME('Phone')         !<DateSigned>2014-09-02</DateSigned>
                 END


WINDOW WINDOW(' ckXML Class demo '),AT(,,579,315),GRAY,FONT('Segoe UI',10)
        OLE,AT(1,1,1,1),USE(?XML),CREATE('Chilkat_9_5_0.Xml.1')
        END
        OLE,AT(1,1,1,1),USE(?XML2),CREATE('Chilkat_9_5_0.Xml.1')
        END
        TEXT,AT(6,8,198,300),USE(?XML_DATA1),HVSCROLL,FONT(,8),COLOR(0F8FCFEH)
        BUTTON('Attribute Search'),AT(437,25,64),USE(?BUTTON:Search_Attribute)
        BUTTON('Currency Test'),AT(505,25,64),USE(?BUTTON:Currency)
        BUTTON('Node Search'),AT(438,42,64),USE(?BUTTON:Search_Node)
        BUTTON('Child w/Attr'),AT(505,42,64),USE(?BUTTON:CreateChildAttrib)
        BUTTON('Value Search'),AT(438,58,64),USE(?BUTTON:Search_Value)
        BUTTON('Site Map'),AT(505,58,64),USE(?Button:GoogleSiteMap)
        BUTTON('All Content'),AT(438,75,64),USE(?BUTTON:AllContent)
        BUTTON('Add Attribute'),AT(505,75,64),USE(?BUTTON:AddAttrib)
        BUTTON('Sort By Attribute '),AT(438,93,64,14),USE(?Button:SortByAttribute)
        BUTTON('Update Attribute'),AT(505,92,64),USE(?BUTTON:AddOrUpdateAttribute)
        BUTTON('Sort By Content'),AT(438,110,64,14),USE(?Button:SortByContent)
        BUTTON('CK Path'),AT(505,109,64),USE(?Button:ckPath)
        BUTTON('Sort By Attrib Int '),AT(438,126,64,14),USE(?Button:SortByAttributeInt)
        BUTTON('Encrypt/Decrypt'),AT(505,126,64),USE(?Button:EncryptDecrypt)
        BUTTON('Sort Recs:Attrib'),AT(438,143,64,14),USE(?Button:SortRecordsByAttribute) |
                
        BUTTON('Siblings'),AT(505,143,64),USE(?Button:Siblings)
        BUTTON('Sort Records'),AT(438,160,64,14),USE(?Button:RecordsSort)
        BUTTON('Add Tree'),AT(505,160,64),USE(?Button:AddTree)
        BUTTON(' '),AT(438,177,64,14),USE(?BUTTON:SetDocType:10)
        BUTTON('Zip/Unzip Tree'),AT(505,176,64),USE(?Button:CompressTree)
        BUTTON(' '),AT(438,194,64,14),USE(?BUTTON:SetDocType:11)
        BUTTON(' Swap Tree'),AT(505,193,64,14),USE(?BUTTON:SwapTree)
        BUTTON(' '),AT(438,210,64,14),USE(?BUTTON:SetDocType:12)
        BUTTON(' '),AT(505,210,64,14),USE(?BUTTON:SetDocType:9)
        BUTTON(' '),AT(437,227,64,14),USE(?BUTTON:SetDocType:8)
        BUTTON(' '),AT(505,227,64,14),USE(?BUTTON:SetDocType:13)
        BUTTON('Set DocType'),AT(437,244,64),USE(?BUTTON:SetDocType)
        BUTTON('Load XML '),AT(505,261,64),USE(?BUTTON:LoadXML)
        BUTTON('Swap Node '),AT(505,244,64,14),USE(?Button:SwapNode)
        BUTTON(' '),AT(438,261,64,14),USE(?BUTTON:SetDocType:15)
        BUTTON('Load Into Q '),AT(438,278,64,14),USE(?Button:LoadIntoQ)
        BUTTON('Save XML '),AT(505,278,64),USE(?BUTTON:saveXML)
        BUTTON(' '),AT(438,295,64,14),USE(?BUTTON:SetDocType:17)
        BUTTON('Close'),AT(505,295,64),USE(?BUTTON:Close)
        PROMPT('ChilKat Demos'),AT(505,12,64),USE(?PROMPT5),FONT(,,,FONT:bold),CENTER
        SHEET,AT(213,8,221,302),USE(?SHEET1)
            TAB('Main'),USE(?TAB:main)
                ENTRY(@s20),AT(263,25,62),USE(?Search_ENTRY)
                PROMPT('Search for...'),AT(219,29),USE(?PROMPT1)
                TEXT,AT(222,41,203,64),USE(?Results1),HVSCROLL
                LIST,AT(222,110,203,179),USE(?Results:List),HVSCROLL,FROM(Results_Q)
                BUTTON('Clear Messages'),AT(221,292,63),USE(?BUTTON:ClearMsgs)
            END
            TAB('Queue Data'),USE(?TAB:QData)
                LIST,AT(222,25,203,277),USE(?LIST1),HVSCROLL,FROM(LIST1:Queue), |
                        FORMAT('80L(2)|M~Name~80L(2)|M~Phone~80L(2)|M~Email~80L(' & |
                        '2)|M~Signature~80L(2)|M~Date Signed~')
            END
            TAB('Tab1'),USE(?TAB1)
                ENTRY(@s20),AT(278,25,83),USE(CurrentNode_)
                PROMPT('Node Object:'),AT(223,29),USE(?PromptCurrentNode)
                PROMPT('Parent Obj:'),AT(223,42),USE(?PromptParent)
                ENTRY(@s20),AT(278,40,83),USE(Parent_)
                PROMPT('Tag:'),AT(223,58),USE(?PROMPT2)
                ENTRY(@s255),AT(278,56,144),USE(TAG_)
                PROMPT('Contents:'),AT(223,73),USE(?PromptCONTENTS)
                ENTRY(@s255),AT(278,71,144),USE(Contents_)
                PROMPT('Attribute'),AT(223,87,36),USE(?PROMPT4)
                PROMPT('Value'),AT(223,100,42),USE(?PromptValue_)
                SPIN(@s20),AT(386,25,36),USE(NodeIndex),RANGE(0,1000),STEP(1)
                PROMPT('#'),AT(378,29),USE(?PROMPT3)
            END
        END
    END
    
    
XML_FileName     STRING(1024)

XML_File         FILE,Driver('DOS'),Name(XML_FileName)
RECORD           RECORD
Char             STRING(1)
                 END
                 END


dQ               QUEUE
Children         LONG
Tag              CSTRING(1024) 
Contents         CSTRING(1024) 
Self             STRING(20) 
Parent           STRING(20)
pTag             CSTRING(1024)
                 END

xmlObj          String(20)
childObj        String(20)
nextSibling     String(20)
prevSibling     String(20)
xYahooStr       String(1024)
                 
  CODE
  OPEN(WINDOW) 
  
  xml.Init(?XML)                                                                !pass the ole container via the init  
  xml.SetDebugLogFilePath('C:\Clarion9.1\Apps\Pretty_XML\debuglog.txt')
  xml.SetVerboseLogging(TRUE)
  xml2.Init(?XML2)
  ACCEPT
   CASE ACCEPTED()
      OF ?BUTTON:ClearMsgs
          FREE(Results_Q)
          
      OF ?Button:LoadIntoQ   
         IF FILEDIALOGA('Load XML file', XML_Filename,'*.xml',0,)
            Success = xml.LoadXmlFile(CLIP(XML_Filename))
            IF Success <> 1 
              CYCLE
            END        
            FREE(LIST1:Queue)
          
       !<Transmission xmlns="http://www.irs.gov/efile" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.irs.gov/efile/FSETV4.4/FSETV4.4/FSET/Transmission.xsd">
       !<TransmissionHeader recordCount="9">
       !<Jurisdiction>Ohio Business Gateway</Jurisdiction>
       !<TransmissionId>00000804</TransmissionId>
       ! <Timestamp>2014-10-07T09:07:50Z</Timestamp>
       ! <Transmitter>
       !<ETIN>42101</ETIN>
       !</Transmitter>
       !<ProcessType>T</ProcessType>
       !<AckAddress>ohreturns</AckAddress>
       
            ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
            DISPLAY
            Add_MSG('Test 1 FindChild ***********************')            
            child"  = xml.FindChild('TransmissionHeader') 
            child2" = xml.FindChild('Jurisdiction',child")
            LIST1:Queue.Name_ = xml.GetContent(child2")
            ADD(LIST1:Queue)            
            Add_MSG('Test 2 FindChild() & NextSibling() *****')            
            xml.GetRoot2()            
            childObj = xml.FindChild('TransmissionHeader')
            childObj = xml.FindChild('Jurisdiction',childObj)
            LOOP
               IF childObj = '' THEN BREAK .
               Add_MSG( xml.GetTag(childObj) & ': ' & xml.GetContent(childObj))
               nextSibling = xml.NextSibling(childobj)
               childobj    = nextSibling
            END             
            Add_MSG('Test 3 using SearchForTag() ***********')
            xml.GetRoot2()            
            childObj = xml.SearchForTag(xml.GetRoot(), 'Name')
            LOOP
               IF childObj = '' THEN BREAK .
               Add_MSG(xml.GetTag(childObj) & ': ' & xml.GetContent(childObj))
               nextSibling = xml.NextSibling(childobj)
               childobj    = nextSibling
            END  
            Add_MSG('Test 4 using ChilkatPath() ************')       
            xml.GetRoot2()   
            
            !Navigate to the 1st animal's picture and print the filename,description, and caption.
            !The "$" updates the caller's internal pointer to reference  the node that is the result of evaluating the path.
            !An empty string is returned for success, and a NULL/nil/0 pointer (reference) is returned on failure.
             
       !     Add_MSG(xml.ChilkatPath('Transmission|ReturnState|ReturnDataState|StateGeneralInformation|ReturnSigner|$'))
       !     result" = xml.ChilkatPath('/T/Transmission|TransmissionHeader|Jurisdiction|*')
                
       !     result" = xml.ChilkatPath('/T/Transmission|/T/ReturnState|/T/ReturnDataState|/T/StateGeneralInformation|/T/ReturnSigner|/T/Name|*') 
       !     Add_Msg('y result = ' & result")
         
       !     result" = xml.ChilkatPath('/C/name,Nigel|..|birth|*')
       !     Add_Msg(' result = ' & result")
      
            result" = xml.ChilkatPath('/T/Transmission|/T/ReturnState|ReturnDataState[0]|/T/StateGeneralInformation|/T/ReturnSigner|/T/Name|$')
            Add_Msg('z result = ' & xml.GetContent(xml.GetSelf()) ) 
           
            sibling" = xml.GetSelf()
            Add_Msg(  ' Sibling = ' &  sibling" )

            LOOP
               IF  sibling" = '' THEN BREAK .
               Add_Msg(xml.GetTag( sibling") & ': ' & xml.GetContent( sibling"))
               CASE UPPER(xml.GetTag( sibling"))
                  OF 'NAME'
                    LIST1:Queue.Name_ = xml.GetContent( sibling")
                  OF 'PHONE'
                     LIST1:Queue.Phone_ = xml.GetContent( sibling")
                  OF 'EMAILADDRESS'
                     LIST1:Queue.EmailAddress_ = xml.GetContent( sibling")
                  OF 'SIGNATURE'
                     LIST1:Queue.Signature_ = xml.GetContent( sibling")
                  OF 'DATESIGNED'
                     LIST1:Queue.DateSigned_ = xml.GetContent( sibling")
               END
               nextSibling = xml.NextSibling( sibling")
               sibling"   = nextSibling
             END  
             ADD(LIST1:Queue)

  !          result" =  xml.ChilkatPath('animal|gender|(spay-neuter)')              
  !   Message(Add_Msg('Display the value of the "spay-neuter" attribute of the 1st animal ')
  !           Add_Msg('ChilkatPath(''animal!gender!(spay-neuter)'') ')
  !           Add_Msg('Result = ' & result")
            
         END 
 
 
 
      OF ?BUTTON:LoadXML
         IF FILEDIALOGA('Load XML file', XML_Filename,'*.xml',0,)
            success = xml.LoadXMLFile(CLIP(XML_Filename))
            IF Success
            ELSE            
             ?XML_DATA1{PROP:TEXT} = xml.GetLastErrorText() 
             ?Results1{PROP:TEXT}  = xml.GetLastErrorhtml()
              Add_Msg(xml.GetLastErrorxml()) 
            END
            ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
            DISPLAY
         END 
         
     OF ?BUTTON:CreateChildAttrib
        Node_ = xml.GetSelf()
        xml.SetTag('Product',Node_)
        xml.SetContent('Here we go!!!!',Node_)
        LOOP X# = 1 TO RANDOM(1,10)
          Node_2 = xml.NewChild('NewChild x #'& x#, x#)
          LOOP y# = 1 TO RANDOM(1,3)
            Node_2 = xml.NewChild('NewChild y #'& y#, y#, Node_2)
          END
        END        
        ?Results1{PROP:TEXT}  = xml.GetLastErrorText(Node_) 
        ?XML_DATA1{PROP:TEXT} = xml.GetXml()
        DISPLAY
                
      OF ?BUTTON:AddAttrib  
         Node_ = xml.GetSelf()
         xml.SetTag('Product',Node_)
         xml.SetContent('Here we go!!!!',Node_)
         LOOP X# = 1 TO RANDOM(1,3)
           Node_2 = xml.NewChild('NewChildNode #'& x#, x#)
           LOOP y# = 1 TO RANDOM(1,2)
             Node_2 = xml.NewChild('NewChildSubNode #'& y#, y#, Node_2)
           END
         END        
         ?XML_DATA1{PROP:TEXT} = xml.GetXml()
         DISPLAY
     Add_Msg('Add a Atrribute a=123 to the root node')
         xml.AddAttribute('a','123')
         LOOP 4 times 
           xml.FirstChild2()                                     !Navigate to the 1st child.  After calling FirstChild2
           xml.AddAttribute('b','456')
           xml.FirstChild2()                                         
           xml.AddAttribute('c','"yahoo"')
           xml.AddAttribute('d','1000')
         END
         xml.GetRoot2()                                          !Revert back to the XML document root node
         ?XML_DATA1{PROP:TEXT} = xml.GetXml()
         DISPLAY
     Add_Msg('Adding Structure #2')
         Node_  = xml.GetSelf()
         Node_2 = xml.NewChild('sellingstuff','',Node_) 
         Node_3 = xml.NewChild('price','',Node_2)
         xml.AddAttribute('SellPrice','11.99',Node_3)            
         Node_3  = xml.NewChild('price','',Node_2)
         xml.AddAttribute('BasePrice','11.99',Node_3) 
         ?XML_DATA1{PROP:TEXT} = xml.GetXml()


     OF ?BUTTON:AddOrUpdateAttribute      
        xml.LoadXml('<abc a="123" b="apple">Test</abc>')           !Both will replace the attribute's value if it already exists, or insert a new attribute if it does not yet exist.
        ?XML_DATA1{PROP:TEXT} = xml.GetXml()
        Add_Msg('Loaded xml String into control.')
        Add_Msg('Using UpdateAttribute: Change the value of attribute "b" to "pear".')
        xml.UpdateAttribute('b','pear')                            !Change the value of attribute "b" to "pear".
        ?XML_DATA1{PROP:TEXT} = xml.GetXml()
        Add_Msg('Using UpdateAttribute: Because no attribute named "c" exists, UpdateAttribute will create it')
        xml.UpdateAttribute('c','orange')                          !Because no attribute named "c" exists, UpdateAttribute will create it:
        ?XML_DATA1{PROP:TEXT} = xml.GetXml()
        Add_Msg('Using AddToAttribute: If an attribute''s value is an integer, the AddToAttribute')
        Add_Msg('method may be called to update it by adding an integer value.')
        Add_Msg('For example, update the value of "a" to "130" by adding 7.' )
        xml.AddToAttribute('a','7')                                !If an attribute's value is an integer, the AddToAttribute
                                                                   !method may be called to update it by adding an integer value. For example, update the value of "a" to "130" by adding 7.
        ?XML_DATA1{PROP:TEXT} = xml.GetXml()


     OF ?BUTTON:Currency                                         !This file is available at http://www.chilkatsoft.com/testData/currency.xml
         Success = xml.LoadXmlFile('currency.xml')
         IF Success <> 1 
            MESSAGE( xml.GetLastErrorText())
            CYCLE
         END 
         Add_Msg('')
         Add_Msg('')
         Add_Msg('Currency test')
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()         
         n# = xml.NumChildrenHavingTag('CURRENCY')               !Iterate over each "CURRENCY" child node and display the contents:
         LOOP i# = 0 To n#-1
           curr" = xml.GetNthChildWithTag('CURRENCY',i#)
           Add_Msg('Name: '         & xml.GetChildContent('NAME',curr")        )
           Add_Msg('CURRENCYCODE: ' & xml.GetChildContent('CURRENCYCODE',curr"))
           Add_Msg('COUNTRY: '      & xml.GetChildContent('COUNTRY',curr")     )
           Add_Msg('')
         END               
            
     OF ?Button:GoogleSiteMap                                    !Load an XML sitemap:
         Success = xml.LoadXmlFile('sitemap.xml')                !xml.LoadXmlFile "sitemap.xml"  
         Add_Msg('')
         Add_Msg('Google Site Map Test')
         xUrl" = xml.FirstChild()                                !Loop over the records in the sitemap and display each URL.
         LOOP
           IF xURL" = '' THEN BREAK .                            !Do While Not (xUrl Is Nothing )
           Results_q.Msg  = 'Loc: ' & xml.XMLContainer{xUrl" &'.GetChildContent("loc")'} &'  '
           Add(Results_Q)
           xUrl" =   xml.XMLContainer{xUrl" & '.NextSibling()'}
         END
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()

     OF ?Button:ckPath
         success = xml.LoadXmlFile('pigs.xml')
         IF success <> 1
            CYCLE
         END 
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY        
         result" = xml.ChilkatPath('animal|species|*')                              !Get the content of the "species" node for the 1st animal:
         Add_Msg('result" = xml.ChilkatPath(''animal!species!*'')')
         Add_Msg('Result Output should be "pot belly pig"') 
         Add_Msg('Result = ' & result" )              
         result" = xml.ChilkatPath('animal[1]|type|*')
         Add_Msg('result" = xml.ChilkatPath(''animal[1]!type!*'')')
         Add_Msg('Get the content of the "type" node for the 2nd animal Indexing begins at 0. ')  
         Add_Msg('Therefore, the 2nd direct child having the tag "animal" is at index 1 ')
         Add_Msg('Result Output should be "House Pig"')
         Add_Msg('Result = ' & result" )             
         result" = xml.ChilkatPath('/C/name,Nigel|..|birth|*')
         Add_Msg('result = xml.ChilkatPath(''/C/name,Nigel!..!birth!*'')')
         Add_Msg('Find the pig having the name "Nigel" and display the birth date.') 
         Add_Msg('To do this, we''ll navigate to the node having tag="name" with the exact content "Nigel",')
         Add_Msg('then navigate up, and finally navigate back down to the "birth" node.')
         Add_Msg('Result Output should be "June, 1991"')
         Add_Msg('Result = ' & result" )                
         result" = xml.ChilkatPath('animal|picture|$')
         Add_Msg('result = xml.ChilkatPath(''animal!picture!$'')') 
         Add_Msg('Navigate to the 1st animal''s picture and print the filename, description, and caption.')
         Add_Msg('The "$" updates the caller''s internal pointer to reference the node that is the result of evaluating the path.')
         Add_Msg('An empty string is returned for success, and a NULL/nil/0 pointer (reference) is returned on failure. ')
         Add_Msg('Result = ' & result" )            
         IF result" = ''
         END
         Add_Msg('Display the contents of the file/description/caption child nodes ')
         Add_Msg('Picture Info: ')                                                     
         Add_Msg('Description: '  & xml.GetChildContent('description'))              
         Add_Msg('Caption: '      & xml.GetChildContent('caption')) 
         xml.GetRoot2() 
         result" =  xml.ChilkatPath('animal|gender|(spay-neuter)')              
         Add_Msg('Display the value of the "spay-neuter" attribute of the 1st animal ')
         Add_Msg('ChilkatPath(''animal!gender!(spay-neuter)'') ')
         Add_Msg('Result = ' & result")
               
      OF ?BUTTON:Search_Node
         
      OF ?BUTTON:Search_Attribute
         NODE_  = xml.GetRoot()  
         Node_2 = xml.SearchForAttribute(Node_,'fruit','color','*e')
         LOOP 
         IF Node_2 = '' THEN BREAK .
           Add_Msg(' Tag:'   & xml.GetTag(Node_2) & '='      & xml.GetContent(node_2) & ' ** ')
           ?Results1{prop:text} = ?Results1{prop:text} & ' Node: ' & clip(Node_)  & ' Children:'   & xml.XMLContainer{node_ &'.NumChildren'} & ' ** '
           Node_ = Node_2 
           Node_2 = xml.SearchForAttribute(Node_,'fruit','color','*')
         END   
         
      OF ?BUTTON:EncryptDecrypt                          !Demonstrates how to encrypt and decrypt the content of an XML node using 128-bit CBC AES encryption.
         success = xml.LoadXmlFile('fox.xml')
         IF success <> 1
           Cycle
         END
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY          
         xml.FirstChild2()                !Navigate to the "fox1" node, which is the 1st child
         xml.EncryptContent('myPassword') !Encrypt the content:
         xml.GetRoot2()                   !Navigate back to the root:
         Add_MSG('Now Encrypt the file')
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY 
         Add_Msg('This is the XML w/the first node encrypted content: ')
         Add_Msg('<root>')                                    
         Add_Msg(' <fox1>1hTtf7XmO+78H+OIr5eWHIuXxP78KPeYrZbsD0HX4negO9ZRqYMBY4s46sPNp+Q+|</fox1>')
         Add_Msg(' <fox2>The quick brown fox jumps over the lazy dog')
         Add_Msg('  <child1>ABC</child1>')
         Add_Msg('  <child2>XYZ</child2>')
         Add_Msg(' </fox2>')
         Add_Msg('</root>' )
         xml.FirstChild2()
         xml.DecryptContent('myPassword')
         xml.GetRoot2()
         Add_Msg('Now decrypt and show that the original content was restored:')
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY 
         xml.FindChild2('fox2')                     !First navigate to the "fox2" child.
         xml.EncryptContent('myPassword')
         xml.GetRoot2()
         Add_Msg('Now encrypt the content of the "fox2" node:')
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY               
         Add_Msg('This is the XML w/the "fox2" encrypted content:')
         Add_Msg('<root>')
         Add_Msg('<fox1>The quick brown fox jumps over the lazy dog</fox1>')
         Add_Msg('    <fox2>1hTtf7XmO+78H+OIr5eWHIuXxP78KPeYrZbsD0HX4negO9ZRqYMBY4s46sPNp+Q+')
         Add_Msg('<child1>ABC</child1>')
         Add_Msg('        <child2>XYZ</child2>')
         Add_Msg('        </fox2>')
         Add_Msg('    </root>')
         Add_Msg('|Notice that the *content* of the node is encrypted.  The child nodes are NOT encrypted.')
         Add_Msg('This is intentional.  To encrypt the content + the subtrees rooted at a given node,')
         Add_Msg('one would call ZipTree to transform the content and subtrees to Base64-encoded compressed content,') 
         Add_Msg('and then call EncryptContent to encrypt.')
         xml.FindChild2('fox2')
         xml.DecryptContent('myPassword')
         xml.GetRoot2() 
         Add_Msg('Finally, decrypt the "fox2" content:') 
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY           
         
      OF ?Button:AddTree       
         Add_Msg('First, build a sample XML document:')     
         xml.SetTag('stocks')
         xmlM"   = xml.NewChild('Microsoft','')
         xml.NewChild2('symbol','MSFT')
         xml.NewChild2('recentPrice','28.00')
         xmlG" = xml.NewChild('Google','')
         xml.NewChild2('symbol','GOOG')
         xml.NewChild2('recentPrice','440.00')
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY                

         Add_Msg('  This is the XML displayed:')
         Add_Msg('  <stocks>')
         Add_Msg('      <Microsoft>')
         Add_Msg('          <symbol>MSFT</symbol>')
         Add_Msg('          <recentPrice>28.00</recentPrice>')
         Add_Msg('      </Microsoft>')
         Add_Msg('      <Google>')
         Add_Msg('          <symbol>GOOG</symbol>')
         Add_Msg('          <recentPrice>440.00</recentPrice>')
         Add_Msg('      </Google>')
         Add_Msg('  </stocks>') 
         Add_Msg('We want to add Yahoo to it:')
         xYahooStr = '<Yahoo><symbol>YHOO</symbol><recentPrice>28.00</recentPrice></Yahoo>'
         xmlYahoo" = xml2.LoadXml(CLIP(xYahooStr))
         xmlYahoo" = xml2.GetSelf()           
         xml.AddChildTree(xmlYahoo")                !Add the xmlYahoo document just under the root node of our original XML document:
         xml.GetRoot2()
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY   
         
      OF ?BUTTON:Search_Value
          
      OF ?NodeIndex          
         CurrentNode_ = xml.GetChild(NodeIndex)
         TAG_         = xml.GetTag(CurrentNode_)
         Contents_    = xml.GetContent(CurrentNode_)
         Parent_      = xml.GetParent(CurrentNode_)
         UPDATE
         DISPLAY   
          
      OF ?BUTTON:AllContent
         Node_  = xml.GetSelf()
         Node_2 = xml.SearchAllForContent(Node_,'*')
         LOOP 
           IF Node_2 = '' THEN BREAK .
           Add_Msg('Tag: ' & xml.GetTag(Node_2) & '  =  ' & xml.GetContent(Node_2))
           Node_ = Node_2 
           Node_2 = xml.SearchAllForContent(Node_,'*')
         END

      OF ?Button:Siblings
         success = xml.LoadXmlFile('fruit.xml')
         IF success <> 1
         END 
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY   
         Add_Msg('SIBLINGS TEST ')        
         Add_Msg(' ')
         Add_Msg('[FirstChild/NextSibling]')
         childObj = xml.FirstChild()                                !Iterate over the direct children by using FirstChild/NextSibling
         LOOP
           IF childObj = '' THEN BREAK .
           Add_Msg('Tag/Content: ' & xml.GetTag(childObj) & ' : ' & xml.GetContent(childObj))
           nextSibling =  xml.NextSibling(childobj)
           childobj    =  nextSibling
         END             
         Add_Msg(' ')
         Add_Msg('[FirstChild2/NextSibling2]')
         success = xml.FirstChild2()                                    !Do the same, but with FirstChild2/NextSibling2 to avoid creating so many XML object instances:
         LOOP
           IF success = 0 THEN BREAK .
           Node_ = xml.GetSelf()
           Add_Msg('Tag/Content: ' & xml.GetTag(Node_) & ' : ' & xml.GetContent(Node_))
           Success =  xml.NextSibling2()
         END
         xml.GetParent2()                                               !Revert back up to the parent:
         Add_Msg(' ')
         Add_Msg('[LastChild/PrevSibling]')
         childObj = xml.LastChild()                                     !Iterate in reverse order using LastChild / PreviousSibling
         LOOP
           IF childObj = '' THEN BREAK .
           Add_Msg('Tag/Content: ' & xml.GetTag(childObj) & ' : ' & xml.GetContent(childObj))
           prevSibling =  xml.PreviousSibling(childobj)
           childobj    =  prevSibling
         END        
         Add_Msg(' ')
         Add_Msg('[LastChild2/PrevSibling2]')
         success = xml.LastChild2()             !Do the same, but with FirstChild2/NextSibling2 to avoid creating so many XML object instances:
         LOOP
           IF success = 0 THEN BREAK .
           Node_ = xml.GetSelf()
           Add_Msg('Tag/Content: ' & xml.GetTag(Node_) & ' : ' & xml.GetContent(Node_))
           Success =  xml.PreviousSibling2()
         END
         xml.GetParent2()                       !Revert back up to the parent:
    
   
      OF ?Button:SaveXML
         OPEN(XML_File,012H) 
         IF ERRORCODE()
            Add_Msg('Error OPEN ec: ' & ERRORCODE() &' '& ERROR())              
         END              
         EMPTY(XML_File)
         IF ERRORCODE()
            Add_Msg('Error OPEN ec: ' & ERRORCODE() &' '& ERROR())              
         END   
         CLOSE(XML_File)
         xml.SaveXml(CLIP(XML_Filename))  
         
      OF ?Button:CompressTree                    !The sample input XML is available at http://www.chilkatsoft.com/data/compress2.xml
         success = xml.LoadXmlFile('compress2.xml')
         IF success <> 1
           CYCLE
         END
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY        
    Add_Msg('Before "compress" subtree:')    
         xml.ZipTree()                           !Zip compress the root node's entire subtree:
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY   
    Add_Msg('This is the XML w/ the compressed subtree in Base64 encoded format:')
    Add_Msg('|<root><![CDATA[4+WyKcrPL7Hj5VIAApucxKrKlPx0KBcslJZfYReSkapQWJqZnK2QVJRfnqcAFFPIKs0tKFbIL0st')
    Add_Msg('|UigBSoN0KgC12uiDNECN00c1jyKzkjMyc1KQHZZelJiXAhElyUwkfTBnovDoYZGNPjTUAQ==]]></root>' )
    Add_Msg('Now uncompress and show that the original subtree was restored:')
         xml.UnzipTree() 
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY   
 
 
    OF ?BUTTON:SetDocType
         xml.SetTag('html', xml.GetSelf())
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY        
         xml.NewChild2('body','This is the html body')
     Add_Msg('Now setting the DOC type property')
         xml.SetDocType('<!DOCTYPE html PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"" ""http://www.w3.org/TR/html4/loose.dtd"">', xml.GetSelf())
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY  
 
    OF ?Button:SortByContent                      !The sample input XML is available at http://www.chilkatsoft.com/data/fruitSort2.xml
         success = xml.LoadXmlFile('Sort2.xml')
         IF success <> 1
            CYCLE
         END
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY  

         xSortRoot" = xml.FindChild('fruits')                !Sort the direct children under the "fruits" node by tag:
         bAscending# = 1                                     !Sort in ascending order.
         Add_Msg('Now sort by fruit in ascending order. ')
         xml.SortByContent(bAscending#,xSortRoot")            !Sort
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY           

         Add_Msg(' Note:  The "apples" node contains child nodes, but its')
         Add_Msg('text content is 0-length (empty).  Therefore, when sorting in')
         Add_Msg('ascending order, it will be positioned before the direct')
         Add_Msg('children containing non-empty content.')
         Add_Msg('<root>')
         Add_Msg('<fruits>')
         Add_Msg('  <apples>')
         Add_Msg('    <apple>granny smith</apple>')
         Add_Msg('    <apple>gala</apple>')
         Add_Msg('    <apple>fuji</apple>')
         Add_Msg('    <apple>mcintosh</apple>')
         Add_Msg('    <apple>honeycrisp</apple>')
         Add_Msg('  </apples>')
         Add_Msg('  <fruit>banana</fruit>')
         Add_Msg('    <fruit>blackberry</fruit>')
         Add_Msg('    <fruit>blueberry</fruit>')
         Add_Msg('    <fruit>orange</fruit>')
         Add_Msg('    <fruit>pear</fruit>')
         Add_Msg('  </fruits>')
         Add_Msg('</root>' )
         Add_Msg('Sort the direct children under the "apples" node  in ascending order. ' )
         xml.FindChild2('apples',xSortRoot")
         xml.SortByContent(bAscending#,xSortRoot")            !Sort            
         ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
         DISPLAY        

         Add_Msg(' ')
         Add_Msg('<root>')
         Add_Msg('<fruits>')              
         Add_Msg('  <apples>')
         Add_Msg('    <apple>fuji</apple>')
         Add_Msg('    <apple>gala</apple>')
         Add_Msg('    <apple>granny smith</apple>')
         Add_Msg('    <apple>honeycrisp</apple>')
         Add_Msg('    <apple>mcintosh</apple>')
         Add_Msg('  </apples>')
         Add_Msg('  <fruit>banana</fruit>')
         Add_Msg('    <fruit>blackberry</fruit>')
         Add_Msg('    <fruit>blueberry</fruit>')
         Add_Msg('    <fruit>orange</fruit>')
         Add_Msg('    <fruit>pear</fruit>')
         Add_Msg('  </fruits>')
         Add_Msg('</root>' )

       OF ?Button:SortByAttributeInt  
          success = xml.LoadXmlFile('Sort3.xml')
          IF success <> 1
          CYCLE
             END
          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY  
          xSortRoot" = xml.FindChild('fruits')                !Sort the direct children under the "fruits" node by tag:
          bAscending# = 1                                     !Sort in ascending order.
          Add_Msg('Now sort fruit by the "qty" Attribute in ascending order . ')
          xml.SortByAttributeInt('qty',bAscending#,xSortRoot")            !Sort   
          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY              
          Add_Msg(' Sort the direct children by the "qty" Attribute under the "apples" node in ascending order. ' )
          xml.FindChild2('apples',xSortRoot")
          xml.SortByAttributeInt('qty',bAscending#,xSortRoot")            !Sort            
          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY        
          
       
       OF ?Button:SortByAttribute  
          success = xml.LoadXmlFile('Sort3.xml')
          IF success <> 1
             CYCLE
          END
          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY  
          xSortRoot" = xml.FindChild('fruits')                            !Sort the direct children under the "fruits" node by tag:
          bAscending# = 0                                                 !Sort in ascending order.
          Add_Msg('Now sort fruit by the "color" attribute in ascending order . ')
          xml.GetRoot()
          xSortRoot" = xml.FindChild('fruits') 
          xml.SortByAttribute('color',bAscending#,xSortRoot")             !Sort
          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY       
          Add_Msg(' Sort the direct children by the "type" Attribute under the "apples" node in ascending order. ' )
          xml.FindChild2('apples',xSortRoot")
          xml.SortByAttributeInt('type',bAscending#,xSortRoot")           !Sort            
          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY  
   
       OF ?Button:SwapNode  
       
       OF ?Button:SwapTree  
          Add_Msg('First, build a sample XML document:')     
          xml.SetTag('stocks')  
          xmlM"   = xml.NewChild('Microsoft','')
          xml.NewChild2('symbol','MSFT')
          xml.NewChild2('recentPrice','28.00')

          xmlG" = xml.NewChild('Google','')
          xml.NewChild2('symbol','GOOG')
          xml.NewChild2('recentPrice','440.00')

          xmlG" = xml.NewChild('Yahoo','')
          xml.NewChild2('symbol','YHOO')
          xml.NewChild2('recentPrice','28.00')
           
          xmlG" = xml.NewChild('ClarionLive','')
          xml.NewChild2('symbol','GLVE')
          xml.NewChild2('recentPrice','1.95')
           
          xmlG" = xml.NewChild('Noyantis','')
          xml.NewChild2('symbol','NYTS')
          xml.NewChild2('recentPrice','18.20')
           
          xmlG" = xml.NewChild('Integrity Systems','')
          xml.NewChild2('symbol','ITGY')
          xml.NewChild2('recentPrice','91.50')
           
           


          ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
          DISPLAY                

    !       xYahooStr = '<Yahoo><symbol>YHOO</symbol><recentPrice>28.00</recentPrice></Yahoo>'
    !       xmlYahoo" = xml2.LoadXml(CLIP(xYahooStr))
    !       xmlYahoo" = xml2.GetSelf()           
    !       xml.AddChildTree(xmlYahoo")                !Add the xmlYahoo document just under the root node of our original XML document:
    !       xml.GetRoot2()
           ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
           DISPLAY   


       
 
       OF ?Button:RecordsSort
              success = xml.LoadXmlFile('fruitRecordsSort.xml')
              IF success <> 1
                 CYCLE
              END
              ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
              DISPLAY    
              Add_Msg('The "fruit" records are direct children of the "fruits" node.' )
              Add_Msg('Therefore, to sort the fruit records, the SortRecordsByContent' )
              Add_Msg('method must be called from the "fruits" node. ')
              xml.GetRoot()
              xSortRoot" = xml.FindChild('fruits', xml.GetSelf())
              bAscending# = 1
              xml.SortRecordsByContent('name',bAscending#,xSortRoot")              !Sort by the "name" field in ascending order.
              ?XML_DATA1{PROP:TEXT} =  xml.GetXml()
              DISPLAY   
       Add_Msg('Sorted looks like this')
              Add_Msg('<root>')
              Add_Msg('<fruits>')
              Add_Msg('    <fruit>')
              Add_Msg('        <name>apple</name>')
              Add_Msg('            <color>red</color>')
              Add_Msg('            </fruit>')
              Add_Msg('        <fruit>')
              Add_Msg('        <name>banana</name>')
              Add_Msg('            <color>yellow</color>')
              Add_Msg('            </fruit>')
              Add_Msg('        <fruit>')
              Add_Msg('        <name>blackberry</name>')
              Add_Msg('            <color>purple</color>')
              Add_Msg('            </fruit>')
              Add_Msg('        <fruit>')
              Add_Msg('        <name>blueberry</name>')
              Add_Msg('            <color>blue</color>')
              Add_Msg('            </fruit>')
              Add_Msg('        <fruit>')
              Add_Msg('        <name>orange</name>')
              Add_Msg('            <color>orange</color>')
              Add_Msg('            </fruit>')
              Add_Msg('        <fruit>')
              Add_Msg('        <name>pear</name>')
              Add_Msg('            <color>green</color>')
              Add_Msg('            </fruit>')
              Add_Msg('        </fruits>')
              Add_Msg('    </root>' )
 
   
     OF ?BUTTON:Close
        BREAK
   END
  END
  CLOSE(WINDOW)
  
  
Add_MSG                   PROCEDURE(STRING pMessage)

  CODE
  Results_Q.Msg = pMessage
  Add(Results_Q)
  
  
  
  
!Load_XML  ROUTINE
!  Search the sub-tree rooted at "searchRoot"
!  Set xSearchRoot = xml.FindChild("searchRoot")
!  Search for all nodes having the tag "fruit"
!  Set xBeginAfter = xml.GetSelf()
!  Set xFound = xSearchRoot.SearchForTag(xBeginAfter,"fruit")
!  Do While Not (xFound Is Nothing )
!  Text1.Text = Text1.Text & xFound.Content & vbCrLf
!  Set xBeginAfter = xFound
!  Set xFound = xSearchRoot.SearchForTag(xBeginAfter,"fruit")
!  Loop
!
!  Text1.Text = Text1.Text & "----" & vbCrLf
!
!
!  Now do the same, but instead use SearchForTag2
!  which updates the internal reference of the caller instead
!  of returning the found node.
!  Dim xSearch As ChilkatXml
!
!  Set xBeginAfter = xSearchRoot.GetSelf()
!  Set xSearch = xSearchRoot.GetSelf()
!
!  success = xSearch.SearchForTag2(xBeginAfter,"fruit")
!  Do While success = 1
!
!  Text1.Text = Text1.Text & xSearch.Content & vbCrLf
!    
!  Copy the internal references so that the next search
!  begins after the found node.
!  xBeginAfter.CopyRef xSearch
!  xSearch.CopyRef xSearchRoot
!    
!  success = xSearch.SearchForTag2(xBeginAfter,"fruit")
!  Loop
!


