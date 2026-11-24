#!/bin/sh
profile=$(kanshictl status | sed -n "s/^Current profile: //p");
kanshictl reload && kanshictl switch "$profile"
