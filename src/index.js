import { Elm } from "./elm/Main.elm";

if (document.readyState !== 'loading') {
	Elm.Main.init();
} else {
	document.addEventListener("DOMContentLoaded", () => {
		Elm.Main.init();
	});
}