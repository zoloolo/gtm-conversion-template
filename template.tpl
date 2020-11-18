___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Weborama Conversion",
  "description": "Tag template for creating Conversion for Weborama.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX0FwcE5leHVzLVNpbW8tQWhhdmE\u003d",
  "securityGroups": [],
  "categories": [
    "CONVERSIONS",
    "ATTRIBUTION",
    "SALES"
  ],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "Weborama",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "accountId",
    "displayName": "Account ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "conversionPageId",
    "displayName": "Conversion page ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
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
        "type": "NON_EMPTY"
      }
    ],
    "defaultValue": "wcmgtm.solution.weborama.fr"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const encodeUri = require('encodeUri');
const encodeUriComponent = require('encodeUriComponent');
const injectHiddenIframe = require('injectHiddenIframe');
const generateRandom = require('generateRandom');

const rnd = generateRandom(1,1000000);

var acc = data.accountId?data.accountId+"":"0";
var pge = data.conversionPageId?data.conversionPageId+"":"0";
var hst = data.accountHost?data.accountHost+"":"wcmgtm.solution.weborama.fr";

const url = 'https://'+encodeUriComponent(hst)+'/fcgi-bin/dispatch.fcgi?a.A=co&a.si='+encodeUriComponent(acc)+'&a.co=' + encodeUriComponent(pge)+'&g.r=' + rnd;

injectHiddenIframe(url, data.gtmOnSuccess);


___WEB_PERMISSIONS___

[
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

scenarios: []


___NOTES___

Created on 05/07/2019, 10:21:41


