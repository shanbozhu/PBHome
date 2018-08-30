#!/bin/sh

rm -rf "${SRCROOT}/${PROJECT_NAME}.framework"
cp -a "${BUILT_PRODUCTS_DIR}/${PROJECT_NAME}.framework" "${SRCROOT}/${PROJECT_NAME}.framework"
