#!/bin/sh

FOUT=${FOUT:-hunt.png}
COLOR=${COLOR:-black}

calc() {
	EXPR=$1
	python -c "print($EXPR)"
}

POW2=${POW2:-9}
WIDTH=${WIDTH:-$(calc "2**$POW2")}
HEIGHT=${HEIGHT:-$(calc "2**$POW2")}

echo "Generating ${WIDTH}x${HEIGHT} image"

w() {
	NORM=$1
	calc "$NORM/100*$WIDTH"
}

h() {
	NORM=$1
	calc "$NORM/100*$HEIGHT"
}

sw() {
	SCALE=$1
	calc "$SCALE*($WIDTH+$HEIGHT)/2**10"
}


# 0.1 step coordinates
X0=$(w   0); Y0=$(h   0)
X1=$(w  10); Y1=$(h  10)
X2=$(w  20); Y2=$(h  20)
X3=$(w  30); Y3=$(h  30)
X4=$(w  40); Y4=$(h  40)
X5=$(w  50); Y5=$(h  50)
X6=$(w  60); Y6=$(h  60)
X7=$(w  70); Y7=$(h  70)
X8=$(w  80); Y8=$(h  80)
X9=$(w  90); Y9=$(h  90)
XT=$(w 100); YT=$(h 100)


magick -size "${WIDTH}x${HEIGHT}" \
	-background transparent \
	-strokewidth 0 \
	-fill "$COLOR" \
	\( \
		\( \
			canvas:transparent \
			-draw "circle $X7,$Y3,$X7,$Y1" \
		\) \
		\( \
			canvas:transparent \
			-draw "rectangle $X7,$Y3,$X9,$Y1" \
		\) \
		-compose In \
		-composite \
	\) \
	\( \
		\( \
			canvas:transparent \
			-draw "circle $X5,$Y3,$X5,$Y0" \
		\) \
		\( \
			canvas:transparent \
			-draw "rectangle $X5,$Y3,$X8,$Y6" \
		\) \
		-compose In \
		-composite \
	\) \
	\( \
		canvas:transparent \
		-draw "circle $(w 75),$Y3,$X8,$Y3" \
		\
		-draw "polygon $X8,$Y3,$X9,$Y4,$X9,$Y3" \
		\
		-draw "polygon $X7,$Y1,$X5,$Y3,$X7,$Y3" \
		-draw "polygon $X5,$Y3,$X1,$Y9,$X5,$Y6" \
		\
		-draw "polygon $X7,$Y2,$X4,$Y1,$X0,$Y6" \
		-draw "polygon $X7,$Y2,$X0,$Y6,$X5,$Y5" \
		\
		-draw "polygon $X7,$Y7,$X8,$Y8,$XT,$Y8" \
		-draw "polygon $X7,$Y7,$X6,$Y9,$X7,$Y8" \
	\) \
	-compose Over \
	-flatten \
	\( \
		-stroke black \
		-strokewidth "$(sw 4)" \
		canvas:transparent \
		-draw "line $X0,$Y6,$X5,$Y5" \
		-draw "line $X8,$Y2,$(w 85),$(h 25)" \
	\) \
	-compose DstOut \
	-composite \
	"$FOUT"

