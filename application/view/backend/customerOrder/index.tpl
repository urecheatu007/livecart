{includeJs file="library/dhtmlxtree/dhtmlXCommon.js"}
{includeJs file="library/dhtmlxtree/dhtmlXTree.js"}
{includeJs file="library/dhtmlxtree/dhtmlXTree_start.js"}
{includeJs file="library/rico/ricobase.js"}
{includeJs file="library/rico/ricoLiveGrid.js"}
{includeJs file="library/form/Validator.js"}
{includeJs file="library/form/ActiveForm.js"}
{includeJs file="library/form/State.js"}
{includeJs file="library/ActiveGrid.js"}
{includeJs file="library/TabControl.js"}
{includeJs file="library/SectionExpander.js"}
{includeJs file="library/ActiveList.js"}

{includeCss file="library/dhtmlxtree/dhtmlXTree.css"}
{includeCss file="library/TabControl.css"}
{includeCss file="library/ActiveList.css"}
{includeCss file="library/ActiveGrid.css"}

{includeCss file="backend/Backend.css"}

{includeJs file="backend/CustomerOrder.js"}
{includeCss file="backend/CustomerOrder.css"}

{includeJs file="backend/Shipment.js"}
{includeCss file="backend/Shipment.css"}

{includeJs file="backend/User.js"}
{includeCss file="backend/User.css"}

{includeJs file="backend/CustomerOrder.js"}
{includeCss file="backend/CustomerOrder.css"}

{includeJs file="backend/Payment.js"}
{includeCss file="backend/Payment.css"}

{pageTitle help="order"}{t _livecart_orders}{/pageTitle}
{include file="layout/backend/header.tpl"}

<div id="orderGroupsWrapper" class="treeContainer maxHeight h--50">
	<div id="orderGroupsBrowser" class="treeBrowser"></div>

	<ul id="categoryBrowserActions" class="verticalMenu">
		<li class="addTreeNode"><a href="#" id="createNewOrderLink">{t _create_order}</a></li>
	</ul>	
    
    <div class="yellowMessage" id="orderCreatedConfirmation" style="display: none;"><div>{t _new_order_has_been_successfully_created}</div></div>
    <div class="yellowMessage" id="orderConfirmation" style="display: none;"><div>{t _order_information_has_been_successfully_updated}</div></div>
    <div class="yellowMessage" id="orderAddressConfirmation" style="display: none;"><div>{t _order_address_information_has_been_successfully_updated}</div></div>
    <div class="redMessage" id="noRateInShippingServiceIsAvailableError" style="display: none;"><div>{t _this_shipping_service_has_no_available_rates}</div></div>
    <div class="redMessage" id="userHasNoAddressError" style="display: none;"><div>{t _err_user_has_no_billing_or_shipping_address}</div></div>
	
    <div class="redMessage" id="transactionError" style="display: none;">
       	<div>
            {t Could not process this transaction}
            <span id="transactionErrorMsg"></span>
        </div>
    </div>

</div>

{include file="backend/customerOrder/orderContainer.tpl"}
{include file="backend/customerOrder/groupContainer.tpl"}
{include file="backend/userGroup/userContainer.tpl"}

<div id="activeUserPath"></div>

{literal}
<script type="text/javascript">
    Backend.CustomerOrder.Editor.prototype.Links.states = '{/literal}{link controller=backend.user action=states}{literal}';
    Backend.CustomerOrder.Editor.prototype.Links.switchCancelled = '{/literal}{link controller=backend.customerOrder action=switchCancelled}{literal}';
    
    Backend.CustomerOrder.Links.selectCustomer = '{/literal}{link controller=backend.customerOrder action=selectCustomer}{literal}';
    Backend.CustomerOrder.Links.createOrder = '{/literal}{link controller=backend.customerOrder action=create}{literal}';
    Backend.CustomerOrder.Messages.selecCustomerTitle = '{/literal}{t _select_customer_title}{literal}';
    
    new Backend.CustomerOrder({/literal}{json array=$orderGroups}{literal});
    
    {/literal}
        {allowed role="order"}
            Backend.CustomerOrder.prototype.ordersMiscPermission = true;
        {/allowed}
        
        {allowed role="user"}
            Backend.CustomerOrder.prototype.usersMiscPermission = true;
        {/allowed}
    {literal}
    Backend.showContainer("orderGroupsManagerContainer");
    window.ordersActiveGrid = {};
</script>
{/literal}


{include file="layout/backend/footer.tpl"}