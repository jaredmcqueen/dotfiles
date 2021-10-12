#!/bin/sh
ip_address="10.0.6.5:8118"

export http_proxy=$ip_address
export https_proxy=$ip_address
export HTTP_PROXY=$ip_address
export HTTPS_PROXY=$ip_address
