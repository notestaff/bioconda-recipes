#!/bin/bash

chmod u+x install_kraken.sh
./install_kraken.sh "$PREFIX"
for bin in kraken kraken-build kraken-filter kraken-mpa-report kraken-report kraken-translate; do
    sed -i.bak 's|#!/usr/bin/perl|#!/usr/bin/env perl|' "$PREFIX/libexec/$bin"
    rm -f $PREFIX/bin/$bin.bak
done
