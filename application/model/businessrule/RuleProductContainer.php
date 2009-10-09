<?php

ClassLoader::import('application.model.businessrule.interface.BusinessRuleProductInterface');

/**
 * Implements setItemPrice and getItemPrice methods of OrderedItem
 *
 * @author Integry Systems
 * @package application.model.businessrule
 */
class RuleProductContainer implements BusinessRuleProductInterface
{
	private $price;
	private $product;
	private $count = 1;

	public function __construct($product)
	{
		$this->product = $product;
	}

	public function getProduct()
	{
		return $this->product;
	}

	public function setItemPrice($price)
	{
		$this->price = $price;
	}

	public function getPriceWithoutTax()
	{
		return $this->price;
	}

	public function setCount($count)
	{
		$this->count = 1;
	}

	public function getCount()
	{
		return $this->count;
	}

	public function getSubTotal()
	{
		return $this->getPriceWithoutTax() * $this->getCount();
	}
}

?>