___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Weborama Conversion",
  "description": "This is the official Google Tag Manager conversion template for Weborama.",
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
    "type": "GROUP",
    "name": "requiredProperties",
    "displayName": "Mandatory properties:",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "help": "Set site or site id here.",
        "displayName": "Site id (si)",
        "simpleValueType": true,
        "name": "accountId",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "help": "Set full host (host) page here.",
        "displayName": "fullhost",
        "simpleValueType": true,
        "name": "accountHost",
        "type": "TEXT",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "help": "Set conversion page number here.",
        "displayName": "conversion page (cp)",
        "simpleValueType": true,
        "name": "conversionPageId",
        "type": "TEXT",
        "valueValidators": []
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "optionalProperties",
    "displayName": "Optional parameters:",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "help": "Set the total price here.",
        "displayName": "revenue (re)",
        "simpleValueType": true,
        "name": "revenue",
        "type": "TEXT",
        "valueValidators": []
      },
      {
        "help": "Set your invoice id here",
        "displayName": "invoice identifier (iid)",
        "simpleValueType": true,
        "name": "invoiceId",
        "type": "TEXT",
        "valueValidators": []
      },
      {
        "help": "Set the number of items purchased.",
        "displayName": "Items number (inu)",
        "simpleValueType": true,
        "name": "itemsNumber",
        "type": "TEXT",
        "valueValidators": []
      },
      {
        "help": "Set your client id here.",
        "displayName": "client identifier (cid)",
        "simpleValueType": true,
        "name": "clientId",
        "type": "TEXT",
        "valueValidators": []
      },
      {
        "help": "Set to 1 if the client is a new client.",
        "displayName": "is client (isc)",
        "simpleValueType": true,
        "name": "isClient",
        "type": "TEXT",
        "valueValidators": []
      },
      {
        "help": "Set an object with extra data.",
        "displayName": "optional parameters (opt)",
        "simpleValueType": true,
        "name": "optionalParameters",
        "type": "TEXT",
        "valueValidators": []
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const logToConsole = require('logToConsole');
const injectScript = require('injectScript');
const callInWindow = require('callInWindow');
const makeInteger = require('makeInteger');

logToConsole('data sent:', data);

const trackingUrl = 'https://cstatic.weborama.fr/js/advertiserv2/adperf_conversion.js';

const accountId = data.accountId;
const revenue = data.revenue;
const clientId = data.clientId;
const fullHost = data.accountHost;
const itemsNumber = data.itemsNumber;
const invoiceId = data.invoiceId;
const conversionPageId = data.conversionPageId;
const optionalParameters = data.optionalParameters;
var isClient = data.isClient;

if (makeInteger(isClient) > 0) {
  isClient = 1;
} else   {
  isClient = 0;
}

function sendConversion() {
  const adperftrackobj = {
    site : accountId,
    fullhost: fullHost,
    conversion_page: conversionPageId,
    client: clientId,
    is_client: isClient,
    amount: revenue,
    invoice_id: invoiceId,
    quantity:itemsNumber,
    optional_parameters: optionalParameters
  };
  callInWindow('adperfTracker.track', adperftrackobj);
  data.gtmOnSuccess();
}

injectScript(trackingUrl, sendConversion, data.gtmOnFailure, 'weborama_conversion');


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
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
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
                "string": "https://cstatic.weborama.fr/"
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
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "adperfTracker.track"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
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


