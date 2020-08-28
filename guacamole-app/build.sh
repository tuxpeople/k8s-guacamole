#!/usr/bin/env bash
set -euo pipefail
cd branding
jar cf ../branding.jar .
cd ..
docker build -t tdeutsch/guacamole-branded:latest -t tdeutsch/guacamole-branded:1.1.0 .
docker push tdeutsch/guacamole-branded:1.1.0
docker push tdeutsch/guacamole-branded:latest
