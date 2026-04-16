ln -s $(pwd)/qmk_firmware/keyboards/keyball ../__qmk__/keyboards/keyball
JOBS=$(($(grep cpu.cores /proc/cpuinfo | sort -u | sed 's/[^0-9]//g') + 1))

#-j にはCPUのスレッド数を指定する。12コア24スレッドのCPUなら -j 24 とする。
#qmk compile -j 12 -kb keyball/keyball44 -km via
qmk compile -j $JOBS -kb keyball/keyball44 -km via
qmk compile -j $JOBS -kb keyball/keyball61 -km via
qmk compile -j $JOBS -kb keyball/keyball44 -km nicola_via
qmk compile -j $JOBS -kb keyball/keyball61 -km nicola_via

mkdir -p tmp
cp ../__qmk__/keyball_keyball44_via.hex tmp/keyball44_via.hex
cp ../__qmk__/keyball_keyball61_via.hex tmp/keyball61_via.hex
cp ../__qmk__/keyball_keyball44_nicola_via.hex tmp/keyball44_nicola_via.hex
cp ../__qmk__/keyball_keyball61_nicola_via.hex tmp/keyball61_nicola_via.hex