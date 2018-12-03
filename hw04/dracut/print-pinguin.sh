#!/bin/bash

exec 0<>/dev/console 1<>/dev/console 2<>/dev/console

cat <<'msgend'
_______________________
< I'm dracut module  >
 -----------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/'\
    \___)=(___/

msgend

sleep 10
echo "Continuing..."
sleep 1
