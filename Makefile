all: numbers.js

numbers.js: numbers.att numbers-inv.att
	echo 'var Word2NumAtt = `' > $@
	cat numbers.att >> $@
	echo '`;' >> $@
	echo 'var Num2WordAtt = `' >> $@
	cat numbers-inv.att >> $@
	echo '`;' >> $@

numbers.att: numbers.lexd
	lexd $< $@

numbers-inv.att: numbers.att
	hfst-txt2fst $< | hfst-invert | hfst-fst2txt -o $@
