{loadJs form=true}
{pageTitle}{t _login}{/pageTitle}
{include file="layout/frontend/layout.tpl" hideLeft=true}
{include file="block/content-start.tpl"}

	<div class="returningCustomer">
		<h2>{t _returning}</h2>

		<p>
			{if $failed}
				<div class="errorMsg failed">
					{t _login_failed}
				</div>
			{else}
				<p class="text-muted">{t _please_sign_in}</p>
			{/if}
		</p>

		{capture assign="return"}{link controller="user"}{/capture}
		{include file="user/loginForm.tpl" return=$return}
	</div>

	<div class="newCustomer">
		<h2>{t _new_cust}</h2>

		<p class="text-muted">{t _not_registered}</p>

		{include file="user/regForm.tpl"}
	</div>

	<div class="clear"></div>

{include file="block/content-stop.tpl"}

{literal}
	<script type="text/javascript">
		Event.observe(window, 'load', function() {$('email').focus()});
	</script>
{/literal}

{include file="layout/frontend/footer.tpl"}