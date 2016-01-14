#!/bin/sh

tar -xjvf medusa100_pts.tar.bz2
cd medusa100/

if [ "X$CFLAGS" = "X" ]
then
        CFLAGS="-O3 -march=native"
fi

cc $CFLAGS *.c -o medusa
echo $? > ~/install-exit-status

cd ~

echo "#!/bin/sh
cd medusa100/
./tscp \$@ > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > medusa
chmod +x medusa