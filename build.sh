ln -s $(pwd)/qmk_firmware/keyboards/keyball ../__qmk__/keyboards/keyball
JOBS=$(($(grep cpu.cores /proc/cpuinfo | sort -u | sed 's/[^0-9]//g') + 1))

#-j にはCPUのコア数+1を指定するのが一般的です。これにより、コンパイルが高速化されます。
#qmk compile -j 7 -kb keyball/keyball44 -km via
qmk compile -j $JOBS -kb keyball/keyball44 -km via
qmk compile -j $JOBS -kb keyball/keyball61 -km via
qmk compile -j $JOBS -kb keyball/keyball61 -km via_ish
qmk compile -j $JOBS -kb keyball/keyball44 -km nicola_via
qmk compile -j $JOBS -kb keyball/keyball61 -km nicola_via
qmk compile -j $JOBS -kb keyball/keyball61 -km nicola_via_ish

mkdir -p tmp
cp ../__qmk__/keyball_keyball44_via.hex tmp/keyball44_via.hex
cp ../__qmk__/keyball_keyball61_via.hex tmp/keyball61_via.hex
cp ../__qmk__/keyball_keyball61_via_ish.hex tmp/keyball61_via_ish.hex
cp ../__qmk__/keyball_keyball44_nicola_via.hex tmp/keyball44_nicola_via.hex
cp ../__qmk__/keyball_keyball61_nicola_via.hex tmp/keyball61_nicola_via.hex
cp ../__qmk__/keyball_keyball61_nicola_via_ish.hex tmp/keyball61_nicola_via_ish.hex
