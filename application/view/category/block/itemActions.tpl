<p class="productAction">
	{if $product.rating && 'ENABLE_RATINGS'|config}
		<span class="actionItem ratingItem">{include file="category/productListRating.tpl"}</span>
	{/if}

	{if 'ENABLE_WISHLISTS'|config}
		<span class="actionItem wishListItem"><span class="glyphicon glyphicon-heart-empty"></span> <a href="{link controller=order action=addToWishList id=$product.ID returnPath=true}" rel="nofollow" class="addToWishList">{t _add_to_wishlist}</a></span>
	{/if}

	{if 'ENABLE_PRODUCT_COMPARE'|config}
		<span class="actionItem compareItem"><span class="glyphicon glyphicon-eye-close"></span> {include file="compare/block/compareLink.tpl"}</span>
	{/if}
</p>
