#!/bin/sh
profile=$(kanshictl status | sed -n "s/^Current profile: //p");
case "$(kanshictl status)" in
  "desk-laptop")
    kanshictl switch desk-external
    ;;
  "desk-external")
    kanshictl switch desk-laptop
    ;;
  *)
    kanshictl switch desk-extend
    ;;
esac