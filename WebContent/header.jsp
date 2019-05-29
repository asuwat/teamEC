<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<script type="text/javascript" src="./js/header.js"></script>
<header>
<div id="header-title">
leo
</div>
<ul id="header-list">
<s:form id="form" name = "form">
	<s:if test='#session.mCategoryDTOList!=null && #session.mCategoryDTOList.size()>0'>
		<li><s:select name="categoryId" list="#session.mCategoryDTOList" listValue="categoryName" listKey="categoryId" id="categoryId" /></li>
	</s:if>
	<li><s:textfield name="keywords" id="txt-keywords" placeholder="検索ワード" /></li>
	<li><s:submit value="商品検索"  onclick="SearchItemAction();" class="btn"/><li>
	<s:if test="#session.logined==1">
		<li><s:submit value="ログアウト"  onclick="LogoutAction();" class="btn"/></li>
	</s:if>
	<s:else>
		<li><s:submit value="ログイン"  onclick="GoLoginAction();" class="btn"/></li>
	</s:else>
	<li><s:submit value="カート" class="btn" onclick="CartAction();"/><li>
	<li><s:submit value="商品一覧" onclick="ProductListAction();" class="btn"/></li>
	<s:if test="#session.logined==1">
		<li><s:submit value="マイページ"  onclick="MyPageAction();" class="btn"/></li>
	</s:if>
</s:form>
</ul>
</header>