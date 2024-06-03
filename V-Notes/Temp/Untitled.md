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

Bearer eyJraWQiOiJTNEYxa0F1Y1ZPNXp0QkJ1YUU4XC80WWZwRU9qc3d4cmE5QTRcL3oxTnhPblk9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI2YWI0Mzk4MC1mYjlmLTQxOGItOWM5NC1jM2VmYjg1MDk1MGQiLCJkZXZpY2Vfa2V5IjoidXMtZWFzdC0xX2QyNmU3Yjk5LTU0NzgtNDA3MC05NDVhLWE1Nzc4MDA1ZTQ5NyIsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xX2k3VFZlSVhleCIsImNsaWVudF9pZCI6IjNoMnQwcGJiMHNjMXZpZXQ4c2xic3RsY29iIiwib3JpZ2luX2p0aSI6IjlhMWNlOWJmLTg4OWItNGExOS04ZTU3LWIyMjhlZDAxYWI5ZCIsImV2ZW50X2lkIjoiN2ZlODNlYWItNTkzZC00NTc2LWFiYjUtMDk1ODNmNjA3ZWY3IiwiYW5zaXJhSWQiOiIxMDAyNjM3MTMiLCJhbnNpcmFVdWlkIjoiNjc3YzczMGQtMmIxOC0xMWVlLWI2OTYtMGVlZDkwM2M5YmE3IiwidG9rZW5fdXNlIjoiYWNjZXNzIiwic2NvcGUiOiJhd3MuY29nbml0by5zaWduaW4udXNlci5hZG1pbiIsImF1dGhfdGltZSI6MTcxNTI4NDQzNSwiZXhwIjoxNzE1Mjg4MDM0LCJpYXQiOjE3MTUyODQ0MzUsImp0aSI6IjNkYTEzODE2LWVkMWItNDgwMS1iNjQwLTljYWRhNGUyNzNmZSIsInVzZXJuYW1lIjoiNmFiNDM5ODAtZmI5Zi00MThiLTljOTQtYzNlZmI4NTA5NTBkIn0.CxI2JyrKYalxjYIqelVYhBCATtIF89UNCSslLVEI2_Kq9iFMNRuPmuIf-d6jgaJd4a835I-XWCNihKPa9IUB35oc8M-PmVZc9FNo_V6Hs9Y80asE8cZgIgzaa8N73wBa6wKgZD18aHCKDAifykL9h8t4B1Jse8Cykgsn-Mov9azlpEU54gVyqUp4WgANki0tpPyTIS6iDIw9TWfLNgZbc-jtiGb_9u3qnCRFtSLQCiChj5o5j3vbkKrkihD2I1eJcWdYqaQ0hd80vxg3J-JhUwuDXknPTBP_IgResUxIM0x_N1pBMiNr_c5Rm7iQ5oVzoSB8KQRfuG_QZPajNAQFNw
- [x] change name generic
- [x] take feeding guide link out of component
- [x] make sure all links are in new tabs



```ts
export const setShippingToCart = async ({ cartId, shipping }: { cartId: string, shipping: ICheckoutState["shipping"]}) => {
  const header = headers()
  const idToken = getCognitoTokenFromHeaders(header, "id", false)
  const accessToken = getCognitoTokenFromHeaders(header, "access", false)

  try {
    // TODO: can refactor these in formState to match the commerce api
    const {
      phone, zipCode, state, city, street1, first, last,
    } = shipping

    const setShipping = await fetch(url, {
      cache: "no-cache",
      // next: { revalidate: revalidationTime },
      // cache: "force-cache",
      method: "POST",
      headers: commerceHeaders({ accessToken, idToken }),
      body: JSON.stringify({
        query: shippingMutation,
        variables: {
          input: {
            cart_id: cartId,
            shipping_addresses: [
              {
                address: {
                  firstname: first,
                  lastname: last,
                  street: [
                    street1,
                    shipping.street2,
                  ],
                  city,
                  region: state,
                  postcode: zipCode,
                  country_code: "US",
                  telephone: phone,
                },
                customer_notes: "",
              },
            ],
          },
        },
      }),
    })

    const shippingRes = await setShipping.json()

    if (process.env.NEXT_PUBLIC_LOGGING === "true") {
      // eslint-disable-next-line
      console.log(require("util").inspect(shippingRes, { showHidden: false, depth: null, colors: true }))
    }

    return shippingRes

    // eslint-disable-next-line
  } catch (e: any) {
    return processError(e)
  }
}

```