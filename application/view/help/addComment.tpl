<li id="comment_{$comment.ID}">
    {include file="help/comment.tpl"}
    {literal}<script type="text/javascript">{/literal}
    	window.location.hash = "c{$comment.ID}"
    </script>
</li>