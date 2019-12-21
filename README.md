Running steamlink on a raspberrypi using [balena.io](https://www.balena.io/)

Env vars
* RESIN_HOST_CONFIG_disable_overscan = 1 - used to avoid overscan on TVs (you also need to disable overscan or enable "just scan" on the TV)
* RESIN_HOST_CONFIG_gpu_mem = 128 - increase gpu memory since the primary purpose of the steamlink is to stream video, not sure on the best value but 128 has worked for me