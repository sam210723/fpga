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
          "id": "75230e56-6eb1-44b2-8a45-39cad9128eac",
          "type": "basic.output",
          "data": {
            "name": "FPGA LED",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 888,
            "y": 72
          }
        },
        {
          "id": "d93dbb7b-e29a-41db-91f3-7bc1fbc98dbf",
          "type": "basic.outputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "pll_locked",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "lightseagreen"
          },
          "position": {
            "x": 728,
            "y": 72
          }
        },
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
          "id": "3725b37a-d029-4a86-931f-083c82a9a225",
          "type": "basic.input",
          "data": {
            "name": "Global",
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
            "x": 56,
            "y": 504
          }
        },
        {
          "id": "7c10886a-a82c-4759-b7fb-8f7a0e25ee9c",
          "type": "basic.inputLabel",
          "data": {
            "blockColor": "lightseagreen",
            "name": "pll_locked",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": ""
              }
            ],
            "virtual": true,
            "oldBlockColor": "lightseagreen"
          },
          "position": {
            "x": 400,
            "y": 520
          }
        },
        {
          "id": "39ddb0ed-3d21-4561-9906-60acf2346e89",
          "type": "basic.constant",
          "data": {
            "name": "DIVR",
            "value": "0",
            "local": false
          },
          "position": {
            "x": 120,
            "y": 336
          }
        },
        {
          "id": "77d9bcf1-85c7-4ed4-aee4-f64658388497",
          "type": "basic.constant",
          "data": {
            "name": "DIVF",
            "value": "64",
            "local": false
          },
          "position": {
            "x": 232,
            "y": 336
          }
        },
        {
          "id": "e5ec7d61-4516-482b-b069-234fd4df1830",
          "type": "basic.constant",
          "data": {
            "name": "DIVQ",
            "value": "4",
            "local": false
          },
          "position": {
            "x": 344,
            "y": 336
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
        },
        {
          "id": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
          "type": "faca50f06ddff849f0e88189e25570d0e4795a3c",
          "position": {
            "x": 232,
            "y": 504
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "c25cd92c-e630-46be-a91b-08571b7267f0",
          "type": "basic.info",
          "data": {
            "info": "  Generate pixel clock",
            "readonly": false
          },
          "position": {
            "x": 176,
            "y": 288
          },
          "size": {
            "width": 208,
            "height": 32
          }
        },
        {
          "id": "7722f896-9aa6-41d3-b3ca-362678562f78",
          "type": "basic.info",
          "data": {
            "info": "  Generate sync signals",
            "readonly": false
          },
          "position": {
            "x": 560,
            "y": 368
          },
          "size": {
            "width": 216,
            "height": 32
          }
        },
        {
          "id": "00e6d2a0-0a58-4c47-a357-86e34342ba43",
          "type": "873f0c7c5bb587927484454749cb978c5e10e199",
          "position": {
            "x": 624,
            "y": 440
          },
          "size": {
            "width": 96,
            "height": 160
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
        },
        {
          "source": {
            "block": "3725b37a-d029-4a86-931f-083c82a9a225",
            "port": "out"
          },
          "target": {
            "block": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
            "port": "55b05bce-1a8c-40b6-b6ac-015323ef0e35"
          }
        },
        {
          "source": {
            "block": "77d9bcf1-85c7-4ed4-aee4-f64658388497",
            "port": "constant-out"
          },
          "target": {
            "block": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
            "port": "2e350185-3aa0-4489-a164-b1769cec3609"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "39ddb0ed-3d21-4561-9906-60acf2346e89",
            "port": "constant-out"
          },
          "target": {
            "block": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
            "port": "c1e3c0f0-e775-4166-a6f4-ed1bbdc37e3d"
          },
          "vertices": [
            {
              "x": 208,
              "y": 448
            }
          ]
        },
        {
          "source": {
            "block": "e5ec7d61-4516-482b-b069-234fd4df1830",
            "port": "constant-out"
          },
          "target": {
            "block": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
            "port": "152f92fe-f9bd-4b3c-9317-1497df19afd5"
          },
          "vertices": [
            {
              "x": 360,
              "y": 448
            }
          ]
        },
        {
          "source": {
            "block": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
            "port": "1051c339-467f-4196-b1d1-999f9d360c6a"
          },
          "target": {
            "block": "7c10886a-a82c-4759-b7fb-8f7a0e25ee9c",
            "port": "inlabel"
          }
        },
        {
          "source": {
            "block": "d10b7aeb-b504-4ba6-9656-f3e0bb505f03",
            "port": "e4964ac9-e0df-40f1-9c50-4f0c267fa2cd"
          },
          "target": {
            "block": "00e6d2a0-0a58-4c47-a357-86e34342ba43",
            "port": "ab56b571-4970-4915-8d69-303c7c7b9de0"
          },
          "vertices": [
            {
              "x": 472,
              "y": 520
            }
          ]
        },
        {
          "source": {
            "block": "d93dbb7b-e29a-41db-91f3-7bc1fbc98dbf",
            "port": "outlabel"
          },
          "target": {
            "block": "75230e56-6eb1-44b2-8a45-39cad9128eac",
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
    },
    "faca50f06ddff849f0e88189e25570d0e4795a3c": {
      "package": {
        "name": "icepll",
        "version": "",
        "description": "PLL configuration block for Lattice iCE FPGAs",
        "author": "sam210723",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22175mm%22%20height=%22226.772%22%20viewBox=%220%200%20175%2060.000008%22%3E%3Cpath%20d=%22M17%200h5v60h-5zM22%200h12v5H22zM34%200h5v60h-5zM39%2055h12v5H39zM51%200h5v60h-5zM56%200h12v5H56zM68%200h5v60h-5zM73%2055h12v5H73zM85%200h5v60h-5zM90%200h12v5H90zM102%200h5v60h-5zM107%2055h12v5h-12zM119%200h5v60h-5zM124%200h12v5h-12zM136%200h5v60h-5zM141%2055h12v5h-12zM153%200h5v60h-5zM158%200h12v5h-12zM170%200h5v60h-5zM5%2055h12v5H5zM0%200h5v60H0z%22/%3E%3C/svg%3E"
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
                "name": "locked"
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
                "code": "SB_PLL40_CORE #(\r\n\t.FEEDBACK_PATH(\"SIMPLE\"),\r\n\t.DIVR(r),\r\n\t.DIVF(f),\r\n\t.DIVQ(q),\r\n\t.FILTER_RANGE(3'b001)\r\n) uut (\r\n\t.LOCK(locked),\r\n\t.RESETB(1'b1),\r\n\t.BYPASS(1'b0),\r\n\t.REFERENCECLK(clock_in),\r\n\t.PLLOUTCORE(clock_out)\r\n);\r\n",
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
                      "name": "locked"
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
            },
            {
              "source": {
                "block": "a8321ee6-1624-4737-84f5-9717819d1a0b",
                "port": "locked"
              },
              "target": {
                "block": "1051c339-467f-4196-b1d1-999f9d360c6a",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "873f0c7c5bb587927484454749cb978c5e10e199": {
      "package": {
        "name": "VGA Sync",
        "version": "",
        "description": "VGA sync signal generator",
        "author": "sam210723",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20id=%22Layer_1%22%20viewBox=%220%200%20544.98944%20253%22%20width=%22544.989%22%20height=%22253%22%3E%3Cstyle%20id=%22style4093%22%3E.st0,.st1%7Bfill:#fff;stroke:#000;stroke-width:2;stroke-miterlimit:10%7D.st1%7Bfill:#0b4e9a%7D.st2%7Bfill:none%7D.st3%7Bfont-family:&apos;DejaVuSansCondensed-Bold&apos;,sans-serif;font-stretch:condensed;font-weight:700%7D.st4%7Bfont-size:31px%7D%3C/style%3E%3Cg%20id=%22g4147%22%20transform=%22translate(-286.25%20-141.5)%22%3E%3Cg%20id=%22g4137%22%20transform=%22translate(0%20-72)%22%3E%3Cpath%20class=%22st0%22%20d=%22M634.34%20214.5H354c-41.49%200-72.92%2040.33-65.72%2084.33l17.57%20107.29c5.62%2034.34%2033.33%2059.38%2065.72%2059.38h374.35c32.38%200%2060.09-25.04%2065.72-59.38l17.57-107.29c7.2-44-24.23-84.33-65.72-84.33z%22%20id=%22path4103%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Cpath%20class=%22st1%22%20d=%22M629.12%20231.5H368.15c-38.62%200-67.88%2034.87-61.18%2072.91l16.36%2092.76c5.23%2029.69%2031.03%2051.33%2061.18%2051.33h348.48c30.15%200%2055.94-21.64%2061.18-51.33l16.36-92.76c6.71-38.04-22.55-72.91-61.18-72.91z%22%20id=%22path4105%22%20fill=%22#0b4e9a%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22392.5%22%20cy=%22271.75%22%20r=%2225.25%22%20id=%22circle4107%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22632.31%22%20cy=%22271.75%22%20r=%2225.25%22%20id=%22circle4109%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22712.25%22%20cy=%22271.75%22%20r=%2225.25%22%20id=%22circle4111%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22552.38%22%20cy=%22271.75%22%20r=%2225.25%22%20id=%22circle4113%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22472.44%22%20cy=%22271.75%22%20r=%2225.25%22%20id=%22circle4115%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22392.5%22%20cy=%22410%22%20r=%2225.25%22%20id=%22circle4117%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22632.31%22%20cy=%22410%22%20r=%2225.25%22%20id=%22circle4119%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22712.25%22%20cy=%22410%22%20r=%2225.25%22%20id=%22circle4121%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22552.38%22%20cy=%22410%22%20r=%2225.25%22%20id=%22circle4123%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22472.44%22%20cy=%22410%22%20r=%2225.25%22%20id=%22circle4125%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22432.38%22%20cy=%22340.88%22%20r=%2225.25%22%20id=%22circle4127%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22672.19%22%20cy=%22340.88%22%20r=%2225.25%22%20id=%22circle4129%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22752.13%22%20cy=%22340.88%22%20r=%2225.25%22%20id=%22circle4131%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22592.25%22%20cy=%22340.88%22%20r=%2225.25%22%20id=%22circle4133%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3Ccircle%20class=%22st0%22%20cx=%22512.31%22%20cy=%22340.88%22%20r=%2225.25%22%20id=%22circle4135%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%222%22%20stroke-miterlimit=%2210%22/%3E%3C/g%3E%3C/g%3E%3Cpath%20class=%22st2%22%20id=%22rect4149%22%20fill=%22none%22%20d=%22M-285.75-141h1121v547h-1121z%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "79970647-0a55-428e-8ac7-9b100a472de4",
              "type": "basic.output",
              "data": {
                "name": "h_sync"
              },
              "position": {
                "x": 1384,
                "y": 184
              }
            },
            {
              "id": "cb08ac43-f855-4385-8bb5-00fe788e90b7",
              "type": "basic.output",
              "data": {
                "name": "v_sync"
              },
              "position": {
                "x": 1384,
                "y": 312
              }
            },
            {
              "id": "ab56b571-4970-4915-8d69-303c7c7b9de0",
              "type": "basic.input",
              "data": {
                "name": "clock",
                "clock": false
              },
              "position": {
                "x": 344,
                "y": 440
              }
            },
            {
              "id": "7c614606-1aa7-486a-9a92-ca070cc20c53",
              "type": "basic.output",
              "data": {
                "name": "x",
                "range": "[9:0]",
                "size": 10
              },
              "position": {
                "x": 1384,
                "y": 440
              }
            },
            {
              "id": "4e921b8e-b770-4746-b7b4-6bfeebe1a88a",
              "type": "basic.output",
              "data": {
                "name": "y",
                "range": "[9:0]",
                "size": 10
              },
              "position": {
                "x": 1384,
                "y": 560
              }
            },
            {
              "id": "2eb4452b-baff-4ed7-a8d2-deeec56bc3f9",
              "type": "basic.output",
              "data": {
                "name": "blank"
              },
              "position": {
                "x": 1384,
                "y": 688
              }
            },
            {
              "id": "463e834f-09b5-447c-a009-bb7493faf741",
              "type": "basic.code",
              "data": {
                "code": "",
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
                      "name": "x",
                      "range": "[9:0]",
                      "size": 10
                    },
                    {
                      "name": "y",
                      "range": "[9:0]",
                      "size": 10
                    },
                    {
                      "name": "blank"
                    }
                  ]
                }
              },
              "position": {
                "x": 520,
                "y": 152
              },
              "size": {
                "width": 784,
                "height": 632
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "ab56b571-4970-4915-8d69-303c7c7b9de0",
                "port": "out"
              },
              "target": {
                "block": "463e834f-09b5-447c-a009-bb7493faf741",
                "port": "clock"
              }
            },
            {
              "source": {
                "block": "463e834f-09b5-447c-a009-bb7493faf741",
                "port": "h_sync"
              },
              "target": {
                "block": "79970647-0a55-428e-8ac7-9b100a472de4",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "463e834f-09b5-447c-a009-bb7493faf741",
                "port": "v_sync"
              },
              "target": {
                "block": "cb08ac43-f855-4385-8bb5-00fe788e90b7",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "463e834f-09b5-447c-a009-bb7493faf741",
                "port": "blank"
              },
              "target": {
                "block": "2eb4452b-baff-4ed7-a8d2-deeec56bc3f9",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "463e834f-09b5-447c-a009-bb7493faf741",
                "port": "x"
              },
              "target": {
                "block": "7c614606-1aa7-486a-9a92-ca070cc20c53",
                "port": "in"
              },
              "size": 10
            },
            {
              "source": {
                "block": "463e834f-09b5-447c-a009-bb7493faf741",
                "port": "y"
              },
              "target": {
                "block": "4e921b8e-b770-4746-b7b4-6bfeebe1a88a",
                "port": "in"
              },
              "size": 10
            }
          ]
        }
      }
    }
  }
}