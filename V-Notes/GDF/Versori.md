# InfoPlus - Metrc Customer Brief

## Company Introduction

## Integration(s) Overview

Our customer is needing a quote to sync data between their “seed to sale” compliance system Metrc and InfoPlus. This customer works out of Missouri is the pilot state and we can only hit the Metrc-MO with our credentials. We will potentially need a Metrc connection for Louisiana and Mississippi, plus a new connection for BioTrack in Arkansas. Below are the three workflows needed.

Big Consideration: the Infoplus Serial Number table is NOT exposed to the API. Versori Workflows

### Workflow 1: Quick Receipt Created in InfoPlus from Metrc

Real-time data flow

Create quickReceipt

Fields needed:

SKU

Qty (cases)

Item Receipt Unit Qty (Unit per case)

Production Lot (Metrc Tag/Serial Number)

Product ID Tag (Batch No)

Expiration Date

THC %

Item Receipt Gross Wt

Location

COA Profile (file)

file transfer

Endpoints:

Endpoints Needed (Source System): [https://api-or.metrc.com/Documentation](https://api-or.metrc.com/Documentation)

Endpoints Needed (Target System):

[https://developer.infopluscommerce.com/api/reference/v3.0/#!/quickReceipt/addQuickReceipt](https://developer.infopluscommerce.com/api/reference/v3.0/#!/quickReceipt/addQuickReceipt)

[https://developer.infopluscommerce.com/api/reference/v3.0/#!/quickReceipt/executeQuickReceipt](https://developer.infopluscommerce.com/api/reference/v3.0/#!/quickReceipt/executeQuickReceipt)

Mapping Table

|   |   |   |
|---|---|---|
|Metrc Field (Source)|Infoplus Field (Target)|Notes|
|Item.Name<br><br>or<br><br>Product.Name|SKU|We will need an alert that if a SKU does not exist, an alert will trigger for the customer to create it manually|
|Quantity|quantity||
|UnitOfMeasureQuantity|itemReceiptUnitQuantity||
|Tag|productionLot||
|ProductId<br><br>or<br><br>BatchNumber|productIdTag||
|ExpirationDate|expirationDate||
|TotalTHCContent<br><br>or similar|thc|customField (already made)|
|GrossWeight|itemReceiptGrossWeight||
|LocationName|Location||
|LabTestingState<br><br>or file URI|coaProfileUrl|customField, this also NOT mandatory, unless needed for audit purposes. This would have to be a custom field in IP.|
|LabResultsFile|labFileId|customField (same as above)|
|UOM|TODO|This will need a trigger/transformation in Versori that has Auto Conversion Logic in it. Metrc expects….(also this is state-dependent) Each Grams Milligrams Ounces Pounds Milliliters Units Packages|

You will need to extract relevant fields from Metrc:

Package ID →

productionLot

Product name/SKU (mapped to Infoplus SKU)

Quantity and unit measures

Lab results →

THC %

and

COA

{ "sku": "CBD-GUMMY-25MG-30CT", // Required "quantity": 10, // Qty (cases) "itemReceiptUnitQuantity": 30, // Units per case "productionLot": "METRC-ABC123456", // Metrc Tag / Serial "productIdTag": "BATCH-456XYZ", // Batch ID "expirationDate": "2025-12-31", // ISO format date "itemReceiptGrossWeight": 12.5, // Total weight (Infoplus expects this field) "location": "Receiving Dock 1", // Location name or ID "customFields": { "thcPercent": "22.3%", // Custom field: must match custom field name in Infoplus "coaProfileUrl": "https://my-lab.com/coa123.pdf", // COA link or file reference "labFileId": "FILE-789XYZ" // If referencing uploaded file ID } }

​

### Workflow 2: Generate a Manifest via the CSV in Metrc from InfoPlus Sales Order Data

Timing: When Orders are marked as Shipped (Shipped Status)

Webhook on the InfoPlus side, to be set over with a script.

TODO from Versori - share webhook with IP

Fields Needed:

packageLabel

Price

Item Receipt Gross Weight

UOM

Quantity

Manifest Type Decision

Manifest delivery method TBD: system may push to Transfer Template endpoint or generate a CSV file to be uploaded manually. This decision depends on Metrc endpoint access and Infoplus report API capabilities.

Endpoints:

Endpoints Needed (Source System): Infoplus, shipped Orders this will be from a webbook and we send over the data below

Endpoints Needed (Target System): [https://api-or.metrc.com/Documentation](https://api-or.metrc.com/Documentation)

Mapping Table

|   |   |   |
|---|---|---|
|Metrc|Infoplus|Notes|
|PackageLabel|orderLine.productionLotTag<br><br>or custom field|PK for the Metric template label, this is the Serial Number|
|Price|orderLine.unitSellPrice||
|GrossWeight|orderLine.itemReceiptGrossWeight|have to the use item receipt gross weight, this is a custom field in IP|
|UOM|TODO|Full list is available from<br><br>GET /items/v1/uom<br><br>in Metrc API. Metrc expects….(also this is state-dependent) Each Grams Milligrams Ounces Pounds Milliliters Units Packages|
|Quantity|orderLineItem.quantity|The amount shipped|

Example Payload

{ "PackageLabel": "METRC-ABC123456", "ItemName": "CBD Gummy 25mg - 30ct", "Quantity": 10, "UnitOfMeasure": "Each", "GrossWeight": 12.5, "Price": 150.00 }

​

### Workflow 3: Inventory Reconciliation from InfoPlus to Metrc

Need Mo to scope this out after call with client

Timing: Every 15 minutes

Versori will query the Perpetual Inventory Log using

GET /infoplus-ws/perpetualInventoryRecord?updatedAtStart=2025-04-21T00:00:00

If a record has been updated, Versori will pull the productIdTag and use that to query GET /itemReceipt?productIdTag={value} Then, Versori will extract the data including itemReceipt.customFields and send that information to Metrc

Sync Direction:

Inventory sync will be bi-directional. Infoplus sends updates to Metrc, and validates if Metrc records are accurate (and vice versa).

Endpoints:

Endpoints Needed (Source System): InfoPlus, GET /perpetualInventoryRecord AND GET /itemReceipt

Endpoints Needed (Target System): PUT /items/v1/update

Mapping Table

|   |   |   |
|---|---|---|
|Metrc Field|Infoplus Table|Infoplus Field|
|PackageLabel|itemReceipt|productionLot|
|ItemName|item|itemDescription|
|Quantity|itemReceipt|quantity|
|UOM|itemReceipt|itemReceiptUnitQuantity|
|GrossWeight|itemReceipt<br><br>.customFields|itemReceiptGrossWeight|
|ExpirationDate|itemReceipt|expirationDate|
|THC %|itemReceipt.customFields|thc|
|COA URI|itemReceipt.customFields|coaProfileUrl|
|Lab File ID|itemReceipt.customFields|labFileId|
|Location|itemReceipt|location|
|Rooms|itemReceipt|zones|

NOTE: The records say we actually need all these fields to update a record over in Metrc. They did not say so on our call….I am a little curious if what we have above will work or if we need to do the below.

Name: The name of the item.

ItemCategory: The category of the item (e.g., "Infused Edible").

UnitOfMeasure: The unit of measure (e.g., "Each", "Grams").

Strain: The strain associated with the item.

THCContent: The THC content percentage.

CBDContent: The CBD content percentage.

UnitWeight: The weight per unit, if applicable.

UnitVolume: The volume per unit, if applicable.

UnitQuantity: The quantity per unit, if applicable.

UnitVolumeUnitOfMeasure: The unit of measure for volume.

UnitWeightUnitOfMeasure: The unit of measure for weight.

UnitQuantityUnitOfMeasure: The unit of measure for quantity.

## Systems

Please provide as much information as possible about the system(s) you expect to be integrating If you have prepared credentials for Versori to access these systems, see the section at the bottom of this page for information on how to share these with us.

### API Specifications

If you have any OpenAPI/Swagger specifications for these APIs, please add them here. If available, most systems may have only one, however if your API has multiple versions with separate specifications, please upload all which are relevant.

### Credentials

Please provide information on how Versori can access the system, this may involve one (or many) of the below approaches (please do not post sensitive information in this page)

If we can register for a free account ourselves, let us know and we can do this. Please also include whether your system supports multiple users per account as this determines which email address we will use to register.

If you can invite us to a test account via email, advise us on which email you have invited and we can activate the account. Our preference is unique logins per user, but if your system only allows a single user please use [solutions@versori.com](mailto:solutions@versori.com) rather than an individual’s address.

If you require to share with us specific credentials such as username/password, client_id/client_secret, or API keys etc., please use the OTS link below and share the URL to solutions@versori.com

|   |   |   |   |
|---|---|---|---|
|Vendor API Key|State|User Key|First Step|
|nxZcCpze369tCeriJyqlj98uJKmbocY0vRrjeAXqENTaQ-bd|Mo|W-KTOjrcsa2AlHL93UVd4x6ARMhyhCxf5KKYBD5SHgOve0Of|As a first step, best practice is validating facility permissions first with the '/facilities/v2/' endpoint.|

|   |   |
|---|---|
|Infoplus API Key|Site|
|434F96220A18CD1DE9F18EEDE796D9A7D60741968492A4C86CEEDB813FF0883F|[https://gooddayfarm-test.infopluswms.com/](https://gooddayfarm-test.infopluswms.com/)|
|||

#### Metrc Agnostic Demo Account

I have created an account on [https://demo.metrc.com](https://demo.metrc.com/) for you to see a Metrc interface. This is state agnostic, but perhaps help serve your needs in the meantime.

I have used your email, [mjohnson@infopluscommerce.com](mailto:mjohnson@infopluscommerce.com), as the registration email. To access, reset your password using your email.

Username: Plus0990

Password: v!hMsRL6S9bGwgj

#### Metrc Authentication Requirements

Each request to Metrc’s API must include:

API Key (issued per user + facility/license)

License Number (identifying which licensed facility you're operating in)

#### Authentication Headers Format

Every request should include the following HTTP headers:

Authorization: <API_KEY> licenseNumber: <LICENSE_NUMBER>

​

Example:

GET /packages/v2/active Host: api-mo.metrc.com Authorization: abcdefghijklmnopqrstuvwxyz123456 licenseNumber: C123456

​

#### Notes (esp for more development):

API Key is user-specific and facility-specific. A user working across multiple facilities must use the correct key and license number per request.

Keys are issued within the Metrc UI under Admin > API Keys.

Most states (e.g., OR, CA, MI) have their own Metrc environments. You must hit the correct base URL like:

Oregon:

https://api-or.metrc.com

California:

https://api-ca.metrc.com

Missouri: https://api-mo.metrc.com

Metrc does not use OAuth, bearer tokens, or refresh tokens — just those two headers.

### One-time-secrets

Users can use our secret-sharing application to upload sensitive information: [https://ots.apps.versori.io/](https://ots.apps.versori.io/).

Send the URL to your account manager or any other relevant person with an @versori.com email address and we can securely store this information for our Solutions team to access.

## Documents

working keys
W-KTOjrcsa2AlHL93UVd4x6ARMhyhCxf5KKYBD5SHgOve0Of
nxZcCpze369tCeriJyqlj98uJKmbocY0vRrjeAXqENTaQ-bd
https://sandbox-api-mo.metrc.com

Metrc.userKey
  
Metrc.vendorKey


---
Eiehter need the login to sandbox metric
or the vendor api key for demo

Line 15880

---
Sales Alignment:
- Demand
	- translates to profit
- Metric Info plus
- Procurement
- Add Cto

---
* Info plus may be source of invoice (future)
* location metrc - room.
	* location infoplus - shelf.
* Location in metrc as a indicator for line of business.
* license Number -> metrc location -> lob
* Remove from info plus if it is in a hold (unapproved) location.
* Case per wrap 
	* unit weight is the total amount of thc in the unit. thc * quantity for everything other then flower.
	* in flower it is the weight of the flower.
	* for flower quantity can become the gross weight.

fb872eca

---
* FIFO 
* show the user the products they care about.
* custom menus provide custom pricing - not connected to whs price
	* even when referencing the wholesale price. updating the whs price does not auto update the menu.
* automate a price based on the customers price group.
---
Talk to tucker about where failed packages get stored.
* should we be filtering packages by test passed.
* Problems arise with manually completed quick receipt's have duplicates across them.
* We should check existing quick receipt's for the package.
---
* Invoice manifest validation is manual <- time suck.

---
When do we still create the quick receipt even when we are missing certain attributes.