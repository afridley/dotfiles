1. clean graphql uneeded queries
2. Revisit rich text once all components are rethemed
	1. Link color needs to be themed
3. Revisit button variant to add
	1. 'btn' | 'btn-outline' | 'btn-link'
4. Revisit Stars
	1. product review
	2. product card



change 
* contact cards - grid and fix bug
* when greater then 4 entries 2 up on mobile - maybe

----
In the future revisit contact card
Revisit accordion


---
Gina webster


----
Collection Listing page using 
```
query MyQuery {
  allTaxonomyTermBreedCollection {
    edges {
      node {
        id
        relationships {
          node__breed {
            id
            field_species
          }
        }
      }
    }
  }
}
```
Breed collection  not making it through to the listing page.
