<div class="accordion-group">
	<div class="stepTitle accordion-heading">
		{include file="onePageCheckout/block/title.tpl" title="_shipping_address"}
	</div>

	<div class="accordion-body">
		<div class="accordion-inner">
			{form action="controller=onePageCheckout action=doSelectShippingAddress" method="POST" handle=$form class="form-vertical"}
				{if !$order.isMultiAddress}
					<div class="checkbox">
						<label>
							{checkbox name="sameAsBilling" id="sameAsBilling"}
							{t _the_same_as_billing_address}
						</label>
					</div>
				{/if}

				{include file="checkout/block/selectAddress.tpl" addresses=$shippingAddresses prefix="shipping" states=$shippingStates}

				{include file="onePageCheckout/block/continueButton.tpl"}
			{/form}
		</div>

		{if $preview_shipping}
			<div class="stepPreview">{$preview_shipping.compact}</div>
		{/if}
	</div>
</div>