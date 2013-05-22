/**
 *	@author Integry Systems
 */

Backend.OrderNote =
{
	init: function(container)
	{
		Event.observe(container.down('a.addResponse'), 'click', this.showForm);
		Event.observe(container.down('a.addResponseCancel'), 'click', this.hideForm);
		Event.observe(container.down('a.responseCancel'), 'click', this.hideForm);
	},

	showForm: function(e)
	{
	 	e.preventDefault();
		var element = Event.element(e);

		var menu = new ActiveForm.Slide(element.up('div.menuContainer').down('ul.orderNoteMenu'));
		menu.show("addResponse", element.up('div.menuContainer').down('div.addResponseForm'));
	},

	hideForm: function(e)
	{
	 	e.preventDefault();
		var element = Event.element(e);

		var menu = new ActiveForm.Slide(element.up('div.menuContainer').down('ul.orderNoteMenu'));
		menu.hide("addResponse", element.up('div.menuContainer').down('div.addResponseForm'));
	},

	submitForm: function(e)
	{
	 	e.preventDefault();
		new Backend.OrderNote.AddResponse(e);
	}
}

Backend.OrderNote.AddResponse = Class.create();
Backend.OrderNote.AddResponse.prototype =
{
	form: null,

	event: null,

	initialize: function(e)
	{
		this.form = Event.element(e);
		this.event = e;
		new LiveCart.AjaxRequest(this.form, null, this.complete.bind(this));
	},

	complete: function(originalRequest)
	{
		Backend.OrderNote.hideForm(this.event);

		var cont = this.form.up('div.tabPageContainer');

		if (cont.down('.noRecords'))
		{
			cont.down('.noRecords').hide();
		}

		var ul = cont.down('ul.notes');
		ul.innerHTML += originalRequest.responseText;
		jQuery(ul.lastChild).effect('highlight');

		cont.down('textarea').value = '';
	}
}