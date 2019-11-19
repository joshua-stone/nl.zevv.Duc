#!/usr/bin/bash

set -e
set -u

readonly APP="nl.zevv.Duc"
readonly MANIFEST="${APP}.yml"
readonly REPO="duc"

# Generated by a helper script:
# https://github.com/joshua-stone/gpg-keygen-helper
source gpghome.cfg

./generate-icons.sh

flatpak-builder --gpg-homedir="${GPG_HOME}" \
                --gpg-sign="${KEY_ID}" \
	        --force-clean \
	        --repo="${REPO}" \
	        build-dir \
	        "${MANIFEST}"

flatpak --user \
	--gpg-import="${PUBLIC_KEY}" \
	--if-not-exists \
	remote-add \
	"${REPO}" \
	"${REPO}"

flatpak --user \
	--assumeyes \
	install \
	"${REPO}" \
	"${APP}"

flatpak --user \
	--assumeyes \
	update \
	"${APP}"
