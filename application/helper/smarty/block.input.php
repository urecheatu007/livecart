<?php

/**
 * Form field row
 *
 * @package application.helper.smarty
 * @author Integry Systems
 *
 * @package application.helper.smarty
 */
function smarty_block_input($params, $content, Smarty_Internal_Template $smarty, &$repeat)
{
	$formParams = $smarty->_tag_stack[0][1];

	if (!$repeat)
	{
		$formHandler = $formParams['handle'];
		$isRequired = $formHandler ? $formHandler->isRequired($params['name']) : false;

		$fieldType = $smarty->getTemplateVars('last_fieldType');

		if ($formHandler && $formHandler->getValidator())
		{
			$err = $formHandler->getValidator()->getErrorList();
			$msg = empty($err[$params['name']]) ? '' : $err[$params['name']];
		}
		else
		{
			$msg = '';
		}

		if ('checkbox' == $fieldType)
		{
			preg_match('/<input(.*) \/\>(.*)\<label(.*)\>(.*)\<\/label\>/msU', $content, $matches);
			if ($matches)
			{
				$content = '<label ' . $matches[3] . '><input ' . $matches[1] . ' /> ' . $matches[4] . '</label>';
			}
		}

		$name = $params['name'];
		$class = !empty($params['class']) ? ' ' . $params['class'] : ' ';
		unset($params['name'], $params['class']);

		$c = $content;
		$content = '<div class="row ' . ($msg ? 'has-error' : '') .  ' name_' . $name . ' type_' . $fieldType . ' ' . ($isRequired ? ' required' : '') . $class . '"';

		foreach ($params as $n => $param)
		{
			$content .= ' ' . $n . '="' . $param . '"';
		}

		$content .= '>' . $c;

		foreach ($smarty->getFieldValidation($name, $formHandler) as $val)
		{
			$content .= '<div ng-show="isSubmitted && form.' . $name . '.$error.' . substr($val[0], 3) . '" class="text-danger">' . $val[1] . '</div>';
		}

		if ($msg)
		{
			$content .= '<div class="text-danger">' . $msg . '</div>';
		}

		$content .= '</div>';

		$smarty->assign('last_fieldType', '');
		$smarty->assign('input_name', '');

		return $content;
	}
	else
	{
		$smarty->assign('last_fieldType', '');
		$smarty->assign('input_name', $params['name']);
	}
}
?>