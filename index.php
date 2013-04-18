<?php

/**
 *  Part of the LiveCart front controller that is only used when URL rewriting is not available
 *
 *  @author Integry Systems
 *  @package application
 */

define('NOREWRITE', false);

// Indicates that URL rewriting is disabled
$_GET['noRewrite'] = true;

// Apache: index.php/route
if (preg_match('/^Apache/', $_SERVER['SERVER_SOFTWARE']) && !NOREWRITE)
{
	$_GET['route'] = isset($_SERVER['PATH_INFO']) ? substr($_SERVER['PATH_INFO'], 1) : '';

	if (substr($_GET['route'], 0, 9) == 'index.php')
	{
		$_GET['route'] = substr($_GET['route'], 9);
	}

	if (substr($_GET['route'], 0, 1) == '/')
	{
		$_GET['route'] = substr($_GET['route'], 1);
	}

	$_SERVER['virtualBaseDir'] = $_SERVER['SCRIPT_NAME'] . '/';
}

// IIS, etc.: index.php?route=
else
{
	$_SERVER['virtualBaseDir'] = $_SERVER['SCRIPT_NAME'] . '?route=';
}

$_SERVER['baseDir'] = dirname($_SERVER['SCRIPT_NAME']) . '/public/';

include dirname(__file__) . '/public/index.php';

?>
