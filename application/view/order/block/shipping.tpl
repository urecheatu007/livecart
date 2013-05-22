{if $cart.shippingSubtotal|@strlen}
	<tr>
		<td colspan="{math equation="$extraColspanSize + 3"}" class="subTotalCaption">
			{if $isShippingEstimated}
				{t _estimated_shipping}:
			{else}
				{t _shipping}:
			{/if}
		</td>
		<td class="amount shippingAmount">{$cart.formatted_shippingSubtotal}</td>
		{include file="order/block/cartUpdate.tpl"}
	</tr>
{/if}
