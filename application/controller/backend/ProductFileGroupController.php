<?php

ClassLoader::import("application.controller.backend.abstract.StoreManagementController");
ClassLoader::import("application.model.category.Category");
ClassLoader::import("application.model.product.Product");

/**
 * Controller for handling product based actions performed by store administrators
 *
 * @package application.controller.backend
 * @role admin.store.product
 */
class ProductFileGroupController extends StoreManagementController 
{
    private function buildValidator()
    {
		ClassLoader::import("framework.request.validator.RequestValidator");
		$validator = new RequestValidator("productFileGroupValidator", $this->request);

		$validator->addCheck('name_' . $this->store->getDefaultLanguageCode(), new IsNotEmptyCheck('_err_file_name_is_empty'));

		return $validator;
    }

    public function save()
    {
        $validator = $this->buildValidator();
		if ($validator->isValid())
		{
    		$ID = $this->request->getValue('ID');
		    if(!empty($ID))
    		{
    		    $fileGroup = ProductFileGroup::getInstanceByID((int)$this->request->getValue('ID'));
    		}
    		else
    		{
    		    $product = Product::getInstanceByID((int)$this->request->getValue('productID'));
    		    $fileGroup = ProductFileGroup::getNewInstance($product);
    		}
    		
		    foreach ($this->store->getLanguageArray(true) as $lang)
    		{
    			if ($this->request->isValueSet('name_' . $lang))
    			{
    			    $fileGroup->setValueByLang('name', $lang, $this->request->getValue('name_' . $lang));
    			}
    		}
    		
    		$fileGroup->save();
    		
            return new JSONResponse(array('status' => "success", 'ID' => $fileGroup->getID()));
		}
		else
		{
			return new JSONResponse(array('status' => "failure", 'errors' => $validator->getErrorList()));
		}
    }
    
	public function delete()
	{
	    ProductFileGroup::getInstanceByID((int)$this->request->getValue('id'))->delete();
	    return new JSONResponse(array('status' => 'success'));
	}

    public function sort()
    {
        foreach($this->request->getValue($this->request->getValue('target'), array()) as $position => $key)
        {
            if(empty($key)) continue;
            $fileGroup = ProductFileGroup::getInstanceByID((int)$key); 
            $fileGroup->position->set((int)$position);
            $fileGroup->save();
        }
        
        return new JSONResponse(array('status' => 'success'));
    }

    public function edit()
    {
        $group = ProductFileGroup::getInstanceByID((int)$this->request->getValue('id'), true);
        
        return new JSONResponse($group->toArray());
    }
    
}

?>