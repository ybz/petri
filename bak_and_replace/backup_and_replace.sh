#!/bin/zsh

BASE_DIR=$1
REPLACE_NAME=$2
SUBSTITUE=$3

echo About to replace all ${REPLACE_NAME} dirs under ${BASE_DIR} with ${SUBSTITUE};

function test_func {
    echo 'test func'
}

test_func


function bak_rename {
    echo 'will rename '$1
    #rename -a .bak $1
}

function copy_over {
    echo 'will copy '${SUBSTITUE} ' over '$1
    #cp -r ${SUBSTITUE} $1
}

find ${BASE_DIR} -type d -name ${REPLACE_NAME} | (while read x;
do
echo 'current file '${x}
bak_rename ${x};
copy_over ${x};
done;)
