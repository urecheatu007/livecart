/**
 * ActiveForm will most likely work in pair with ActiveList. While ActiveList handles ActiveRecords ActiveForm handles new instances, which are not yet saved in database. 
 * 
 * It's main feature is to show/hide the new form and the link to this form. It allso show/hide 
 * the progress indicator for new forms and generates valid handle from title
 * 
 * @author Sergej Andrejev <sandrejev@gmail.com>
 */
ActiveForm = Class.create();
ActiveForm.prototype = {
 
    
    /**
     * Generate valid handle from item title
     * 
     * @param string title Input title
     * @return string valid handle
     */
    generateHandle: function(title)
    {
		handle = title.toLowerCase();  
		
		handle = handle.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g,""); // trim
		handle = handle.replace(/[^a-z_\d \.]/g, ""); // remove all illegal simbols
		// handle = handle.replace(/^[\d\_]+/g, "."); // replace first digits with "."
		handle = handle.replace(/ /g, "."); // replace spaces with "."

		// replace repeating dots with one
		var oldHandle = '';
		while (oldHandle != handle) 
		{
		  	oldHandle = handle;
		  	handle = handle.replace(/\.\./g, ".");
		}		 
		
		// replace leading and ending dots
		handle = handle.replace(/^\./g, "");
		handle = handle.replace(/\.$/g, "");
				       
        return handle;
    },
    
    resetErrorMessages: function(form)
    {
        if ('form' != form.tagName.toLowerCase()) 
        {
            form = form.down('form');
        }
      
        var messages = document.getElementsByClassName('errorText', form);
        for (k = 0; k < messages.length; k++)
        {
            messages[k].innerHTML = '';
            messages[k].style.display = 'none';
        }
	},
    
    resetErrorMessage: function(formElement) 
    {
        var errorText = formElement.up().down(".errorText");

        if (errorText)
        {
    	  	errorText.innerHTML = '';
    	  	errorText.style.display = 'none';
    	  	Element.addClassName(errorText, 'hidden');
        }
    },

    setErrorMessages: function(form, errorMessages)
    {
        if ('form' != form.tagName.toLowerCase()) form = form.down('form');
        
        try
        {
            var focus = true;
    		$H(errorMessages).each(function(error)
    		{
    			if (form.elements.namedItem(error.key))
    		  	{                
                    var formElement = form.elements.namedItem(error.key);
                    var errorMessage = error.value;
                    
                    ActiveForm.prototype.setErrorMessage(formElement, errorMessage, focus);
                    focus = false;
    			}
    		}); 	
        } catch(e) {
            console.info(e);
        }
	},
    
    setErrorMessage: function(formElement, errorMessage, focus)
    {
        try
        {
            if (focus) 
            {
                alert(errorMessage);
                Element.focus(formElement);
            }
            
            var errorContainer = formElement.up().down(".errorText");		
            if (errorContainer)	
            {
        		errorContainer.innerHTML = errorMessage;
        	  	Element.removeClassName(errorContainer, 'hidden');
        		Effect.Appear(errorContainer);
            }
            else
            {
                console.info("Please add \n...\n <div class=\"errorText hidden\"></div> \n...\n after " + formElement.name);   
            }
        } catch(e) {
            console.info(e);
        }
    },
    
    updateNewFields: function(className, ids, parent)
    {     
        ids = $H(ids);
        ids.each(function(transformation) { transformation.value = new RegExp(transformation.value);   });  
        var attributes = ['class', 'name', 'id', 'for'];  
        var attributesLength = attributes.length;
        var fields = $A(document.getElementsByClassName(className));
        
        fields.each(function(element)
        {
            for(var a = 0; a < attributesLength; a++)
            {
               var attr = attributes[a];
               ids.each(function(transformation) { 
                   if (element[attr]) element[attr] = element[attr].replace(transformation.value, transformation.key); 
               });
            };
        });
    },
    
    lastTinyMceId: 0,
    
    disabledTextareas: {},
    lastDisabledTextareaId: 1,
    idleTinyMCEFields: {},
	
    initTinyMceFields: function(container) 
    {
		var textareas = $(container).getElementsBySelector('textarea.tinyMCE');
		for (k = 0; k < textareas.length; k++)
		{
			if (textareas[k].readOnly)
            {
				setInterval
                textareas[k].style.display = 'none';
                new Insertion.After(textareas[k], '<div class="disabledTextarea" id="disabledTextareas_' + (ActiveForm.prototype.lastDisabledTextareaId++) + '">' + textareas[k].value + '</div>'); 
                var disabledTextarea = textareas[k].up().down('.disabledTextarea');
                ActiveForm.prototype.disabledTextareas[disabledTextarea.id] = disabledTextarea;
                
                var hoverFunction = function()
                {
                    try
                    {
                        $H(ActiveForm.prototype.disabledTextareas).each(function(iter)
                        {
                            iter.value.style.backgroundColor = '';
                            iter.value.style.borderStyle = '';
                            iter.value.style.borderWidth = '';
                        });
                    }
                    catch(e)
                    {
                        console.info(e)
                    }
                }
                
                Event.observe(document.body, 'mousedown', hoverFunction, true);
                Event.observe(disabledTextarea, 'click', function()
                {
                    this.style.backgroundColor = '#ffc';
                    this.style.borderStyle = 'inset';
                    this.style.borderWidth = '2px';
                }, true);
                
            }
            else
            {
                textareas[k].tinyMCEId = (this.lastTinyMceId++);
				if (!textareas[k].id) 
                {    
                    textareas[k].id = 'tinyMceControll_' + textareas[k].tinyMCEId;
                }
				
				ActiveForm.prototype.idleTinyMCEFields[textareas[k].id] = window.setInterval(function(tinyMCEField)
				{
                    try
                    {
					    if(!tinyMCEField || 0 >= tinyMCEField.offsetHeight) return;
						window.clearInterval(ActiveForm.prototype.idleTinyMCEFields[tinyMCEField.id]);
						tinyMCE.execCommand('mceAddControl', true, tinyMCEField.id);
                    }
					catch(e)
					{
						console.info(e);
					}
				}.bind(this, textareas[k]), 1000);
            }
		}
    },
    
    destroyTinyMceFields: function(container) {
        var textareas = container.getElementsBySelector('textarea.tinyMCE');
		for (k = 0; k < textareas.length; k++)
		{
            if (textareas[k].readOnly)
            {
                textareas[k].style.display = 'block';
                var disabledTextarea = textareas[k].up().down('.disabledTextarea');
                if (disabledTextarea)
                {
                    Element.remove(disabledTextarea);
                    delete ActiveForm.prototype.disabledTextareas[disabledTextarea.id];
                }
                
            }
            else
            {
    			tinyMCE.execCommand('mceRemoveControl', true, textareas[k].id);
                window.clearInterval(ActiveForm.prototype.idleTinyMCEFields[textareas[k].id]);
            }
		}
    },
    
	resetTinyMceFields: function(container)
	{
		var textareas = container.getElementsBySelector('textarea.tinyMCE');
		for(k = 0; k < textareas.length; k++)
		{
            if (textareas[k].readonly) 
            {
                continue;    
            }
			tinyMCE.execInstanceCommand(textareas[k].id, 'mceSetContent', true, '', true);
		}
	}
}


ActiveForm.Slide = Class.create();
ActiveForm.Slide.prototype = {
	initialize: function(ul)
	{
		this.ul = $(ul);
	},

    show: function(className, form, ignoreFields, onCompleteCallback)
	{
		// Show progress indicator
        this.ul.getElementsBySelector(".progressIndicator").invoke("show");
		
		setTimeout(function(className, form, ignoreFields, onCompleteCallback) 
		{
			if(typeof(ignoreFields) == 'function')
			{
				onCompleteCallback = ignoreFields;
				ignoreFields = [];
			}
			
			if(form)
	        {
	            Effect.BlindDown(form, {duration: 0.3});
	            Effect.Appear(form, {duration: 0.66});
	            
	            setTimeout(function() { 
	                form.style.display = 'block'; 
	                form.style.height = 'auto';
	            }, 700);
	        }
			
			ignoreFields = ignoreFields || [];
			var form = $(form);
			var cancel = this.ul.down("." + className + 'Cancel');
			
			this.ul.childElements().invoke("hide");
			if(cancel)
			{
			    Element.show(this.ul.down("." + className + 'Cancel'));
			}
			
			$A(form.getElementsByTagName("input")).each(function(input)
			{
				if(input.type == 'text')
				{
					input.focus();
					throw $break;
				}
			});
			
	        if(window.Form.State && !Form.State.hasBackup(form)) Form.State.backup(form, ignoreFields);
	        if(window.ActiveList) ActiveList.prototype.collapseAll();
			ActiveForm.prototype.initTinyMceFields(form); 
			
			if(onCompleteCallback)
			{
			    onCompleteCallback();
			}
		}.bind(this, className, form, ignoreFields, onCompleteCallback), 10);
	},

    hide: function(className, form, ignoreFields, onCompleteCallback)
    {
        // Hide progress indicator
        this.ul.getElementsBySelector(".progressIndicator").invoke("hide");
		
        setTimeout(function(className, form, ignoreFields, onCompleteCallback) 
        {
	        if(typeof(ignoreFields) == 'function')
	        {
	            onCompleteCallback = ignoreFields;
                ignoreFields = [];
	        }
			
	        ignoreFields = ignoreFields || [];
			var form = $(form);
			
            if(window.Form.State) Form.State.restore(form, ignoreFields);
            ActiveForm.prototype.destroyTinyMceFields(form); 
			
	        if(form)
	        {
	            Effect.Fade(form, {duration: 0.2});
	            Effect.BlindUp(form, {duration: 0.3});
	            setTimeout(function() { form.style.display = 'none'; }, 300);   
	        }
			
			this.ul.childElements().each(function(element) {
				if(!element.className.match(/Cancel/))
				{
					Element.show(element);
				}
				else
				{
	                Element.hide(element);
				}
			});
		
		    if(onCompleteCallback)
			{
            onCompleteCallback();
			}
        }.bind(this, className, form, ignoreFields, onCompleteCallback), 10);
    }   
}


/**
 * Extend focus to use it with TinyMce fields. 
 * 
 * @example
 *     <code> Element.focus(element) </code>
 *     
 *   This won't work
 *     <code>
 *         $(element).focus();
 *         element.focus();
 *     </code>
 * 
 * @param HTMLElement element
 */
Element.focus = function(element)
{
    var styleDisplay = element.style.display;
    var styleHeight = element.style.height;
    var styleVisibility = element.style.visibility;
    var elementType = element.type;

    if ('none' == element.style.display || "hidden" == element.type)
    {
        if (Element.isTinyMce(element)) element.style.height = '80px';
        
        element.style.visibility = 'hidden';
        element.style.display = 'block';
        try { element.type = elementType; } catch(e) {}
        element.focus();
        element.style.display = styleDisplay;
        element.style.height = styleHeight;
        element.style.visibility = styleVisibility;
        try { element.type = elementType; } catch(e) {}
        
        if (Element.isTinyMce(element)) element.style.height = '1px';
    }
    else
    {
        element.focus();
    }
    
    if (Element.isTinyMce(element))
    {
        var inst = tinyMCE.getInstanceById(element.nextSibling.down(".mceEditorIframe").id);  
        tinyMCE.execCommand("mceStartTyping");
        inst.contentWindow.focus();
    }
}
   
/**
 * Check if field is tinyMce field
 * 
 * @example
 *     <code> Element.isTinyMce(element) </code>
 * 
 * @param HTMLElement element
 */
Element.isTinyMce = function(element)
{
    return element.nextSibling && element.nextSibling.nodeType != 3 && Element.hasClassName(element.nextSibling, "mceEditorContainer");
}
    
/**
 * Copies data from TinyMce to textarea. 
 * 
 * Normally it would be copied automatically on form submit, but since validator overrides
 * form.submit() we should submit all fields ourself. Note that I'm calling this funciton
 * from validation, so most of the time there is no need to worry.
 * 
 * @example
 *     <code> Element.saveTinyMceFields(element) </code>
 * 
 * @param HTMLElement element
 */
Element.saveTinyMceFields = function(element)
{
    document.getElementsByClassName("mceEditorIframe", element).each(function(mceControl)
    {
         tinyMCE.getInstanceById(mceControl.id).triggerSave();
    });
}
