<fieldset class="allFilters">
	
	{if 'brand' == $showAll}
		<legend>By Brand</legend>		
	{else}
		<legend>{$allFilters.name_lang}</legend>
	{/if}

	{math count=$allFilters.filters|@count equation="max(2, ceil(count / 3))" assign="perColumn"}

	{foreach from=$allFilters.filters item=filter name="filters"}

		{if $smarty.foreach.filters.iteration % $perColumn == 1}
			<div style="float: left; width: 30%" class="filterGroup">
				<ul>
		{/if}
			
		<li>
			<a href="{categoryUrl data=$category filters=$filters addFilter=$filter query="showAll=$showAll"}">{$filter.name_lang}</a>&nbsp;<span class="count">({$filter.count})</span>
		</li>

		{if $smarty.foreach.filters.iteration % $perColumn == 0 || $smarty.foreach.filters.last}
				</ul>
			</div>
		{/if}	
				
	{/foreach}
	
</fieldset>
