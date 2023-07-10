## Current
```json
{
	// Hard Coded for every event
    "event": "select_content", 
    
    // module title field entered by cms
    "eventCategory": "A Cat Chow For Every Cat", 
    
    // Inner text. So the innermost text of a component. Usually the body or link text in cms
    "eventAction": "NATURALS", 
    
    // Inner text. Same as above
    "eventLabel": "NATURALS", 
    "event_params": {
    
	    // Inner Text same as above. Sounds like this is not needed
        "linkTitle": "NATURALS", 
        
        // url of the page that is being navigated to will be sanitized if queryParams are present
        "linkUrl": "http://localhost:3000/cat-chow/dry-cat-food/naturals", 
        
        // title of module that current component is a child of. Probably not needed anymore now that there will not be multiple nesting
        "componentParent": "A Cat Chow For Every Cat", 
        
		// The drupal id of the item assigned by the cms. This is incase componentId is duplicated. as there is no unique key for components just for modules other then the drupalId.
        "componentDrupalId": "3bef1504-9d3e-47a8-bc48-59fc4a0428d0", 
        
        // This comes from the link Title in cms or innerHtml. As with some components there is no component Title attribute to properly id these.
        "componentId": "NATURALS", 
        
        // Position of the component left to right on desktop.
        "componentPosition": "2 of 6", 
        
        // The type assigned by the cms storage__ will be stripped
        "componentType": "storage__icon_link", 
        
        // Probably unneeded now that we will not have multiple components and you should have this already
        "moduleParent": "Cat Chow",
        
        // Drupal id given by the cms incase title component has duplicate though this should be rare as it would mean a cms author has titled the 2 storage modules the same which would be a mistake.
        "moduleDrupalId": "e8a2293b-439a-426d-bb07-4b995ca690a8",
        
        // The "name" given to the module by cms author. This is different then the visual Title field. Though cms author's atleast right now have been using the same value for both name and title.  
        "moduleId": "A Cat Chow For Every Cat",
        
        // Position of module or row vertically on page so this is the 4th row on the page
        "modulePosition": "4",
        
        // Type given by the cms to the module. storage__ will be stripped
        "moduleType": "storage__category_cards",
        
        // The page type given by cms. node__ will be stripped
        "pageType": "node__page",

		// unneded now as this should already be collected.
        "pageTitle": "Cat Chow"
    }
}
```
### Additional params that could be passed
```json
{
	// Url of page that event happend. Though this is probably already logged
	"baseURI": "http://localhost:3000/cat-chow",

	// This would only show up when available as not all elements have this
	"moduleEntityHeadingElement": 'h2', 

	// This is the visual title that the element was given. this is different then moduleId as that comes from the name (admin) field.
	"moduleTitle": "A Cat Chow For Every Cat",

	// This again can only be passed if available though most modules do allow a heading and body text 
	"moduleBodyText": "<p>Cat Chow has thoughtfully-crafted formulas for all kinds of cats.</p>" 
}
```
