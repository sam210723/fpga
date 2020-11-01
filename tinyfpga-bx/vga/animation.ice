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
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 184
          }
        },
        {
          "id": "bad73ad4-7ad9-4f89-a6ad-efafe95d91c4",
          "type": "basic.output",
          "data": {
            "name": "red",
            "pins": [
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
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 320
          }
        },
        {
          "id": "f505c21d-d61a-43b4-b974-028e6ef9ad7b",
          "type": "basic.output",
          "data": {
            "name": "green",
            "pins": [
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
          "id": "ac4170b8-f2f9-4bf4-a5e6-94d467c7b983",
          "type": "basic.input",
          "data": {
            "name": "x",
            "range": "[11:0]",
            "pins": [
              {
                "index": "11",
                "name": "",
                "value": ""
              },
              {
                "index": "10",
                "name": "",
                "value": ""
              },
              {
                "index": "9",
                "name": "",
                "value": ""
              },
              {
                "index": "8",
                "name": "",
                "value": ""
              },
              {
                "index": "7",
                "name": "",
                "value": ""
              },
              {
                "index": "6",
                "name": "",
                "value": ""
              },
              {
                "index": "5",
                "name": "",
                "value": ""
              },
              {
                "index": "4",
                "name": "",
                "value": ""
              },
              {
                "index": "3",
                "name": "",
                "value": ""
              },
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 464
          }
        },
        {
          "id": "6d1703df-2ae6-4a88-baab-aec27e88a681",
          "type": "basic.input",
          "data": {
            "name": "y",
            "range": "[11:0]",
            "pins": [
              {
                "index": "11",
                "name": "",
                "value": ""
              },
              {
                "index": "10",
                "name": "",
                "value": ""
              },
              {
                "index": "9",
                "name": "",
                "value": ""
              },
              {
                "index": "8",
                "name": "",
                "value": ""
              },
              {
                "index": "7",
                "name": "",
                "value": ""
              },
              {
                "index": "6",
                "name": "",
                "value": ""
              },
              {
                "index": "5",
                "name": "",
                "value": ""
              },
              {
                "index": "4",
                "name": "",
                "value": ""
              },
              {
                "index": "3",
                "name": "",
                "value": ""
              },
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
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": 328,
            "y": 600
          }
        },
        {
          "id": "1e3c3261-e886-4028-8936-99da1a03cb83",
          "type": "basic.output",
          "data": {
            "name": "blue",
            "pins": [
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
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
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
            "code": "localparam H_ACTIVE = 1024;      // Horizontal active pixels\nlocalparam V_ACTIVE = 768;       // Vertical active pixels\nlocalparam F_MAX    = 511;       // Frame counter maximum\n\nreg red, green, blue;\nreg [8:0] frame;\n\nalways @(negedge v_sync)\n    begin\n        frame = frame == F_MAX ? 0 : frame + 1;\n    end\n\nalways @(posedge clock)\n    begin\n        red    = x == 0 || x == H_ACTIVE - 1\n              || y == 0 || y == V_ACTIVE - 1\n              || x > 20 && x < 40 && y > 20 && y < 20 + frame\n              || x > 140 && x < 160 && y > 20 && y < 20 + (F_MAX - frame);\n        \n        green  = x == 0 || x == H_ACTIVE - 1\n              || y == 0 || y == V_ACTIVE - 1\n              || x > 60 && x < 80 && y > 20 && y < 20 + (F_MAX - frame)\n              || x > 140 && x < 160 && y > 20 && y < 20 + (F_MAX - frame)\n              || x > 20 && x < frame && y > 9 && y < 11\n              || x > F_MAX && x < F_MAX + 2 && y > 5 && y < 15\n              || x > 18 && x < 20 && y > 5 && y < 15\n              || x > 300+F_MAX-frame && x < 300+frame && y > 100+F_MAX-frame && y < 100+frame;\n        \n        blue   = x == 0 || x == H_ACTIVE - 1\n              || y == 0 || y == V_ACTIVE - 1\n              || x > 100 && x < 120 && y > 20 && y < 20 + frame\n              || x > 140 && x < 160 && y > 20 && y < 20 + (F_MAX - frame)\n              || x > 300 && x < 300+frame && y > 100 && y < 100+frame;\n    end\n\nassign r = active && red;\nassign g = active && green;\nassign b = active && blue;\n",
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
                  "name": "r"
                },
                {
                  "name": "g"
                },
                {
                  "name": "b"
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
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "r"
          },
          "target": {
            "block": "bad73ad4-7ad9-4f89-a6ad-efafe95d91c4",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "g"
          },
          "target": {
            "block": "f505c21d-d61a-43b4-b974-028e6ef9ad7b",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "b"
          },
          "target": {
            "block": "1e3c3261-e886-4028-8936-99da1a03cb83",
            "port": "in"
          }
        },
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
        }
      ]
    }
  },
  "dependencies": {}
}