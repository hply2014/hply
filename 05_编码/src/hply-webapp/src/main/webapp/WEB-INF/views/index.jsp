<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<div class="container main">
    <div class="row">
        <div class="col-sm-10 col-md-offset-1">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <h4>欢迎登录</h4>
                    <h1>工程项目核算系统</h1>
                </div>
            </div>
            <shiro:hasPermission name="`partybilling_step1`">
                <div class="panel panel-info">
                    <!-- Default panel contents -->
                    <div class="panel-heading">待审核的甲方开票</div>
                    <div class="panel-body">
                        <p>...</p>
                    </div>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="`partybilling_step1`">
                <div class="panel panel-success">
                    <!-- Default panel contents -->
                    <div class="panel-heading">待处理的用章申请（用章部门审核）</div>
                    <div class="panel-body">
                        <p>...</p>
                    </div>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="`partybilling_step1`">
                <div class="panel panel-success">
                    <!-- Default panel contents -->
                    <div class="panel-heading">待处理的用章申请（财务审核）</div>
                    <div class="panel-body">
                        <p>...</p>
                    </div>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="`partybilling_step1`">
                <div class="panel panel-success">
                    <!-- Default panel contents -->
                    <div class="panel-heading">待处理的用章申请（财务审核委托）</div>
                    <div class="panel-body">
                        <p>...</p>
                    </div>
                </div>
            </shiro:hasPermission>
            <shiro:hasPermission name="`partybilling_step1`">
                <div class="panel panel-success">
                    <!-- Default panel contents -->
                    <div class="panel-heading">待处理的用章申请（用章办理）</div>
                    <div class="panel-body">
                        <p>...</p>
                    </div>
                </div>
            </shiro:hasPermission>
        </div>
    </div>

</div>
<%@ include file="bottom.jsp"%>