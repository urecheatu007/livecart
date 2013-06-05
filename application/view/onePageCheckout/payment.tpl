<div class="accordion-group">
	<div class="stepTitle accordion-heading">
		{include file="onePageCheckout/block/title.tpl" title="_payment_info"}
	</div>

	<div class="accordion-body">
		<div class="accordion-inner">
			{form action="controller=onePageCheckout action=setPaymentMethod" method="POST" handle=$form id="checkout-select-payment-method" class="form-horizontal"}
				<p class="selectMethodMsg">
					{t _select_payment_method}
				</p>

				{if 'CC_ENABLE'|config}
					<div class="radio">
						<label>
							<input type="radio" name="payMethod" value="cc" id="pay_cc" {if $selectedMethod == 'cc'}checked="checked"{/if} />
							{t _credit_card}
						</label>
					</div>
				{/if}

				{foreach from=$offlineMethods key="key" item="method"}
					<div class="radio">
						<label>
							<input type="radio" name="payMethod" value="{$method}" id="{$method}"  {if $selectedMethod == $method}checked="checked"{/if} />
							{"OFFLINE_NAME_`$key`"|config}
						</label>
					</div>
				{/foreach}

				{if $otherMethods}
					<div class="checkout-otherMethods">
						{foreach from=$otherMethods item=method}
							<div class="radio">
								<label>
									<input type="radio" name="payMethod" value="{link controller=onePageCheckout action=redirect query="id=`$method`"}" id="{$method}" {if $selectedMethod == $method}checked="checked"{/if} />
									<img src="{s image/payment/{$method}.gif}" class="paymentLogo" alt="{$method}" />
								</label>
							</div>
						{/foreach}
					</div>
				{/if}

				{if $requireTos}
					{include file="order/block/tos.tpl"}
				{/if}
			{/form}

			<div class="form">
				<div id="paymentForm"></div>

				<div id="checkout-place-order">
					<div class="text-error hidden" id="no-payment-method-selected">
						{t _no_payment_method_selected}
					</div>

					<hr />

					<div class="row">
						<div class="col col-lg-6">
							<div class="grandTotal">
								{t _total}:
								<span class="orderTotal">{$order.formattedTotal.$currency}</span>
							</div>
						</div>

						<div class="completeOrderButton text-right col col-lg-6">
							{include file="onePageCheckout/block/submitButton.tpl"}
						</div>
					</div>
				</div>
			</div>

			<div id="paymentMethodForms" style="display: none;">
				{if 'CC_ENABLE'|config}
					<div id="payForm_cc">
						{include file="checkout/block/ccForm.tpl" controller="onePageCheckout"}
					</div>
				{/if}

				{foreach from=$offlineMethods key="key" item="method"}
					<div id="payForm_{$method}">
						{form action="controller=onePageCheckout action=payOffline query=id=$method" handle=$offlineForms[$method] method="POST" class="form-horizontal"}
							{sect}
								{header}
									<h2>{"OFFLINE_NAME_`$key`"|config}</h2>
								{/header}
								{content}
									{include file="checkout/offlineMethodInfo.tpl" method=$key}
									{include file="block/eav/fields.tpl" fieldList=$offlineVars[$method].specFieldList}
								{/content}
							{/sect}
						{/form}
					</div>
				{/foreach}
			</div>

			<div class="notAvailable">
				<p>{t _payment_not_ready}</p>
			</div>
		</div>
	</div>
</div>