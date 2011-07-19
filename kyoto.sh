#!/bin/sh

# nbum twice the number of records
# msiz how much mem to allocate
# 
ktserver -port 1978 -tout 10 -ls \
  -plsv /usr/local/Cellar/kyoto-tycoon/0.9.45/libexec/ktplugservmemc.dylib \
  -plex 'port=2010' \
  'kyoto/casket.kch#opts=l#bnum=16000000#dfunit=8'
