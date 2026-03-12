#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.sh"

echo "Running mjpc: task='$TASK', steps=$STEPS, horizon=$HORIZON, w0=$W0, w1=$W1, w2=$W2, w3=$W3"

"$SCRIPT_DIR/build/bin/mjpc" \
  --task="$TASK" \
  --steps=$STEPS \
  --horizon=$HORIZON \
  --w0=$W0 \
  --w1=$W1 \
  --w2=$W2 \
  --w3=$W3

# Convert latest .avi in videos/ to .mp4
VIDEOS_DIR="$SCRIPT_DIR/videos"
LATEST_AVI=$(ls -t "$VIDEOS_DIR"/*.avi 2>/dev/null | head -1)

if [ -z "$LATEST_AVI" ]; then
  echo "No .avi file found in $VIDEOS_DIR"
  exit 1
fi

OUTPUT_MP4="${LATEST_AVI%.avi}.mp4"
echo "Converting $LATEST_AVI -> $OUTPUT_MP4"
ffmpeg -i "$LATEST_AVI" -c:v libx264 -pix_fmt yuv420p "$OUTPUT_MP4" -y
rm "$LATEST_AVI"

echo "Done: $OUTPUT_MP4"
