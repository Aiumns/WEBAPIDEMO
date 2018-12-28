<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     
     <script type="text/javascript">

         function setIframeSRC(objFRM, local_src) {
             alert(objFRM);
             alert(local_src);
             /////// None of this works and doesnt throw any error but load a blank page(about:blank)
             ///////////////////////////////
             /// attempt #1
             //document.getElementById(objFRM).src = local_src;
             /// attempt #2
             // testiframe.location.replace = local_src  // local_src = 'c:\\PDFS\\abc.pdf'
             /// attempt #3
             //objIFrame = document.getElementById(objFRM);
             //objIFrame.src = local_src;
             /// attempt #4
             //document.all.ctl00_cph_1_doc_frame.src = local_src;

             ////// This works   ////////
             //document.all.ctl00_cph_1_doc_frame.src = C:\\mypics\\me.jpg';
             ////////////////////////////

         }
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>       
        <table>          
            <tr>
                <td>
                    Photo/Image
                </td>
                <td>
                    <asp:FileUpload ID="fuImage" runat="server" accept=".png,.PNG,.bmp,.BMP,.jpeg,.JPEG,.jpg,.JPG" ></asp:FileUpload>   
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btnBack" runat="server" Text="View File" 
                        onclick="btnBack_Click" />

                        
                </td>
            </tr>
        </table>

        <iframe runat="server" id="fred" style="border:1px solid #666CCC" visible="false" title="PDF in an i-Frame" frameborder="1" scrolling="auto" height="1100" width="850" ></iframe>

<%--        <object data="http://www.jigzone.com/im/photo400300.gif" type="application/pdf">
              <embed src="http://www.jigzone.com/im/photo400300.gif" type="application/pdf" />
        </object>--%>

        <iframe id="iFrame" width="500"></iframe>
        <input type="button" value="Load" onclick="setIframeSRC('iFrame', 'file://C:\\Users\\JITENDRA\\Desktop\\msdn.pdf');" />
    
        <%-- <iframe src = "DisplayPage.aspx?file=air-waybill.jpg" height = "200px" width = "200px"></iframe>--%>
         <iframe src = "DisplayPage.aspx?file=360Logo.JPG"  style=" display:none;border:1px solid #666CCC" visible="false" title="PDF in an i-Frame" frameborder="1" scrolling="auto" height="1100" width="850"></iframe>
         <%--<object data="your_url_to_pdf" type="application/pdf">
            <embed src="your_url_to_pdf" type="application/pdf" />
         </object>--%>
    </div>
    </form>
</body>
</html>
