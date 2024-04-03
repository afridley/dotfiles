```ts
dataLayer.push({  
	"event": "module_interaction",  
	"event_params": {  
	"component_id": "{{product title H1 if clicked on card or buy_now_button}}",  
	"component_type": "product_card",  
	"content_name": "{{ product_card / braze / related_product_card / products_bundle}}",  
	"page_type": "{{ article, pdp, home page, contact us, faqs, etc. }}"  
}  
},{event_params: undefined});
```