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
          "id": "2c0dab43-d509-4cc0-91c5-53152c2c9b8b",
          "type": "basic.output",
          "data": {
            "name": "USB Pull-up",
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
            "x": 536,
            "y": 88
          }
        },
        {
          "id": "0d467f2a-1a62-479b-acf8-53674aa78fe6",
          "type": "basic.info",
          "data": {
            "info": "TinyFPGA BX VGA Demo\nhttps://github.com/sam210723/fpga/vga\n\nPins      ｜ VGA Info\nHSync: 1  ｜ Resolution:    1024x768\nVSync: 2  ｜ Refresh Rate:  60 Hz\nRed:   3  ｜ Vertical Rate: 48.36 kHz\nGreen: 6  ｜ Pixel Clock:   65.0 MHz\nBlue:  9  ｜ Colours:       8 (1 bpp)",
            "readonly": false
          },
          "position": {
            "x": 16,
            "y": 16
          },
          "size": {
            "width": 320,
            "height": 176
          }
        },
        {
          "id": "89ee46bd-7d24-4345-af7c-669352abc984",
          "type": "basic.info",
          "data": {
            "info": "  Disable USB controller",
            "readonly": false
          },
          "position": {
            "x": 408,
            "y": 48
          },
          "size": {
            "width": 224,
            "height": 32
          }
        },
        {
          "id": "ab76cb2c-c7f4-45fa-9b84-0ecbcb3502b7",
          "type": "c4dd08263a85a91ba53e2ae2b38de344c5efcb52",
          "position": {
            "x": 408,
            "y": 88
          },
          "size": {
            "width": 96,
            "height": 64
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "ab76cb2c-c7f4-45fa-9b84-0ecbcb3502b7",
            "port": "19c8f68d-5022-487f-9ab0-f0a3cd58bead"
          },
          "target": {
            "block": "2c0dab43-d509-4cc0-91c5-53152c2c9b8b",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {
    "c4dd08263a85a91ba53e2ae2b38de344c5efcb52": {
      "package": {
        "name": "Bit 0",
        "version": "1.0.0",
        "description": "Assign 0 to the output wire",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%2247.303%22%20height=%2227.648%22%20viewBox=%220%200%2044.346456%2025.919999%22%3E%3Ctext%20style=%22line-height:125%25%22%20x=%22325.37%22%20y=%22315.373%22%20font-weight=%22400%22%20font-size=%2212.669%22%20font-family=%22sans-serif%22%20letter-spacing=%220%22%20word-spacing=%220%22%20transform=%22translate(-307.01%20-298.51)%22%3E%3Ctspan%20x=%22325.37%22%20y=%22315.373%22%20style=%22-inkscape-font-specification:'Courier%2010%20Pitch'%22%20font-family=%22Courier%2010%20Pitch%22%3E0%3C/tspan%3E%3C/text%3E%3C/svg%3E"
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
                "code": "// Bit 0\n\nassign v = 1'b0;",
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