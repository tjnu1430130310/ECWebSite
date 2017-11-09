# ECWebSite

网购系统（Web开发课程结课大作业-2016/11到2016/12-项目负责人）：带领四人团队，使用ASP.NET WEB Form和SQL Server 2008R2数据库开发了一个适应IE6浏览器的web网购系统。开发过程中调配开发人员，编写程序代码实现相应功能，设计Logo和页面模板，解决测试人员提交的缺陷；发现并修改错误信息，针对出现的问题，与小组成员共同讨论，翻查各种开发方案，改正错误；书写开发文档、使用说明书等相关文件。成品获得了班级第一的优异成绩。

缺点：没有支付功能；没有物流模块

制作时参考了微软官网的各种文档和教程，仅供学习参考使用。

# 界面预览

![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7Products.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7Details.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7Login.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7Register.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7User.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7Cart.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7AddOrder.PNG)
![](https://github.com/tjnu1430130310/ECWebSite/blob/master/images/ECWebSitePhoto/%E6%8D%95%E8%8E%B7Order.PNG)



# Web网站结构和使用说明

## 1. 文档介绍

随着互联网迅速的崛起， 越来越多的人选择网上购物，各种网购平台顺势而出。本文主要用于产品阶段的工作成果，为相关领导、产品负责人、开发主管等领导决 策提供切实可靠的依据。

本系统采用asp.net框架。ASP.NET是用于构建现代web应用程序和服务与.NET开源web框架。ASP.NET创建网站基于 HTML5、CSS和JavaScript，简单，快速，并可以扩展到数以百万计的用户。

ASP.NET 是HTML5，CSS3，JavaScript和基于标准的网站建设。ASP.NET支持三种方法的web站点。ASP.NET Web窗体控件和事件模型用于基于组件的开发。ASP.NET的MVC旨在分离关注点，并使更容易测试驱动的开发。ASP.NET 网页中喜欢混合代码和 HTML 标记的单页面模型。

#### 基于Web窗体框架具有以下优点︰	

Web窗体支持通过 HTTP，有利于业务线 Web 应用程序开发保留状态的事件模型。基于 Web 窗体的应用程序提供了许多支持数百个服务器控件的事件。Web窗体使用一种页面控制器模式，将功能添加到单个页面。更多的信息，请参阅 MSDN 网站上的页面控制器。Web窗体使用视图状态或基于服务器的窗体，可以使管理状态信息更容易。Web窗体非常适合小团队的Web开发人员和设计师们想要利用大量的可用快速开发应用程序的组件。	一般情况下，Web窗体是应用程序开发的复杂程度较低，因为组件（Page类、 控件和等等）紧密集成，并且通常比MVC模型需要更少的代码。	

#### ASP.NET MVC框架具有以下优点︰
MVC框架不使用视图状态或基于服务器的窗体。这使得 MVC 框架特别适合开发人员想要完全控制应用程序的行为。MVC框架很容易通过将应用程序划分为模型、视图和控制器管理的复杂性。MVC框架使用处理 Web 应用程序请求通过单一控制器前端控制器模式。这使您能够设计支持丰富的路由基础结构的应用程序。MVC框架为测试驱动开发 (TDD) 提供了更好的支持。MVC框架非常适合 Web 应用程序支持那些需要高度控制应用程序行为的大型团队的开发人员和Web设计人员。

本系统开发团队人员简单，因此使用ASP.NET的Web窗体。使用ASP.NET Web 窗体，可以熟练的拖放、构建事件驱动模型以制作动态网站。设计图面和数以百计的控件和组件，可以快速地构建先进、强大UI驱动的站点与数据访问。本系统适用于Win XP、Win 8环境，部分功能不适用与IE6浏览器，推荐使用最新版本的世界之窗浏览器。

## 2. 系统总体设计

### 网站结构设计、布局与代码实现

Web网站页面总体分为上中下三个部分，上部为导航框Navigation，中部为主体Main，下部为脚注Footer。导航Navigation分为左右两个部分。左部分为Logo，右部分为首页Index、商城Product、购物车Cart的集合。导航Navigation对每个权限的用户（包括管理员、会员、游客）、每个页面都可见。其中，点击“首页”可以进入Index.aspx，点击“商城”可以进入Product.aspx，点击“购物车”只有VIP会员可以进入ShoppingCart.aspx页面、管理他的购物车。

中部Main也分为上部商品类目菜单ProductClassMenu和下部。

上部的商品类目菜单ProductClassMenu使用一个Menu控件，配合使用后台语句调出数据库中的CLASS_INFO表中的商品类目数据，并向Menu控件的NavigateUrl属性赋值，使得点击一个MenuItem，返回一个ClassID，并通过ClassID查询某个类别中的商品。

中部Main的下部左侧部分为一个站内搜索框和一个简易版本的用户面板Member Control。

用户面板Member Control使用LoginView控件。LoginView 控件为不同的用户显示不同的 Web 站点内容模板或视图。

在用户未登录时，用户权限为游客Visiter，用户面板显示Lable控件的“用户名”和“密码”，它们各自跟随一个TextBox控件，“登录”为Button控件，“没有账号？快注册吧！”为LinkButton控件，这些控件都存储在LoginView 控件的AnonymousTemplate模板中。游客可以在此状态下点击“登录”按钮获得Vip权限，也可以点击“没有账号？快注册吧！”转到注册页面Register.aspx填写Vip基本信息申请Vip账号。而“个人中心”与“退出”存放在LoggedInTemplate模板中，当VIP在线时显示。

用户登录后，用户面板显示用户的“个人中心”链接以及“退出”按钮，这些内容放置在LoginView 控件的LoggedInTemplate模板中。点击个人中心用户可以进入个人中心页面Member.aspx，点击“退出”按钮用户可以退出登录状态，退出后用户权限将降级为游客。本系统的LoginView 控件并未设置RoleGroups，使用数据库中的数据区分VIP会员权限与管理员权限。

在个人中心，VIP可以查看、修改个人信息，可以修改登录密码，可以管理购物车、管理订单，也可以返回“首页”“商城”页面。其中，个人信息的收货地址由省份Province、城市City、地址Address构成。

个人中心的左部是成员菜单MemberMenu，使用Menu控件。

如下面两图所示，当VIP登录时，只可访问“管理购物车”和“查看订单”页面。在“管理购物车”页面中，VIP可以查看购物车中的商品记录、修改购物车中需要购买的商品的数量，以及形成未支付的订单。在“查看订单”页面，VIP可以查看订单，包括已支付的订单和未支付的订单，可以修改和删除未支付的订单，但不可以删除已支付的订单。

管理员登录时，则可以访问“管理商品”“管理订单”“管理会员”页面，在“管理商品”页面中，管理员可以查看、编辑、新增、删除商品记录。在“管理订单”页面，管理员可以查看订单，可以编辑已支付的订单，删除已完成的订单，不可以对订单做除此以外的其他事情。

在“管理会员”页面，管理员可以查看、注销VIP会员，可以编辑会员的VIipRole会员等级但不可以编辑VIP会员其他的个人信息

关于用户的登陆，本系统使用窗体身份验证。FormsAuthenticationModule是托管代码的 ASP.NET 运行库的一部分。在微软的Internet信息服务(IIS) web服务器之前，是IIS的HTTP管道和ASP.NET运行库的管道之间的障碍。总之，在IIS 6和早期版本，FormsAuthenticationModule只在请求从IIS委派到ASP.NET运行时执行。默认情况下，IIS也会处理静态内容本身——像HTML页面和CSS和图像文件——只手关闭请求向 ASP.NET 运行时当请求一个扩展名为.aspx、.asmx 和.ashx 页。

默认情况下，ASP.NET 应用程序使用Windows身份验证。更改为窗体身份验证的身份验证类型，需要修改<authentication>元素模式属性的形式，代码如下：

<configuration>
    <system.web>
        <compilation debug="false" targetFramework="4.0" />
      <!--
            <authentication>节可以配置所使用的安全身份验证模式 ASP.NET 可以识别传入的用户。
        -->
      <authentication mode="Forms" />
    </system.web>
  ... ...
</configuration>

在创建窗体身份验证票证时，使用用户名文本框MemberNameLabel的Text属性作为窗体的用户名参数身份验证票，persistCookie参数则记录复选框的选中的状态，代码如下：

string MemberName = ((TextBox)MasterLoginView.FindControl("MemberNameTextBox")).Text.ToString().Trim();
...
FormsAuthentication.RedirectFromLoginPage(MemberName, ((CheckBox)MasterLoginView.FindControl("RememberCheckBox")).Checked);
    Request.IsAuthenticated 属性返回一个布尔值，指示该请求是否已经过身份验证。Page_Load 事件处理程序代码中输入以下代码︰
        if (Request.IsAuthenticated)
        {  // 用户经过身份验证
                ...
        }
        else
        {  //用户未经身份验证
            ...
        }

假设用户没有登录，用户将进入登录页面。

个人中心的右侧显示个人资料。个人资料使用了FromView控件，在产品详情页面也同样使用了FromView控件。FormView控件与 DetailsView 控件类似，可用于处理数据源中的单个记录。FormView控件与DetailsView控件之间的差别在于DetailsView控件使用表格布局，其中记录的每个域都分别逐行单另显示。而FormView控件则不指定用于显示记录的预定义布局。实际上，可以创建一个包含控件的模板，以显示记录中的各个域。该模板中包含用于创建表单的格式、控件和绑定表达式。

## 3. 系统配色风格与系统使用

系统总体风格简洁，无弹出广告，色彩搭配类似Visual Studio 2013纯色主题。在底色#EEEEF2（）的基础上，鼠标不聚焦在超级链接上时，显示 #858585（ ）颜色，当鼠标聚焦时则呈现#9983C0（）色彩。系统制作方的Email联系方式置于页面下方，方便用户随时联系并反馈意见。

进入主页，游客可以从左侧的面板登录，也可以不登录直接点击右上方的“商品”进入商品页面浏览并选购商品，但未登录时，游客点击“购物车”将不会进入购物车页面而是跳转到登录页面，只有游客登录获得VIP权限后方可查看并管理购物车。

没有账号的游客可以通过账号注册免费获得VIP账号。账号注册的四个项目为必填项，当游客获得VIP权限后，系统会自动跳转到登陆页面。在登录页面，获取了账号的游客输入账号和密码方可登录，打开新世界的大门，进行他（或她）的购物之旅。选购商品，即浏览商品，并将商品加入购物车生成订单并支付，待VIP确认支付后，整个交易完成。

登录后，VIP将进入他的个人中心，在个人中心，VIP可以查看、编辑他的资料，可以管理购物车与订单，可以退出账号。用户应当填写正确的个人信息，以使得平台能够为其提供优质服务。若VIP填写的资料并不完整，他新建的订单将不被系统允许通过。若订单因此原因未通过，VIP可以在订单页面填写他的个人资料。


VIP也可以返回购物车页面继续浏览并将商品加入购物车，可以将商品移出购物车，可以更改需要购买的商品数量。数量列的文本框可以使用框内右侧的按钮改变数字，也可以手动输入数字，但不可以输入除数字以外的其他字符。文本框使用了 type="Number"，也可以使用属性TextMode="Number"达到同样效果，但此方法不兼容IE6。

<asp:TextBox ...onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" ontextchange="ItemTotalCalcular(this);" Text='<%# Bind("Quantity") %>' type="Number"></asp:TextBox>

用户确认购物车信息后，可以点击结算生成未支付订单。

当用户完善其资料之后，系统才会为其新建订单，等待片刻，页面将自动跳转到用户的查看订单页面。在用户的查看订单页面，用户可以选择任一的订单查看，可以结算未支付订单，可以删除未支付订单和已完成订单。结算会使得订单状态从未支付状态UnPaid变化为已支付状态Paid，等待配送管理员改变已支付状态Paid到“正在配送”InTheWay并发货。货物到达VIP手中，VIP确认收货会使得订单状态变为已完成状态End，此时VIP可以删除已完成的订单。

用户可以在个人中心更改密码。

管理员登录页面独立于系统。可以看到，管理员界面与VIP界面类似。不同的是管理员可以进行商品管理、订单管理、VIP管理。

## 4. 电商，就是全世界也能买回家

我们的口号是“将世界购买回家”。随着网站平台的不断完善，我们有自信提供优质的、全方面的、个性化的服务，从你的全世界路过，将你的全世界送到家。下方的购物车类似一个e，即electronic，中文电子的、电子化，意味我们的平台是个电商平台。上方的地球代表全世界；地球正转到中国，代表服务商成立于中国，面向世界提供服务。




## 参考资料：
ASP.NET官网 网址：https://www.asp.net/
《SQL Database Driven Menu in ASP.NET (C#)》网址：http://www.aspnettutorials.com/tutorials/controls/sqldb-driven-menu-csharp/
《FormView 控件》网址：https://msdn.microsoft.com/zh-cn/library/cc295401.aspx
《An Overview of Forms Authentication (C#)》网址：https://www.asp.net/web-forms/overview/older-versions-security/introduction/an-overview-of-forms-authentication-cs
