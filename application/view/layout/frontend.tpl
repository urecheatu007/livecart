<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />	
    <title>
        {if $PAGE_TITLE}
            {$PAGE_TITLE}
        {else}
            {assign var="lastBreadcrumb" value=$breadCrumb|@end}
            {$lastBreadcrumb.title}
        {/if}
    </title>
	<base href="{baseUrl}" />

	<!-- Css includes -->
	<link href="stylesheet/frontend/Frontend.css" media="screen" rel="Stylesheet" type="text/css"/>
	<!--[if IE]>
		<link href="stylesheet/frontend/FrontendIE.css" media="screen" rel="Stylesheet" type="text/css"/>
	<![endif]-->

	{**} {includeCss file="backend/stat.css"}
	{$STYLESHEET}

	<!-- JavaScript includes -->
    {**} <script type="text/javascript" src="firebug/firebug.js"></script>
	<script type="text/javascript" src="javascript/library/prototype/prototype.js"></script>
	<script type="text/javascript" src="javascript/library/scriptaculous/scriptaculous.js"></script>
	<script type="text/javascript" src="javascript/frontend/Frontend.js"></script>
	{$JAVASCRIPT}
</head>

<body>
	<div id="container">
		{$ACTION_VIEW}
	</div>	
</body>

</html>