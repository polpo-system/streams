# streams

Streams for [polpo](https://github.com/polpo-system/polpo): streams of ETH Oberon (`Streams`), on files, on texts (`TextStreams`), on network connections (NetTools of the gadgets), with reading and writing of numbers, reals, strings and sets. MIME, HyperDocs and the HTML documents use them.

```
portia.Install streams
```

## What is here

    src/Streams.Mod          streams, on files
    src/TextStreams.Mod      streams on texts, formatted output
    test/StreamsTest.Mod

The sources come from ETH Linux Oberon (OLR, 2017-06-18), converted from Oberon texts to plain
text; the first commit has them unchanged. They compile unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS).

## Tests

    StreamsTest.Run      3 checks: a file stream written and read back, a text written through
                         TextStreams; it needs the desktop's display

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
