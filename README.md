## Repro

Repro of https://github.com/foundry-rs/foundry/issues/6572

## Notes

Unable to reproduce bug with instructions:

>Running forge script in a repo that has a dependency with .sol files that don't contain a contract (e.g. the file contains only error definitions or constants) results in an error like

See `Counter.sol` inherits from `lib/foundry-bug-6572-repro-lib` that was installed with `zerosnacks/foundry-bug-6572-repro-lib` (see: https://github.com/zerosnacks/foundry-bug-6572-repro-lib/tree/master/src)

Running `Counter.s.sol` yields:

```
[⠊] Compiling...
No files changed, compilation skipped
Traces:
  [98] CounterScript::setUp()
    └─ ← [Stop] 

  [106006] CounterScript::run()
    ├─ [0] VM::startBroadcast()
    │   └─ ← [Return] 
    ├─ [61711] → new Counter@0xA8452Ec99ce0C64f20701dB7dD3abDb607c00496
    │   └─ ← [Return] 308 bytes of code
    ├─ [224] Counter::foo() [staticcall]
    │   └─ ← [Return] 1
    ├─ [0] VM::stopBroadcast()
    │   └─ ← [Return] 
    ├─ [0] console::log(1) [staticcall]
    │   └─ ← [Stop] 
    └─ ← [Stop] 


Script ran successfully.
Gas used: 127070

== Logs ==
  1

If you wish to simulate on-chain transactions pass a RPC URL.
```
