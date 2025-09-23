```ts
"errors": [  
        {  
          "code": "INSUFFICIENT_STOCK",  
          "message": "Could not update the product with SKU CS-VPAO-DS-SG-F0047-W1-Q1_1A40C0300003C29000114441: The requested qty exceeds the maximum qty allowed in shopping cart"  
        }  
      ]
```

```ts
"user_errors": [  
        {  
          "code": "UNDEFINED",  
          "message": "The requested qty exceeds the maximum qty allowed in shopping cart"  
        },  
        {  
          "code": "PRODUCT_NOT_FOUND",  
          "message": "Could not find a product with SKU \"AL-VPAO-DS-SG-F0034-W1-Q1_1A40C0300003C29000095163\""  
        }  
      ]
```

## Issues
* Currently we do not get skus back on errors with add and update calls
* Currently the errors differ between add and update calls

addProductToCart errors
```
"user_errors": [  
        {  
          "code": "UNDEFINED",  
          "message": "The requested qty exceeds the maximum qty allowed in shopping cart"  
        },  
        {  
          "code": "PRODUCT_NOT_FOUND",  
          "message": "Could not find a product with SKU \"AL-VPAO-DS-SG-F0034-W1-Q1_1A40C0300003C29000095163\""  
        }  
      ]
```

Above 2 products were added and we cannot tell which error belongs to which product.

updateCartItems errors:
```
      "errors": [  
        {  
          "code": "INSUFFICIENT_STOCK",  
          "message": "Could not update the product with SKU CS-VPAO-DS-SG-F0047-W1-Q1_1A40C0300003C29000114441: The requested qty exceeds the maximum qty allowed in shopping cart"  
        }  
      ]
```

The error here does not match the addProductsToCart errors they differ in both code and message.

## Ask
* Align errors between add and update
* Add sku's to errors (more below)

Ideally for the error object it would be nice to get a keyed object by sku
```
user_errors: {
	[simpleSku]: [
		{code: string, message: string}
		...
	]
	...
}
```

But if its not possible to make the user_errors an object

We at least need the sku's the error applies to

```
user_errors: [
	{
		code: string
		message: string
		skus: [sku, sku, ...]
	}
]
```

make sure 
446 can order over salable just with adobe using 2 diff companies on the same user.

Show reservation expired modal.

### Submission
You can submit with errors and it tries as hard as it can to submit even if there was an error.





