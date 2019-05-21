%% This is the application resource file (.app file) for the 'base'
%% application.
{application, blk,
[{description, "blk  " },
{vsn, "1.0.0" },
{modules, 
	  [blk_app,blk_sup,blk,blk_lib]},
{registered,[blk]},
{applications, [kernel,stdlib]},
{mod, {blk_app,[]}},
{start_phases, []}
]}.
