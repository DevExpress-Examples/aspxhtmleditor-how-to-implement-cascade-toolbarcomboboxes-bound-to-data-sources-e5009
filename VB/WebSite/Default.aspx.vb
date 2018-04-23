Imports Microsoft.VisualBasic
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxHtmlEditor
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub ASPxCallbackPanel1_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
		AccessDataSourceCities.SelectParameters(0).DefaultValue = e.Parameter.ToString()
	End Sub
End Class