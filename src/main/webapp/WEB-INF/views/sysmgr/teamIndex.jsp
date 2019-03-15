<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/decorator.jsp"></jsp:include>
<jsp:include page="../common/taglib.jsp"></jsp:include>

<html>
<head>
    <title>后台</title>
    <link href="${ctx}/static/metismenu/2.7.7/metisMenu.min.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/css/index.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<div id="messageDiv" style="display:none;position:fixed;top:40%;left:40%;transform: translate(-40%, -40%);background-color:#000;color:#fff;border-radius:4px;padding:10px;filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.6;">
    <span>提示信息</span>
</div>
<div id="main">
    <div id="header" role="navigation" class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
            <%-- <img alt="logo" src="${ctx}/static/images/logo.png" style="width:40px;float:left;margin-top:3px;" /> --%>
                <a class="navbar-brand" href="#"><font color="#fff" onclick="meunToggle()">NBA球队管理系统</font></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        <font color="#fff"><i class="fa fa-user"></i>${username}您好</font><span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${ctx}/sysmgr/updatePwdFace" target="mainFrame">修改密码</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${ctx}/logout">注销</a></li>
                    </ul>
                </li>
                <li>&nbsp;&nbsp;&nbsp;</li>
            </ul>
        </div>
    </div>
    <div id="content" class="container-fluid">
        <div class="row-fluid">
            <div id="left" class="sidebar">
                <div class="sidebar-nav navbar-collapse">
                <ul class="nav in nav-1-level metismenu" id="side-menu">
                    <li>
                        <a class="" href="/pro/homepage" target="mainFrame" aria-expanded="false">
                            <span class="fa fa-home"></span>
                            主页
                        </a>
                    </li>

                    <li>
                        <a class="" href="/pro/teamInfo/normalTeamList" target="mainFrame" aria-expanded="false">
                            <span class="fa fa-user"></span>
                            球队列表
                        </a>
                    </li>
                    <li>
                        <a class="" href="/pro/teamInfo/myTeam" target="mainFrame" aria-expanded="false">
                            <span class="fa fa-user"></span>
                            我的球队
                        </a>
                    </li>
                    <li>
                        <a class="" href="/pro/playerInfo/normalIndex" target="mainFrame" aria-expanded="false">
                            <span class="fa fa-list"></span>
                            球员列表
                        </a>
                    </li>
                    <li>
                        <a class="" href="/pro/gameInfo/normalIndex" target="mainFrame" aria-expanded="false">
                        <span class="fa fa-building"></span>
                        比赛
                    </a>
                    </li>
                    <li class="">
                        <a class="has-arrow" href="#" aria-expanded="false">
                            <span class="fa fa-navicon"></span>
                            球员排行榜
                        </a>
                        <ul class="nav nav-2-level collapse" aria-expanded="false" style="height: 1px;">
                            <li>
                                <a href="/pro/playerInfo/normalScore" target="mainFrame" aria-expanded="false">
                                    <span class="fa fa-user"></span>得分排行榜
                                </a>
                            </li>
                            <li>
                                <a href="/pro/playerInfo/normalBackboard" target="mainFrame" aria-expanded="false">
                                    <span class="fa fa-user"></span>篮板球排行榜
                                </a>
                            </li>
                            <li>
                                <a href="/pro/playerInfo/normalAssists" target="mainFrame" aria-expanded="false">
                                    <span class="fa fa-user"></span>助攻排行榜
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
         </div>
            <div id="right">
                <iframe id="mainFrame" name="mainFrame" src="${ctx }/homepage" style="overflow: visible;"
                        scrolling="yes" width="100%" height="600"></iframe>
            </div>

    </div>
</div>
</div>

<script src="${ctx}/static/metismenu/2.7.7/metisMenu.min.js" type="text/javascript"></script>
<script type="text/javascript">
    console.log("123123");

    console.log(${userTeamId} );
    var TOP_HEIGHT = 100;
    var breadCrumbArr = [];
    $(function () {
        console.log(1111)
        $('#side-menu').metisMenu();
        $("#mainFrame").css('height', $(window).height() - TOP_HEIGHT);
        $(window).resize(function () {
            $("#mainFrame").css('height', $(window).height() - TOP_HEIGHT);
        });

        // 点击高亮
        var lastClick = ""
        $('#side-menu a').click(function (e) {
            var thisClick = e.currentTarget.parentElement
            if (lastClick != thisClick) {
                $(lastClick).removeClass("active");
                $(thisClick).addClass("active");
                lastClick = e.currentTarget.parentElement
            }
        });
    });

    //菜单开关
    function meunToggle() {
        console.log($("#left").css("display"))
        if ($("#left").css("display") == "block") {
            $("#left").css("display", "none")
            $("#right").css("margin-left", "0px")
        } else {
            $("#left").css("display", "block")
            $("#right").css("margin-left", "196px")
        }
    }
</script>
</body>
</html>
