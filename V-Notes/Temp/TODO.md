- [ ] Try `mergeCachingHeaders: true,`
- [ ] try https://github.com/netlify/netlify-plugin-gatsby/issues/287
- [ ] Make sure to fix breed listing,

---
Braze Product Cards

the braze breed page does not use the StorageProductCard

Need to build an optional intermediary wrapper that gathers context

But if context isn't included still works?

---
Check
offers listing
product listing

---
### 28th

`environment = { NETLIFY_IMAGE_CDN = "true", GATSBY_ENABLED_LANGUAGES = "en", GATSBY_DRUPAL_ENDPOINT = 'https://dev-purina-h20.pantheonsite.io/', GATSBY_DRUPAL_SEARCH_ENDPOINT = 'https://dev-purina-h20.pantheonsite.io/api/search' }
`

There is an error with the global braze store.
Cannot call hook within the body of a non-function.
May need to move to Layout?


add unit tests for offers not having an address.

7664

---
For netlify api



```ts
import type { Context } from '@netlify/functions';
import { getTokenFromHeaders } from '@purinanbm/pup-script';
// eslint-disable-next-line
import { createResponse } from 'nFunctionsCommon/helpers.mjs';
// eslint-disable-next-line
import { SstServices } from 'src/services/sst/SstServices';

export default async (req: Request, context: Context) => {
  // eslint-disable-next-line
  const shouldLog = Netlify.env.get('GATSBY_LOGGING');
  // eslint-disable-next-line
  const apiKey = Netlify.env.get('SST_ACCESS_TOKEN');
  if (shouldLog === 'true') {
    // eslint-disable-next-line
    console.log(
      'Health Check Request: ',
      // eslint-disable-next-line
      require('util').inspect({ req, context }, { showHidden: false, depth: null, colors: true }),
    );
  }

  const S = new SstServices({
    baseUrl: 'https://api.services-qa.purina.com',
    baseApiParams: {
      secure: true,
      headers: {
        'x-api-key': process.env.SST_ACCESS_TOKEN || '',
      },
    },
    securityWorker: (securityData: any | null) => {
      if (securityData) {
        return {
          headers: {
            Authorization: securityData.token,
          },
        };
      }
      return undefined;
    },
  });

  console.log(req.headers);
  const token: string = getTokenFromHeaders(req.headers, 'access', false);
  console.log(token);
  S.setSecurityData({
    token:
      'yJraWQiOiJvUkZqeTlNY2pjRU1Gejl2ZmxQdnJpaXRNVGZKdSt0MjVibFNLb3lmQ0xNPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiJjMjg2ZTY2NS03Y2M5LTQyMDgtODc4OS03MDk4ZWEzZDg3OTciLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0xLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMV9xUnIwSDZIWDIiLCJ2ZXJzaW9uIjoyLCJjbGllbnRfaWQiOiIxOWU5bmZzcmQ2MjFtMGJ0Z2Z2OWNmNjhydCIsIm9yaWdpbl9qdGkiOiI1NzdiYzc2Ni0wMGMzLTRjZDYtODY3ZC0yODA0OTZiZDYxOTIiLCJldmVudF9pZCI6ImRkZDZhM2MxLTM1NTUtNDcwNy05OGVkLWFlNGQ3NzkxN2U2YSIsImFuc2lyYUlkIjoiMTAwNDc0Nzg4IiwiYW5zaXJhVXVpZCI6IjRkZjNlZTZkLWE2YmEtMTFlZi05YWI4LTBlMmU5MGRiZWFhZCIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4gcGhvbmUgb3BlbmlkIHByb2ZpbGUgZW1haWwiLCJhdXRoX3RpbWUiOjE3Mzg2MTI3MTcsImV4cCI6MTczODYxNDY2OCwiaWF0IjoxNzM4NjEzNzY4LCJqdGkiOiJjMjAyODdmMS00OWE5LTRkYzMtOWRhYy1lNDI0OGJlYzI2MGUiLCJ1c2VybmFtZSI6ImMyODZlNjY1LTdjYzktNDIwOC04Nzg5LTcwOThlYTNkODc5NyJ9.fbTyety7AmU_WQaxJt0i-mykgsVISg6eCmnZfkGhTEhx31tzNNrz61mgF8pcyEF0epQ8Cc5OhfUJsQXwoGbyqqAewaIaEJYLkf_iEp9JdNKKYpAFiWJzQydI8a5C-6PDECzJmRyL1yZya7eqNLWG0NDQJ_DkFDgaRH5_r6w2sCaat4AxxQafsCxxVCMjf4LXIb0jKh_eCOBxlyOAOI3ShHjeNGfTkkdjaRPQqowftXXeckEWRCc1DXuBdv7HqlgpmHHhG_z7sLxnJgAtD4DuRPhCjlQ1DQfCqUNUZurpXhyZh6XrnF_ptQwsb4WSiftOoUVMD9ng0Rno_Jp9WQ0FcQ',
  });
  try {
    const x = await S.getUserByUserIdSstServicesV1UsersUserIdGet({
      userId: '4df3ee6d-a6ba-11ef-9ab8-0e2e90dbeaad',
    });
    console.log(
      'Health Check Request: ',
      // eslint-disable-next-line
      require('util').inspect({ x }, { showHidden: false, depth: null, colors: true }),
    );
  } catch (e) {
    // eslint-disable-next-line
    console.log(
      'success',
      require('util').inspect(e, { showHidden: false, depth: null, colors: true }),
    );
  }

  return createResponse({ statusCode: 200, body: { message: 'healthy' } });
};


```

---
Netlify functions not working
https://github.com/netlify/cli/issues/1076
https://www.netlify.com/blog/2018/09/13/how-to-run-express.js-apps-with-netlify-functions/
https://docs.netlify.com/frameworks/express/

----

https://uat-purinareg.ansiradigital.com/service/oauth/v2/token?client_id=281_31nsigz48oogd3895udfmk94ewrssjdjdoiswsw8sk4owogos44sk65&client_secret=z50yp5490ifkmrc5t5fgmn54h6dfwhsdi03js8k8ss00cosw4wo0cwg0ki&grant_type=client_credentials

```
            {/* <div */ }
            {/*   key={brand.id} */ }
            {/*   className="pds-border-t pds-border-t-surface-line pds-py-4 md:pds-py-5" */ }
            {/* > */ }
            {/*   <Checkbox */ }
            {/*     id={`campaigns-${brand.keyName}`} */ }
            {/*     value={brand.keyName} */ }
            {/*     checked={getValues('campaigns').includes(brand.keyName)} */ }
            {/*     onCheckedChange={(value: boolean) => handleCheckedChange(brand.keyName, value)} */ }
            {/*     {...register('campaigns')} */ }
            {/*     label={brand.name} */ }
            {/*   /> */ }
            {/* </div> */ }

```

```
            <div
              key={brand.id}
              className="pds-border-t pds-border-t-surface-line pds-py-4 md:pds-py-5"
            >
              <Checkbox
                id={`campaigns-${brand.keyName}`}
                value={brand.keyName}
                checked={getValues('campaigns').includes(brand.keyName)}
                onCheckedChange={(value: boolean) => handleCheckedChange(brand.keyName, value)}
                {...register('campaigns')}
                label={brand.name}
              />
            </div>

```

https://dev-h20.purina.com/subscriptions/preferences?uid=NGRmM2VlNmQtYTZiYS0xMWVmLTlhYjgtMGUyZTkwZGJlYWFk

https://dev-h20.purina.com/subscriptions/unsub?brand=PU&uid=NGRmM2VlNmQtYTZiYS0xMWVmLTlhYjgtMGUyZTkwZGJlYWFk


----
```
meta {
  breed_species: {
    label: 'Species',
    weight: -5,
    field_id: 'field_species_term',
    url_alias: 'species'
  },
  breed_size: {
    label: 'Size',
    weight: -2,
    field_id: 'field_breed_size',
    url_alias: 'breed-size'
  },
  breed_coat: {
    label: 'Coat',
    weight: -1,
    field_id: 'field_coat',
    url_alias: 'breed_coat'
  },
  breed_energy: {
    label: 'Energy',
    weight: 0,
    field_id: 'field_energy',
    url_alias: 'breed_energy'
  },
  breed_shedding: {
    label: 'Shedding',
    weight: 1,
    field_id: 'field_shedding',
    url_alias: 'breed_shedding'
  }
}
```

```
desired {
  breed_species: {
    label: 'Species',
    weight: -5,
    field_id: 'field_species_term',
    url_alias: 'species'
  },
  breed_size: {
    label: 'Size',
    weight: -2,
    field_id: 'field_breed_size',
    url_alias: 'breed-size',
    facets: [
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed-size%3A85',
        raw_value: '85',
        values: { value: 'Small', count: 45 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed-size%3A1110',
        raw_value: '1110',
        values: { value: 'Medium', count: 61 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed-size%3A87',
        raw_value: '87',
        values: { value: 'Large', count: 69 }
      }
    ]
  },
  breed_coat: {
    label: 'Coat',
    weight: -1,
    field_id: 'field_coat',
    url_alias: 'breed_coat',
    facets: [
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_coat%3Ashort',
        raw_value: 'short',
        values: { value: 'Short', count: 86 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_coat%3Amedium',
        raw_value: 'medium',
        values: { value: 'Medium', count: 75 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_coat%3Along',
        raw_value: 'long',
        values: { value: 'Long', count: 63 }
      }
    ]
  },
  breed_energy: {
    label: 'Energy',
    weight: 0,
    field_id: 'field_energy',
    url_alias: 'breed_energy',
    facets: [
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_energy%3Amedium',
        raw_value: 'medium',
        values: { value: 'Medium', count: 87 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_energy%3Ahigh',
        raw_value: 'high',
        values: { value: 'High', count: 83 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_energy%3Alow',
        raw_value: 'low',
        values: { value: 'Low', count: 18 }
      }
    ]
  },
  breed_shedding: {
    label: 'Shedding',
    weight: 1,
    field_id: 'field_shedding',
    url_alias: 'breed_shedding',
    facets: [
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_shedding%3Asome',
        raw_value: 'some',
        values: { value: 'Some', count: 128 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_shedding%3Aminimal',
        raw_value: 'minimal',
        values: { value: 'Minimal', count: 58 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_shedding%3Aheavy',
        raw_value: 'heavy',
        values: { value: 'Heavy', count: 50 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_shedding%3Anone',
        raw_value: 'none',
        values: { value: 'None', count: 17 }
      }
    ]
  }
}
```

```
{
current after
    id: 'field_coat',
    values: [
      {
        url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_coat%3Ashort&species=1117',
        raw_value: 'short',
        values: { value: 'Short', count: 86 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117',
        raw_value: 'medium',
        values: { value: 'Medium', count: 75, active: 'true' }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Along&f%5B1%5D=breed_coat%3Amedium&species=1117',
        raw_value: 'long',
        values: { value: 'Long', count: 63 }
      }
    ]
  },
```

``` 
desire
breed_coat: {
    label: 'Coat',
    weight: -1,
    field_id: 'field_coat',
    url_alias: 'breed_coat',
    facets: [
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_coat%3Ashort',
        raw_value: 'short',
        values: { value: 'Short', count: 86 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_coat%3Amedium',
        raw_value: 'medium',
        values: { value: 'Medium', count: 75 }
      },
      {
        url: 'https://dev.purina.com/api/search/breeds?species=1117&f%5B0%5D=breed_coat%3Along',
        raw_value: 'long',
        values: { value: 'Long', count: 63 }
      }
    ]
  },
```

```
[
  [
    {
      field_coat: [
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_coat%3Ashort&species=1117',
          raw_value: 'short',
          values: { value: 'Short', count: 86 }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?species=1117',
          raw_value: 'medium',
          values: { value: 'Medium', count: 75, active: 'true' }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Along&f%5B1%5D=breed_coat%3Amedium&species=1117',
          raw_value: 'long',
          values: { value: 'Long', count: 63 }
        }
      ]
    }
  ],
  [
    {
      field_energy: [
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_energy%3Ahigh&species=1117',
          raw_value: 'high',
          values: { value: 'High', count: 35 }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_energy%3Amedium&species=1117',
          raw_value: 'medium',
          values: { value: 'Medium', count: 34 }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_energy%3Alow&species=1117',
          raw_value: 'low',
          values: { value: 'Low', count: 7 }
        }
      ]
    }
  ],
  [
    {
      field_shedding: [
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_shedding%3Asome&species=1117',
          raw_value: 'some',
          values: { value: 'Some', count: 45 }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_shedding%3Aheavy&species=1117',
          raw_value: 'heavy',
          values: { value: 'Heavy', count: 29 }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_shedding%3Aminimal&species=1117',
          raw_value: 'minimal',
          values: { value: 'Minimal', count: 27 }
        },
        {
          url: 'https://dev.purina.com/api/search/breeds?f%5B0%5D=breed_coat%3Amedium&f%5B1%5D=breed_shedding%3Anone&species=1117',
          raw_value: 'none',
          values: { value: 'None', count: 9 }
        }
      ]
    }
  ],
```