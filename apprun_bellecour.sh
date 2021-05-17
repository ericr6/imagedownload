#!/bin/sh
iexec app run 0xCb214944300AAFD25655b887E625655FeE97D53f \
      --chain bellecour \
      --wallet-file user_wallet \
      --params {\"iexec_args\":\"http://www.lemonde.fr\"} \
      --skip-request-check \
      --watch


