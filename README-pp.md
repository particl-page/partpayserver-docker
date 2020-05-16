# PartPayServer Docker

Guide on running BTCPayServer for Particl, via Docker on your VPS.

Sources:
- https://medium.com/@BtcpayServer/hosting-btcpay-server-for-cheap-2b27761fdb9d
- https://medium.com/@BtcpayServer/hosting-btcpayserver-on-lunanode-bf9ef5fff75b
- https://github.com/particl-page/partpayserver-docker

---

## Requirements

This guide assumes, you already have a VPS (or your own server) up and running and working domain name pointing to your server (via DNS records).


## Installation

1. SSH to your server, create the necessary directories (needed) and enter the main one:

    sudo mkdir /volume1/docker/pay.particl.page /etc/profile.d
    cd /volume1/docker/pay.particl.page

2. Clone latest code via `git` inside:

    git clone https://github.com/particl-page/partpayserver-docker.git
    cd partpayserver-docker

> You can safely skip to step 5 from here (in case `docker-compose.particl-only.yml` is safed or pre-generated)

3. Set PARTPayServer options via `export` parameters (see [a list of all available parameters](https://github.com/particl-page/partpayserver-docker#environment-variables)):

```bash
sudo su -
#export LIGHTNING_ALIAS="pay.particl.page"
#export BTCPAYGEN_CRYPTO2="btc"
#export BTCPAYGEN_LIGHTNING="clightning"
export BTCPAY_HOST="pay.particl.page"
export BTCPAYGEN_CRYPTO1="part"
export BTCPAYGEN_REVERSEPROXY="(empty)"
export BTCPAYGEN_SUBNAME="particl-only"
export BTCPAYGEN_ADDITIONAL_FRAGMENTS="opt-save-storage-xs;opt-save-memory"
export LETSENCRYPT_EMAIL="xe-non@particl.page"
```

4. Run build script to generate `docker-compose` file:

    sudo ./build.sh

If you decide to change any parameters above, `export` the changes again and re-run the script.

This will generate `Generated/docker-compose.particl-only.yml` file used to spin up the Docker combo.

5. Compose the generated `docker-compose`:

```
sudo docker-compose -f "Generated/docker-compose.particl-only.yml" up --remove-orphans -d
```


## Notes

Installing this creates a few files outside of Docker and configured directories, namely:

- /etc/profile.d/btcpay-env.sh


