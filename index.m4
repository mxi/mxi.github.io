include(htmlbase.m4)

PAGE(`hello', `
	
	HEADER(`
		ASIDE(`
			H1(`Maxim Kasyanenko')
		')
		NAV(`
			REF(`Portfolio', `/portfolio/')
			REF(`Journal',   `/journal/')
			REF(`Contact',   `/contact/')
		')
	')

	MAIN(`
		H1(`Main article 1')
			
		PARA(`
			Welcome to my humble home. I wonder how you
			found out about this awesome website lmao.
		')

		CODEFILE(`include/sample.c', `include/sample.c')
		CODEBLOCK(`INCLUDE(`include/sample.c')')
	')

	FOOTER()
')
