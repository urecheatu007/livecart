<div class="userIndex">

{include file="layout/frontend/header.tpl"}
{* include file="layout/frontend/leftSide.tpl" *}
{* include file="layout/frontend/rightSide.tpl" *}

<div id="content" class="left right">
	
	<h1>{t _your_account} ({$user.fullName})</h1>
	
	{if $userConfirm}
	<div class="confirmationMsg">
        <div>{$userConfirm}</div>
	</div>
	{/if}
	
	{include file="user/userMenu.tpl" current="homeMenu"}
    
    <h2>{t Your Recent Orders}</h2>
    {foreach from=$orders item="order"}    
	    <h3>{$order.formatted_dateCreated.date_long}</h3>
	    
        <div class="orderStatus">
            {t Status}: 
    		{if $order.isCancelled}
    	    	<span class="cancelled">{t Cancelled}</span>
    	    {elseif !$order.isPaid}
        		<span class="awaitingPayment">{t Awaiting payment} 
                <strong>{$order.formattedTotal[$order.Currency.ID]}</strong></span>.
        		{t Make payment for this order}.	    
    	    {else}
    	    	{if $order.isReturned}
    	    	    <span class="returned">{t Returned}</span>
    	    	{elseif $order.isShipped}
    	    	    <span class="mailed">{t Shipped}</span>
    	    	{elseif $order.isAwaitingShipment}
    	    	    <span class="mailed">{t Awaiting Shipment}</span>
    	    	{elseif $order.isBackordered}
    	    	    <span class="mailed">{t The products you ordered are being backordered now and will be shipped to you as soon as they become available.}</span>
    	    	{else}
    	    	    <span class="processing">{t The order is being processed}</span>
    	    	{/if}
    	    {/if}
    	</div>
	    
	    <div class="orderDetails">
	    
	       <div class="orderMenu"style="float: left; width: 200px;">
	       
	           <ul>
	               <li><a href="{link controller=user action=viewOrder id=$order.ID}">{t View Details}</a></li>
	               <li><a href="{link controller=user action=orderInvoice id=$order.ID}">{t Print Invoice}</a></li>
	           </ul>
	           
	           <div>
	               {t Order ID}: {$order.ID}
	           </div>
	           
	           <div>
	               {t Recipient}: {$order.ShippingAddress.fullName}
	           </div>

	           <div class="orderTotal">
	               {t Total}: <strong>{$order.formattedTotal[$order.Currency.ID]}</strong>
	           </div>
	       
	       </div>
	    
	       <div style="float: left">
	        
                <ul style="padding: 10px;">
                {foreach from=$order.cartItems item="item"}
        	        <li>{$item.count} x {$item.Product.name_lang}</li>
        	    {/foreach}
        	    </ul>
        	    
            </div>
            
        </div>
        
        <div class="clear"></div>
    
    {/foreach}
    
</div>

{include file="layout/frontend/footer.tpl"}

</div>