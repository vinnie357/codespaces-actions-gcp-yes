{
    "class": "AS3",
    "action": "deploy",
    "persist": true,
    "declaration": {
      "class": "ADC",
      "schemaVersion": "3.13.0",
      "id": "${uuid}",
      "label": "Sample 1",
      "remark": "An HTTPS sample application",
      "controls": {
        "trace": true
      },
      "Sample_01": {
        "class": "Tenant",
        "A1": {
          "class": "Application",
          "template": "https",
          "serviceMain": {
            "class": "Service_HTTPS",
            "virtualAddresses": [
              "${publicvip}",
              "${privatevip}"
            ],
            "pool": "web_pool",
            "serverTLS": "webtls",
            "policyWAF": {
              "use": "OWASPAutoTune"
            },
          "securityLogProfiles": [
              {
              "bigip": "/Common/Log all requests"
              }
          ]
          },
          "web_pool": {
            "class": "Pool",
            "monitors": [
              "tcp"
            ],
            "members": [{
              "servicePort": 80,
              "addressDiscovery": "fqdn",
              "autoPopulate": true,
              "hostname": "httpbin.org"
            }]
          },
          "webtls": {
            "class": "TLS_Server",
            "ciphers": "HIGH",
            "certificates": [{
                "certificate": "certificate_default"
            }]
          },
          "certificate_default": {
            "class": "Certificate",
            "certificate": {
                "bigip": "/Common/default.crt"
            },
            "privateKey": {
                "bigip": "/Common/default.key"
            }
         },
         "OWASPAutoTune": {
            "class": "WAF_Policy",
            "url": "https://raw.githubusercontent.com/mdditt2000/f5-as3-declarations/master/waf-policy/Common_WAF_Policy.xml",
            "ignoreChanges": true
         }
        }
      }
    }
  }