{if 'ENABLE_PRODUCT_SHARING'|config
	&&
	($user.ID || 'ENABLE_ANONYMOUS_PRODUCT_SHARING'|config)
}

	<div id="sharingSection" class="productSection sharingSection">
		<h2>{maketext text="_share_product_name" params=$product.name_lang}</h2>

		<div id="sendToFriendRepsonse"></div>

		<div id="shareProduct">
			{form action="controller=product action=sendToFriend id=`$product.ID`" handle=$sharingForm method="POST"
				onsubmit="new Product.Share(this); return false;" }
				<div class="producSharingForm">
					{input name="friendemail"}
						{label}{t _friend_email}:{/label}
						{textfield}
					{/input}

					{if !$user.ID}
						{input name="nickname"}
							{label}{t _nickname}:{/label}
							{textfield}
						{/input}
					{/if}

					{input name="friendemail"}
						{label}{t _notes}:{/label}
						{textarea}
					{/input}
				</div>

				{block SEND-TO-FRIEND-SUBMIT}

				<p>
					<input class="submit" type="submit" value="{tn _send_to_friend}" /> <span class="pi" style="display: none;"></span>
				</p>

			{/form}
		</div>
	</div>
	<script type="text/javascript">
		_error_cannot_send_to_friend = "{t _error_cannot_send_to_friend}";
	</script>

{/if}