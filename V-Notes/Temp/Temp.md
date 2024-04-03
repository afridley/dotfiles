@Mohamed Langi @Justin Ketterman @Mike Novitsky @Curtis Meuth 
Im uploading an image using the Upload Media /sst-services/v1/media/{user_id} endpoint

The file being placed looks like

My request looks like

{
  secure: true,
  headers: {
    'x-api-key': '----',
    Authorization: '----'
  },
  method: 'POST',
  signal: null,
  body: FormData {
    [Symbol(state)]: [
      {
        name: 'file',
        value: File {
          size: 3472522,
          type: 'image/jpeg',
          name: 'testLargePetPhoto.jpg',
          lastModified: 1708378110692
        }
      },
      {
        name: 'data',
        value: '{"fileType":"Pet","petId":"100037768","mediaType":"Images","user
Id":"100263713","isPrimary":true}'
      }
    ]
  }
}
Im getting an error response

{
  e: Response {
    data: null,
    error: { message: 'Internal server error' },
    [Symbol(realm)]: null,
    [Symbol(state)]: {
      aborted: false,
      rangeRequested: false,
      timingAllowPassed: true,
      requestIncludesCredentials: true,
      type: 'default',
      status: 502,
      timingInfo: [Object],
      cacheState: '',
      statusText: 'Bad Gateway',
      headersList: [HeadersList],
      urlList: [Array],
      body: [Object]
    },
    [Symbol(headers)]: HeadersList {
      cookies: null,
      [Symbol(headers map)]: [Map],
      [Symbol(headers map sorted)]: null
    }
  }
}


---
Check 
* Related categories h2 - articleListing
* Title on h2 - ArticleAuthorListingBody
* Rich text is article
* new article card - pds-text-body-md
* Link new article card - pds-text-body-lg
* category tag - artilce listing

---

Cookie Policy