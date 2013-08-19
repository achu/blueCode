<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KamalSample.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .trHeader {
            font-weight: bold;
            font-size: 20px;
        }
    </style>




</head>
<body>
    <form id="form1" runat="server">
        <script src="scripts/jquery-1.10.1.js"></script>
        <script type="text/javascript">
            /* onkeyup event, this method hits database by passing the charaters in the "txtName" textbox and fetches the result */
            $("body").on("keyup", "#txtName", function () {
                var myData = $("#txtName").val();
                $.ajax({
                    type: "POST"
                , data: "{'sName' : '" + myData + "'}"
                , url: "KamalSample.aspx/SampleMethod"
                , contentType: "application/json; charset=utf-8"
                , dataType: "json"
                , success: function (msg) {
                    BindGrid(msg);
                }
                , error: function (error) {
                    alert(error.status);
                }
                });
            });

            /* This method creates a table dynamically using the result from the database */
            function BindGrid(msg) {
                try {
                    var tableValues = msg.d;
                    tableValues = $.parseJSON(tableValues.slice(0, -1)); // This removes the semicolon(;), from the json string
                    $("#tblDetails").empty(); // This clears the table each time the result is fetched so that a new table is formed
                    if (msg.d.length > 0) {
                        $.each(tableValues.Super, function () {
                            $("#tblDetails").append("<tr><td>" + this.Name + "</td><td>" + this.Location + "<span id='spanEmail' style='display:none;'>" + this.Email + "</span></td><td><a id='aEmail" + this.Name + "' href='#'>Email</a></td></tr>");
                        });
                    }
                }
                catch (err) {
                    $("#tblDetails").empty();
                }
            }
            //        $("#btnTest").live("click", function() {
            //            $("#lbl").text('Hello World');
            //        });
            //$("#btn").live("click", function () {
            //    $("#tblTest tbody").append("<tr><td>Added Row</td></tr>");
            //});

            $("body").on("click", "#tblDetails a", function () {
                var rowIndex = $(this).parent().parent().attr('sectionRowIndex');
                var emailAddress = $("#tblDetails tr:eq(" + rowIndex + ") span").text();
                $("#lblEmailAddress").text(emailAddress);
                //$("#divEmail").attr('display', 'block');
                blockPage();
            });

            function blockPage() {
                var height = $(document).height();
                var width = $(document).width();
                var windowHeight = $(window).height();
                var divLoading = $("#divLoading");
                divLoading.css('height', height);
                var mouseX = 0;
                var mouseY = 0;

                divLoading.css({
                    'left': width / 2 - (divLoading.width() / 2),
                    'top': height / 2 - (divLoading.height() / 2),
                    'z-index': 15,
                    'position': 'absolute',
                    'opacity': 0.8,
                    'text-align': 'center',
                    'color': '#00FF1F',
                    'display': 'block'
                });
            }
        </script>
        <asp:ScriptManager ID="sm1" runat="server" />
        <div>
            A sample done for my friend Kamala Gopi Nathan on Jan 31, 2010. 
            This is a rough sample which is incomplete as he requested for a sample to load data using jquery ajax. 
            When you type something in text box (eg. j, a, o), it hits the database and displays the data just below the textbox
            <br />
            <asp:UpdatePanel ID="updTable" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    Type Name to Filter :
                <input type="text" id="txtName" />
                    <%--<input type="button" id="btnTest" runat="server" value="Show" />--%>
                    <label id="lbl">
                    </label>
                    <table id="tblDetails">
                        <thead>
                            <tr>
                                <td>
                                    <label class="trHeader">
                                        Name</label>
                                </td>
                                <td>
                                    <label class="trHeader">
                                        Location</label>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <input type="button" id="btn" value="Add Row" />
            <%--<table id="tblTest">
            <thead>
                <tr>
                    <td>
                        <strong>Header</strong>
                    </td>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>--%>
            <asp:UpdatePanel ID="upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Button ID="btnS" runat="server" Text="Server Buttom" />
                    <asp:Label ID="lblTest" runat="server" />
                    <div id="divLoading" style="background: #888888; width: 100%; display: none;">
                        <div id="divEmail">
                            <label id="lblEmailAddress" style="color: Black;">
                                To Email :
                            </label>
                            <textarea id="txtAreaEmail" rows="5" cols="10"></textarea>
                            <asp:Button ID="btnSendEmail" runat="server" Text="Send Email" OnClick="btnSendEmail_Click" />
                            <input type="button" value="close" onclick="$('#divLoading').css('display', 'none')" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
