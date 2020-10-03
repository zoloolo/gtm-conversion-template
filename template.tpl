___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Weborama Conversion",
  "categories": [
    "CONVERSIONS",
    "ATTRIBUTION",
    "SALES"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Weborama"
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "accountId",
    "displayName": "Account identifier",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "conversionPageId",
    "displayName": "Conversion page identifier",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "accountHost",
    "displayName": "Collect host of the account",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "*.solution.weborama.fr"
        ]
      }
    ],
    "defaultValue": "wcm.solution.weborama.fr"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
log('data =', data);

const encodeUri = require('encodeUri');
const injectHiddenIframe = require('injectHiddenIframe');
const generateRandom = require('generateRandom');

const account = data.accountId;
const page = data.conversionPageId;
const host = encodeUri(data.accountHost);
const rnd = generateRandom(1,1000000);
//const revenue = data.revenue;

const url = 'https://'+host + '/fcgi-bin/dispatch.fcgi?a.A=co&a.si=' + account + '&a.co=' + page + '&g.r=' + rnd;// + 'a.re='+revenue;

//sendPixel(url);
injectHiddenIframe(url);
// Call data.gtmOnSuccess when the tag is finished.
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_hidden_iframe",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://*.solution.weborama.fr/fcgi-bin/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Main test
  code: |-
    const mockData = {
      // Mocked field values
      accountId: 1,
      conversionPageId: 1,
      accountHost: 'test.solution.weborama.fr'
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 10/3/2020, 11:04:59 PM


