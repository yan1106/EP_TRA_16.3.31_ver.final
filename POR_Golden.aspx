<%@ Page Language="C#" AutoEventWireup="true" CodeFile="POR_Golden.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>POR_Golden!</title>
<head runat="server">
    <link rel="stylesheet" href="..\css\styles.css" type="text/css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://jqueryui.com/resources/demos/external/jquery.bgiframe-2.1.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script type="text/javascript">
    function Confirm(strMsg, strData) {
        var isOK = confirm(strMsg);
        if (isOK) {
            PageMethods.CreateJob(strData, OnSuccess, OnFail);
                
        }
    }
    function OnSuccess(receiveData, userContext, methodName) {
        //成功時，目地控制項顯示所接收結果
        if (receiveData == "") {
            window.parent.$('#dialog').dialog('close');
            window.parent.$('#cmdFilter').click();
        } else {
            alert(methodName + ": " + receiveData);
        }
    }

    function OnFail(error, userContext, methodName) {
        if (error != null) {
            alert(methodName + ": " + error.get_message());
        }
    }
</script>
 <style type="text/css">
     .style2
        {
            color: #FFFFFF;            
        }
 </style>
</head>
<body>
    <form id="form1"  runat="server">
          
      
    <asp:Panel ID="CPSP_Panel" runat="server" Visible="true" Width="1079px">             
    <fieldset style="margin:auto;" class="fieldset">
    <legend class="legend" style="font-weight: 700; font-size: large;">POR Golden Condition</legend>
        
        <%--<table class="auto-style160">
            <tr>
                <td class="auto-style166"><span class="auto-style98"><strong>PKG </strong></span></td>
                <td class="auto-style164">
                    <asp:TextBox ID="PKG_TextBox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style159"><strong>FAB</strong></td>
                <td class="auto-style158">
                    <asp:TextBox ID="FAB" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style161"><strong><span class="auto-style106">RVSI(Y/N)</span></strong></td>
                <td class="auto-style158" style="text-align: left">
                    <asp:DropDownList ID="RVSI_ddl1" runat="server" Height="20px" Width="80px">
                        <asp:ListItem Value="&quot;&quot;">請選擇</asp:ListItem>
                        <asp:ListItem>Y</asp:ListItem>
                        <asp:ListItem>N</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style163"><strong>Production Site</strong></td>
                <td class="auto-style158">
                    <asp:DropDownList ID="ProSite_ddl" runat="server" Height="20px" Width="80px">
                        <asp:ListItem Value="&quot;&quot;">請選擇</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style167"><span class="auto-style156">　</span><span class="auto-style168"><strong>Wafer Tech.(nm)</strong></span></td>
                <td class="auto-style165">
                    <asp:TextBox ID="WaferT_TextBox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style157"><span class="auto-style168"><strong>Wafer PSV type / Thickness</strong></span></td>
                <td class="auto-style169">
                    <asp:TextBox ID="WaferPSV_TextBox" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style162"><strong><span class="auto-style107">Customer</span></strong></td>
                <td class="auto-style169">
                    <asp:TextBox ID="Customer_TextBox" runat="server"></asp:TextBox>
                </td>
                <td colspan="2" style="text-align: center">
                    
                    <asp:Button ID="Search_por" runat="server" class="blueButton button2" OnClick="Search_por_Click" Text="Search" />
                    
                   
                </td>
            </tr>
        </table>--%>
         <table style="width: 100%;">
              <tr>
                  <th bgcolor="#006699" Width="150px" class="style2">Production Site</th>
                  <td bgcolor="White" Width="50px"> 
                  <asp:DropDownList ID="ProSite_ddl" runat="server" Height="25px">
                            <asp:ListItem Value="0">All Site</asp:ListItem>
                        </asp:DropDownList>                                     
                  </td>
                  <th bgcolor="#006699" Width="150px" class="style2">PKG</th>
                  <td bgcolor="#fff" Width="150px"><asp:TextBox ID="PKG_TextBox" runat="server" 
                          Width="150px" Height="20px"></asp:TextBox></td>
                  <th bgcolor="#006699" Width="150px" class="style2">Wafer Tech.(nm)</th>
                  <td bgcolor="#FFFFFF" Width="100px"><asp:TextBox ID="WaferT_TextBox" runat="server" 
                          Width="100px" Height="20px"></asp:TextBox></td>
                  <th bgcolor="#006699" class="style2" Width="100px">FAB</th>
                  <td bgcolor="#fff" Width="100px"><%-- <asp:DropDownList ID="ddl_Fab" runat="server">
                            <asp:ListItem Value="0">All FAB</asp:ListItem>
                            <asp:ListItem Value="GF">GF</asp:ListItem>
                            <asp:ListItem Value="SMIC">SMIC</asp:ListItem>
                            <asp:ListItem Value="TSMC">TSMC</asp:ListItem>
                            <asp:ListItem Value="UMC">UMC</asp:ListItem>
                        </asp:DropDownList>--%>
                         <asp:TextBox ID="FAB" runat="server" Width="100px" Height="20px"></asp:TextBox>
                  </td>
              </tr>
              <tr>
                  <th bgcolor="#006699" class="style2">Wafer PSV Type/Thickness</th>     
                  <td bgcolor="#fff"><asp:TextBox ID="WaferPSV_TextBox" runat="server"></asp:TextBox> </td>            
                  <%--<td bgcolor="#fff"><asp:DropDownList ID="ddl_PSV" runat="server" Height="25px">
                            <asp:ListItem Value="0">All</asp:ListItem>
                            <asp:ListItem Value="SiN">SiN</asp:ListItem>
                            <asp:ListItem Value="TSMC PI">TSMC PI</asp:ListItem>
                        </asp:DropDownList></td>--%>
                  <th bgcolor="#006699" class="style2">RSVI(Y/N)</th>
                  <td bgcolor="#FFFFFF"> <asp:DropDownList ID="RVSI_ddl1" runat="server" Height="25px">
                            <asp:ListItem Value="0">All RSVI</asp:ListItem>
                            <asp:ListItem Value="Y">Y</asp:ListItem>
                            <asp:ListItem Value="N">N</asp:ListItem>
                        </asp:DropDownList></td>
                  <th bgcolor="#006699" class="style2">Customer</th>
                  <td bgcolor="#fff" Width="100px"><asp:TextBox ID="Customer_TextBox" runat="server" 
                          Width="100px" Height="20px"></asp:TextBox></td>
                  <td colspan="2" style="text-align: center">
                      <asp:Button ID="btn_Search" runat="server" Text="Search" class="blueButton button2"
                          onclick="Search_por_Click" Height="25px" />                          
                  </td>
              </tr>
          </table>        
        </fieldset>
        <br/    >        
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True"></asp:ScriptManager>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" CellPadding="3" Height="170px"
               DataKeyNames="POR_Customer,POR_Device" 
        onrowcommand="GridView1_RowCommand" 
                   AllowPaging="True" OnPageIndexChanged="GridView1_PageIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="7" AllowSorting="True" >
                <HeaderStyle Height="50px" ></HeaderStyle>
                <Columns>
                    <asp:ButtonField CommandName="yan" Text="選取"  />
                    <asp:BoundField DataField="POR_17" HeaderText="*Device" />
                    <asp:BoundField DataField="POR_01" HeaderText="*Production Site" />
                    <asp:BoundField DataField="POR_02" HeaderText="*PKG " />
                    <asp:BoundField DataField="POR_03" HeaderText="*Wafer Tech.(nm)" />
                    <asp:BoundField DataField="POR_04" HeaderText="*FAB" />
                    <asp:BoundField DataField="POR_05" HeaderText="*Wafer PSV type / Thickness" />
                    <asp:BoundField DataField="POR_11" HeaderText="*RVSI(Y/N)" />
                    <asp:BoundField DataField="POR_14" HeaderText="*Customer" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Right" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />

            </asp:GridView>
            <br />
        <br />
        </asp:Panel>
      
    </form>
</body>
</html>
