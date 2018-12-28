using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.ContentType = "image/png";
            Response.WriteFile(Server.MapPath("~/userfiles/" + Request.QueryString["file"]));
            Response.Flush();
            Response.End();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(fuImage.PostedFile.FileName);
        string str = DateTime.Now.ToString("hhmmssffffff") + filename;
        fuImage.SaveAs(Server.MapPath("~/userfiles/" + filename));

          // fred.Attributes.Add("Src", Server.MapPath("userfiles/" + str));
        string strdata = Server.MapPath("~/userfiles/" + filename);
        // fred.Attributes.Add("src", "http://www.jigzone.com/im/photo400300.gif");
        //fred.Attributes.Add("src", Server.MapPath("~/userfiles/" + filename));

        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        SqlCommand cmd = new SqlCommand("Insert into tblFileUpload (strFile) Values(@strFile)", con);
        cmd.Parameters.AddWithValue("@strFile", str);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
        //Response.Redirect("~/FriendList.aspx");
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
       
    }
}