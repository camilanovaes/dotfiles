-- statusline.lua

 local mode_map = {
	['n']  = 'normal ',
	['no'] = 'n·operator pending ',
	['v']  = 'visual ',
	['V']  = 'v·line ',
	['']   = 'v·block ',
	['s']  = 'select ',
	['S']  = 's·line ',
	['']   = 's·block ',
	['i']  = 'insert ',
	['R']  = 'replace ',
	['Rv'] = 'v·replace ',
	['c']  = 'command ',
	['cv'] = 'vim ex ',
	['ce'] = 'ex ',
	['r']  = 'prompt ',
	['rm'] = 'more ',
	['r?'] = 'confirm ',
	['!']  = 'shell ',
	['t']  = 'terminal '
}


