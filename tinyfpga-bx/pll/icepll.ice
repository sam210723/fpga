{
  "version": "1.2",
  "package": {
    "name": "icepll",
    "version": "",
    "description": "PLL configuration block for Lattice iCE FPGAs",
    "author": "sam210723",
    "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22175mm%22%20height=%22226.772%22%20viewBox=%220%200%20175%2060.000008%22%3E%3Cpath%20d=%22M17%200h5v60h-5zM22%200h12v5H22zM34%200h5v60h-5zM39%2055h12v5H39zM51%200h5v60h-5zM56%200h12v5H56zM68%200h5v60h-5zM73%2055h12v5H73zM85%200h5v60h-5zM90%200h12v5H90zM102%200h5v60h-5zM107%2055h12v5h-12zM119%200h5v60h-5zM124%200h12v5h-12zM136%200h5v60h-5zM141%2055h12v5h-12zM153%200h5v60h-5zM158%200h12v5h-12zM170%200h5v60h-5zM5%2055h12v5H5zM0%200h5v60H0z%22/%3E%3C/svg%3E"
  },
  "design": {
    "board": "TinyFPGA-BX",
    "graph": {
      "blocks": [
        {
          "id": "e4964ac9-e0df-40f1-9c50-4f0c267fa2cd",
          "type": "basic.output",
          "data": {
            "name": "clock_out",
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
            "x": 1272,
            "y": 384
          }
        },
        {
          "id": "55b05bce-1a8c-40b6-b6ac-015323ef0e35",
          "type": "basic.input",
          "data": {
            "name": "clock_in",
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
            "x": 496,
            "y": 464
          }
        },
        {
          "id": "1051c339-467f-4196-b1d1-999f9d360c6a",
          "type": "basic.output",
          "data": {
            "name": "locked",
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
  },
  "dependencies": {}
}