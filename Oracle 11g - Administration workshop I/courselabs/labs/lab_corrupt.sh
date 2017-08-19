#!/bin/bash
# corrupts 2 consequetive blocks.
# make sure the table is in 2 consequetive blocks
FILE=${1:?'Parameter 1 should be set to file name'}
BLOCK=${2:?'Parameter 2 should be set to the block to be corrupted'}
BLOCKSIZE=${3:?'Parameter 3 should be set to the database block size'}

dd of=$FILE bs=$BLOCKSIZE conv=notrunc seek=$BLOCK <<EOF
CORRUPT corrupt CORRUPT corrupt CORRUPT corrupt CORRUPT corrupt CORRUPT corrupt
EOF
dd of=$FILE bs=$BLOCKSIZE conv=notrunc seek=`expr 1 + $BLOCK` <<EOF
CORRUPT THIS BLOCK. A LONGER String may be NEEDED. This makes a longer stringx
EOF
