#!/bin/bash

# Check for existing node_modules_cached_tar in s3bucket
if [ -f "../../../s3bucket/node_modules_cached_tar/${{ github.repository_owner }}-${{ github.event.repository.name }}-${GITHUB_REF#refs/heads/}.tar.gz" ]
then
  echo "cached tar file exists."
  cp ../../../s3bucket/node_modules_cached_tar/${{ github.repository_owner }}-${{ github.event.repository.name }}-${GITHUB_REF#refs/heads/}.tar.gz ./
  tar -xvzf ${{ github.repository_owner }}-${{ github.event.repository.name }}-${GITHUB_REF#refs/heads/}.tar.gz
else
  echo "cached tar file does not exist."
fi