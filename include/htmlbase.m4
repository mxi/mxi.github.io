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

	dnl Renders a full HTML page with content.
	dnl $1 - title of the page;
	dnl $2 - content of the page.
	define(`PAGE', `
		<!DOCTYPE html>
		<html>
			<head>
				<title>$1</title>
				<meta charset="utf-8"/>
				<link rel="stylesheet" href="/style/base.css"/>
			</head>

			<body>
				$2
			</body>
		</html>
	')


	dnl Basic Texts
	define(`H1',        `<h1       class="$2">$1</h1>')
	define(`H2',        `<h2       class="$2">$1</h2>')
	define(`H3',        `<h3       class="$2">$1</h3>')
	define(`H4',        `<h4       class="$2">$1</h4>')
	define(`H5',        `<h5       class="$2">$1</h5>')
	define(`H6',        `<h6       class="$2">$1</h6>')
	define(`PARA',      `<p        class="$2">$1</p>' )


	dnl Specialized Texts
	define(`CODELINE',  `<code    class="$2"          >$1</code>')
	define(`CODEBLOCK', `<pre     class="$2"          >$1</pre>' )
	define(`REF',       `<a       class="$3" href="$2">$1</a>'   )


	dnl Containers
	define(`ARTICLE',   `<article class="$2">$1</article>')
	define(`ASIDE',     `<aside   class="$2">$1</aside>'  )
	define(`DIV',       `<div     class="$2">$1</div>'    )
	define(`FOOTER',    `<footer  class="$2">$1</footer>' )
	define(`HEADER',    `<header  class="$2">$1</header>' )
	define(`MAIN',      `<main    class="$2">$1</main>'   )
	define(`NAV',       `<nav     class="$2">$1</nav>'    )
	define(`SECTION',   `<section class="$2">$1</section>')


	dnl Other
	define(`IMAGE',     `
divert(0)
