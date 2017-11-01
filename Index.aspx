<%@ Page Title="" Language="C#" MasterPageFile="WebMainMaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<%@ Register Src="~/UserControl/Search.ascx" TagPrefix="uc1" TagName="Search" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/Index.css" />
    <link rel="Stylesheet" type="text/css" href="css/IndexSwitchImg.css" />
    <link rel="Stylesheet" type="text/css" href="css/sign.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebMainContentPlaceHolder" runat="Server">
    <div class="Main">
        <div id="IndexLogin">
            <div class="search">
                <uc1:Search runat="server" ID="Search" />
            </div>
            <div>
                
                <asp:LoginView ID="MasterLoginView" runat="server">
                    <AnonymousTemplate>
                        <div>
                            <div>
                                <div class="Label">
                                    <asp:Label ID="MemberNameLabel" runat="server" Text="账号："></asp:Label>
                                    <asp:TextBox ID="MemberNameTextBox" runat="server" placeholder="VIP Name" CssClass="TextBox"></asp:TextBox>
                                </div>
                                <div class="Label">
                                    <asp:Label ID="PasswordLabel" runat="server" Text="密码："></asp:Label>
                                    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Password" CssClass="TextBox"></asp:TextBox>
                                </div>
                                <div class="Label">
                                    <asp:CheckBox ID="RememberCheckBox" runat="server" Text="记住我" Checked="false" />
                                    <asp:Button ID="LoginButton" runat="server" Text="登录" OnClick="LoginButton_Click" CssClass="Button" /><br />
                                    <asp:Label ID="MsgLabel" runat="server" ForeColor="Red" Text="您输入的用户名或密码错误，请重新输入！"
                                        Visible="false" CssClass="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="Label">
                                <p>还没有账号？快去<a href="Member/Register.aspx">注册账号</a></p>
                            </div>
                        </div>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <div class="LoggedIn">
                            <ul>
                                <li>
                                    <asp:HyperLink ID="MemberHyperLink" runat="server" Text="个人中心" NavigateUrl="../Member/Member.aspx"></asp:HyperLink></li>
                                <li>
                                    <asp:LoginStatus ID="MasterLoginStatus" runat="server" LogoutText="退出" />
                                </li>
                            </ul>
                        </div>

                    </LoggedInTemplate>
                </asp:LoginView>

            </div>

        </div>
        <div class="SwitchMain">
            <div id="SwitchImg">
                <script type="text/javascript" src="js/try.js"></script>
                <div class="SwitchContainer" id="idContainer2">
                    <table id="idSlider2">
                        <tr>
                            <td>
                                <img src="images/Index/box1.jpg" /></td>
                            <td>
                                <img src="images/Index/box2.jpg" /></td>
                            <td>
                                <img src="images/Index/box3.jpg" /></td>
                            <td>
                                <img src="images/Index/box4.jpg" /></td>
                            <td>
                                <img src="images/Index/box5.jpg" /></td>
                        </tr>
                    </table>
                    <ul class="num" id="idNum">
                    </ul>
                </div>
                <br />
                <div class="center">
                    <input id="idAuto" type="button" value="停止" />
                    <input id="idPre" type="button" value="&lt;&lt;" />
                    <input id="idNext" type="button" value="&gt;&gt;" />
                    <select id="idTween">
                        <option value="0">默认缓动</option>
                        <option value="1">方式1</option>
                        <option value="2">方式2</option>
                    </select>
                </div>
                <script>
                    var forEach = function (array, callback, thisObject) {
                        if (array.forEach) {
                            array.forEach(callback, thisObject);
                        } else {
                            for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
                        }
                    }

                    var st = new SlideTrans("idContainer2", "idSlider2", 5, { Vertical: false });

                    var nums = [];
                    //插入数字
                    for (var i = 0, n = st._count - 1; i <= n;) {
                        (nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
                    }

                    forEach(nums, function (o, i) {
                        o.onmouseover = function () { o.className = "on"; st.Auto = false; st.Run(i); }
                        o.onmouseout = function () { o.className = ""; st.Auto = true; st.Run(); }
                    })

                    //设置按钮样式
                    st.onStart = function () {
                        forEach(nums, function (o, i) { o.className = st.Index == i ? "on" : ""; })
                    }

                    $("idAuto").onclick = function () {
                        if (st.Auto) {
                            st.Auto = false; st.Stop(); this.value = "自动";
                        } else {
                            st.Auto = true; st.Run(); this.value = "停止";
                        }
                    }
                    $("idNext").onclick = function () { st.Next(); }
                    $("idPre").onclick = function () { st.Previous(); }

                    $("idTween").onchange = function () {
                        switch (parseInt(this.value)) {
                            case 2:
                                st.Tween = Tween.Bounce.easeOut; break;
                            case 1:
                                st.Tween = Tween.Back.easeOut; break;
                            default:
                                st.Tween = Tween.Quart.easeOut;
                        }
                    }

                    st.Run();
                </script>
            </div>
            <!-- end of #SwitchImg -->
        </div>
    </div>
</asp:Content>

