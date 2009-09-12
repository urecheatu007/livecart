<fieldset>
	<legend>{t _main_details}</legend>

	<p class="required" style="border-bottom: 1px solid #ccc; padding-bottom: 4px; margin-bottom: 4px;">
		<label for="product_{$cat}_{$product.ID}_isEnabled">{t _availability}:</label>
		{selectfield name="isEnabled" options=$productStatuses}
	</p>

	<p class="required">
		<label for="product_{$cat}_{$product.ID}_name">{t _product_name}:</label>
		<fieldset class="error">
			{textfield name="name" id="product_`$cat`_`$product.ID`_name" class="wide" autocomplete="controller=backend.product field=name"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>

	<p class="autoSKU">
		<label for=""></label>
		{checkbox name="autosku" id="product_`$cat`_`$product.ID`_sku_auto" class="checkbox" value="on" onclick="Backend.Product.toggleSkuField(this);"}
		<label for="product_{$cat}_{$product.ID}_sku_auto" class="checkbox">{t _generate_sku}</label>
	</p>
	<p class="required">
		<label for="product_{$cat}_{$product.ID}_sku" class="acronym"><a>{t _sku_code}<div>{t _hint_sku}</div></a>:</label>
		<fieldset class="error" style="margin-bottom: 6px;">
			{textfield name="sku" id="product_`$cat`_`$product.ID`_sku" class="product_sku" autocomplete="controller=backend.product field=sku"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>

	<p>
		<label for="product_{$cat}_{$product.ID}_shortdes" class="acronym"><a>{t _short_description}<div>{t _hint_shortdescr}</div></a>:</label>
		<div class="textarea">
			{textarea class="shortDescr tinyMCE" id="product_`$cat`_`$product.ID`_shortdes" name="shortDescription"}
		</div>
	</p>
	<p>
		<label for="product_{$cat}_{$product.ID}_longdes" class="acronym"><a>{t _long_description}<div>{t _hint_longdescr}</div></a>:</label>
		<div class="textarea">
			{textarea class="longDescr tinyMCE" id="product_`$cat`_`$product.ID`_longdes" name="longDescription"}
		</div>
	</p>
	<p>
		<label for="product_{$cat}_{$product.ID}_type">{t _product_type}:</label>
		<fieldset class="error">
			{selectfield options=$productTypes name="type" id="product_`$cat`_`$product.ID`_type" class="productType"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	<p>
		<label for="product_{$cat}_{$product.ID}_url">{t _website_address}:</label>
		<fieldset class="error">
			{textfield name="URL" class="wide" id="product_`$cat`_`$product.ID`_url" autocomplete="controller=backend.product field=URL"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	<p>
		<label for="product_{$cat}_{$product.ID}_manufacterer">{t _manufacturer}:</label>
		<fieldset class="error">
			{textfield name="manufacturer" class="wide" autocomplete="controller=backend.manufacturer field=manufacturer" id="product_`$cat`_`$product.ID`_manufacterer"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	<p>
		<label for="product_{$cat}_{$product.ID}_keywords" class="acronym"><a>{t _keywords}<div>{t _hint_keywords}</div></a>:</label>
		<fieldset class="error">
			{textfield name="keywords" class="wide" id="product_`$cat`_`$product.ID`_keywords" autocomplete="controller=backend.product field=keywords"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	<p>
		<label for="product_{$cat}_{$product.ID}_pageTitle" class="acronym"><a>{t _pageTitle}<div>{t _hint_pageTitle}</div></a>:</label>
		<fieldset class="error">
			{textfield name="pageTitle" class="wide" id="product_`$cat`_`$product.ID`_pageTitle" autocomplete="controller=backend.product field=pageTitle"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>

	{if $shippingClasses}
	<p>
		<label for="product_{$cat}_{$product.ID}_shippingClassID">{t _shippingClass}:</label>
		<fieldset class="error">
			{selectfield options=$shippingClasses name="shippingClassID" id="product_`$cat`_`$product.ID`_shippingClassID" class="shippingClassID"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	{/if}

	{if $taxClasses}
	<p>
		<label for="product_{$cat}_{$product.ID}_taxClassID">{t _taxClass}:</label>
		<fieldset class="error">
			{selectfield options=$taxClasses name="taxClassID" id="product_`$cat`_`$product.ID`_taxClassID" class="taxClassID"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	{/if}

	<p>
		<label for="product_{$cat}_{$product.ID}_position" class="acronym"><a>{t _sort_order}<div>{t _hint_sort_order}</div></a>:</label>
		<fieldset class="error">
			{textfield name="position" class="number" id="product_`$cat`_`$product.ID`_position"}
			<div class="errorText hidden"></div>
		</fieldset>
	</p>
	<p>
		<label></label>
		{checkbox name="isFeatured" class="checkbox" id="product_`$cat`_`$product.ID`_isfeatured"}
		<label for="product_{$cat}_{$product.ID}_isfeatured" class="acronym checkbox"><a>{t _mark_as_featured_product}<div>{t _hint_featured}</div></a></label>
	</p>

</fieldset>