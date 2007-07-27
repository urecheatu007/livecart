Backend.SiteNews = Class.create();
Backend.SiteNews.prototype = 
{
	initialize: function(newsList, container, template)
	{
		newsList.each(function(el)
		{
			new Backend.SiteNews.PostEntry(container, template, el);
		});
		
		ActiveList.prototype.getInstance('newsList', {
	         beforeEdit:     function(li) 
			 { 
				 li.handler.showEditForm();
				 return false;
             },
	         beforeSort:     function(li, order) 
			 { 
				 return $('sortUrl').innerHTML + '?draggedId=' + this.getRecordId(li) + '&' + order 
			 },
	         beforeDelete:   function(li)
	         {
	             if (confirm($('confirmDelete').innerHTML)) return $('deleteUrl').innerHTML + this.getRecordId(li)
	         },
	         afterEdit:      function(li, response) { li.handler.update(response);},
	         afterSort:      function(li, response) {  },
	         afterDelete:    function(li, response)  { Element.remove(li); curr.resetRatesContainer(); }
	     }, []);		
	},
	
	showAddForm: function()
	{
		slideForm('addNews', 'newsMenu');
		tinyMCE.idCounter = 0;
		ActiveForm.prototype.initTinyMceFields($('addNews'));		
	},
	
	hideAddForm: function()
	{
		if ('none' == $('addNews').style.display)
		{
			return false;
		}
		
		restoreMenu('addNews', 'newsMenu');
		ActiveForm.prototype.destroyTinyMceFields($('addNews'));		
	},
}

Backend.SiteNews.PostEntry = Class.create();
Backend.SiteNews.PostEntry.prototype = 
{	
	data: null,
	
	node: null,
	
	initialize: function(container, template, data)
	{
		this.data = data;
		this.node = template.cloneNode(true);		
		container.appendChild(this.node);
		this.updateHtml();
		
		this.node.handler = this;

		Element.show(this.node);
	},
	
	showEditForm: function()
	{
		Backend.SiteNews.prototype.hideAddForm();
		
		var nodes = this.node.parentNode.getElementsByTagName('li');
		$H(nodes).each(function(li)
		{
			if (li && li[1] && li[1].handler && li != this.node)
			{
				li[1].handler.cancelEditForm();				
			}
		});
	
		var form = $('newsForm').cloneNode(true);

		$H(this.data).each(function(el) 
		{ 
			if (form.elements.namedItem(el[0])) 
		 	{
				form.elements.namedItem(el[0]).value = el[1];
			}
		});
		form.elements.namedItem('id').value = this.data['ID'];

		this.node.down('div.formContainer').appendChild(form);

		tinyMCE.idCounter = 0;
		ActiveForm.prototype.initTinyMceFields(this.node.down('div.formContainer'));
		
		form.down('a.cancel').onclick = this.cancelEditForm.bindAsEventListener(this);
		form.onsubmit = this.save.bindAsEventListener(this);
		
		new Backend.LanguageForm();
	},
	
	cancelEditForm: function(e)
	{		
		var formContainer = this.node.down('div.formContainer');
		
		if (!formContainer.firstChild)
		{
			return;
		}
		
		ActiveForm.prototype.destroyTinyMceFields(formContainer);
	
		formContainer.innerHTML = '';		
			
		if (e)
		{
			Event.stop(e);
		}
	},
	
	save: function(e)
	{
		new LiveCart.AjaxRequest(this.node.down('form'), null, this.update.bind(this));		
		Event.stop(e);
	},
	
	update: function(originalRequest)
	{
		this.data = originalRequest.responseData;
		this.updateHtml();
		this.cancelEditForm();
	},
	
	del: function()
	{
		
	},

	updateHtml: function()
	{
		this.node.down('.newsTitle').innerHTML = this.data.title;
		this.node.down('.newsDate').innerHTML = this.data.time;
		this.node.down('.newsText').innerHTML = this.data.text;		
		this.node.id = 'newsEntry_' + this.data.ID;
	}
}

Backend.SiteNews.Add = Class.create();
Backend.SiteNews.Add.prototype = 
{
	form: null,
	
	initialize: function(form)
	{
		new LiveCart.AjaxRequest(form, null, this.onComplete.bind(this));
	},
	
	onComplete: function(originalRequest)
	{
		new Backend.SiteNews.PostEntry($('newsList'), $('newsList_template'), originalRequest.responseData);
	}
}