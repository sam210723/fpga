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
          "id": "bc448ea5-aa90-4eff-9fa2-dde186f5fb82",
          "type": "basic.output",
          "data": {
            "name": "r0",
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
            "x": 1424,
            "y": 152
          }
        },
        {
          "id": "bffb3e0d-8569-43bc-89a7-4840bd505696",
          "type": "basic.input",
          "data": {
            "name": "clock",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
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
          "id": "ac03a546-d807-4831-835e-a4112c7f57d2",
          "type": "basic.output",
          "data": {
            "name": "r1",
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
            "x": 1424,
            "y": 240
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
                "value": "0"
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
          "id": "a8e25399-1ccf-4ec6-bcb8-52ee89757079",
          "type": "basic.output",
          "data": {
            "name": "r2",
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
            "x": 1424,
            "y": 328
          }
        },
        {
          "id": "421cc2bc-1ee2-453b-a2e0-9930631bcca7",
          "type": "basic.output",
          "data": {
            "name": "g0",
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
            "x": 1424,
            "y": 416
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
                "value": "0"
              },
              {
                "index": "10",
                "name": "",
                "value": "0"
              },
              {
                "index": "9",
                "name": "",
                "value": "0"
              },
              {
                "index": "8",
                "name": "",
                "value": "0"
              },
              {
                "index": "7",
                "name": "",
                "value": "0"
              },
              {
                "index": "6",
                "name": "",
                "value": "0"
              },
              {
                "index": "5",
                "name": "",
                "value": "0"
              },
              {
                "index": "4",
                "name": "",
                "value": "0"
              },
              {
                "index": "3",
                "name": "",
                "value": "0"
              },
              {
                "index": "2",
                "name": "",
                "value": "0"
              },
              {
                "index": "1",
                "name": "",
                "value": "0"
              },
              {
                "index": "0",
                "name": "",
                "value": "0"
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
          "id": "5cb718ea-029c-4b0e-9f71-0df04b3580b6",
          "type": "basic.output",
          "data": {
            "name": "g1",
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
            "x": 1424,
            "y": 504
          }
        },
        {
          "id": "a9ecd864-d5c2-4abf-a92c-780de886cd57",
          "type": "basic.output",
          "data": {
            "name": "g2",
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
            "x": 1424,
            "y": 592
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
                "value": "0"
              },
              {
                "index": "10",
                "name": "",
                "value": "0"
              },
              {
                "index": "9",
                "name": "",
                "value": "0"
              },
              {
                "index": "8",
                "name": "",
                "value": "0"
              },
              {
                "index": "7",
                "name": "",
                "value": "0"
              },
              {
                "index": "6",
                "name": "",
                "value": "0"
              },
              {
                "index": "5",
                "name": "",
                "value": "0"
              },
              {
                "index": "4",
                "name": "",
                "value": "0"
              },
              {
                "index": "3",
                "name": "",
                "value": "0"
              },
              {
                "index": "2",
                "name": "",
                "value": "0"
              },
              {
                "index": "1",
                "name": "",
                "value": "0"
              },
              {
                "index": "0",
                "name": "",
                "value": "0"
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
          "id": "62dde055-a57e-4603-974a-fa6c495d7018",
          "type": "basic.output",
          "data": {
            "name": "b0",
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
            "x": 1424,
            "y": 680
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
                "value": "0"
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
          "id": "03cb1d9a-a0a5-48a4-9618-203c9169cb74",
          "type": "basic.output",
          "data": {
            "name": "b1",
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
            "x": 1424,
            "y": 768
          }
        },
        {
          "id": "dfa50058-b2e6-4419-9bcf-34a397f02133",
          "type": "basic.code",
          "data": {
            "code": "localparam H_ACTIVE = 1024;      // Horizontal active pixels\nlocalparam V_ACTIVE = 768;       // Vertical active pixels\nlocalparam F_MAX    = 511;       // Frame counter maximum\n\nreg [2:0] red;\nreg [2:0] green;\nreg [1:0] blue;\nreg [8:0] frame;\n\nalways @(negedge v_sync)\n    begin\n        frame = frame == F_MAX ? 0 : frame + 1;\n    end\n\nalways @(posedge clock)\n    begin\n        red    = 3'b001;\n        \n        green  = 3'b000;\n        \n        blue   = 3'b000;\n    end\n\nassign r0 = active && red[0];\nassign r1 = active && red[1];\nassign r2 = active && red[2];\nassign g0 = active && green[0];\nassign g1 = active && green[1];\nassign g2 = active && green[2];\nassign b0 = active && blue[0];\nassign b1 = active && blue[1];\n",
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
                  "name": "r0"
                },
                {
                  "name": "r1"
                },
                {
                  "name": "r2"
                },
                {
                  "name": "g0"
                },
                {
                  "name": "g1"
                },
                {
                  "name": "g2"
                },
                {
                  "name": "b0"
                },
                {
                  "name": "b1"
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
            "port": "r0"
          },
          "target": {
            "block": "bc448ea5-aa90-4eff-9fa2-dde186f5fb82",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "r1"
          },
          "target": {
            "block": "ac03a546-d807-4831-835e-a4112c7f57d2",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "r2"
          },
          "target": {
            "block": "a8e25399-1ccf-4ec6-bcb8-52ee89757079",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "g0"
          },
          "target": {
            "block": "421cc2bc-1ee2-453b-a2e0-9930631bcca7",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "g1"
          },
          "target": {
            "block": "5cb718ea-029c-4b0e-9f71-0df04b3580b6",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "g2"
          },
          "target": {
            "block": "a9ecd864-d5c2-4abf-a92c-780de886cd57",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "b0"
          },
          "target": {
            "block": "62dde055-a57e-4603-974a-fa6c495d7018",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "dfa50058-b2e6-4419-9bcf-34a397f02133",
            "port": "b1"
          },
          "target": {
            "block": "03cb1d9a-a0a5-48a4-9618-203c9169cb74",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}