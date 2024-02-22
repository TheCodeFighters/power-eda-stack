#!/bin/bash

download_dir="./plugin"
confluent_version="7.5.2"
avro_version="1.11.3"
guava_version="32.1.3"
guava_failure_access_version="1.0.2"

download_file() {
    local url="$1"
    local filename=$(basename "$url")
    local destination="$download_dir/$filename"

    if curl -k -o "$destination" "$url"; then
        echo "Download successful for $filename."
    else
        echo "Download failed for $filename."
    fi
}

download_file "https://packages.confluent.io/maven/io/confluent/kafka-connect-avro-converter/$confluent_version/kafka-connect-avro-converter-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/kafka-connect-avro-data/$confluent_version/kafka-connect-avro-data-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/kafka-avro-serializer/$confluent_version/kafka-avro-serializer-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/kafka-schema-serializer/$confluent_version/kafka-schema-serializer-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/kafka-schema-registry-client/$confluent_version/kafka-schema-registry-client-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/common-config/$confluent_version/common-config-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/common-utils/$confluent_version/common-utils-$confluent_version.jar"
download_file "https://packages.confluent.io/maven/io/confluent/kafka-schema-converter/$confluent_version/kafka-schema-converter-$confluent_version.jar"
download_file "https://repo1.maven.org/maven2/org/apache/avro/avro/$avro_version/avro-$avro_version.jar"
download_file "https://repo1.maven.org/maven2/com/google/guava/guava/$guava_version-jre/guava-$guava_version-jre.jar"
download_file "https://repo1.maven.org/maven2/com/google/guava/failureaccess/$guava_failure_access_version/failureaccess-$guava_failure_access_version.jar"
