#!/usr/bin/env bash
set -euo pipefail
docker build -t tdeutsch/guacd-helper:latest -t tdeutsch/guacd-helper:1.1.0 .
docker push tdeutsch/guacd-helper:1.1.0
docker push tdeutsch/guacd-helper:latest