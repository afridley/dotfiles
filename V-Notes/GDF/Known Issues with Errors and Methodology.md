## Introduction
Due to the way adobe commerce works we need to detect certain errors on our side.

This is because we have artificial unit caps and attributes that need to show errors.

Mainly the `availability` attribute.

This is further complicated by adobe commerce product search having caching times for those attributes.

---
## Adobe Product Attributes stages
There are 3 stages of caching the user may experience. Using availability attribute as an example

In this example an admin has just changed a product from `available` to `unavailable`

* Stage1 | 0min: The attributes in product search have not yet updated
	* The user can add the item to their cart.
* Stage2 | 5min: The attribute updates in product search
	* The user will receive an error when trying to add the unavailable product to their cart.
* Stage3 | 15min: Product search filters out the unavailable product
	* User is incapable of adding the product.
## Issues
### Availability
> Behavior
> OnChange
> With availability when a product becomes available we opt to remove it from a users cart and display a dismissible error that we took that action on behalf of the user.
> 
> OnGetCart
> When we get a cart the error will be a hard error that will prevent the user from continuing until they go to make other adjustments (we will remove the product from their cart) or they can remove the product from their cart.

Because the product search api has 3 stages if you do not yet have a unavailable item in your cart you may be able to add it.

Once it is in your cart your cart will have the correctly updated attributes as the product attributes in your cart update without noticeable delay.

But if you are just adding an unavailable item to your cart initially if the Product Search api is in stage 1 or cached locally you will be allowed to add it.

When you hit a unavailable error we will automatically remove the item from your cart and notify the user.

### Unit Cap Errors
We do our best to prevent the user from even getting these, and there should be almost no case in which the user can currently hit these errors.

But if a user did get a unit cap error. We cant send the api request so we return early and resync the cart.

This means the user ends up losing all their changes since the last save.

### Api Errors
We do not yet know all the possible api errors.

The most common is an adjustment.
In this case we inform the user and adjust their inventory.

---
## Verification handling
The best flow we have found:

When a user hits view cart.
* if they have no changes they will validate their cart and continue if no hard errors are found.
* If they have pending changes they will first have their cart saved.
	* If a dismissible error is found they will remain on the page to see the new errors. (usually adjustments)
	* They can then re click the button if there are not any hard errors
	* If there are no errors they continue to their cart