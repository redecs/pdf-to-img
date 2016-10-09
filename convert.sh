#!/bin/bash
_PDF_PATH="$PWD/pdfs"
_IMG_PATH="$PWD/imgs"
if [ ! -d $_PDF_PATH ]; then
	echo "PDF input folder not found: $_PDF_PATH"
	exit 1
fi
if [ ! -d $_IMG_PATH ]; then
	mkdir $_IMG_PATH
fi
_IFS_OLD=$IFS
IFS=$(echo -en "\n\b")
for _FILE in `ls $_PDF_PATH`; do
	echo "Converting: $_FILE"
	_CURRENT_PDF_DIR="${_FILE%.*}"
	if [ ! -d "$_IMG_PATH/$_FILE" ]; then
		mkdir "$_IMG_PATH/$_CURRENT_PDF_DIR"
	fi
	convert -quality 00 -density 150 "$_PDF_PATH/$_FILE" "$_IMG_PATH/$_CURRENT_PDF_DIR/page%d.png"
done
IFS=$_IFS_OLD;
