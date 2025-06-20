+++

title = "an overengineered pc build"
date = "2024-11-02"
slug = "an-overengineered-pc-build"

[taxonomies]
  tags = ["computer-hardware", "3d-printing"]

+++

## the pop mini air

i've had some issues with my current case, the pop mini air from fractal. it's an matx case that i have quite enjoyed using, however the design doesn't work perfectly with my components:

- the case features a psu shroud, which makes the case quite tall vertically
- the psu shroud leaves 0.7 slots of breathing room against my 3.3 slot gpu
- the side panels are tempered glass, with no ventilation

under extreme loads, my gpu would reach 80c, causing the clocks to drop, despite the gpu fans running up to 3,400rpm! (it sounds like a jet taking off sometimes)

unfortunately, besides spending a few hundred dollars on a custom loop for my gpu, there was nothing i could do to improve the thermals in this case. so, i bought a new case!

## new case smell

![lian li x dan a3-matx](/images/lian-li-dan-a3-matx/case.jpg)

the a3 is another matx case like the pop mini air, but here the intake and psu positions are swapped

the psu shroud is removed, with the psu instead being placed in the front of the case, allowing for intake across the bottom.

this can improve gpu thermals dramatically, as the card has access to fresh air from outside the case

the removal of the psu shroud, and cable management area allows the a3 to take up a significantly smaller volume than the pop mini air. this makes for a denser, more challenging build

this is not a [case review](https://youtu.be/0r9yukG_9EQ) though, only a documentation of my build!

## the build

this post wont cover the more standard processes and choices of the build process but looks more at the interesting problems and design choices that i had to make

### case fans

for this build i want to utilise the maximum supported 3x 120mm fans in the bottom of the case. for reasons i will get into later, i want the bottom intake fans to be optimised to push air through an air cooling heatsink

i like to use noctua fans due to their low noise operation, having a look at [noctua's airflow & static pressure chart](https://noctua.at/en/nf-a12x25-performance-comparison-to-nf-f12-and-nf-s12a) comparing their main 120mm fans, we can see that the nf-a12x25 fans (the brown line) perform the best in water cooling and air cooling settings:

![noctua nf-a12x25 p/q compared](/images/lian-li-dan-a3-matx/noctua_nf_a12x25_pq_compared.png)

unfortunately, these are also the most expensive option, retailing for $70 aud each

i have an nf-a12x25r fan from a previous air cooler i was using, this fan is functionally identical to the nf-a12x25, however it has a round frame and non standard mounting holes. this unfortunately means it cannot be mounted to a standard case

i found an online retailer with a 40% off sale on nf-a12x25r (round ;;) fans. this brings the price down lower than even the standard nf-f12 fans. so i decided i would purchase 2 of them and with my existing fan, design and 3d print mounts for them to screw into the bottom of the case

![noctua nf-n12x25 mount](/images/lian-li-dan-a3-matx/nf-a12x25r_mount.jpeg)

this mount adapts the non standard hole spacing of the nf-n12x25r into standard 105x105mm spacing. it is a width of 5mm, the same as [noctua's inlet spacers](https://noctua.at/en/na-is1-12-sx2), this is optimal for cancelling the noise created by panel interference on intake fans

i have uploaded the file for this mount to [thingiverse](https://www.thingiverse.com/thing:6799022) if you'd like to print it for yourself

### aio mounting struggles

in my previous case, i had to remove the heat spreaders from my ram sticks in order to allow clearance for my aio:

![heatspreader removal](/images/lian-li-dan-a3-matx/heatspreader-removal.jpeg)

unfortunately, my ram sticks were too tall to fit the aio in the new case, pushing the mounting holes ~ 6mm out of alignment

fortunately the aio does still physically fit even with the offset, so i designed a mounting bracket that offset the aio away from the ram by 6.5mm:

![aio mount](/images/lian-li-dan-a3-matx/aio-mount.jpg)

this was printed in 2 parts, above shows the first half installed. the bracket was 5mm thick for some rigidity, as well as to allow the screws provided to be contained within the bracket

with this, the aio was able to (barely) slide in and screw to the top of the case

### spaghetti management

#### cable combs

my power supply is atx 3.0 compliant and supports the newer 12vhpwr connector. however the cable is quite messy:

![12vhpwr cable mess](/images/lian-li-dan-a3-matx/12vhpwr-cable-mess.jpg)

this is unfortunate, because this particular cable has 5 sense cables (i believe that's what they are called) and the only designs for 12vhpwr cable combs i could find supported only 2 sense cables. so i decided to design and print my own:

![12vhpwr cable combs](/images/lian-li-dan-a3-matx/12vhpwr-cable-combs.jpeg)

you can also grab this design from [thingiverse](https://www.thingiverse.com/thing:6800373), but be sure to never place a comb within 3cm of the 12vhpwr connector. use this design at your own risk as it will apply more strain to the 12vhpwr connector, which is known to have higher failure rates

i then altered this design into cable combs for my motherboard 24 pin cable (though it has 27 cables :/) and sata power cable, but these are standard and can be found easily online

#### cable box

the a3 has no cable management area, this means that unless you run custom length cables, you're going to have extra cable slack and no place to put it

i didn't want to mess around with cutting cables to size, and especially didn't want to tamper with the 12vhpwr cable, so i opted to create a "cable management area" (a box to shove all the cables in)

![psu cable box](/images/lian-li-dan-a3-matx/psu-cable-box.png)

this box sits underneath the psu and is the minimum depth to cover the connectors, with a angled design to allow for airflow to pass through. the bottom and right side are open to allow for cables to pass through, and to make clearance for the front io which is located at the bottom of the front panel on the a3. the psu box screws into the bottom psu mounts

### the gpu

i mentioned earlier that i wanted to use air cooling optimised fans for my bottom intake, this is because i want to deshroud my gpu

this involves removing the plastic shroud and fans from the gpu, and attaching your own fans to better suit your needs. the new fans can be attached directly to the card or to the case and blow air up through the card

the image below shows the structure of most gpus, the shroud & fans, heatsink, board and backplate, i have removed the full assembly on the left, leaving only the heatsink, board and backplate. i took the opportunity to repaste the gpu while i had it open

![pny 4070ti exploded](/images/lian-li-dan-a3-matx/pny-4070ti-exploded.jpg)

i have 3 nf-a12x25r fans in the bottom of my case, which don't exactly line up with my freshly deshrouded gpu. the gpu only reaches to halfway across the third fan, which would not impact cooling performance, however it also sits closer to the motherboard than the fans do, and is raised up by a few of centimetres away from the fans. this will cause air to deflect from the heatsink and to only cool a portion of it:

![gpu fan gap](/images/lian-li-dan-a3-matx/gpu-fan-gap.jpg)

to fix this issue, i designed a duct for each fan that smoothly bridges the gap between the shape and position of the fans and the heatsink fins of the card, allowing them to push air through directly and efficiently:

![gpu duct designs](/images/lian-li-dan-a3-matx/gpu-duct-designs.png)

### fan control!

not really part of the build, but honestly ties everything i'm trying to achieve together.

i decided to use the motherboard fan headers instead of buying an adaptor cable for the one of the gpu's fan headers as i can control the fan speeds better in linux, but it still isn't very easy. i wanted to use fancontrol to control my systems fans, however lm_sensors cannot detect nvidia gpu temperatures, and so i had to set up a systemd service that writes the temperature to a file every few seconds, not ideal, but it works:

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

i can then use this as a sensor in my fancontrol config, which was first generated using pwmconfig, and then tweaked manually. the fancontrol config is fairly messy and unreadable, so i'll just link my full nixos [fancontrol configuration file](https://github.com/different-name/nix-files/blob/e9c2a79ecea5dc407f9a9c37ddba7c39092d713a/nixos/hosts/sodium/fancontrol.nix)

## final result

with my non standard fans, ram heatspreaders removal, aio mounting bracket, custom cable combs, cable management box and deshrouded ducted gpu all complete the build is finished! mostly... i still need to replace my spinning disks with an upgraded ssd that's currently on the way, then i can take proper photos and celebrate

![final front](/images/lian-li-dan-a3-matx/final-front.jpg)

(i ended up flipping the back fan to intake here, i have a 120mm dust filter on the way! there's a 5mm spacer on this fan now too, since it is intake)

![final side](/images/lian-li-dan-a3-matx/final-side.jpg)

the combination of fan curves, direct access to fresh air, premium fans, intake spacing and ducting result in a dead silent gpu, especially in comparison to my previous build which could be heard across the house. the cpu is roughly in the same situation, the back fan provides some fresh intake, with the power supply exhausting some of the case air. the case is mesh on all sides, this allows the case to exhaust hot air wherever possible when the gpu is under load (as the case becomes a positive pressure setup) and to intake fresh air passively for the cpu when the gpu is idling (as the case becomes a negative pressure setup)

i'm not sure if this is the most effective airflow configuration for this case, but it makes great use of the parts i have, only spending money on 2 discounted fans :)

feel free to get in touch with me if you want access to any models or have any questions, you can find my contact details on the [home page](@/_index.md)
