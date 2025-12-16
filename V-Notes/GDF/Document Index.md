
| Name                            | Type                      | Link                                                                                                                                                                                                                                                                             |
| ------------------------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Info Plus api                   | Ref                       | https://gooddayfarm.atlassian.net/wiki/spaces/SD/pages/154566660/Infoplus                                                                                                                                                                                                        |
| Bio Track                       | Ref                       | https://gooddayfarm.atlassian.net/wiki/spaces/SD/pages/154370087/Bio+Track+Arstems                                                                                                                                                                                               |
| Ways of working                 | Need to read all children | https://gooddayfarm.atlassian.net/wiki/spaces/SD/pages/222298140/Ways+of+Working+WiP                                                                                                                                                                                             |
| Infused smokable change request | Ref - Hidden              | https://gooddayfarm-my.sharepoint.com/:x:/r/personal/kmcbride_gooddayfarm_com/_layouts/15/Doc.aspx?sourcedoc=%7B8594C3CE-DCE2-44B9-A1D8-6479A8249A72%7D&file=Infused%20Smokables%20-%20Change%20Request.xlsx&wdOrigin=TEAMS-MAGLEV.p2p_ns.rwc&action=default&mobileredirect=true |
| GDF SYSTEM MAP                  |                           | https://lucid.app/lucidchart/e45860a6-eafb-483f-8dc5-b78a56e85ef5/edit?invitationId=inv_388f0ffa-d8f6-4b2d-b7e5-c6ba597a363b&page=lwz363Tdt0GS                                                                                                                                   |
| Systems Diagram                 |                           | https://lucid.app/lucidchart/76fc9c81-aa6e-445d-ab04-1c5bbf22b2f1/edit?invitationId=inv_b80ed327-9c0d-4ff4-9bd5-4a7f232b5e30&page=5cyL_33s9pDO                                                                                                                                   |
| SKU doc                         |                           | Still waiting on.                                                                                                                                                                                                                                                                |
| Info Plus                       | Attributes- Hidden        | https://gooddayfarm-my.sharepoint.com/:x:/p/kmcbride/EX5HveXkDZBNmW8Eh1VMISwBh9126JpCzBjS12OBSO9MXw?wdOrigin=TEAMS-MAGLEV.p2p_ns.rwc&wdExp=TEAMS-TREATMENT&wdhostclicktime=1762799023863&web=1                                                                                   |
| Info plus diagram flow          |                           | https://www.figma.com/board/35G551ozJDjGYgt9p2GZeE/InfoPlus?node-id=0-1&p=f&t=LoNBovCgLCTvri1x-0                                                                                                                                                                                 |
| Arch diagram Kieran             |                           | https://www.figma.com/board/ze0GL2d3qSMLEnQrktiCsl/Tech---Adobe---System-Map?node-id=277-310&t=Tl1u3GyHZqzZYLQd-0                                                                                                                                                                |


| Excalidraw            | Link                                                                      |
| --------------------- | ------------------------------------------------------------------------- |
| dutchie intake sketch | https://excalidraw.com/#json=2cNqw7n5jAuk8X4KV2y8T,l_-7KeBorNE1wmUXdTJvYw |


Retail Dutchie data comes into snowflake.
* Does the master Sku get mangled going into Dutchie.
	* Product sku stored in dutchie
	* Do we get product sku back out
		* If not we cannot do analysis on the infused smokes by cultivar in the future
* Can we still read it when we get retail data back out.
* Why does retail care about cultivar does it drive pricing or is it just that consumers care about it.
* maintainability
* extendability
* If we want to do analysis based on cultivar

---
Talked to the team we are regrouping tomorrow to fill out https://gooddayfarm.atlassian.net/browse/W33D-851 in more detail.

Main concern is that Retail systems having a different Idea of what the product is then wholesale. This could cause headaches down the road.

* Sku's go from CATSY into Dutchie.
	* Since Dutchie is retail my guess is something either happens to the master sku or the product sku is passed into Dutchie
		* When sales data comes out of Dutchie does it contain the Product sku or just the Master sku
			* If just the Master Sku we will not be able to perform analysis on infused smokables within certain cultivars.

Main questions that could help clarify
1. What are we doing in regard to infused smokable skus when they go into Dutchie, and when they come back out into snowflake?
2. Do cultivars on Infused Smokeables drive pricing in any way?
3. Will Infused Smokeables get a cultivar set?
4. Why does retail care about the cultivar on Infused Smokables? Is it for the customer or does it drive something like price etc?

The way that we are describing the data in wholesale where the cultivar does not appear in the master sku.
Seems like it would lend more to a retail experience similar to Amazon

In which the user would click on Grape flavored infused smokes and be presented within that product several cultivar options to choose from.

---
For segmentSet on the bundle. To save time during product creation.
so it ends up in the bundle and simple attribute sets.


---
- PG dissmissal
- disorganization
- politics
- inserts himself between team and information then icorrectly shares the info.
- to optics based
-
---
## Credentials

<aside> <img src="/icons/info-alternate_green.svg" alt="/icons/info-alternate_green.svg" width="40px" />

_Please provide information on how Versori can access the system, this may involve one (or many) of the below approaches (please do not post sensitive information in this page)_

- _If we can register for a free account ourselves, let us know and we can do this. Please also include whether your system supports multiple users per account as this determines which email address we will use to register._
- _If you can invite us to a test account via email, advise us on which email you have invited and we can activate the account. Our preference is unique logins per user, but if your system only allows a single user please use [solutions@versori.com](mailto:solutions@versori.com) rather than an individual’s address._
- _If you require to share with us specific credentials such as username/password, client_id/client_secret, or API keys etc., please use the OTS link below and share the URL to [solutions@versori.com](mailto:solutions@versori.com)_ </aside>

|Vendor API Key|State|User Key|First Step|
|---|---|---|---|
|nxZcCpze369tCeriJyqlj98uJKmbocY0vRrjeAXqENTaQ-bd|Mo|W-KTOjrcsa2AlHL93UVd4x6ARMhyhCxf5KKYBD5SHgOve0Of|As a first step, best practice is validating facility permissions first with the '/facilities/v2/' endpoint.|

|Infoplus API Key|Site|
|---|---|
|434F96220A18CD1DE9F18EEDE796D9A7D60741968492A4C86CEEDB813FF0883F|[https://gooddayfarm-test.infopluswms.com/](https://gooddayfarm-test.infopluswms.com/)|
|||

### Metrc Agnostic Demo Account

I have created an account on [](https://demo.metrc.com/)[https://demo.metrc.com](https://demo.metrc.com) for you to see a Metrc interface. This is state agnostic, but perhaps help serve your needs in the meantime.

I have used your email, [mjohnson@infopluscommerce.com](mailto:mjohnson@infopluscommerce.com), as the registration email. To access, reset your password using your email.

Username: Plus0990

Password: v!hMsRL6S9bGwgj

**https://github.com/hey-api/openapi-ts**
https://github.com/acacode/swagger-typescript-api
---
## Meeting Crimson Aftermath edition
* Pushed to info plus - waiting for response.
* Adobe side works to Chads requirements.
* No one knows whats going on.


* Reservations
* Orders over 100 died
* No multi
---
## Procurement
### Time savers
* Download data - in an analytical format - 
* Based on historic analytic data - demand analysis - purchase order.
* Keying the orders into the ordering portal.

24k data.

Uploading to the server will save time.

---
* Order combination
* Per customer pricing
* Be able to update pricing Andy's spreadsheet to enter prices for each product line for each customer group.
	* Per customer or group ?
---

