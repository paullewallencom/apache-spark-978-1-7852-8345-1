#!/usr/bin/env bash
set -e
TOPDIR="$(cd `dirname $0`/..; pwd)"
export DATADIR="$TOPDIR/data"
export MODELSDIR="$TOPDIR/models"

export SPARKLING_WATER_VERSION="2.1.12"
export SPARK_PACKAGES=\
"ai.h2o:sparkling-water-core_2.11:${SPARKLING_WATER_VERSION},\
ai.h2o:sparkling-water-repl_2.11:${SPARKLING_WATER_VERSION},\
ai.h2o:sparkling-water-ml_2.11:${SPARKLING_WATER_VERSION},\
com.packtpub:mastering-ml-w-spark-utils:1.0.0"

$SPARK_HOME/bin/spark-shell \
        --master 'local[*]' \
        --driver-memory 8g \
        --executor-memory 8g \
        --conf spark.executor.extraJavaOptions=-XX:MaxPermSize=384M \
        --conf spark.driver.extraJavaOptions=-XX:MaxPermSize=384M \
        --packages "$SPARK_PACKAGES" "$@"

