#!/bin/bash

if [ -d backend ]; then
  cd tools
fi

while read line; do
  line_array=($line)
  
  if [[ $line == *APP_MAJOR_NUMBER* ]]; then APP_MAJOR_NUMBER=${line_array[2]};
  elif [[ $line == *APP_MINOR_NUMBER* ]]; then APP_MINOR_NUMBER=${line_array[2]};
  elif [[ $line == *APP_RELEASE_NUMBER* ]]; then APP_RELEASE_NUMBER=${line_array[2]};
  elif [[ $line == *APP_REVISION_NUMBER* ]]; then APP_REVISION_NUMBER=${line_array[2]};
  elif [[ $line == *APP_BUILD_NUMBER* ]]; then APP_BUILD_NUMBER=${line_array[2]};
  elif [[ $line == *APP_RELEASE_TYPE* ]]; then APP_RELEASE_TYPE=${line_array[2]};
  elif [[ $line == *APP_LICENSE_TYPE* ]]; then APP_LICENSE_TYPE=${line_array[2]};
  elif [[ $line == *APP_EDITION_NAME* ]]; then APP_EDITION_NAME=${line_array[2]};
  fi
done < ../backend/wbprivate/workbench/wb_version.h

case "$1" in
  "major") echo $APP_MAJOR_NUMBER;;
  "minor") echo $APP_MINOR_NUMBER;;
  "release") echo $APP_RELEASE_NUMBER;;
  "revision") echo $APP_REVISION_NUMBER;;
  "build") echo $APP_BUILD_NUMBER;;
  "release_type") echo $APP_RELEASE_TYPE;;
  "license") echo $APP_LICENSE_TYPE;;
  "edition") echo $APP_EDITION_NAME;;
  "full_version") echo "$APP_MAJOR_NUMBER.$APP_MINOR_NUMBER.$APP_RELEASE_NUMBER";;
  *) echo "Invalid argument....";;
esac

