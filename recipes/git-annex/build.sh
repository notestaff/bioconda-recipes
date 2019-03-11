#!/bin/bash

set -e -o pipefail -x

export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"

#git clone git://git-annex.branchable.com/ git-annex
#pushd git-annex
cp $RECIPE_DIR/stack-lts-9.9.yaml stack.yaml
stack setup
stack update
stack install --extra-include-dirs ${PREFIX}/include --local-bin-path ${PREFIX}/bin
which git-annex
git-annex version
#git-annex test
#stack runghc git-annex version
#stack runghc git-annex test
#mv ${PREFIX}/bin/RNAlien ${PREFIX}/bin/RNAlien-bin
#echo -e "#!/bin/bash\nexport SYSTEM_CERTIFICATE_PATH=/usr/local/ssl/cacert.pem\n${PREFIX}/bin/RNAlien-bin \"\$@\"\n" > ${PREFIX}/bin/RNAlien
#chmod 755 ${PREFIX}/bin/RNAlien
#cleanup
#rm -r .stack-work

