#!/bin/bash

# Check if language argument is provided
if [ $# -eq 0 ]; then
    echo "Error: No language option provided."
    echo "Available options:"
    echo "  it - Italian version"
    echo "  en - English version"
    exit 1
fi

LANGUAGE=$1

case $LANGUAGE in
    "it")
        echo "Rendering Italian CV..."
        rendercv render ".\Baccara_Mahdi_CV.yaml" --output-folder-name "ita"
        ;;
    "en")
        echo "Rendering English CV..."
        rendercv render ".\Mahdi_Baccara_CV.yaml" --output-folder-name "eng"
        ;;
    *)
        echo "Error: Invalid language option '$LANGUAGE'"
        echo "Available options:"
        echo "  it - Italian version"
        echo "  en - English version"
        exit 1
        ;;
esac

echo "Rendering completed!"