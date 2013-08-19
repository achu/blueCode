using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Services;
using System.Text;
using System.Data.SqlClient;

public class RowElement
{
    public string id;
    public string[] cell;
}
public class SecondMethod
{
    public string name;
    public string location;
    public RowElement[] rows;
}
public partial class _Default : System.Web.UI.Page
{
    public static Random rnd = new Random(DateTime.Now.Millisecond);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string SampleMethod(string sName)
    {
        if (sName.Trim() != "")
        {
            //SqlConnection conn = new SqlConnection(@"Data Source=a584477f-8fef-4480-8e0f-a21f000fb4bc.sqlserver.sequelizer.com; Initial Catalog=dba584477f8fef44808e0fa21f000fb4bc; Uid=vckdcgbbafwfqrtn; Pwd=JddNNSWvanfTgKt8TDeV7FvYvX5fmzBpCrkTVb5grchZis6w33BhL7GdPnsYWQjH");
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["newConnection"].ToString());
            string sQuery = string.Format("Select Name, Location, Email from Details Where Name like '{0}%'", sName);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sQuery, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dt.TableName = "Super";
            if (dt.Rows.Count > 0)
            {
                //DataTable dt = new DataTable();
                //dt.Columns.Add("Name");
                //dt.Columns.Add("Location");
                //dt.TableName = "Super";
                //for (int i = 0; i < 10; i++)
                //{
                //    DataRow dr = dt.NewRow();

                //    dr["Name"] = GetValue(8);
                //    dr["Location"] = GetValue(10);

                //    dt.Rows.Add(dr);
                //}
                return GetJSONString(dt);
            }
            else
            {
                return "";
            }
        }
        else
        {
            return "";
        }
        //int iRowCount = dt.Rows.Count;
        //SecondMethod objSM = new SecondMethod();
        //objSM.rows = new RowElement[iRowCount];
        //for (int i = 0; i < dt.Rows.Count; i++)
        //{
        //    objSM.rows[i] = new RowElement();
        //    objSM.rows[i].cell = new string[2];
        //    objSM.rows[i].cell[0] = dt.Rows[i]["Name"].ToString();
        //    objSM.rows[i].cell[1] = dt.Rows[i]["Location"].ToString();

        //}
        //return objSM;
    }

    private static string GetValue(int p)
    {

        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < p; i++)
        {
            sb.Append(Convert.ToChar(Convert.ToInt32(Math.Floor(26 * rnd.NextDouble() + 65))));
        }
        return sb.ToString();
    }

    public static string GetJSONString(DataTable Dt)
    {

        string[] StrDc = new string[Dt.Columns.Count];

        string HeadStr = string.Empty;
        for (int i = 0; i < Dt.Columns.Count; i++)
        {

            StrDc[i] = Dt.Columns[i].Caption;
            HeadStr += "\"" + StrDc[i] + "\": \"" + StrDc[i] + i.ToString() + "¾" + "\",";

        }

        HeadStr = HeadStr.Substring(0, HeadStr.Length - 1);
        StringBuilder Sb = new StringBuilder();

        Sb.Append("{\"" + Dt.TableName + "\": [");
        for (int i = 0; i < Dt.Rows.Count; i++)
        {

            string TempStr = HeadStr;

            Sb.Append("{");
            for (int j = 0; j < Dt.Columns.Count; j++)
            {

                TempStr = TempStr.Replace(Dt.Columns[j] + j.ToString() + "¾", Dt.Rows[i][j].ToString());

            }
            Sb.Append(TempStr + "},");

        }
        Sb = new StringBuilder(Sb.ToString().Substring(0, Sb.ToString().Length - 1));

        Sb.Append("]};");
        return Sb.ToString();

    }

    public void btnSendEmail_Click(object sender, EventArgs e)
    {

    }
}
