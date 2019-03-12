<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="../common/decorator.jsp"></jsp:include>
<jsp:include page="../common/taglib.jsp"></jsp:include>
<html>
<head>
    <title>项目管理</title>
</head>

<body>

<div class="container-fluid">

    <div class="row" id="divSearch">
        <div class="col-md-3 col-lg-3">
            <button type="button" class="btn btn-default btn-md add">添加</button>
            <!-- data-toggle="modal" data-target="#myModal" -->
        </div>
        <div class="col-md-9 col-lg-9 text-right">
            <form class="form-search form-inline" action="#">
                <div class="form-group">
                    <label for="search_playerName">球员名称：</label>
                    <input type="text" class="form-control" id="search_playerName" placeholder=""/>
                </div>
                <%--<div class="form-group">--%>
                <%--<label for="search_teamBoss">球队老板：</label>--%>
                <%--<input type="text" class="form-control" id="search_teamBoss" placeholder="" />--%>
                <%--</div>--%>
                <button type="button" class="btn btn-default" id="btnSearch">查询</button>
            </form>
        </div>
    </div>

    <div class="row">
        <table id="table"
               class="table  table-condensed table-hover">
        </table>
    </div>

</div>

<!-- Modal 新增修改-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">球员信息</h4>
            </div>
            <div class="modal-body">
                <form id="formSave" class="form-save form-horizontal" method="post" action="#">
                    <input type="hidden" id="id" name="id"/>
                    <div class="form-group">
                        <label for="teamName" class="col-sm-2 control-label">所属球队：</label>
                        <div class="col-sm-10">
                            <select id="select">
                                <option value="" disabled>请选择</option>
                                <c:forEach items="${teamList}" var="item">
                                    <option value="${item.id}">${item.teamName}</option>
                                </c:forEach>
                            </select>

                            <input style="display: none !important " type="text" class="form-control" id="teamId"
                                   name="teamId" maxlength="50" value="${item.id}">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerName" class="col-sm-2 control-label">球员名字：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerName" name="playerName" maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerAge" class="col-sm-2 control-label">球员年龄：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerAge" name="playerAge" maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerHeight" class="col-sm-2 control-label">球员身高：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerHeight" name="playerHeight"
                                   maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerWeight" class="col-sm-2 control-label">球员体重：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerWeight" name="playerWeight"
                                   maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerArmlength" class="col-sm-2 control-label">球员臂展：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerArmlength" name="playerArmlength"
                                   maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerScore" class="col-sm-2 control-label">球员得分：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerScore" name="playerScore" maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerBackboard" class="col-sm-2 control-label">球员篮板：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerBackboard" name="playerBackboard"
                                   maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerAssists" class="col-sm-2 control-label">球员助攻：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerAssists" name="playerAssists"
                                   maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerState" class="col-sm-2 control-label">球员状态：</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="playerState" name="playerState" maxlength="50">
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="playerPhoto" class="col-sm-2 control-label">球员头像：</label>
                        <input type="text" class="form-control" id="playerPhoto" name="playerPhoto" maxlength="500"
                               style="display: none!important">
                        <div class="col-sm-10">
                            <form id="upload-file-form" enctype="multipart/form-data">
                                <input id="upload-file-input" type="file" name="uploadImage" accept="*"/>
                            </form>
                            <div class="help-inline"><font color="red">*</font></div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btnSave">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal 基础信息-->
<div class="modal fade" id="myModalView" tabindex="-1" role="dialog" aria-labelledby="myModalViewLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalViewLabel">球队信息</h4>
            </div>
            <div class="modal-body">
                <form id="formView" class="form-view form-horizontal" method="post" action="#">
                    <input type="hidden" id="id" name="id"/>
                    <div class="form-group">
                        <label for="teamName" class="col-sm-3 control-label">球队名字：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="teamName" name="teamName" maxlength="50"
                                   disabled="disabled">
                            <!-- <div class="help-inline"><font color="red">*</font></div> -->
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teamHistory" class="col-sm-3 control-label">球队历史：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="teamHistory" name="teamHistory" maxlength="50"
                                   disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teamManager" class="col-sm-3 control-label">球队经理：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="teamManager" name="teamManager"
                                   disabled="disabled"></input>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teamBoss" class="col-sm-3 control-label">球队老板：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="teamBoss" name="teamBoss"
                                   disabled="disabled"></input>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <!-- <button type="button" class="btn btn-primary" id="btnSave">保存</button> -->
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/static/jquery-plugins/jquery.download.js" type="text/javascript"></script>
<script type="text/javascript">
    var validator;
    $(function () {

        var $table = $('#table');
        $table.bootstrapTable({
            url: '${ctx}/playerInfo/scoreList',
            height: getTableHeight(),
            columns: [{
                field: '',
                title: '排名',
                width: '15%',
                formatter: function (value, row, index) {
                    return index+1;
                },
                align: 'center'
            },{
                field: 'id',
                title: '球员ID',
                width: '15%',
                align: 'center'
            }, {
                field: 'playerName',
                title: '球员名字',
                width: '15%',
                align: 'center'
            }, {
                field: 'playerAge',
                title: '球员年龄',
                width: '15%',
                align: 'center'
            }, {
                field: 'playerPhoto',
                title: '球员头像',
                width: '15%',
                align: 'center',
                formatter: function (value, row, index) {
                    return '<img src=' + value + ' style="width:50px;height50px">'
                }
            },{
                field: 'playerScore',
                title: '球员得分',
                width: '15%',
                align: 'center'
            }, {
                field: 'playerBackboard',
                title: '球员篮板',
                width: '15%',
                align: 'center'
            }, {
                field: 'playerAssists',
                title: '球员助攻',
                width: '15%',
                align: 'center'
            }, {
                field: '*',
                title: '操作',
                formatter: operateFormatter,
                events: operateEvents,
                width: '15%',
                align: 'center'
            }]
        });

        $table.on('load-success.bs.table', function (data) {
            //console.log("load-success...");
        });

        validator = $("#formSave").validate({
            rules: {
                projectName: {required: true, maxlength: 50},
                bizMgr: {required: true}
            }
        });

        // 新增,弹框
        $(".add").click(function () {
            $(".form-save").clearForm();
            $('#myModalLabel').html('新增');
            $('#myModal').modal('show');
            validator.resetForm();//清除验证错误的显示
        });

        // 保存
        $("#btnSave").click(function () {
            if ($("#formSave").valid()) {
                var obj = $(".form-save").getFormObject();
                $.ajaxPostJson("${ctx}/playerInfo/saveOrUpdate", obj, function (result) {
                    $('#table').bootstrapTable("refresh");
                    $('#myModal').modal('hide');
                    showMessage("操作成功!");
                });
            }
        });

        //监听select
        $("#select").change(function () {
            //要触发的事件
            var a = $("select option:checked").val(); // 选中项目的显示值
            console.log(a);

            // $("#teamId").attr("value",a);//只改变value不改变框内容
            $("#teamId").val(a);
            <%--value ="${item.id}">${item.teamName}--%>
        });

        //查询
        $("#btnSearch").click(function () {
            $table.bootstrapTable("refresh");
        });

        $("#btnExport").click(function () {

        });

        $(window).resize(function () {
            // 表格
            $table.bootstrapTable('resetView', {
                height: getTableHeight()
            });
        });

    });

    //表格配置全选框实现


    $("#all").on('click', function () {
        $("input[name='tableIds']").prop("checked", this.checked);
    });

    $("input[name='tableIds']").on('click', function () {
        var $subs = $("input[name='tableIds']");
        $("#all").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
    });

    // 修改、删除
    function operateFormatter(value, row, index) {
        var html = '';
        html += '<a class="edit" href="javascript:void(0)">修改</a> &nbsp;&nbsp;';
        html += '<a class="detail" href="javascript:void(0)">基础信息</a> &nbsp;&nbsp;';
        html += '<a class="remove" href="javascript:void(0)">删除</a> &nbsp;&nbsp;';
        /* html+= '<a class="export" href="javascript:void(0)">导出</a> &nbsp;&nbsp;'; */
        return html;
    }

    window.operateEvents = {
        'click .edit': function (e, value, row, index) {
            validator.resetForm();//清除验证错误的显示
            $('#myModal').modal('show');
            $('#myModalLabel').html('修改');
            $.ajaxPostJson("${ctx}/playerInfo/getById/" + row.id, {}, function (result) {
                if (result) {
                    console.log(result);

                    $(".form-save").setFormObject(result);
                    $("#select").val(result.teamId);
                }
            });
        },
        'click .remove': function (e, value, row, index) {
            $.ajaxPostJson("${ctx}/playerInfo/delete/" + row.id, {}, function (result) {
                $('#table').bootstrapTable("refresh");
                showMessage("操作成功!");
            });
        },
        'click .export': function (e, value, row, index) {
            jQuery.download("${ctx}/playerInfo/export/" + row.id, {});
        },
        'click .detail': function (e, value, row, index) {
            $.ajaxPostJson("${ctx}/playerInfo/getById/" + row.id, {}, function (result) {
                if (result) {
                    $('#myModalView').modal('show');
                    $(".form-view").setFormObject(result);
                }
            });
        }
    };

    $("#upload-file-input").on("change", uploadFile);

    function uploadFile() {
        console.log($("#upload-file-input"))
        var f = new FormData();
        f.append("image", $("#upload-file-input")[0].files[0])
        $.ajax({
            url: "${ctx}/image/uploadImage",
            type: "POST",
            data: f,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            success: function (res) {
                console.log(res)
                $("#playerPhoto").val(res);
            },
            error: function () {
                console.log(2)
            }
        });
    }
</script>
</body>
</html>