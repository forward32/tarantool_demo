# Tarantool Demo

Several simplest Tarantool's features.

## Branches:
* step1 - creating space and writing http-server
* step2 - working with fibers and channels
* step3 - sending data via UDP

## Tips
* install http - `tarantoolctl rocks install http`
* run your script within tarantool instance - `dofile('/path/to/file')`
* using tcpdump to capture traffic - `tcpdump -v -X -i wlan0 port 30000`
