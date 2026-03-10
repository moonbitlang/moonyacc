.PHONY: boot

boot:
	moon build --target js --release
	cp _build/js/release/build/main/main.js boot/moonyacc.cjs
