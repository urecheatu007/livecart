<?php
/**
 * ...
 *
 * @param array $params
 * @param Smarty $smarty
 * @return string
 *
 * @package application.helper.smarty
 * @author Integry Systems
 */
function smarty_function_includeCss($params, LiveCartSmarty $smarty)
{
	// fix slashes
	$fileName = str_replace('\\', DIRECTORY_SEPARATOR, $params['file']);
	$fileName = str_replace('/', DIRECTORY_SEPARATOR, $fileName);
	$filePath = substr($fileName, 0, 1) != '/' ?
					ClassLoader::getRealPath('public.stylesheet.') .  $fileName :
					ClassLoader::getRealPath('public') .  $fileName;

	if(!is_file($filePath)) return;

	if(isset($params['inline']) && $params['inline'] == 'true')
	{
		return '<link href="stylesheet/' . str_replace(DIRECTORY_SEPARATOR, '/', $fileName) . '?' . filemtime($filePath) . '"" media="screen" rel="Stylesheet" type="text/css" />' . "\n";
	}
	else
	{
		$includedStylesheetTimestamp = $smarty->_smarty_vars['INCLUDED_STYLESHEET_TIMESTAMP'];
		if(!($includedStylesheetFiles = $smarty->_smarty_vars['INCLUDED_STYLESHEET_FILES']))
		{
		   $includedStylesheetFiles = array();
		}

		if(isset($params['front']) && in_array($filePath, $includedStylesheetFiles))
		{
			unset($includedStylesheetFiles[array_search($filePath, $includedStylesheetFiles)]);
		}

		$fileMTime = filemtime($filePath);
		if($fileMTime > (int)$includedStylesheetTimestamp)
		{
			$smarty->_smarty_vars['INCLUDED_STYLESHEET_TIMESTAMP'] = $fileMTime;
		}

		if(isset($params['front']))
		{
			array_unshift($includedStylesheetFiles, $filePath);
		}
		else
		{
			array_push($includedStylesheetFiles, $filePath);
		}

		$smarty->_smarty_vars['INCLUDED_STYLESHEET_FILES'] = $includedStylesheetFiles;
	}
}
?>