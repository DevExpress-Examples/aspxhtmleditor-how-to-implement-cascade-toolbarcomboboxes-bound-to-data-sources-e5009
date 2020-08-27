<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Cascade ToolbarComboBoxes in the toolbox of the ASPxHtmlEditor</title>
		<script type="text/javascript">
			var checkboxValue = "";
			function OnValueChanged(s, e) {
				cp.PerformCallback(s.GetValue());
				checkboxValue = s.GetValue();
			}

			function OnHtmlEditorInit(s, e) {
				s.SetToolbarComboBoxValue("chCountry", checkboxValue);
			}

			function OnHtmlEditorCommand(s, e) {

			}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="cp" runat="server" Width="200px" OnCallback="ASPxCallbackPanel1_Callback">
			<PanelCollection>
				<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server">
						<ClientSideEvents Init="OnHtmlEditorInit" CustomCommand="OnHtmlEditorCommand" />
						<Toolbars>
							<dx:HtmlEditorToolbar>
								<Items>
									<dx:ToolbarComboBox CommandName="chCountry" PropertiesComboBox-ClientSideEvents-ValueChanged="OnValueChanged">                                 
										<PropertiesComboBox TextField="Country" ValueField="Country" DataSourceID="AccessDataSourceCountry" />
									</dx:ToolbarComboBox>
									<dx:ToolbarComboBox>
										<PropertiesComboBox TextField="City" ValueField="City" DataSourceID="AccessDataSourceCities" />
									</dx:ToolbarComboBox>
								</Items>
							</dx:HtmlEditorToolbar>
						</Toolbars>
					</dx:ASPxHtmlEditor>
				</dx:PanelContent>
			</PanelCollection>
		</dx:ASPxCallbackPanel>
		<asp:AccessDataSource ID="AccessDataSourceCountry" runat="server" DataFile="~/App_Data/WorldCities.mdb"
			SelectCommand="SELECT cr.Country, c.City as Capital FROM [Cities] c, [Countries] cr WHERE c.CityId = cr.CapitalId order by cr.Country"></asp:AccessDataSource>
		<asp:AccessDataSource ID="AccessDataSourceCities" runat="server" DataFile="~/App_Data/WorldCities.mdb"
			SelectCommand="SELECT c.City FROM [Cities] c, [Countries] cr WHERE (c.CountryId = cr.CountryId) AND (cr.Country = @Country) order by c.City">
			<SelectParameters>
				<asp:Parameter Name="Country"/>
			</SelectParameters>
		</asp:AccessDataSource>
	</form>
</body>
</html>