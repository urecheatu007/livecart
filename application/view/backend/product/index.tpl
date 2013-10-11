<div ng-controller="ProductController">

	<grid controller="backend.product" primaryKey="Product_ID">
		<actions>
			<edit-button>{t _edit}</edit-button>
		</actions>
		<mass>
			{* include file="backend/product/massAction.tpl" *}
		</mass>
	</grid>

</div>

{*

{activeGrid
	prefix="products"
	id=$categoryID
	role="product.mass"
	controller="backend.product" action="lists"
	displayedColumns=$displayedColumns
	availableColumns=$availableColumns
	totalCount=$totalCount
	filters=$filters
	container="tabProducts"
	dataFormatter="Backend.Product.GridFormatter"
	count="backend/product/count.tpl"
	massAction="backend/product/massAction.tpl"
	advancedSearch=true
	addMenu="backend/product/addButton.tpl"
}

</div>

<script type="text/javascript">

	var massHandler = new ActiveGrid.MassActionHandler(
						$('productMass_{$categoryID}'),
						window.activeGrids['products_{$categoryID}'],
{literal}
						{
							'onComplete':
								function()
								{
									Backend.Product.resetEditors();

									var parentId = {/literal}{$categoryID}{literal};
									var massForm = $('productMass_' + parentId).down('form');
									parentId = Backend.Category.treeBrowser.getParentId(parentId);

									do
									{
										Backend.Product.reloadGrid(parentId);
										parentId = Backend.Category.treeBrowser.getParentId(parentId);
									}
									while(parentId != 0);

									// reload grid of target category if products were moved
									var movedCat = massForm.elements.namedItem('categoryID');
									if (movedCat.value)
									{
										Backend.Product.reloadGrid(movedCat.value);
									}

									movedCat.value = null;
								}
						}
						);
	massHandler.deleteConfirmMessage = '{t _delete_conf|addslashes}' ;
	massHandler.nothingSelectedMessage = '{t _nothing_selected|addslashes}' ;
</script>
*}