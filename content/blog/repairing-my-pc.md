+++

title = "Repairing my PC"
date = "2024-09-10"
slug = "repairing-my-pc"

[taxonomies]
  tags = ["hardware", "troubleshooting"]

+++

A few days ago my PC shut down unexpectedly, the screen suddenly went black and the fans stopped spinning as if the power was cut. I booted it back up and surely enough about 10 minutes into a game, it happened again.

## What isn't the issue?

Because the computer went dark so quickly, it did not seem like a fault with the game I was playing, or the operating system. So I booted into a fresh OS on a different drive to rule out any software and drive issues, a short while into playing a game, the computer shut down again.

To further rule out any software and configuration issues, I also tried resetting my BIOS, unfortunately this did not have any effect.

It could have been that the computer was reaching unsafe thermal levels and shutting down as a safety measure, though the temperatures all seemed to be perfectly within level, and all case fans were running as usual.

With this, I decided that there was most likely a hardware fault that had occurred .

## Identifying the problem part

I had not opened my PC for maintenance or any hardware changes leading up to this event, so I had no guesses as to what could have been the issue. I thought it was most likely an issue with either the:

- CPU
- PSU
- Motherboard
- RAM

I had a spare motherboard and spare RAM from previous builds / upgrades that were compatible with my current system, however I wanted to run some tests before opening up the computer.

I ran a CPU stress test using stress-ng:

```console
nix-shell -p stress-ng --run "stress-ng --cpu 16 --timeout 120s"
```

This pinned the CPU at 100% usage for 2 minutes and completed without any issues.

Separately, I ran a similar test on the GPU using gpu_burn:

```console
nix-shell -p gpu-burn --run "gpu_burn 120"
```

Which also completed with no issues. With these results, I was comfortable that the system was working as expected, and turned my suspicion to the PSU. My hypothesis at this point was that the PSU had begun to fail and is no longer capable of outputting the 650W it was rated for.

Running both the CPU and GPU stress tests at the same time yielded an immediate loss of power, leading me to believe the PSU was at fault. This made the most sense to me, as the PSU was one of the two only parts that had been kept around since I built my first computer, the other being an SSD.

## Repairs

I ordered a new Corsair RM850e PSU. I chose to bump from 650W to 850W mostly due to the rising power consumption of modern components, My current components had been running perfectly for around a year with the previous PSU, but I wanted to support future builds too given how long I kept my previous unit. This model also features PCIe-5.0 support, and can connect directly to my 4000 series card without any adaptors.

The new unit arrived and I got to removing all of the old power cables and the old unit. I could have reused the old cabling, however I thought it was a good idea to have it all replaced, the new cabling was also flat styled and much easier to route.

After the rebuild, everything worked as expected!