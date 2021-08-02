divert(-1)
	dnl Gets the directory part of a path.
	dnl Requires GNU m4 patsubst.
	define(`DIRNAME', `patsubst($1, `\/+[^\/]*\/*$')')

	dnl Gets the base name of a path.
	dnl Requires GNU m4 patsubst.
	define(`BASENAME', `patsubst(patsubst($1, `\/*$'), `^\/?.*\/')')

	dnl HTML armored include; Substitutes in escapes for
	dnl various special characters in HTML (<, >, &, etc.).
	define(`INCLUDE', `syscmd(`./htmlarmor.sh $1 $2 $3 $4 $5 $6 $7 $8 $9 $10')')


	dnl /* --- TEXTS ---------------------------------------- */
	define(`H1',        `<h1 class="$2">$1</h1>')
	define(`H2',        `<h2 class="$2">$1</h2>')
	define(`H3',        `<h3 class="$2">$1</h3>')
	define(`H4',        `<h4 class="$2">$1</h4>')
	define(`H5',        `<h5 class="$2">$1</h5>')
	define(`H6',        `<h6 class="$2">$1</h6>')
	define(`PARA',      `<p class="$2">$1</p>')

	dnl TODO: move
	define(`CODELINE',  `<code class="$2">$1</code>')
	define(`CODEBLOCK', `<pre class="$2">$1</pre>')
	define(`REF',       `<a class="$3" href="$2">$1</a>')

	dnl /* --- SPECIAL TEXTS -------------------------------- */
	define(`LOGOTITLE', `H1(`$1', `logo-title $2')')


	dnl /* --- CONTAINERS ----------------------------------- */
	define(`ARTICLE',   `<article class="$2">$1</article>')
	define(`ASIDE',     `<aside class="$2">$1</aside>')
	define(`DIV',       `<div class="$2">$1</div>')
	define(`FOOTER',    `<footer class="$2">$1</footer>')
	define(`HEADER',    `<header class="$2">$1</header>')
	define(`MAIN',      `<main class="$2">$1</main>')
	define(`NAV',       `<nav class="$2">$1</nav>')
	define(`SECTION',   `<section class="$2">$1</section>')
	define(`IMAGE',     `<img src="$1" alt="$2" class="$3"/>')

	dnl /* --- SPECIAL CONTAINERS --------------------------- */
	define(`LOGOAREA',  `DIV(`$1', `logo-area $2')')
	define(`LOGOIMAGE', `IMAGE(`$1', `$2', `logo-image $3')')


	dnl /* --- SCAFFOLDS ------------------------------------ */
	dnl Provides the absolute minimum HTML markup required
	dnl to render a webpage. The <head/> and <body/> tags
	dnl must be populated via $1 and $2 respectively.
	define(`BASEPAGE', `
		<!DOCTYPE html>
		<html>
			<head>
				$1
			</head>

			<body>
				$2
			</body>
		</html>
	')

	dnl Provides the absolute minimum default contents of 
	dnl the <head/> tag to make the page render proprely
	dnl on most devices.
	define(`BASEHEAD', `
		<title>$1</title>
		<meta charset="utf-8"/>
		<meta name="viewport" content="width=device-width,initial-scale=1"/>
	')

	dnl A special home-page scaffold with special, trimmed
	dnl CSS to display a single, viewport-sized with a simple
	dnl logo and navigation.
	define(`HOMEPAGE', `
		BASEPAGE(`
			BASEHEAD(`$1')
			<link rel="stylesheet" href="/style/home.css"/>
		', `$2')
	')

	dnl A basic page scaffold using the BASEPAGE and BASEHEAD
	dnl macros as defining blocks alongside the `style/base.css`
	dnl stylesheet.
	define(`STANDARDPAGE', `
		BASEPAGE(`
			BASEHEAD(`$1')
			<link rel="stylesheet" href="/style/base.css"/>
		', `$2')
	')
divert(0)
