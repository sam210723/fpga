{
  "version": "1.2",
  "package": {
    "name": "VGA Animation Demo",
    "version": "",
    "description": "Generate animated RGB signals for a VGA display",
    "author": "sam210723",
    "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20version=%221%22%20width=%22672%22%20height=%22504%22%3E%3Cpath%20fill=%22#131313%22%20d=%22M0%200h672v504H0z%22/%3E%3Cpath%20fill=%22silver%22%20d=%22M0%200h96v336H0z%22/%3E%3Cpath%20fill=%22#c0c000%22%20d=%22M96%200h96v336H96z%22/%3E%3Cpath%20fill=%22#00c0c0%22%20d=%22M192%200h96v336h-96z%22/%3E%3Cpath%20fill=%22#00c000%22%20d=%22M288%200h96v336h-96z%22/%3E%3Cpath%20fill=%22#c000c0%22%20d=%22M384%200h96v336h-96z%22/%3E%3Cpath%20fill=%22#c00000%22%20d=%22M480%200h96v336h-96z%22/%3E%3Cpath%20fill=%22#0000c0%22%20d=%22M576%200h96v336h-96zM0%20336h96v42H0z%22/%3E%3Cpath%20fill=%22#c000c0%22%20d=%22M192%20336h96v42h-96z%22/%3E%3Cpath%20fill=%22#00c0c0%22%20d=%22M384%20336h96v42h-96z%22/%3E%3Cpath%20fill=%22silver%22%20d=%22M576%20336h96v42h-96z%22/%3E%3Cpath%20fill=%22#00214c%22%20d=%22M0%20378h120v126H0z%22/%3E%3Cpath%20fill=%22#fff%22%20d=%22M120%20378h120v126H120z%22/%3E%3Cpath%20fill=%22#32006a%22%20d=%22M240%20378h120v126H240z%22/%3E%3Cpath%20fill=%22#090909%22%20d=%22M480%20378h32v126h-32z%22/%3E%3Cpath%20fill=%22#1d1d1d%22%20d=%22M544%20378h32v126h-32z%22/%3E%3C/svg%3E"
  },
  "design": {
    "board": "TinyFPGA-BX",
    "graph": {
      "blocks": [
        {
          "id": "bffb3e0d-8569-43bc-89a7-4840bd505696",
          "type": "basic.input",
          "data": {
            "name": "clock",
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 184
          }
        },
        {
          "id": "4ecfe9be-3e76-44c5-bf3c-e1d37c35d26b",
          "type": "basic.output",
          "data": {
            "name": "r",
            "range": "[2:0]",
            "pins": [
              {
                "index": "2",
                "name": "",
                "value": ""
              },
              {
                "index": "1",
                "name": "",
                "value": ""
              },
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 1416,
            "y": 232
          }
        },
        {
          "id": "b1387c93-c475-4beb-943d-96e9de0dbf1e",
          "type": "basic.input",
          "data": {
            "name": "v_sync",
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 320
          }
        },
        {
          "id": "ac4170b8-f2f9-4bf4-a5e6-94d467c7b983",
          "type": "basic.input",
          "data": {
            "name": "x",
            "range": "[11:0]",
            "clock": false,
            "size": 12
          },
          "position": {
            "x": 328,
            "y": 464
          }
        },
        {
          "id": "4b18b8f2-c5e4-40fa-a7ef-1b3a2ce49f76",
          "type": "basic.output",
          "data": {
            "name": "g",
            "range": "[2:0]",
            "pins": [
              {
                "index": "2",
                "name": "",
                "value": ""
              },
              {
                "index": "1",
                "name": "",
                "value": ""
              },
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 1416,
            "y": 464
          }
        },
        {
          "id": "6d1703df-2ae6-4a88-baab-aec27e88a681",
          "type": "basic.input",
          "data": {
            "name": "y",
            "range": "[11:0]",
            "clock": false,
            "size": 12
          },
          "position": {
            "x": 328,
            "y": 600
          }
        },
        {
          "id": "2f1d1d32-aaa2-4182-b05d-7e6f8b6ebf1b",
          "type": "basic.output",
          "data": {
            "name": "b",
            "range": "[2:0]",
            "pins": [
              {
                "index": "2",
                "name": "",
                "value": ""
              },
              {
                "index": "1",
                "name": "",
                "value": ""
              },
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 1416,
            "y": 696
          }
        },
        {
          "id": "686091c5-47c9-4221-86d2-611e79ecd0f2",
          "type": "basic.input",
          "data": {
            "name": "active",
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 736
          }
        },
        {
          "id": "dfa50058-b2e6-4419-9bcf-34a397f02133",
          "type": "basic.code",
          "data": {
            "code": "localparam H_ACTIVE = 1024;      // Horizontal active pixels\nlocalparam V_ACTIVE = 768;       // Vertical active pixels\nlocalparam F_MAX    = 511;       // Frame counter maximum\n\nreg [2:0] red;\nreg [2:0] green;\nreg [2:0] blue;\nreg [8:0] frame;\n\nalways @(negedge v_sync)\n    begin\n        frame = frame == F_MAX ? 0 : frame + 1;\n    end\n\nalways @(posedge clock)\n    begin\n        red    = x == 0 ? 7 : 0 || x == H_ACTIVE - 2 ? 7 : 0\n              || y == 0 ? 7 : 0 || y == V_ACTIVE - 1 ? 7 : 0\n              || (y > 0 && y <= 128) ? x / 128 : 0\n              || (y > 384 && y <= 512) ? x / 128 : 0\n              || (y > 512 && x > 0 && x <= 160) ? 7 : 0\n              || (y > 512 && x > 800 && x <= 960) ? 7 : 0;\n        \n        green  = x == 0 ? 7 : 0 || x == H_ACTIVE - 2 ? 7 : 0\n              || y == 0 ? 7 : 0 || y == V_ACTIVE - 1 ? 7 : 0\n              || (y > 128 && y <= 256) ? x / 128 : 0\n              || (y > 384 && y <= 512) ? x / 128 : 0\n              || (y > 512 && x > 0 && x <= 160) ? x / 20 : 0\n              || (y > 512 && x > 160 && x <= 480) ? 7 : 0;\n        \n        blue   = x == 0 ? 7 : 0 || x == H_ACTIVE - 2 ? 7 : 0\n              || y == 0 ? 7 : 0 || y == V_ACTIVE - 1 ? 7 : 0\n              || (y > 256 && y <= 384) ? x / 128 : 0\n              || (y > 384 && y <= 512) ? x / 128 : 0\n              || (y > 512 && x > 480 && x <= 800) ? 7 : 0\n              || (y > 512 && x > 320 && x <= 480) ? (x-320) / 20 : 0;\n    end\n\nassign r = active && red;\nassign g = active && green;\nassign b = active && blue;\n",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clock"
                },
                {
                  "name": "v_sync"
                },
                {
                  "name": "x",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "y",
                  "range": "[11:0]",
                  "size": 12
                },
                {
                  "name": "active"
                }
              ],
              "out": [
                {
                  "name": "r",
                  "range": "[2:0]",
                  "size": 3
                },
                {
                  "name": "g",
                  "range": "[2:0]",
                  "size": 3
                },
                {
                  "name": "b",
                  "range": "[2:0]",
                  "size": 3
                }
              ]
            }
          },
          "position": {
            "x": 504,
            "y": 144
          },
          "size": {
            "width": 832,
            "height": 696
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "bffb3e0d-8569-43bc-89a7-4840bd505696",
            "port": "out"
          },
          "target": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "clock"
          }
        },
        {
          "source": {
            "block": "b1387c93-c475-4beb-943d-96e9de0dbf1e",
            "port": "out"
          },
          "target": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "v_sync"
          }
        },
        {
          "source": {
            "block": "ac4170b8-f2f9-4bf4-a5e6-94d467c7b983",
            "port": "out"
          },
          "target": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "x"
          },
          "size": 12
        },
        {
          "source": {
            "block": "6d1703df-2ae6-4a88-baab-aec27e88a681",
            "port": "out"
          },
          "target": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "y"
          },
          "size": 12
        },
        {
          "source": {
            "block": "686091c5-47c9-4221-86d2-611e79ecd0f2",
            "port": "out"
          },
          "target": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "active"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "r"
          },
          "target": {
            "block": "4ecfe9be-3e76-44c5-bf3c-e1d37c35d26b",
            "port": "in"
          },
          "size": 3
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "g"
          },
          "target": {
            "block": "4b18b8f2-c5e4-40fa-a7ef-1b3a2ce49f76",
            "port": "in"
          },
          "size": 3
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "b"
          },
          "target": {
            "block": "2f1d1d32-aaa2-4182-b05d-7e6f8b6ebf1b",
            "port": "in"
          },
          "size": 3
        }
      ]
    }
  },
  "dependencies": {}
}