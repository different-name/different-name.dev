+++

title = "Lian Li x Dan A3-mATX"
date = "2024-11-02"
slug = "lian-li-dan-a3-matx"

[taxonomies]
  tags = ["hardware", "3d printing", "design"]

+++

## The Pop Mini Air

I've had some issues with my current case, the Pop Mini Air from Fractal. It's an mATX case that I have quite enjoyed using, however the design doesn't work perfectly with my parts:

- The case features a PSU shroud, which makes the case quite tall vertically
- The PSU shroud leaves 0.7 slots of breathing room against my 3.3 slot GPU
- The side panels are TG and do not allow for breathing

Under extreme loads, my GPU would reach 80c, causing the clocks to drop, despite the GPU fans running up to 3,400rpm! (It sounds like a jet taking off sometimes 🛫).

Unfortunately, besides spending a few hundred dollars on a custom loop for my GPU, there was nothing I could do to improve the thermals in this case. So, I bought a new case! The Lian Li x Dan A3-mATX.

## New case smell

![Lian Li x Dan A3-mATX](/images/lian-li-dan-a3-matx/case.jpg)

The A3 is another mATX case like the Pop Mini Air, but here the intake and PSU positions are swapped.

The PSU shroud is removed, with the PSU instead being placed in the front of the case, allowing for intake across the bottom.

This can improve GPU thermals dramatically, as the card has access to fresh air from outside the case.

The removal of the PSU shroud, and cable management area allows the A3 to take up a significantly smaller volume than the Pop Mini Air. This makes for a denser, more challenging build.

This is not a [case review](https://youtu.be/0r9yukG_9EQ) though, only a documentation of my build!

## The build

This post wont cover the more standard processes and choices of the build process but looks more at the interesting problems and design choices that I had to make.

### Case fans

For this build I want to utilise the maximum supported 3x 120mm fans in the bottom of the case. For reasons I will get into later, I want the bottom intake fans to be optimised to push air through an air cooling heatsink.

I like to use Noctua fans due to their low noise operation, having a look at [Noctua's airflow & static pressure chart](https://noctua.at/en/nf-a12x25-performance-comparison-to-nf-f12-and-nf-s12a) comparing their main 120mm fans, we can see that the NF-A12x25 fans (the brown line) perform the best in water cooling and air cooling settings:

![Noctua NF-A12x25 P/Q Compared](/images/lian-li-dan-a3-matx/noctua_nf_a12x25_pq_compared.png)

Unfortunately, these are also the most expensive option, retailing for $70 AUD each.

I have an NF-A12x25r fan from a previous air cooler I was using, this fan is functionally identical to the NF-A12x25, however it has a round frame and non standard mounting holes. This unfortunately means it cannot be mounted to a standard case.

I found an online retailer with a 40% off sale on NF-A12x25r (round ;;) fans. This brings the price down lower than even the standard NF-F12 fans. So I decided I would purchase 2 of them and with my existing fan, design and 3D print mounts for them to screw into the bottom of the case.

![Noctua NF-A12x25 Mount](/images/lian-li-dan-a3-matx/nf-a12x25r_mount.jpeg)

This mount adapts the non standard hole spacing of the NF-A12x25r into standard 105x105mm spacing. It is a width of 5mm, the same as [Noctua's inlet spacers](https://noctua.at/en/na-is1-12-sx2), this is optimal for cancelling the noise created by panel interference on intake fans.

I have uploaded the file for this mount to [Thingiverse](https://www.thingiverse.com/thing:6799022) if you'd like to print it for yourself.

### AIO mounting struggles

In my previous case, I had to remove the heat spreaders from my RAM sticks in order to allow clearance for my AIO:

![Heatspreader Removal](/images/lian-li-dan-a3-matx/heatspreader-removal.jpeg)

Unfortunately, my RAM sticks were too tall to fit the AIO in the new case, pushing the mounting holes ~ 6mm out of alignment.

Fortunately the AIO does still physically fit even with the offset, so I designed a mounting bracket that offset the AIO away from the RAM by 6.5mm:

![AIO Mount](/images/lian-li-dan-a3-matx/aio-mount.jpg)

This was printed in 2 parts, above shows the first half installed. The bracket was 5mm thick for some rigidity, as well as to allow the screws provided to be contained within the bracket.

With this, the AIO was able to (barely) slide in and screw to the top of the case.

### Spaghetti management

#### Cable Combs

My power supply is ATX 3.0 compliant and supports the newer 12vhpwr connector. However the cable is quite messy:

![12vhpwr Cable Mess](/images/lian-li-dan-a3-matx/12vhpwr-cable-mess.jpg)

This is unfortunate, because this particular cable has 5 sense cables (I believe that's what they are called) and the only designs for 12vhpwr cable combs I could find supported only 2 sense cables. So I decided to design and print my own:

![12vhpwr Cable Combs](/images/lian-li-dan-a3-matx/12vhpwr-cable-combs.jpeg)

You can also grab this design from [Thingiverse](https://www.thingiverse.com/thing:6800373), but be sure to never place a comb within 3cm of the 12vhpwr connector. Use this design at your own risk as it will apply more strain to the 12vhpwr connector, which is known to have higher failure rates.

I then altered this design into cable combs for my motherboard 24 pin cable (though it has 27 cables :/) and SATA power cable, but these are standard and can be found easily online.

#### Cable Box

The A3 has no cable management area, this means that unless you run custom length cables, you're going to have extra cable slack and no place to put it.

I didn't want to mess around with cutting cables to size, and especially didn't want to tamper with the 12vhpwr cable, so I opted to create a "cable management area" (a box to shove all the cables in).

![PSU Cable Box](/images/lian-li-dan-a3-matx/psu-cable-box.png)

This box sits underneath the PSU and is the minimum depth to cover the connectors, with a angled design to allow for airflow to pass through. The bottom and right side are open to allow for cables to pass through, and to make clearance for the front IO which is located at the bottom of the front panel on the A3. The PSU box screws into the bottom PSU mounts.

### The GPU

I mentioned earlier that I wanted to use air cooling optimised fans for my bottom intake, this is because I want to deshroud my GPU.

This involves removing the plastic shroud and fans from the GPU, and attaching your own fans to better suit your needs. The new fans can be attached directly to the card or to the case and blow air up through the card.

The image below shows the structure of most GPUs, the shroud & fans, heatsink, board and backplate, I have removed the full assembly on the left, leaving only the heatsink, board and backplate. I took the opportunity to repaste the GPU while I had it open.

![PNY 4070ti Exploded](/images/lian-li-dan-a3-matx/pny-4070ti-exploded.jpg)

I have 3 NF-A12x25r fans in the bottom of my case, which don't exactly line up with my freshly deshrouded GPU. The GPU only reaches to halfway across the third fan, which would not impact cooling performance, however it also sits closer to the motherboard than the fans do, and is raised up by a few of centimetres away from the fans. This will cause air to deflect from the heatsink and to only cool a portion of it:

![GPU Fan Gap](/images/lian-li-dan-a3-matx/gpu-fan-gap.jpg)

To fix this issue, I designed a duct for each fan that smoothly bridges the gap between the shape and position of the fans and the heatsink fins of the card, allowing them to push air through directly and efficiently:

![GPU Duct Designs](/images/lian-li-dan-a3-matx/gpu-duct-designs.png)

### Fan control!

Not really part of the build, but honestly ties everything I'm trying to achieve together.

I decided to use the motherboard fan headers instead of buying an adaptor cable for the one of the GPU's fan headers as I can control the fan speeds better in Linux, but it still isn't very easy. I wanted to use fancontrol to control my systems fans, however lm_sensors cannot detect Nvidia GPU temperatures, and so I had to set up a systemd service that writes the temperature to a file every few seconds, not ideal, but it works:

```nix
# https://www.reddit.com/r/linuxquestions/comments/s8odfm/comment/htkp2td/
systemd.services.nvidia-temp = {
  enable = true;
  description = "Nvidia GPU temperature reader";
  wantedBy = ["fancontrol.service"];
  serviceConfig = {
    Restart = "on-failure";
  };
  path = with pkgs; [
    bash
    config.hardware.nvidia.package
  ];
  script = ''
    bash -c 'while :; do
      t="$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)";
      echo "$((t * 1000))" > /run/nvidia-temp;
      sleep 5;
    done'
  '';
};
```

I can then use this as a sensor in my fancontrol config, which was first generated using pwmconfig, and then tweaked manually. The fancontrol config is fairly messy and unreadable, so I'll just link my full NixOS [fancontrol configuration file](https://github.com/different-name/nix-files/blob/607c11bce0f5285d83fcdfe252b112649b9241c7/system/hosts/sodium/fancontrol.nix).

## Final result

With my non standard fans, RAM heatspreaders removal, AIO mounting bracket, custom cable combs, cable management box and deshrouded ducted GPU all complete the build is finished! Mostly... I still need to replace my spinning disks with an upgraded SSD that's currently on the way, then I can take proper photos and celebrate.

![Final Front](/images/lian-li-dan-a3-matx/final-front.jpg)

(I ended up flipping the back fan to intake here, I have a 120mm dust filter on the way! There's a 5mm spacer on this fan now too, since it is intake).

![Final Side](/images/lian-li-dan-a3-matx/final-side.jpg)

The combination of fan curves, direct access to fresh air, premium fans, intake spacing and ducting result in a dead silent GPU, especially in comparison to my previous build which could be heard across the house. The CPU is roughly in the same situation, the back fan provides some fresh intake, with the power supply exhausting some of the case air. The case is mesh on all sides, this allows the case to exhaust hot air wherever possible when the GPU is under load (as the case becomes a positive pressure setup) and to intake fresh air passively for the CPU when the GPU is idling (as the case becomes a negative pressure setup).

I'm not sure if this is the most effective airflow configuration for this case, but it makes great use of the parts I have, with only money spent on 2 discounted fans :)

I'll edit this post with more pictures when the new SSD arrives and I can button everything up properly. Feel free to get in touch with me if you want access to any models or have any questions, you can find my contact details on the [about page](@/about.md).
