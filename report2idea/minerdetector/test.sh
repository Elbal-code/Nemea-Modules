#!/bin/bash

# input data:
in='
H4sIANzTd1gAA2NiAIPYzILElJQiBZfgkHjPAB0oLzjIGcQrycxNVQjx9HWNd/MMCg5B4vs4Arml
mXklxkYKrmGufiHxwc6OPq5gIUMzsGkB/kEhQAtWM5gxQIGokozQfyCA8XlZVBhhfA2BsggQLStY
FsEOpFl5EfpauM10kfUpmEjMh/F38kP0PQfql0fTh26fSJe5GYzfDLVPDmgfK0QfIwMAACTyOhQB
AAA=
'

# output data:
out='
H4sIAD4MM14AA+WU32vbMBDH3/dXCD9XQqcfruK3LWkhDwuBBAYbfZBlOTFLrGArLV3o/z5LHsOF
pDXt9jDmJ4v73p2+pw93Sqba241rHpMMfUtWx/ZQmcodW/K5qm2T3F2hZOEKG6KnZPUlqhZ2b3XS
RfZBU1hvjXe9dv14iNrkduceguTTTpvvu6r1fSm9D+HE/CDGtrX1pA61yPNCT0F6c29rv656PaNw
jSlggDXQTE4yyb6G6mvdbKzvLzdfitiZAeGCMEVAxZ7LxnkXI94ckrtYfOrqeuqOdUi97s63rtnr
cEjms5uPNJSeWt3ac/0hozyT17H/tLHd+AaqCaYMU7kGkck0kzyqFs7H+ModG2PRfImAE0F4SgDt
q83Wo9wijeIQSEjohc9t/U65aCqMfGhqFuf5moX5LERTCykFsBi0FlikRmHNZIpVTkvDNRQUbBJr
tqapDr5ydUi77OOq+zf62FpUeWS6cXdXsQXyDg3eJ+Pdhx62ldmiqkXlTm82nUi3fZWq3qCDczvU
2uY+jObpw+mf5FVlFC7yCpwRACIFEXIUsBzeQizl7yK2u6RkhAkCcjIe2mHWKG6jt1fA/eWkB7dM
8zwVlOMSpMRCsRxrykoslSqLIuWqKPMz4L5o5zK7w7f6L+DtBg4Z439s2co3LVv1LnQZJcAVkbJ7
t/HoDrNGoStHrFw1IFcYozkAw7osFBalpTg3JcVaTIpywmiHcnqG3Bfd/KWt+xMRDLndJggAAA==
'

test -z "$srcdir" && export srcdir=.

. $srcdir/../test.sh

test_conversion "minerdetector" "minerdetector" "$in" "$out"

