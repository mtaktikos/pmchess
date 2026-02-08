#!/bin/bash

echo "=== Test 1: Pawn move creates mirror knight ==="
cat << 'EOF' | ./tscp 2>&1 | grep -A 12 "tscp> tscp>"
d
e2e4
d
quit
EOF

echo ""
echo "=== Test 2: Mirror occupied - no mirror piece created ==="
cat << 'EOF' | ./tscp 2>&1 | grep -A 12 "8  r n b q k"
e2e4
e7e5
d
quit
EOF

echo ""
echo "=== Test 3: Knight move creates mirror bishop ==="
cat << 'EOF' | ./tscp 2>&1 | grep -A 12 "f3"
e2e4
e7e5
g1f3
d
quit
EOF

echo ""
echo "=== Test 4: Capture move doesn't create mirror piece ==="
cat << 'EOF' | ./tscp 2>&1 | grep -A 12 "exd5"
e2e4
d7d6
e4e5
d6d5
exd5
d
quit
EOF

