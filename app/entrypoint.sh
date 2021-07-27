#!/usr/bin/env bash

java -Xmx${JAVA_XMX:-1024M} -jar /app/waterfall.jar --noconsole
