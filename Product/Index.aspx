<%@ Page Title="" Language="C#" MasterPageFile="~/Product/Product.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Product_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProductListContentPlaceHolder" Runat="Server">
    <div id="SwitchImg">
        <link rel="Stylesheet" type="text/css" href="../css/IndexSwitchImg.css" />
        <script type="text/javascript" src="../js/try.js"></script>
        <div class="SwitchContainer" id="idContainer2">
            <table id="idSlider2">
                <tr>
                    <td>
                        <img src="../images/Index/box1.jpg" /></td>
                    <td>
                        <img src="../images/Index/box2.jpg" /></td>
                    <td>
                        <img src="../images/Index/box3.jpg" /></td>
                    <td>
                        <img src="../images/Index/box4.jpg" /></td>
                    <td>
                        <img src="../images/Index/box5.jpg" /></td>
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
            for (var i = 0, n = st._count - 1; i <= n; ) {
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
    </div><!-- end of #SwitchImg -->
</asp:Content>

