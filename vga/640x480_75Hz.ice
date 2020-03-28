{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "TinyFPGA-BX",
    "graph": {
      "blocks": [
        {
          "id": "8647213d-0f6b-459e-b423-04a4b6b24fe9",
          "type": "basic.output",
          "data": {
            "name": "USB",
            "pins": [
              {
                "index": "0",
                "name": "USBPU",
                "value": "A3"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 304,
            "y": -240
          }
        },
        {
          "id": "48d757b9-465e-4421-9e48-e86f2e2d56b5",
          "type": "basic.output",
          "data": {
            "name": "H_SYNC",
            "pins": [
              {
                "index": "0",
                "name": "PIN_7",
                "value": "D1"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1248,
            "y": -232
          }
        },
        {
          "id": "914842c7-d894-40a5-a2e6-ea721670bbd1",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "h_sync",
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
            "x": 1088,
            "y": -232
          }
        },
        {
          "id": "448f340f-fe75-4edf-b470-687e6723e32c",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "pix_clock",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "deepskyblue"
          },
          "position": {
            "x": -8,
            "y": -192
          }
        },
        {
          "id": "0004b0e0-15ee-42e1-a781-a564fb65ff50",
          "type": "basic.output",
          "data": {
            "name": "V_SYNC",
            "pins": [
              {
                "index": "0",
                "name": "PIN_8",
                "value": "E2"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1248,
            "y": -144
          }
        },
        {
          "id": "07730b29-8016-43ef-ba53-5ac81a6b0c96",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "v_sync",
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
            "x": 1088,
            "y": -144
          }
        },
        {
          "id": "478e9c8c-c93b-470d-b449-cc3d0f4edd8b",
          "type": "basic.output",
          "data": {
            "name": "LED",
            "pins": [
              {
                "index": "0",
                "name": "LED",
                "value": "B3"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": -8,
            "y": -112
          }
        },
        {
          "id": "2716b09f-bf4a-482d-9b99-fb714ad08c39",
          "type": "basic.input",
          "data": {
            "name": "CLOCK",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "B2"
              }
            ],
            "virtual": false,
            "clock": true
          },
          "position": {
            "x": -392,
            "y": -112
          }
        },
        {
          "id": "ecbdd5a0-1271-49ee-b895-f109203084eb",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "red",
            "name": "red",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "springgreen"
          },
          "position": {
            "x": 952,
            "y": -72
          }
        },
        {
          "id": "a5490802-4924-4b11-8b8d-24256d3b0468",
          "type": "basic.output",
          "data": {
            "name": "RED",
            "pins": [
              {
                "index": "0",
                "name": "PIN_9",
                "value": "E1"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1248,
            "y": -56
          }
        },
        {
          "id": "03a2c3b0-3f60-434f-a179-f54bb6587ef2",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "blank",
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
            "x": 952,
            "y": -32
          }
        },
        {
          "id": "3f904710-0c47-4ecc-bc66-9b8d6e213d95",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "springgreen",
            "name": "green",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "darkgreen"
          },
          "position": {
            "x": 952,
            "y": 16
          }
        },
        {
          "id": "185569db-172d-4482-ac26-b5d4a8427478",
          "type": "basic.output",
          "data": {
            "name": "GREEN",
            "pins": [
              {
                "index": "0",
                "name": "PIN_10",
                "value": "G2"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1248,
            "y": 32
          }
        },
        {
          "id": "305f849d-b495-4da2-9f0b-77b720a6c250",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "blank",
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
            "x": 952,
            "y": 56
          }
        },
        {
          "id": "06771bf9-04b1-47c3-b795-7053e105ba9b",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "h_sync",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "slateblue"
          },
          "position": {
            "x": 392,
            "y": 72
          }
        },
        {
          "id": "9e5c90a5-7c13-415c-a048-692f59732bff",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "deepskyblue",
            "name": "blue",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "steelblue"
          },
          "position": {
            "x": 952,
            "y": 104
          }
        },
        {
          "id": "65e82307-ceec-49f2-8aa4-cf3c8bfa2b0b",
          "type": "basic.output",
          "data": {
            "name": "BLUE",
            "pins": [
              {
                "index": "0",
                "name": "PIN_11",
                "value": "H1"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1248,
            "y": 120
          }
        },
        {
          "id": "21b0ea6c-f94d-4f1e-a2a3-8384763f5381",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "blank",
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
            "x": 952,
            "y": 144
          }
        },
        {
          "id": "287304ca-d0a2-4c65-b056-6546b07c6d16",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "v_sync",
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
            "x": 392,
            "y": 192
          }
        },
        {
          "id": "26651465-90f8-4258-a4e4-9a88537c8451",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "red",
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
            "x": 1248,
            "y": 272
          }
        },
        {
          "id": "bc53bd3c-3c8c-426c-a083-bc9c1e38f24d",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "pix_clock",
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
            "x": -480,
            "y": 320
          }
        },
        {
          "id": "fe87d614-36e4-4186-995a-00c4b5838a42",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "blank",
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
            "x": 392,
            "y": 320
          }
        },
        {
          "id": "5a855ada-620a-4b76-b12f-a27ff627fcb2",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "springgreen",
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
            "x": 1248,
            "y": 416
          }
        },
        {
          "id": "c823eb80-3ace-43ec-b6b2-39abe82497ea",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "deepskyblue",
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
            "x": 1248,
            "y": 552
          }
        },
        {
          "id": "71df0ec7-28ba-4c09-abb9-293dbf8538f1",
          "type": "basic.constant",
          "data": {
            "name": "DIVR",
            "value": "0",
            "local": false
          },
          "position": {
            "x": -344,
            "y": -248
          }
        },
        {
          "id": "e5532d46-483a-4770-9826-2c47e18dc8dd",
          "type": "basic.constant",
          "data": {
            "name": "DIVF",
            "value": "62",
            "local": false
          },
          "position": {
            "x": -224,
            "y": -248
          }
        },
        {
          "id": "47ebc9d7-4d2c-4fe0-a3e1-deb0cc2429b6",
          "type": "basic.constant",
          "data": {
            "name": "DIVQ",
            "value": "5",
            "local": false
          },
          "position": {
            "x": -104,
            "y": -248
          }
        },
        {
          "id": "7e01b8ab-a31d-419e-a7f5-8509e5e95b01",
          "type": "basic.info",
          "data": {
            "info": "  Disable USB controller",
            "readonly": false
          },
          "position": {
            "x": 176,
            "y": -288
          },
          "size": {
            "width": 224,
            "height": 32
          }
        },
        {
          "id": "6c8b9e0c-8bb8-4114-bd51-48fd8c9d7857",
          "type": "basic.info",
          "data": {
            "info": "       Generate 40 MHz pixel clock",
            "readonly": false
          },
          "position": {
            "x": -344,
            "y": -288
          },
          "size": {
            "width": 336,
            "height": 32
          }
        },
        {
          "id": "f3e750b7-aa49-47e5-b866-267a45a7cc6c",
          "type": "basic.info",
          "data": {
            "info": "  VGA output signals  ",
            "readonly": false
          },
          "position": {
            "x": 1120,
            "y": -288
          },
          "size": {
            "width": 192,
            "height": 32
          }
        },
        {
          "id": "be30276b-e953-44ee-bdc7-790f5cfc7335",
          "type": "1b12830a45ef1e022c6fe14270b726d4e5ea26cb",
          "position": {
            "x": -224,
            "y": -112
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "615b6c85-c788-4b72-af53-99af3beacb76",
          "type": "basic.info",
          "data": {
            "info": "  Generate sync signals",
            "readonly": false
          },
          "position": {
            "x": -104,
            "y": 0
          },
          "size": {
            "width": 216,
            "height": 32
          }
        },
        {
          "id": "1e1b6c5f-bbc5-4d6b-961d-45c5a2a73af7",
          "type": "7ebc902cbb1c4db116741533a86182485900ecda",
          "position": {
            "x": 1088,
            "y": -56
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "b28f55e0-7978-4f35-92e2-dc17e5160302",
          "type": "7ebc902cbb1c4db116741533a86182485900ecda",
          "position": {
            "x": 1088,
            "y": 32
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "3b9ef126-803f-489f-99c3-1cb9d3a057c7",
          "type": "7ebc902cbb1c4db116741533a86182485900ecda",
          "position": {
            "x": 1088,
            "y": 120
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "bbe5ae9a-37c0-4503-917d-673310044ba9",
          "type": "c83dcd1d9ab420d911df81b3dfae04681559c623",
          "position": {
            "x": 176,
            "y": -240
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "a5998ca8-b1ea-4461-abbc-5060d5ab0294",
          "type": "basic.info",
          "data": {
            "info": "  Generate video signals",
            "readonly": false
          },
          "position": {
            "x": 672,
            "y": 192
          },
          "size": {
            "width": 224,
            "height": 32
          }
        },
        {
          "id": "63c478ff-2297-45ec-ab06-362f3b0d57e5",
          "type": "basic.info",
          "data": {
            "info": "640x480 @ 75 Hz\n37.5 KHz\n31.5 MHz\nhttp://tinyvga.com/vga-timing/640x480@75Hz",
            "readonly": false
          },
          "position": {
            "x": 536,
            "y": -288
          },
          "size": {
            "width": 352,
            "height": 88
          }
        },
        {
          "id": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
          "type": "basic.code",
          "data": {
            "code": "localparam H_ACTIVE = 640;      // Horizontal active pixels\nlocalparam V_ACTIVE = 480;      // Vertical active pixels\n\nreg red, green, blue;\n\nalways @(posedge clock)\n    begin\n        // Screen border\n        red   = x == 0 || x == H_ACTIVE - 1 || y == 0 || y == V_ACTIVE - 1;\n        \n        // Grid\n        green = (x > 200 && x < 300 && y > 200 && y < 300)\n        || (x > 350 && x < 400 && y > 350 && y < 400)\n        || (y % 50 == 0 && y > 0);\n        blue = 0;\n        \n        //red = 1;\n        //green = 1;\n        //blue  = 1;\n    end\n\nassign r = red;\nassign g = green;\nassign b = blue;\n",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clock"
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
            "x": 600,
            "y": 232
          },
          "size": {
            "width": 600,
            "height": 424
          }
        },
        {
          "id": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
          "type": "basic.code",
          "data": {
            "code": "// Parameters\nlocalparam H_ACTIVE = 640;      // Horizontal active pixels\nlocalparam H_FPORCH = 16;       // Horizontal front porch\nlocalparam H_PULSE  = 64;       // Horizontal sync pulse length\nlocalparam H_BPORCH = 120;      // Horizontal back porch\nlocalparam H_TOTAL  = H_ACTIVE + H_FPORCH + H_PULSE + H_BPORCH - 1;\nlocalparam H_SYNC_S = H_ACTIVE + H_FPORCH;     // Horizontal pulse start\nlocalparam H_SYNC_E = H_SYNC_S + H_PULSE - 1;  // Horizontal pulse end\n\nlocalparam V_ACTIVE = 480;      // Vertical active pixels\nlocalparam V_FPORCH = 1;        // Vertical front porch\nlocalparam V_PULSE  = 3;        // Vertical sync pulse length\nlocalparam V_BPORCH = 16;       // Vertical back porch\nlocalparam V_TOTAL  = V_ACTIVE + V_FPORCH + V_PULSE + V_BPORCH - 1;\nlocalparam V_SYNC_S = V_ACTIVE + V_FPORCH;     // Vertical pulse start\nlocalparam V_SYNC_E = V_SYNC_S + V_PULSE - 1;  // Vertical pulse end\n\n// Registers\nreg [11:0] h_count, v_count;\n\nalways @(posedge clock)\n    begin\n        h_count = h_count == H_TOTAL ? 0 : h_count + 1;\n        v_count = h_count == 0 ? (\n            v_count == V_TOTAL ? 0 : v_count + 1\n        ) : v_count;\n    end\n\n// Assign outputs\nassign h_sync = ~(h_count >= H_SYNC_S && h_count <= H_SYNC_E);\nassign v_sync = ~(v_count >= V_SYNC_S && v_count <= V_SYNC_E);\nassign blank = h_count < H_ACTIVE && v_count < V_ACTIVE;\nassign x = h_count;\nassign y = v_count;\n",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clock"
                }
              ],
              "out": [
                {
                  "name": "h_sync"
                },
                {
                  "name": "v_sync"
                },
                {
                  "name": "blank"
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
                }
              ]
            }
          },
          "position": {
            "x": -336,
            "y": 40
          },
          "size": {
            "width": 656,
            "height": 616
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "e4964ac9-e0df-40f1-9c50-4f0c267fa2cd"
          },
          "target": {
            "block": "448f340f-fe75-4edf-b470-687e6723e32c",
            "port": "inlabel"
          },
          "vertices": [
            {
              "x": -40,
              "y": -120
            }
          ]
        },
        {
          "source": {
            "block": "07730b29-8016-43ef-ba53-5ac81a6b0c96",
            "port": "outlabel"
          },
          "target": {
            "block": "0004b0e0-15ee-42e1-a781-a564fb65ff50",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "914842c7-d894-40a5-a2e6-ea721670bbd1",
            "port": "outlabel"
          },
          "target": {
            "block": "48d757b9-465e-4421-9e48-e86f2e2d56b5",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "ecbdd5a0-1271-49ee-b895-f109203084eb",
            "port": "outlabel"
          },
          "target": {
            "block": "1e1b6c5f-bbc5-4d6b-961d-45c5a2a73af7",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "03a2c3b0-3f60-434f-a179-f54bb6587ef2",
            "port": "outlabel"
          },
          "target": {
            "block": "1e1b6c5f-bbc5-4d6b-961d-45c5a2a73af7",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "3f904710-0c47-4ecc-bc66-9b8d6e213d95",
            "port": "outlabel"
          },
          "target": {
            "block": "b28f55e0-7978-4f35-92e2-dc17e5160302",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "9e5c90a5-7c13-415c-a048-692f59732bff",
            "port": "outlabel"
          },
          "target": {
            "block": "3b9ef126-803f-489f-99c3-1cb9d3a057c7",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "305f849d-b495-4da2-9f0b-77b720a6c250",
            "port": "outlabel"
          },
          "target": {
            "block": "b28f55e0-7978-4f35-92e2-dc17e5160302",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "21b0ea6c-f94d-4f1e-a2a3-8384763f5381",
            "port": "outlabel"
          },
          "target": {
            "block": "3b9ef126-803f-489f-99c3-1cb9d3a057c7",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
            "port": "h_sync"
          },
          "target": {
            "block": "06771bf9-04b1-47c3-b795-7053e105ba9b",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
            "port": "v_sync"
          },
          "target": {
            "block": "287304ca-d0a2-4c65-b056-6546b07c6d16",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "bc53bd3c-3c8c-426c-a083-bc9c1e38f24d",
            "port": "outlabel"
          },
          "target": {
            "block": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
            "port": "clock"
          }
        },
        {
          "source": {
            "block": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
            "port": "blank"
          },
          "target": {
            "block": "fe87d614-36e4-4186-995a-00c4b5838a42",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
            "port": "b"
          },
          "target": {
            "block": "c823eb80-3ace-43ec-b6b2-39abe82497ea",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
            "port": "g"
          },
          "target": {
            "block": "5a855ada-620a-4b76-b12f-a27ff627fcb2",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
            "port": "r"
          },
          "target": {
            "block": "26651465-90f8-4258-a4e4-9a88537c8451",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "bbe5ae9a-37c0-4503-917d-673310044ba9",
            "port": "19c8f68d-5022-487f-9ab0-f0a3cd58bead"
          },
          "target": {
            "block": "8647213d-0f6b-459e-b423-04a4b6b24fe9",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "71df0ec7-28ba-4c09-abb9-293dbf8538f1",
            "port": "constant-out"
          },
          "target": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "c1e3c0f0-e775-4166-a6f4-ed1bbdc37e3d"
          },
          "vertices": [
            {
              "x": -256,
              "y": -160
            }
          ]
        },
        {
          "source": {
            "block": "e5532d46-483a-4770-9826-2c47e18dc8dd",
            "port": "constant-out"
          },
          "target": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "2e350185-3aa0-4489-a164-b1769cec3609"
          }
        },
        {
          "source": {
            "block": "47ebc9d7-4d2c-4fe0-a3e1-deb0cc2429b6",
            "port": "constant-out"
          },
          "target": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "152f92fe-f9bd-4b3c-9317-1497df19afd5"
          },
          "vertices": [
            {
              "x": -96,
              "y": -160
            }
          ]
        },
        {
          "source": {
            "block": "2716b09f-bf4a-482d-9b99-fb714ad08c39",
            "port": "out"
          },
          "target": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "55b05bce-1a8c-40b6-b6ac-015323ef0e35"
          }
        },
        {
          "source": {
            "block": "1e1b6c5f-bbc5-4d6b-961d-45c5a2a73af7",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "a5490802-4924-4b11-8b8d-24256d3b0468",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "3b9ef126-803f-489f-99c3-1cb9d3a057c7",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "65e82307-ceec-49f2-8aa4-cf3c8bfa2b0b",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "b28f55e0-7978-4f35-92e2-dc17e5160302",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "185569db-172d-4482-ac26-b5d4a8427478",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "e4964ac9-e0df-40f1-9c50-4f0c267fa2cd"
          },
          "target": {
            "block": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
            "port": "clock"
          },
          "vertices": [
            {
              "x": -40,
              "y": -120
            },
            {
              "x": 544,
              "y": 40
            }
          ]
        },
        {
          "source": {
            "block": "be30276b-e953-44ee-bdc7-790f5cfc7335",
            "port": "1051c339-467f-4196-b1d1-999f9d360c6a"
          },
          "target": {
            "block": "478e9c8c-c93b-470d-b449-cc3d0f4edd8b",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
            "port": "x"
          },
          "target": {
            "block": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
            "port": "x"
          },
          "size": 12
        },
        {
          "source": {
            "block": "96a73365-0fd0-4fba-bb71-fdbf6f67a5f9",
            "port": "y"
          },
          "target": {
            "block": "f7db89d8-93b8-4ee0-bc98-cd8aad84bec6",
            "port": "y"
          },
          "size": 12
        }
      ]
    }
  },
  "dependencies": {
    "1b12830a45ef1e022c6fe14270b726d4e5ea26cb": {
      "package": {
        "name": "icepll",
        "version": "1.0",
        "description": "Configuration block for PLLs in Lattice iCE FPGAs.",
        "author": "sam210723",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "e4964ac9-e0df-40f1-9c50-4f0c267fa2cd",
              "type": "basic.output",
              "data": {
                "name": "clock_out"
              },
              "position": {
                "x": 1272,
                "y": 384
              }
            },
            {
              "id": "55b05bce-1a8c-40b6-b6ac-015323ef0e35",
              "type": "basic.input",
              "data": {
                "name": "clock_in",
                "clock": false
              },
              "position": {
                "x": 496,
                "y": 464
              }
            },
            {
              "id": "1051c339-467f-4196-b1d1-999f9d360c6a",
              "type": "basic.output",
              "data": {
                "name": "pll_locked"
              },
              "position": {
                "x": 1272,
                "y": 536
              }
            },
            {
              "id": "c1e3c0f0-e775-4166-a6f4-ed1bbdc37e3d",
              "type": "basic.constant",
              "data": {
                "name": "DIVR",
                "value": "",
                "local": false
              },
              "position": {
                "x": 728,
                "y": 224
              }
            },
            {
              "id": "2e350185-3aa0-4489-a164-b1769cec3609",
              "type": "basic.constant",
              "data": {
                "name": "DIVF",
                "value": "",
                "local": false
              },
              "position": {
                "x": 880,
                "y": 224
              }
            },
            {
              "id": "152f92fe-f9bd-4b3c-9317-1497df19afd5",
              "type": "basic.constant",
              "data": {
                "name": "DIVQ",
                "value": "",
                "local": false
              },
              "position": {
                "x": 1032,
                "y": 224
              }
            },
            {
              "id": "a8321ee6-1624-4737-84f5-9717819d1a0b",
              "type": "basic.code",
              "data": {
                "code": "// 16 MHz -> 40 MHz\r\n\r\nSB_PLL40_CORE #(\r\n\t.FEEDBACK_PATH(\"SIMPLE\"),\r\n\t.DIVR(r),\r\n\t.DIVF(f),\r\n\t.DIVQ(q),\r\n\t.FILTER_RANGE(3'b001)\r\n) uut (\r\n\t.LOCK(pll_locked),\r\n\t.RESETB(1'b1),\r\n\t.BYPASS(1'b0),\r\n\t.REFERENCECLK(clock_in),\r\n\t.PLLOUTCORE(clock_out)\r\n);\r\n",
                "params": [
                  {
                    "name": "r"
                  },
                  {
                    "name": "f"
                  },
                  {
                    "name": "q"
                  }
                ],
                "ports": {
                  "in": [
                    {
                      "name": "clock_in"
                    }
                  ],
                  "out": [
                    {
                      "name": "clock_out"
                    },
                    {
                      "name": "pll_locked"
                    }
                  ]
                }
              },
              "position": {
                "x": 696,
                "y": 344
              },
              "size": {
                "width": 464,
                "height": 296
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "clock_out"
              },
              "target": {
                "block": "e4964ac9-e0df-40f1-9c50-4f0c267fa2cd",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "pll_locked"
              },
              "target": {
                "block": "1051c339-467f-4196-b1d1-999f9d360c6a",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "55b05bce-1a8c-40b6-b6ac-015323ef0e35",
                "port": "out"
              },
              "target": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "clock_in"
              }
            },
            {
              "source": {
                "block": "c1e3c0f0-e775-4166-a6f4-ed1bbdc37e3d",
                "port": "constant-out"
              },
              "target": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "r"
              }
            },
            {
              "source": {
                "block": "2e350185-3aa0-4489-a164-b1769cec3609",
                "port": "constant-out"
              },
              "target": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "f"
              }
            },
            {
              "source": {
                "block": "152f92fe-f9bd-4b3c-9317-1497df19afd5",
                "port": "constant-out"
              },
              "target": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "q"
              }
            }
          ]
        }
      }
    },
    "7ebc902cbb1c4db116741533a86182485900ecda": {
      "package": {
        "name": "AND",
        "version": "1.0.0",
        "description": "AND logic gate",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%22-252%20400.9%2090%2040%22%3E%3Cpath%20d=%22M-252%20409.9h26v2h-26zM-252%20429.9h27v2h-27z%22/%3E%3Cpath%20d=%22M-227%20400.9v39.9h20.4c11.3%200%2020-9%2020-20s-8.7-20-20-20H-227zm2.9%202.8h17.6c9.8%200%2016.7%207.6%2016.7%2017.1%200%209.5-7.4%2017.1-17.1%2017.1H-224c-.1.1-.1-34.2-.1-34.2z%22/%3E%3Cpath%20d=%22M-187.911%20419.9H-162v2h-25.911z%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 64,
                "y": 80
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 752,
                "y": 144
              }
            },
            {
              "id": "97b51945-d716-4b6c-9db9-970d08541249",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 64,
                "y": 208
              }
            },
            {
              "id": "00925b04-5004-4307-a737-fa4e97c8b6ab",
              "type": "basic.code",
              "data": {
                "code": "// AND logic gate\n\nassign c = a & b;",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    },
                    {
                      "name": "b"
                    }
                  ],
                  "out": [
                    {
                      "name": "c"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "97b51945-d716-4b6c-9db9-970d08541249",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "b"
              }
            },
            {
              "source": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "c"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "c83dcd1d9ab420d911df81b3dfae04681559c623": {
      "package": {
        "name": "Bit 1",
        "version": "1.0.0",
        "description": "Assign 1 to the output wire",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2247.303%22%20height=%2227.648%22%20viewBox=%220%200%2044.346456%2025.919999%22%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22325.218%22%20y=%22315.455%22%20font-weight=%22400%22%20font-size=%2212.669%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22translate(-307.01%20-298.51)%22%3E%3Ctspan%20x=%22325.218%22%20y=%22315.455%22%20style=%22-inkscape-font-specification:'Courier%2010%20Pitch'%22%20font-family=%22Courier%2010%20Pitch%22%3E1%3C/tspan%3E%3C/text%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 608,
                "y": 192
              }
            },
            {
              "id": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
              "type": "basic.code",
              "data": {
                "code": "// Bit 1\n\nassign v = 1'b1;",
                "params": [],
                "ports": {
                  "in": [],
                  "out": [
                    {
                      "name": "v"
                    }
                  ]
                }
              },
              "position": {
                "x": 96,
                "y": 96
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "b959fb96-ac67-4aea-90b3-ed35a4c17bf5",
                "port": "v"
              },
              "target": {
                "block": "19c8f68d-5022-487f-9ab0-f0a3cd58bead",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}
