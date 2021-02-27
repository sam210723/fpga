# Small Form-factor Pluggable (SFP) Transceiver Interface

![](https://vksdr.com/bl-content/uploads/pages/8e5fdb2eaf58946d4c3950c0f26ec6d4/sfp.png)


## SFP Pmod
This project uses a custom designed Pmod for connecting SFP transceivers to FPGA development boards. [More info available here](https://vksdr.com/pmod#sfp).

![](https://pbs.twimg.com/media/EuLglpbVcAQRnrV?format=jpg&name=large)

## Layers
![](docs/phy-layers.png)

 - Physical Medium Dependent (PMD)
   - SFP transceiver converting between optical signalling and electrical signalling
 - Physical Medium Attachment (PMA)
   - NRZ-I Serialisation/Deserialisation
   - Clock recovery from incoming signal
 - Physical Coding Sublayer (PCS)
   - Encoding/Decoding of 4b/5b symbols
 - Media Independent Interface (MII)
   - Connection of PCS to MAC
 - Media Access Controller (MAC)
   - Framing, [FCS](https://en.wikipedia.org/wiki/Frame_check_sequence) and [IPG](https://en.wikipedia.org/wiki/Interpacket_gap)
