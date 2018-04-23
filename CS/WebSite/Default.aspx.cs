using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxHtmlEditor;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        AccessDataSourceCities.SelectParameters[0].DefaultValue = e.Parameter.ToString();
    }
}