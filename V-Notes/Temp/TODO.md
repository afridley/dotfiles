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
