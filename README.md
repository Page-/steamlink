# balena steamlink 

Run steamlink on a Raspberry Pi using [balena.io](https://www.balena.io/)

## Getting started 

You can one-click-deploy this project to balena using the button below:

[![deploy button](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/Page-/steamlink&defaultDeviceType=raspberrypi3)

## Manual Deployment

Alternatively, deployment can be carried out by manually creating a [balenaCloud account](https://dashboard.balena-cloud.com) and application, flashing a device, downloading the project and pushing it via either Git or the [balena CLI](https://github.com/balena-io/balena-cli).

## Device Variables

### Environment Variables

* DEBUG = 1 - to stop the container exiting if steamlink / x fails for debugging purposes.

### Configuration Variables

* RESIN_HOST_CONFIG_disable_overscan = 1 - used to avoid overscan on TVs (you also need to disable overscan or enable "just scan" on the TV).
* RESIN_HOST_CONFIG_gpu_mem = 128 - increase gpu memory since the primary purpose of the steamlink is to stream video, not sure on the best value but 128 has worked for me.
* RESIN_HOST_CONFIG_hdmi_enable_4kp60 = 1 - if you want to use 4k 60hz on a raspberrypi 4, can only be used on hdmi0.
