<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
</head>
<body>
    <div class="page-header">
        <h1>
            <i class="icon-search"></i>
            <g:message code="app.search.label"/>
            <small>
            Quick find your data
            </small>
        </h1>
    </div>

<div class="row rowbar">
    <div class="offset2 span10">
        <g:form class="form-inline" method="post" controller="search" >
            <input type="text" name="q" placeholder="${message(code:'app.menu.search.label')}"
                   value="${params.q}" class="input-xxlarge"  />
            <button class="btn btn-primary">Search</button>
        </g:form>
    </div>
</div>
<div class="row">
    <div class="span2">
        <ul class="nav nav-pills nav-stacked">
            <li class="nav-header">Filter by</li>
            <li class="${(params.dateCreated == '')?('active'):('')}">
                <g:link action="index" params="${params + [dateCreated: '']}" title="All time">
                    <i class="icon-time"></i>
                    All time
                </g:link>
            </li>
            <li class="${(params.dateCreated == "30")?('active'):('')}">
                <g:link action="index" params="${params + [dateCreated: 30]}" title="Last month">
                    <i class="icon-time"></i>
                    Last month
                </g:link>
            </li>
            <li class="${(params.dateCreated == "7")?('active'):('')}">
                <g:link action="index" params="${params + [dateCreated: 7]}" title="Last week">
                    <i class="icon-time"></i>
                    Last week
                </g:link>
            </li>
            <li class="${(params.dateCreated == "1")?('active'):('')}">
                <g:link action="index" params="${params + [dateCreated: 1]}" title="Yesterday">
                    <i class="icon-time"></i>
                    Today
                </g:link>
            </li>
            <li class="nav-header">Sort by</li>
            <li class="${(params.sortFilter == "sort1")?('active'):('')}">
                <g:link action="index" params="${params + [sortFilter: "sort1"]}" title="Yesterday">
                    <i class="icon-filter"></i>
                    Sort 1
                </g:link>
            </li>
            <li class="${(params.sortFilter == "sort2")?('active'):('')}">
                <g:link action="index" params="${params + [sortFilter: "sort2"]}" title="Yesterday">
                    <i class="icon-filter"></i>
                    Sort 2
                </g:link>
            </li>
            <li class="${(params.sortFilter == "sort3")?('active'):('')}">
                <g:link action="index" params="${params + [sortFilter: "sort3"]}" title="Yesterday">
                    <i class="icon-filter"></i>
                    Sort 3
                </g:link>
            </li>
        </ul>
   </div>
   <div class="span9">
       <g:if test="${results}">
           <p><strong>Showing ${resultsCount} results for "${params.q}"</strong></p>
           <g:each in="${results}" var="result">
               <div class="media">
                   <a class="pull-left" href="#">
                       <img class="media-object" data-src="holder.js/64x64">
                   </a>
                   <div class="media-body">
                       <h4 class="media-heading">${result.title}</h4>
                       ${result.description}
                   </div>
               </div>
           </g:each>
       </g:if>
       <g:else>
           <g:render template="/common/empty" />
       </g:else>
   </div>
</div>
</body>
</html>
