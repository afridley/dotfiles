3 things
* On route change pathname.
* component analytics.
	* Module Id.
	* What analytics trying to use for.
* Social links cards overlapping intentions
	* Do we add SEO things on to storage

modulePosition overall module.
component position within the module.

1 based index

all values pushed to the data layer should be lowercase

-category cards
-article cards* 1
-product cards* 2
ingredients map only missing componentType

---
article Cards: No name field on field_article
product Cards: No name on node product, node product non food, node product bundle


---
Needs ids assigned in components and indexes passed in
* brandGrid-
* card grid-
* category cards-
* highlights-
* article cards-
* manual cards
* product cards
* reviews
* contact cards
* ingredient map
* faq section:

---
What analytics needs
* moduleOrder => modulePosition
* link_url becomes item_id
* item_id becomes internal_path

---
Ansira profiles cookie
* Called profiles_uuid

---
Hide recaptcha message 
and add what google wants

---
Make the eventLabel a title


---
Ingredients component on product details and ingredients page.

Not going to make the 
eventCategory: product details.
eventCategory will be ingredients. I can add a url event param to tell you which page it's coming from

add [notSet] as default