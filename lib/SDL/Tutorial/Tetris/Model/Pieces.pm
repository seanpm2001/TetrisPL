package SDL::Tutorial::Tetris::Model::Pieces;

use strict;
use warnings;

require Exporter;
our @ISA = qw/Exporter/;
our @EXPORT =  qw/@pieces @pieces_init/;

our @pieces  =
(
[
#square
    [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 2, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0]
    ],
    [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 2, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0]
    ],
    [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 2, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0]
    ],
    [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 2, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0]
    ]
],
#line
[
    [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 2, 1, 1],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ],
    [
    [0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 2, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0]
    ],
    [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [1, 1, 2, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ],
    [
    [0, 0, 1, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 2, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0]
    ]
],


#L_shape 
[
  [
    [0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 2, 0, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 2, 1, 0],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 2, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0],
    [0, 1, 2, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ]

],
# L_shape_mirror 
[
  [
    [0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 2, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 1, 2, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 2, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 2, 1, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0]
    ]
],
# N_shape
[
   [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 2, 1, 0],
    [0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 2, 0, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 0, 0, 0]
    ],
   [
    [0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0],
    [0, 1, 2, 0, 0],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ],

   [
    [0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 2, 1, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
   ]
   
],
#N_mirror_shape
[
	[
	[0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 2, 1, 0],
	[0, 0, 0, 1, 0],
	[0, 0, 0, 0, 0]
	],
	[
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 2, 1, 0],
	[0, 1, 1, 0, 0],
	[0, 0, 0, 0, 0]
	],
	[
	[0, 0, 0, 0, 0],
	[0, 1, 0, 0, 0],
	[0, 1, 2, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0]
	],
	[
	[0, 0, 0, 0, 0],
	[0, 0, 1, 1, 0],
	[0, 1, 2, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0]
	]
],
#T_shape 
[
	[
	[0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 2, 1, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0]
	],
	[
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 1, 2, 1, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0]
	],
	[
	[0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 1, 2, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0]
	],
	[
	[0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 1, 2, 1, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0]
	]
]
);

our @pieces_init=
(
#square_init
[
	[-2, -3],
	[-2, -3],
	[-2, -3],
	[-2, -3]
],
#line_init,
[
	[-2, -2],
	[-2, -3],
	[-2, -2],
	[-2, -3]
],
#L_init 
[
	[-2, -3],
	[-2, -3],
	[-2, -3],
	[-2, -2]
],
#L_m_init
[
	[-2, -3],
	[-2, -2],
	[-2, -3],
	[-2, -3]
],
#N_init
[
	[-2, -3],
	[-2, -3],
	[-2, -3],
	[-2, -2]
],
#N_m_init
[
	[-2, -3],
	[-2, -3],
	[-2, -3],
	[-2, -2]
],
#T_init
[
	[-2, -3],
	[-2, -3],
	[-2, -3],
	[-2, -2]
]

);

1;